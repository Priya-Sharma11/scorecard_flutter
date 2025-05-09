import 'package:flutter/material.dart';

enum DeviceScreenType {mobile,tablet,desktop}

DeviceScreenType getDeviceType(BuildContext context){
  final width = MediaQuery.of(context).size.width;

  if(width >= 1024) return DeviceScreenType.desktop;
  if(width >= 600) return DeviceScreenType.tablet;
  return DeviceScreenType.mobile;

}

class ResponsiveLayout extends StatelessWidget{
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch(deviceType){
      case DeviceScreenType.mobile:
        return mobile;
      case DeviceScreenType.tablet:
        return tablet;
      case DeviceScreenType.desktop:
        return desktop;
    }
  }
}