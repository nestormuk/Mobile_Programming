// lib/connectivity_service.dart
import 'dart:html' as html;
import 'package:flutter/material.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService _instance =
  ConnectivityService._privateConstructor();

  static ConnectivityService get instance => _instance;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  void initialize() {
    html.window.onOnline.listen((event) {
      _showConnectivitySnackBar(true);
    });

    html.window.onOffline.listen((event) {
      _showConnectivitySnackBar(false);
    });

    bool? isOnline = html.window.navigator.onLine;
    if (isOnline != null && isOnline) {
      _showConnectivitySnackBar(true);
    } else {
      _showConnectivitySnackBar(false);
    }
  }

  void _showConnectivitySnackBar(bool isConnected) {
    String message =
    isConnected ? 'Connected to the Internet' : 'No Internet Connection';
    Color bgColor = isConnected ? Colors.green : Colors.red;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bgColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

