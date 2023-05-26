import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final List<String> allFriends = [
    'Nguyễn Đình Nhật Quan',
    'Trần Đình Lộc',
    'Lê Hà Gia Bảo',
    'Lê Đức Hậu',
  ];

  final List<String> selectedFriends = [];
  late List<String> friendResults;

  File? imageFile;

  @override
  void initState() {
    super.initState();
    friendResults = [...allFriends];
  }

  void handleSelectMembers(String member) {
    if (!selectedFriends.contains(member)) {
      setState(() {
        selectedFriends.add(member);
      });
    } else {
      setState(() {
        selectedFriends.remove(member);
      });
    }
  }

  void handleTextChange(String value) {
    if (value == '') {
      setState(() {
        friendResults = [...allFriends];
      });
    } else {
      setState(() {
        friendResults = allFriends
            .where(
                (friend) => friend.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile!.path);
  }

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile!.path);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedFile = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    if (croppedFile != null) {
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
