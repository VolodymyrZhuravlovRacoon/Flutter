import 'package:flutter/material.dart';

class Constants extends InheritedWidget {
  static Constants of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<Constants>();

  const Constants({Widget child, Key key}): super(key: key, child: child);

  final String appKey = '2387dfec-382b-44d0-b5c7-38f687523e8b';
  final String access_token = 'access_token';
  final String touch_id_select = 'touch_id_select';
  final String user_id = 'user_id';
  final String refresh_token = 'refresh_token';
  final String local = 'local';
  final String policy_url = 'https://bond.com.ua/confidential.html';
  final String baseUrl = "https://viaversa.com/client/api/v1";

  @override
  bool updateShouldNotify(Constants oldWidget) => false;
}