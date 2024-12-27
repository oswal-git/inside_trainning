import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:inside_trainning/app/pages/pages.dart';
import 'package:inside_trainning/domain/entities/device.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:package_info_plus/package_info_plus.dart';

class LoginController extends Controller {
  PackageInfo _info;

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final Device _device = Device();
  bool isBiometricAvailable = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  LoginController() : _info = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  String get info => '${_info.appName} v${_info.version}';
  Device get device => _device;

  @override
  void initListeners() async {
    await retrieveData();
    await retrieveDevice();

    isBiometricAvailable = await _localAuthentication.canCheckBiometrics;
    logger.finest('finger', isBiometricAvailable);

    refreshUI();

    // _localAuthentication.canCheckBiometrics.then((value) {
    //   logger.finest('finger', value);
    //   isBiometricAvailable = value;
    //   // refreshUI();
    // });
  }

  Future<void> retrieveData() async {
    _info = await PackageInfo.fromPlatform();
    // refreshUI();
  }

  Future<void> retrieveDevice() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo android = await _deviceInfoPlugin.androidInfo;
      _device.id = android.id;
      _device.model = android.model;
      _device.appversion = packageInfo.version;
      _device.os = 'android';
      _device.versionOS = android.version.release;
      _device.dateCreation = DateTime.now();
      // refreshUI();
    } else {
      final IosDeviceInfo ios = await _deviceInfoPlugin.iosInfo;
      _device.id = ios.identifierForVendor;
      _device.model = ios.model;
      _device.appversion = packageInfo.version;
      _device.os = 'ios';
      _device.versionOS = ios.systemVersion;
      _device.dateCreation = DateTime.now();
      // refreshUI();
    }
  }

  void fingerAuthLogin() async {
    bool didAuthenticated = false;

    try {
      didAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Ingresa tu huella para validar identidad',
        options: const AuthenticationOptions(biometricOnly: true, useErrorDialogs: false),
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
        logger.finest("Device don't support fingerprint authorization");
      } else if (e.code == auth_error.notEnrolled) {
        // ...
        logger.finest("Fingerprint not registered");
      } else {
        // ...
        logger.finest("Error on check fingerprint authorization");
      }
    }

    if (didAuthenticated) {
      final Map<String, dynamic> args = <String, dynamic>{};
      Navigator.pushReplacementNamed(getContext(), Pages.splash, arguments: args);
      logger.finest('Authenticated');
    }
  }
}
