// This is a generated file (see the discoveryapis_generator project).

library googleapis.fc.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client fc/v1';

/** Friend Computer API */
class FcApi {

  final commons.ApiRequester _requester;

  FcApi(http.Client client, {core.String rootUrl: "http://127.0.0.1:8080/", core.String servicePath: "fc/v1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [LoginResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<LoginResponse> apiLogin(LoginRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'login';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new LoginResponse.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [SynResponse].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<SynResponse> getLoginKey(SynRequest request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'syn';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new SynResponse.fromJson(data));
  }

}



class LoginRequest {
  core.String loginKey;
  core.String password;
  core.String username;

  LoginRequest();

  LoginRequest.fromJson(core.Map _json) {
    if (_json.containsKey("loginKey")) {
      loginKey = _json["loginKey"];
    }
    if (_json.containsKey("password")) {
      password = _json["password"];
    }
    if (_json.containsKey("username")) {
      username = _json["username"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (loginKey != null) {
      _json["loginKey"] = loginKey;
    }
    if (password != null) {
      _json["password"] = password;
    }
    if (username != null) {
      _json["username"] = username;
    }
    return _json;
  }
}

class LoginResponse {
  core.bool success;
  core.String userKey;

  LoginResponse();

  LoginResponse.fromJson(core.Map _json) {
    if (_json.containsKey("success")) {
      success = _json["success"];
    }
    if (_json.containsKey("userKey")) {
      userKey = _json["userKey"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (success != null) {
      _json["success"] = success;
    }
    if (userKey != null) {
      _json["userKey"] = userKey;
    }
    return _json;
  }
}

class SynRequest {
  core.String pubKey;

  SynRequest();

  SynRequest.fromJson(core.Map _json) {
    if (_json.containsKey("pubKey")) {
      pubKey = _json["pubKey"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (pubKey != null) {
      _json["pubKey"] = pubKey;
    }
    return _json;
  }
}

class SynResponse {
  core.String loginKey;
  core.String pubKey;

  SynResponse();

  SynResponse.fromJson(core.Map _json) {
    if (_json.containsKey("loginKey")) {
      loginKey = _json["loginKey"];
    }
    if (_json.containsKey("pubKey")) {
      pubKey = _json["pubKey"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (loginKey != null) {
      _json["loginKey"] = loginKey;
    }
    if (pubKey != null) {
      _json["pubKey"] = pubKey;
    }
    return _json;
  }
}
