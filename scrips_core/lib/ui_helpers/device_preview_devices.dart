import 'package:device_preview/device_preview.dart';

// scrips: sumeet: not possible to add new Devices as DeviceFrame() is not exposed - use FreeForm devices instead
/*const androidTab = Device.android(
    name: "Android Tab",
    type: DeviceType.phone,
    portrait: MediaQueryData(
        padding: EdgeInsets.only(top: 20), size: Size(1024, 1336), devicePixelRatio: 2.0),
    landscape:
        MediaQueryData(padding: EdgeInsets.zero, size: Size(1336, 1024), devicePixelRatio: 2.0),
    frame: null);*/

List<Device> extraDevices = [/*androidTab*/];
