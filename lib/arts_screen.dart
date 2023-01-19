import 'dart:io';
import 'package:ai_image_generator/colors.dart';
import 'package:flutter/material.dart';

class ArtsScreen extends StatefulWidget {
  const ArtsScreen({super.key});
  @override
  State<ArtsScreen> createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  List imgList = [];

  getImages() async {
    final directory = Directory("storage/emulated/0/DCIM/AI Image");
    imgList = directory.listSync();
    print(imgList);
  }

  popImage(filepath) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.file(
                  filepath,
                  fit: BoxFit.cover,
                ),
              ),
            ));
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Art Gallery",
          style: TextStyle(
            fontFamily: "poppins_bold",
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 300),
            itemCount: imgList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  popImage(imgList[index]);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.file(
                    imgList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
