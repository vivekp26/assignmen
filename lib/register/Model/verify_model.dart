class VerifyModel {
  String? otp;

  VerifyModel({this.otp});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  get success => null;

  get message => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    return data;
  }
}
