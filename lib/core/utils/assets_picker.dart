import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AppAssetsPicker {
  static Future<String?>? pickSingleAssets(BuildContext context,
      {int limit = 1}) async {
    try {
      final List<AssetEntity>? result = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: limit,
          requestType: RequestType.image,
        ),
      );
      if (result == null) return null;
      final file = await result[0].file;
      if (file == null) return null;
      final filePath = file.path;
      return filePath;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}