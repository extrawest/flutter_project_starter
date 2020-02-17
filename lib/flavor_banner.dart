import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:provider_starter_app/app_config.dart';
import 'package:provider_starter_app/popup/popup.dart';
import 'package:provider_starter_app/theme/theme.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;

  FlavorBanner({@required this.child});

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  String packageName;
  String version;
  String buildNumber;
  String phoneModel;

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      setState(() {
        this.packageName = packageName;
        this.version = version;
        this.buildNumber = buildNumber;
      });
    });

    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        deviceInfo.androidInfo.then((AndroidDeviceInfo androidInfo) {
          setState(() {
            this.phoneModel = androidInfo.model;
          });
        });
      }
      if (Platform.isIOS) {
        deviceInfo?.iosInfo?.then((IosDeviceInfo iosInfo) {
          setState(() {
            this.phoneModel = iosInfo?.utsname?.machine;
          });
        });
      }
    }
    catch (e) {
      print('platform error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return config.flavorName == 'stage' || config.flavorName == 'dev'
        ? Stack(
      children: <Widget>[widget.child, _buildBanner(context, config)],
    )
        : widget.child;
  }

  Widget _buildBanner(BuildContext context, AppConfig config) {
    var config = AppConfig.of(context);
    return Positioned(
      bottom: -10,
      left: -10,
      child: Container(
        width: 30,
        height: 30,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: CustomPaint(
            painter: BannerPainter(
                message: getBannerMessage(config),
                textDirection: TextDirection.ltr,
                layoutDirection: TextDirection.ltr,
                location: BannerLocation.bottomStart,
                color: cherryRed),
          ),
          onTap: () {
            PopUp.showDefault(
              context,
              _getContent(config),
              "App is running in `${config.flavorName}` mode",
            );
          },
        ),
      ),
    );
  }

  String getBannerMessage(AppConfig config) {
    if (config.flavorName == 'staging') {
      return "STAGE";
    } else if (config.flavorName == 'dev') {
      return "DEV";
    }
    return "";
  }

  Widget _getContent(AppConfig config) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTile('Flavor: ', '${config.flavorName}'),
          _buildTile('Phone Model: ', '${this.phoneModel}'),
          _buildTile('App name: ', '${config.appName}'),
          _buildTile('API URLs: ', '${config.apiUrl}'),
          _buildTile('PackageName: ', this.packageName),
          _buildTile('Version: ', this.version),
          _buildTile('BuildNumber: ', this.buildNumber),
          RaisedButton(
            child: Text("Copy to clipboard"),
            onPressed: () {
              Clipboard.setData(ClipboardData(
                  text: '${
                      buildLine('Phone Model', this.phoneModel) +
                          buildLine('Flavor', config.flavorName) +
                          buildLine('App name', config.appName) +
                          buildLine('API URL', config.apiUrl) +
                          buildLine('PackageName', this.packageName) +
                          buildLine('Version', this.version) +
                          buildLine('BuildNumber', this.buildNumber)
                  }'
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  static buildLine(String key, String value) {
    return '${key}: ${value}\n';
  }

  Widget _buildTile(String key, String value) {
    if (key == null) {
      key = "this value is null";
    }
    if (value == null) {
      value = "this value is null";
    }
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(child: Text(value, maxLines: 5, overflow: TextOverflow.ellipsis,))
        ],
      ),
    );
  }
}
