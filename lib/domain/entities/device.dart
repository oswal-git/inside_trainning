import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Device extends Equatable {
  Device({
    this.id,
    this.model,
    this.appversion,
    this.os,
    this.versionOS,
    this.dateCreation,
    this.dateModification,
    this.dateLast,
    this.fcmToken,
    this.userId,
    this.enabled,
  });

  String? id;
  String? model;
  String? appversion;
  String? os;
  String? versionOS;
  DateTime? dateCreation;
  DateTime? dateModification;
  String? dateLast;
  String? fcmToken;
  String? userId;
  bool? enabled;

  Device.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    id = json['id'] as String?;
    model = json['model'] as String?;
    appversion = json['appversion'] as String?;
    os = json['os'] as String?;
    versionOS = json['versionOS'] as String?;
    dateCreation = (json['dateCreation'] == null) ? null : DateTime.parse(json['dateCreation'] as String);
    dateModification = (json['dateModification'] == null) ? null : DateTime.parse(json['dateModification'] as String);
    dateLast = json['dateLast'] as String?;
    fcmToken = json['fcmToken'] as String?;
    userId = json['userId'] as String?;
    enabled = json['enabled'] as bool?;
  }

  @override
  List<Object?> get props => [id, model, appversion, os, versionOS, dateCreation, dateModification, dateLast, fcmToken, userId, enabled];

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};

    if (id != null) json['id'] = id;
    if (model != null) json['id'] = model;
    if (appversion != null) json['id'] = appversion;
    if (os != null) json['id'] = os;
    if (versionOS != null) json['id'] = versionOS;
    if (dateCreation != null) json['id'] = dateCreation?.toUtc().toIso8601String();
    if (dateModification != null) json['id'] = dateModification?.toUtc().toIso8601String();
    if (dateLast != null) json['id'] = dateLast;
    if (fcmToken != null) json['id'] = fcmToken;
    if (userId != null) json['id'] = userId;
    if (enabled != null) json['id'] = enabled;

    return json;
  }

  static List<Device> listFromJson(List<dynamic>? json) {
    return json == null ? <Device>[] : json.map((dynamic value) => Device.fromJson(value as Map<String, dynamic>)).toList();
  }

  static Map<String, dynamic>? mapFromJson(Map<String, Map<String, dynamic>>? json) {
    final Map<String, dynamic> map = <String, Device>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = Device.fromJson(value));
    }

    return map;
  }

  static Map<String, List<Device>>? mapListFromJson(Map<String, List<Map<String, dynamic>>>? json) {
    final Map<String, List<Device>> map = <String, List<Device>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, List<Map<String, dynamic>> value) => map[key] = Device.listFromJson(value));
    }

    return map;
  }
}
