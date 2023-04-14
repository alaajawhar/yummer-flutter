class GetStoreOrdersResponse {
  int? count;
  List<OrderList>? orderList;

  GetStoreOrdersResponse({this.count, this.orderList});

  GetStoreOrdersResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['orderList'] != null) {
      orderList = <OrderList>[];
      json['orderList'].forEach((v) {
        orderList!.add(new OrderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.orderList != null) {
      data['orderList'] = this.orderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class GetStoreOffersResponse {
  List<Offers>? offers;

  GetStoreOffersResponse({this.offers});

  GetStoreOffersResponse.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class GetFiltersResponse {
  List<Order>? order;
  List<Category>? category;

  GetFiltersResponse({this.order, this.category});

  GetFiltersResponse.fromJson(Map<String, dynamic> json) {
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class GetPromocodesResponse {
  List<Promocodes>? promocodes;

  GetPromocodesResponse({this.promocodes});

  GetPromocodesResponse.fromJson(Map<String, dynamic> json) {
    if (json['promocodes'] != null) {
      promocodes = <Promocodes>[];
      json['promocodes'].forEach((v) {
        promocodes!.add(new Promocodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promocodes != null) {
      data['promocodes'] = this.promocodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promocodes {
  int? id;
  String? value;
  String? description;
  int? expiryDate;
  String? imageUrl;

  Promocodes(
      {this.id, this.value, this.description, this.expiryDate, this.imageUrl});

  Promocodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    description = json['description'];
    expiryDate = json['expiryDate'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['description'] = this.description;
    data['expiryDate'] = this.expiryDate;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
class Category {
  String? id;
  String? description;

  Category({this.id, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
class Order {
  String? id;
  String? description;

  Order({this.id, this.description});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    return data;
  }
}
class OrderList {
  int? id;
  String? name;
  String? category;
  String? price;
  int? discount;
  String? imageUrl;

  OrderList(
      {this.id,
        this.name,
        this.category,
        this.price,
        this.discount,
        this.imageUrl});

  OrderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    discount = json['discount'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
class Offers {
  int? id;
  String? imageUrl;

  Offers({this.id, this.imageUrl});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}


