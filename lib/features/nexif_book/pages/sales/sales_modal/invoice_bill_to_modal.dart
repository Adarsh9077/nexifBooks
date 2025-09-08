class InvoiceBillToModal {
  int? id;
  String? name;
  String? address;
  String? city;
  String? state;
  String? country;

  InvoiceBillToModal({
    this.id,
    this.name,
    this.address,
    this.city,
    this.state,
    this.country,
  });

  InvoiceBillToModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['billing_address']["address"] ?? "";
    city = json['billing_address']['city'] ?? "";
    state = json['billing_address']['state'] ?? "";
    country = json['billing_address']['country'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}
