import 'dart:io' show Platform;
import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:android_tv_test_app/page/web_view.dart';

class _LoaderPageState extends State<LoaderPage> {
  late final Timer _delayedNetworkTimer;
  late final Timer _minimumDelayTimer;
  bool _minimumTimerExpired = false;
  bool _loadingSequenceCompleted = false;
  double _opacityLevel = 0.0;
  String _deviceId = '';

  @override
  void initState() {
    super.initState();
    _loadSequence();
  }

  @override
  void dispose() {
    _delayedNetworkTimer.cancel();
    _minimumDelayTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 128,
                width: 128,
                child: Image.asset('assets/images/app_icon.png'),
              ),
              AnimatedOpacity(
                opacity: _opacityLevel,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  margin: const EdgeInsets.only(top: 36),
                  child: const CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadSequence() async {
    try {
      _delayedNetworkTimer =
          Timer(const Duration(seconds: 1), _onDelayedLoading);
      _minimumDelayTimer =
          Timer(const Duration(milliseconds: 600), _onMinimumTimerExpired);

      await _initConfig();

      _onLoadingSequenceCompleted();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _initConfig() async {
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
        _deviceId = info.id;
      } else {
        _deviceId = 'Works only for android';
      }
    } catch (e) {
      debugPrint(e.toString());
      _deviceId = 'Couldn\'t read deviceId';
    }

    debugPrint('deviceId: [$_deviceId]');
  }

  void _onDelayedLoading() {
    setState(() => _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0);
  }

  void _onMinimumTimerExpired() {
    _minimumTimerExpired = true;
    _onDoneLoading();
  }

  void _onLoadingSequenceCompleted() {
    _loadingSequenceCompleted = true;
    _onDoneLoading();
  }

  void _onDoneLoading() {
    if (!_loadingSequenceCompleted || !_minimumTimerExpired) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => WebViewPage(deviceId: _deviceId),
      ),
    );
  }
}

class LoaderPage extends StatefulWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}
