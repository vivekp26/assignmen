class LoginModel {
  bool? success;
  String? message;
  String? token;
  User? user;
  AccountPreference? accountPreference;
  NotificationSettings? notificationSettings;
  bool? isVerified;

  LoginModel(
      {this.success,
      this.message,
      this.token,
      this.user,
      this.accountPreference,
      this.notificationSettings,
      this.isVerified});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accountPreference = json['account_preference'] != null
        ? new AccountPreference.fromJson(json['account_preference'])
        : null;
    notificationSettings = json['notification_settings'] != null
        ? new NotificationSettings.fromJson(json['notification_settings'])
        : null;
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.accountPreference != null) {
      data['account_preference'] = this.accountPreference!.toJson();
    }
    if (this.notificationSettings != null) {
      data['notification_settings'] = this.notificationSettings!.toJson();
    }
    data['is_verified'] = this.isVerified;
    return data;
  }
}

class User {
  String? id;
  String? avatar;
  String? fullName;
  String? email;
  String? deviceToken;
  String? type;
  String? socialId;

  User(
      {this.id,
      this.avatar,
      this.fullName,
      this.email,
      this.deviceToken,
      this.type,
      this.socialId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    fullName = json['full_name'];
    email = json['email'];
    deviceToken = json['device_token'];
    type = json['type'];
    socialId = json['social_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['device_token'] = this.deviceToken;
    data['type'] = this.type;
    data['social_id'] = this.socialId;
    return data;
  }
}

class AccountPreference {
  String? locale;
  String? timeZone;
  String? currency;

  AccountPreference({this.locale, this.timeZone, this.currency});

  AccountPreference.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    timeZone = json['time_zone'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    data['time_zone'] = this.timeZone;
    data['currency'] = this.currency;
    return data;
  }
}

class NotificationSettings {
  String? notificationSettings;
  String? minBidThreshold;

  NotificationSettings({this.notificationSettings, this.minBidThreshold});

  NotificationSettings.fromJson(Map<String, dynamic> json) {
    notificationSettings = json['notificationSettings'];
    minBidThreshold = json['minBidThreshold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationSettings'] = this.notificationSettings;
    data['minBidThreshold'] = this.minBidThreshold;
    return data;
  }
}
