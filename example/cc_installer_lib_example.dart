import 'package:cc_installer_lib/cc_installer_lib.dart';

Future<void> main() async {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');

  print(await LoopDevice.list());
}
