import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickersController extends GetxController{
  var selectedImage = "".obs ;
  var base64Image="".obs;
  ImagePicker imagePicker = ImagePicker();
  Future pickerImages() async {
    var images = await imagePicker.pickImage(source: ImageSource.gallery,imageQuality: 5);
    if(images!.path.isNotEmpty) {
      selectedImage.value=images.path;
      convertImageToBase64();
    }
  }
   convertImageToBase64(){
    if(selectedImage.isNotEmpty)
      {
        final bytes = File(selectedImage.value).readAsBytesSync();
        base64Image.value= base64Encode(bytes);
      }
  }
}
