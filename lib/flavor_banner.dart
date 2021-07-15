import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:provider_starter_app/app_config.dart';
import 'package:provider_starter_app/popup/popup.dart';
import 'package:provider_starter_app/theme/theme.dart';
import 'package:provider_starter_app/utils/application_utils.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;

  const FlavorBanner({required this.child});

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  String? packageName;
  String? version;
  String? buildNumber;
  String? phoneModel;
  String? deviceUdId;

  @override
  void initState() {
    super.initState();

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      final packageName = packageInfo.packageName;
      final version = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;
      setState(() {
        this.packageName = packageName;
        this.version = version;
        this.buildNumber = buildNumber;
      });

      ApplicationUtils.getDeviceUdId().then((String? udid) {
        setState(() {
          deviceUdId = udid;
        });
      });
    });

    try {
      // ignore: omit_local_variable_types
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        deviceInfo.androidInfo.then((AndroidDeviceInfo androidInfo) {
          setState(() {
            phoneModel = androidInfo.model;
          });
        });
      }
      if (Platform.isIOS) {
        deviceInfo?.iosInfo?.then((IosDeviceInfo iosInfo) {
          setState(() {
            phoneModel = iosInfo?.utsname?.machine;
          });
        });
      }
    } catch (e) {
      print('platform error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context)!;
    return config.flavorName == 'stage' || config.flavorName == 'dev'
        ? Stack(
            children: <Widget>[widget.child, _buildBanner(context, config)],
          )
        : widget.child;
  }

  Widget _buildBanner(BuildContext context, AppConfig config) {
    final config = AppConfig.of(context)!;
    return Positioned(
      bottom: -10,
      left: -10,
      child: Container(
        width: 30,
        height: 30,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            PopUp.showDefault(
              context,
              _getContent(config),
              'App is running in `${config.flavorName}` mode',
            );
          },
          child: CustomPaint(
            painter: BannerPainter(
                message: getBannerMessage(config),
                textDirection: TextDirection.ltr,
                layoutDirection: TextDirection.ltr,
                location: BannerLocation.bottomStart,
                color: cherryRed),
          ),
        ),
      ),
    );
  }

  String getBannerMessage(AppConfig config) {
    if (config.flavorName == 'staging') {
      return 'STAGE';
    } else if (config.flavorName == 'dev') {
      return 'DEV';
    }
    return '';
  }

  Widget _getContent(AppConfig config) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTile('Flavor: ', '${config.flavorName}'),
          _buildTile('Phone Model: ', '${phoneModel}'),
          _buildTile('App name: ', '${config.appName}'),
          _buildTile('API URLs: ', '${config.apiUrl}'),
          _buildTile('PackageName: ', packageName),
          _buildTile('Version: ', version),
          _buildTile('BuildNumber: ', buildNumber),
          _buildTile('Device Unique ID: ', deviceUdId),
          ElevatedButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(
                    text:
                        '${buildLine('Phone Model', phoneModel) + buildLine('Flavor', config.flavorName) + buildLine('App name', config.appName) + buildLine('API URL', config.apiUrl) + buildLine('PackageName', packageName) + buildLine('Version', version) + buildLine('BuildNumber', buildNumber)}'),
              );
            },
            child: const Text('Copy to clipboard'),
          ),
        ],
      ),
    );
  }

  static String buildLine(String key, String? value) {
    return '$key: $value\n';
  }

  Widget _buildTile(String key, String? value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key ?? 'this value is null',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
              child: Text(
            value ?? 'this value is null',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
