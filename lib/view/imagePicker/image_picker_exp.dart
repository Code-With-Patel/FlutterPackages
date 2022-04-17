import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExp extends StatefulWidget {
  const ImagePickerExp({Key? key}) : super(key: key);

  @override
  State<ImagePickerExp> createState() => _ImagePickerExpState();
}

class _ImagePickerExpState extends State<ImagePickerExp> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  List<File> multipleImages = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeWithPatel"),
      ),
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  // XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                XFile? video=  await _picker.pickVideo(source: ImageSource.gallery);
                  setState(() {
                    image = File(video!.path);
                  });
                  print("Video ${image!.path}");
                },
                child: Text("Image Picker")),
            ElevatedButton(
                onPressed: () async {
                  List<XFile>? picked = await _picker.pickMultiImage();
                  setState(() {
                    multipleImages = picked!.map((e) => File(e.path)).toList();
                  });
                },
                child: const Text("Multiple Image Picker")),
            // image == null
            //     ? const Text("There is No Image")
            //     : Image.file(
            //         image!,
            //         height: 200,
            //         width: 200,
            //       )
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: multipleImages.length,
                  itemBuilder: (context, index) {
                    return GridTile(child: Image.file(multipleImages[index]));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
