import 'dart:io';
import 'dart:convert';

// https://linuxconfig.org/how-to-create-loop-devices-on-linux
class LoopDevice {

	LoopDevice();

	static Future<Map<String, dynamic>> list() async {
		var result = await Process.run(
			'losetup', 
			[
				'--json',
				'--list',
			],
		);

		return jsonDecode(result.stdout);
	}

}
