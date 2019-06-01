import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class storage{
  static Future<String> enviarFoto(File imagem, String id) async {
    final StorageReference ref = FirebaseStorage.instance.ref().child('fotoperfil$id.jpg');
    final StorageUploadTask uploadTask = ref.putFile(imagem);
    String fotoLink = await (await uploadTask.onComplete).ref.getDownloadURL();
    return fotoLink;
  }
}