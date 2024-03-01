class UserData {
  String name;
  String address;
  int mobile;

  UserData({required this.name, required this.mobile, required this.address});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['name'],
        mobile: json['mobile'],
        address: json['address'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'mobile': mobile,
        'address': address,
      };
}
