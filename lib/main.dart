import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'modules/web/app.dart';

void main() {
  if (kIsWeb) {
    runApp(WebApp());
  } else if (Platform.isAndroid) {
    print("Android");
  }
}
