class ForgotModel {
  String? mobile;

  ForgotModel({this.mobile});

  ForgotModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  get success => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    return data;
  }
}
