/// Product.dart
/// Version 0.0.1a
/// Copyright 2015 Pioneer Valley Gamer Collective

/// Product
/// This class is used to create Product objects and methods for Product objects.
class Product {
  int _id;
  int parent_id;
  Sting name;
  DateTime introductionDate;
  DateTime discontinuationDate;
  DateTime eolDate;
  String comment;

  /// getCategories returns a list of categories.
  ///
  /// Generates a [List<int>] of [Category] ids from [Product_Category] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getCategories() {
    //TODO: Implement getCategories in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getPrimaryCategories returns a list of primary categories.
  ///
  /// Generates a [List<int>] of [PrimaryCategory] ids from [Product_Category_Classification] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getPrimaryCategories() {
    //TODO: Implement getPrimaryCategories in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getFeatures returns a list of features.
  ///
  /// Generates a [List<int>] of [Features] ids from [Product_Feature] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getFeatures() {
    //TODO: Implement getFeatures in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getProductType returns a product type.
  ///
  /// Generates a [List<int>] of [ProductType] ids from [Good] or [Service] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  ProductType getProductType() {
    //TODO: Implement getProductType in Product
    ProductType people = new ProductType();
    return people;
  }

  /// getGood returns a good.
  ///
  /// Generates a [Good] from the database where
  ///   Product_id references [this], or an empty [Good] if no parents exist.
  Good getGood(int id) {
    //TODO: Implement getGood in Product
    Good people = new Good();
    return people;
  }

  /// getService returns a service.
  ///
  /// Generates a [Service] from the database where
  ///   Product_id references [this], or an empty [Service] if no parents exist.
  Service getService(int id) {
    //TODO: Implement getService in Product
    Service people = new Service();
    return people;
  }

  /// getSupplierLinks returns a list of supplier links.
  ///
  /// Generates a [List<int>] of [SupplierLink] ids from [Supplier_Product] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getSupplierLinks(int id) {
    //TODO: Implement getSupplierLinks in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getComponents returns a list of components.
  ///
  /// Generates a [List<int>] of [Component] ids from [Product_Component] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getComponents() {
    //TODO: Implement getComponents in Product
    List<int> people = new List<int>();
    return people;
  }

  /// isComponentOf checks for components.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> isComponentOf() {
    //TODO: Implement isComponentOf in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getSubstitutes returns a list of substitutes.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getSubstitutes() {
    //TODO: Implement getSubstitutes in Product
    List<int> people = new List<int>();
    return people;
  }

  /// substitutesFor checks for substitutes.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> substitutesFor() {
    //TODO: Implement substitutesFor in Product
    List<int> people = new List<int>();
    return people;
  }

  /// replacedBy states what this product is replaced by.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> replacedBy() {
    //TODO: Implement replacedBy in Product
    List<int> people = new List<int>();
    return people;
  }

  /// supercedes <Include description here>.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> supercedes() {
    //TODO: Implement supercedes in Product
    List<int> people = new List<int>();
    return people;
  }

  /// complimentedBy returns what a product is complimented by.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> complimentedBy() {
    //TODO: Implement complimentedBy in Product
    List<int> people = new List<int>();
    return people;
  }

  /// incompatibleWith returns what a product is incompatible with.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> incompatibleWith() {
    //TODO: Implement incompatibleWith in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getPriceComponents returns a list of price components.
  ///
  /// Generates a [List<int>] of [PriceComponent] ids from [Price_Component_Product_Association] where
  ///   Product_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getPriceComponents() {
    //TODO: Implement getPriceComponents in Product
    List<int> people = new List<int>();
    return people;
  }

  /// addCategory adds a category to a product.
  ///
  /// Takes an [int] id for a [Category], and creates an [Product_Category]
  ///   record referencing [this] and the given [Category]. Returns no value.
  void addCategory(int id) {
    //TODO: Implement addCategory in Product
  }

  /// endCategory removes a category from a product.
  ///
  /// Takes an [int] id for a [Category], and removes all [Product_Category]
  ///   records referencing [this] and the given [Category]. Returns no value.
  void endCategory(int id) {
    //TODO: Implement endCategory in Product
  }

  /// makeCategoryPrimary makes a product category primary.
  ///
  /// Takes an [int] id for a [Category], and makes the [Category] primary.
  /// Returns no value.
  void makeCategoryPrimary(int id) {
    //TODO: Implement makeCategoryPrimary in Product
  }

  /// addFeature adds a feature to a product.
  ///
  /// Takes an [int] id for a [Feature], and creates an [Product_Feature]
  ///   record referencing [this] and the given [Feature]. Returns no value.
  void addFeature(int id) {
    //TODO: Implement addFeature in Product
  }

  /// endFeature removes a feature from a product.
  ///
  /// Takes an [int] id for a [Feature], and removes all [Product_Feature]
  ///   records referencing [this] and the given [Feature]. Returns no value.
  void endFeature(int id) {
    //TODO: Implement endFeature in Product
  }

  /// addSupplier adds a supplier to a product.
  ///
  /// Takes an [int] id for a [Supplier], and creates an [Supplier_Product]
  ///   record referencing [this] and the given [Supplier]. Returns no value.
  void addSupplier(int id) {
    //TODO: Implement addSupplier in Product
  }

  /// endSupplier removes a category from a product.
  ///
  /// Takes an [int] id for a [Supplier], and removes all [Supplier_Product]
  ///   records referencing [this] and the given [Supplier]. Returns no value.
  void endSupplier(int id) {
    //TODO: Implement endSupplier in Product
  }

  /// addComponent adds a component to a product.
  ///
  /// Takes an [int] id for a [Component], and creates an [Product_Component]
  ///   record referencing [this] and the given [Component]. Returns no value.
  void addComponent(int id) {
    //TODO: Implement addComponent in Product
  }

  /// endComponent removes a component from a product.
  ///
  /// Takes an [int] id for a [Component], and removes all [Product_Component]
  ///   records referencing [this] and the given [Component]. Returns no value.
  void endComponent(int id) {
    //TODO: Implement endComponent in Product
  }

  /// addSubstitute adds a substitute to a product.
  ///
  /// Takes an [int] id for a [Substitute], and creates an [Product_Substitute]
  ///   record referencing [this] and the given [Substitute]. Returns no value.
  void addSubstitute(int id) {
    //TODO: Implement addSubstitute in Product
  }

  /// endSubstitute removes a substitute from a product.
  ///
  /// Takes an [int] id for a [Substitute], and removes all [Product_Substitute]
  ///   records referencing [this] and the given [Substitute]. Returns no value.
  void endSubstitute(int id) {
    //TODO: Implement endSubstitute in Product
  }

  /// addReplacement adds a replacement to a product.
  ///
  /// Takes an [int] id for a [Replacement], and Replacement
  ///  [this] and the given [Replacement]. Returns no value.
  void addReplacement(int id) {
    //TODO: Implement addReplacement in Product
  }

  /// addCompliment adds a compliment to a product.
  ///
  /// Takes an [int] id for a [Compliment], and creates an [Product_Compliment]
  ///   record referencing [this] and the given [Compliment]. Returns no value.
  void addCompliment(int id) {
    //TODO: Implement addCompliment in Product
  }

  /// endCompliment removes a compliment from a product.
  ///
  /// Takes an [int] id for a [Compliment], and removes all [Product_Compliment]
  ///   records referencing [this] and the given [Compliment]. Returns no value.
  void endCompliment(int id) {
    //TODO: Implement endCompliment in Product
  }

  /// addIncompatibility adds a compatibility to a product.
  ///
  /// Takes an [int] id for an [Incompatibility], and creates an [Product_Incompatibility]
  ///   record referencing [this] and the given [Incompatibility]. Returns no value.
  void addIncompatibility(int id) {
    //TODO: Implement addIncompatibility in Product
  }

  /// endIncompatibility removes a compatibility from a product.
  ///
  /// Takes an [int] id for an [Incompatibility], and removes all [Product_Incompatibility]
  ///   records referencing [this] and the given [Incompatibility]. Returns no value.
  void endIncompatibility(int id) {
    //TODO: Implement endIncompatibility in Product
  }

  /// addPriceComponent adds a price component to a product.
  ///
  /// Takes an [int] id for a [PriceComponent], and creates an [Price_Component_Product_Association]
  ///   record referencing [this] and the given [PriceComponent]. Returns no value.
  void addPriceComponent(int id) {
    //TODO: Implement addPriceComponent in Product
  }

  /// endPriceComponent removes a price component from a product.
  ///
  /// Takes an [int] id for a [PriceComponent], and removes all [Price_Component_Product_Association]
  ///   records referencing [this] and the given [PriceComponent]. Returns no value.
  void endPriceComponent(int id) {
    //TODO: Implement endPriceComponent in Product
  }
}

/// Service
/// This class is used to create Service objects and methods for Service objects.
class Service extends Product {
  int _id;
  int parent_id;
}

/// Good
/// This class is used to create Good objects and methods for Good objects.
class Good extends Product {
  int _id;
  int parent_id;

  /// getInventoryItems returns a list of inventory items.
  ///
  /// Generates a [List<int>] of [InventoryItem] ids from [Inventory_Item] where
  ///   Good_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getInventoryItems() {
    //TODO: Implement getInventoryItems in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getReorderingGuidelines returns a list of reordering guidelines.
  ///
  /// Generates a [List<int>] of [ReorderingGuideline] ids from [Reordering_Guidelines] where
  ///   Good_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getReorderingGuidelines() {
    //TODO: Implement getReorderingGuidelines in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getIdentifications returns a list of identifications.
  ///
  /// Generates a [List<int>] of [Identification] ids from [Good_Identification] where
  ///   Good_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getIdentifications() {
    //TODO: Implement getIdentifications in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getItemShipments returns a list of item shipments.
  ///
  /// Generates a [List<int>] of [ItemShipment] ids from [Shipment_Item] where
  ///   Good_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getItemShipments() {
    //TODO: Implement getItemShipments in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getReceivedShipments returns a list of received shipments.
  ///
  /// Generates a [List<int>] of [ReceivedShipment] ids from [Shipment_Receipt] where
  ///   Good_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getReceivedShipments() {
    //TODO: Implement getReceivedShipments in Product
    List<int> people = new List<int>();
    return people;
  }

  /// addInventoryItem adds an inventory item to a product.
  ///
  /// Takes an [int] id for a [InventoryItem], and creates an [Inventory_Item]
  ///   record referencing [this] and the given [InventoryItem]. Returns no value.
  void addInventoryItem(int id) {
    //TODO: Implement addInventoryItem in Product
  }

  /// addReorderGuideline adds a reorder guideline to a product.
  ///
  /// Takes an [int] id for a [ReorderGuideline], and creates an [Reorder_Guidelines]
  ///   record referencing [this] and the given [ReorderGuideline]. Returns no value.
  void addReorderGuideline(int id) {
    //TODO: Implement addReorderGuideline in Product
  }

  /// endReorderGuideline removes a reorder guideline from a product.
  ///
  /// Takes an [int] id for a [ReorderGuideline], and removes all [Reorder_Guidelines]
  ///   records referencing [this] and the given [ReorderGuideline]. Returns no value.
  void endReorderGuideline(int id) {
    //TODO: Implement endReorderGuideline in Product
  }

  /// addIdentification adds an identification to a product.
  ///
  /// Takes an [int] id for a [Identification], and creates an [Good_Identification]
  ///   record referencing [this] and the given [Identification]. Returns no value.
  void addIdentification(int id) {
    //TODO: Implement addIdentification in Product
  }

  /// addShipment adds a shipment to a product.
  ///
  /// Takes an [int] id for a [Shipment], and creates an [Shipment_Item]
  ///   record referencing [this] and the given [Shipment]. Returns no value.
  void addShipment(int id) {
    //TODO: Implement addShipment in Product
  }

  /// addShipmentReceipt adds a shipment receipt to a product.
  ///
  /// Takes an [int] id for a [ShipmentReceipt], and creates an [Shipment_Receipt]
  ///   record referencing [this] and the given [ShipmentReceipt]. Returns no value.
  void addShipmentReceipt(int id) {
    //TODO: Implement addShipmentReceipt in Product
  }
}
  /// ProductCategory
  /// This class is used to create ProductCategory objects and methods for ProductCategory objects.
  class ProductCategory extends Product {
  int _id;
  int parent_id;
  String description;

  /// getProducts returns a list of Product ids.
  ///
  /// Generates a [List<int>] of [Product] ids from [Product_Category] where
  ///   ProductCategory_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getProducts() {
    //TODO: Implement getProducts in Product
    List<int> people = new List<int>();
    return people;
  }

  /// addProduct adds a Product to a ProductCategory.
  ///
  /// Takes an [int] id for a [Product], and creates an [Product_Category]
  ///   record referencing [this] and the given [Product]. Returns no value.
  void addProduct(int id) {
    //TODO: Implement addProduct in Product
  }

  /// removeProduct removes a Product from a ProductCategory.
  ///
  /// Takes an [int] id for a [Product], and removes all [Product_Category]
  ///   records referencing [this] and the given [Product]. Returns no value.
  void removeProduct(int id) {
    //TODO: Implement removeProduct in Product
  }

  /// getParentCategories returns a list of ParentCategory ids.
  ///
  /// Generates a [List<int>] of [ParentCategory] ids from [Product_Category_Classification] where
  ///   ProductCategory_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getParentCategories() {
    //TODO: Implement getParentCategories in Product
    List<int> people = new List<int>();
    return people;
  }

  /// addParentCategory adds a ParentCategory to a ProductCategory.
  ///
  /// Takes an [int] id for a [ParentCategory], and creates an [Product_Category_Classification]
  ///   record referencing [this] and the given [ParentCategory]. Returns no value.
  void addParentCategory(int id) {
    //TODO: Implement addParentCategory in Product
  }

  /// removeParentCategory removes a ParentCategory from a ProductCategory.
  ///
  /// Takes an [int] id for a [ParentCategory], and removes all [Product_Category_Classification]
  ///   records referencing [this] and the given [ParentCategory]. Returns no value.
  void removeParentCategory(int id) {
    //TODO: Implement removeParentCategory in Product
  }

  /// getChildCategories returns a list of ChildCategory ids.
  ///
  /// Generates a [List<int>] of [ChildCategory] ids from [Product_Category_Classification] where
  ///   ProductCategory_id references [this], or an empty [List<int>] if no parents exist.
  List<int> getChildCategories() {
    //TODO: Implement getChildCategories in Product
    List<int> people = new List<int>();
    return people;
  }

  /// addChildCategory adds a ChildCategory to a ProductCategory.
  ///
  /// Takes an [int] id for a [ChildCategory], and creates an [Product_Category_Classification]
  ///   record referencing [this] and the given [ChildCategory]. Returns no value.
  void addChildCategory(int id) {
    //TODO: Implement addChildCategory in Product
  }

  /// removeProduct removes a ChildCategory from a ChildCategoryCategory.
  ///
  /// Takes an [int] id for a [ChildCategory], and removes all [Product_Category_Classification]
  ///   records referencing [this] and the given [ChildCategory]. Returns no value.
  void removeChildCategory(int id) {
    //TODO: Implement removeChildCategory in Product
  }

  /// getSalesTax returns a list of SalesTax ids.
  ///
  /// @param name Placeholder for parameter name.
  /// @returns A list of integers.
  List<int> getSalesTax() {
    //TODO: Implement getSalesTax in Product
    List<int> people = new List<int>();
    return people;
  }

  /// getGender returns a FeatureType.
  ///
  /// Generates a [FeatureType] from the database, or an empty [FeatureType] if no parents exist.
  FeatureType getFeatureType() {
    //TODO: Implement getFeatureType in Product
    FeatureType people = new FeatureType();
    return people;
  }
}


