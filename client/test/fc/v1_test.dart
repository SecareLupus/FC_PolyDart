library googleapis.fc.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/fc/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterLoginRequest = 0;
buildLoginRequest() {
  var o = new api.LoginRequest();
  buildCounterLoginRequest++;
  if (buildCounterLoginRequest < 3) {
    o.loginKey = "foo";
    o.password = "foo";
    o.username = "foo";
  }
  buildCounterLoginRequest--;
  return o;
}

checkLoginRequest(api.LoginRequest o) {
  buildCounterLoginRequest++;
  if (buildCounterLoginRequest < 3) {
    unittest.expect(o.loginKey, unittest.equals('foo'));
    unittest.expect(o.password, unittest.equals('foo'));
    unittest.expect(o.username, unittest.equals('foo'));
  }
  buildCounterLoginRequest--;
}

core.int buildCounterLoginResponse = 0;
buildLoginResponse() {
  var o = new api.LoginResponse();
  buildCounterLoginResponse++;
  if (buildCounterLoginResponse < 3) {
    o.success = true;
    o.userKey = "foo";
  }
  buildCounterLoginResponse--;
  return o;
}

checkLoginResponse(api.LoginResponse o) {
  buildCounterLoginResponse++;
  if (buildCounterLoginResponse < 3) {
    unittest.expect(o.success, unittest.isTrue);
    unittest.expect(o.userKey, unittest.equals('foo'));
  }
  buildCounterLoginResponse--;
}

core.int buildCounterSynRequest = 0;
buildSynRequest() {
  var o = new api.SynRequest();
  buildCounterSynRequest++;
  if (buildCounterSynRequest < 3) {
    o.pubKey = "foo";
  }
  buildCounterSynRequest--;
  return o;
}

checkSynRequest(api.SynRequest o) {
  buildCounterSynRequest++;
  if (buildCounterSynRequest < 3) {
    unittest.expect(o.pubKey, unittest.equals('foo'));
  }
  buildCounterSynRequest--;
}

core.int buildCounterSynResponse = 0;
buildSynResponse() {
  var o = new api.SynResponse();
  buildCounterSynResponse++;
  if (buildCounterSynResponse < 3) {
    o.loginKey = "foo";
    o.pubKey = "foo";
  }
  buildCounterSynResponse--;
  return o;
}

checkSynResponse(api.SynResponse o) {
  buildCounterSynResponse++;
  if (buildCounterSynResponse < 3) {
    unittest.expect(o.loginKey, unittest.equals('foo'));
    unittest.expect(o.pubKey, unittest.equals('foo'));
  }
  buildCounterSynResponse--;
}


main() {
  unittest.group("obj-schema-LoginRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildLoginRequest();
      var od = new api.LoginRequest.fromJson(o.toJson());
      checkLoginRequest(od);
    });
  });


  unittest.group("obj-schema-LoginResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildLoginResponse();
      var od = new api.LoginResponse.fromJson(o.toJson());
      checkLoginResponse(od);
    });
  });


  unittest.group("obj-schema-SynRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSynRequest();
      var od = new api.SynRequest.fromJson(o.toJson());
      checkSynRequest(od);
    });
  });


  unittest.group("obj-schema-SynResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSynResponse();
      var od = new api.SynResponse.fromJson(o.toJson());
      checkSynResponse(od);
    });
  });


  unittest.group("resource-FcApi", () {
    unittest.test("method--apiLogin", () {

      var mock = new HttpServerMock();
      api.FcApi res = new api.FcApi(mock);
      var arg_request = buildLoginRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.LoginRequest.fromJson(json);
        checkLoginRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("fc/v1/"));
        pathOffset += 6;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("login"));
        pathOffset += 5;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildLoginResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.apiLogin(arg_request).then(unittest.expectAsync(((api.LoginResponse response) {
        checkLoginResponse(response);
      })));
    });

    unittest.test("method--getLoginKey", () {

      var mock = new HttpServerMock();
      api.FcApi res = new api.FcApi(mock);
      var arg_request = buildSynRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SynRequest.fromJson(json);
        checkSynRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("fc/v1/"));
        pathOffset += 6;
        unittest.expect(path.substring(pathOffset, pathOffset + 3), unittest.equals("syn"));
        pathOffset += 3;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSynResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getLoginKey(arg_request).then(unittest.expectAsync(((api.SynResponse response) {
        checkSynResponse(response);
      })));
    });

  });


}

