class GetProfileResponse {
  String? username;
  String? profilePicture;
  String? email;
  String? phone;
  Address? address;

  GetProfileResponse(
      {this.username,
        this.profilePicture,
        this.email,
        this.phone,
        this.address});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profilePicture = json['profilePicture'];
    email = json['email'];
    phone = json['phone'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['profilePicture'] = this.profilePicture;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}
class GetAddressesResponse {
  List<Addresses>? addresses;

  GetAddressesResponse({this.addresses});

  GetAddressesResponse.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? name;
  String? province;
  String? state;
  bool? currentUse;

  Addresses({this.name, this.province, this.state, this.currentUse});

  Addresses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    province = json['province'];
    state = json['state'];
    currentUse = json['currentUse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['province'] = this.province;
    data['state'] = this.state;
    data['currentUse'] = this.currentUse;
    return data;
  }
}
class Address {
  String? province;
  String? state;

  Address({this.province, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['state'] = this.state;
    return data;
  }
}
