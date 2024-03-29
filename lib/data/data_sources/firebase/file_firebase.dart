import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

enum TypeFile {
  images,
}

@Injectable()
class FileStorageFirebase {
  //upload image file
  Future<String?> uploadFile(String filePath) async {
    try {
      final fileName = basename(filePath);
      // path for file in firestore
      Reference ref = FirebaseStorage.instance.ref();
      Reference refDirImage = ref.child(TypeFile.images.toString());
      Reference refToUpload = refDirImage.child(fileName);

      UploadTask? uploadTask = refToUpload.putFile(File(filePath));
      final snapshot = await uploadTask.whenComplete(() => {});
      final urlDownloadImage = await snapshot.ref.getDownloadURL();
      return urlDownloadImage;
    } catch (err) {
      log('Failed to pick image: $err');
      return null;
    }
  }

// Future<String?> uploadRecord(XFile file) async {
//   try {
//     //get name for file by random time.
//     String uniqueImageName = DateTime.now().microsecondsSinceEpoch.toString();
//     // path for file in firestore
//     Reference ref = FirebaseStorage.instance.ref();
//     Reference refDirImage = ref.child(TypeFile.images.toString());
//     Reference refToUpload = refDirImage.child(uniqueImageName);
//     final newMetadata = SettableMetadata(
//       contentType: "audio/mp3",
//     );
//     UploadTask? uploadTask = refToUpload.putFile(
//       File(file.path),
//       newMetadata,
//     );
//     final snapshot = await uploadTask.whenComplete(() => {});
//     final urlDownloadImage = await snapshot.ref.getDownloadURL();
//     return urlDownloadImage;
//   } catch (err) {
//     log('Failed to pick image: $err');
//     return null;
//   }
// }
}
