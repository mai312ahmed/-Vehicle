import 'dart:io';
import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/core1/const.dart';
import 'package:car_store/screens/signup/singup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utilis/constans.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  getPostNO() async {
    await FirebaseFirestore.instance
        .collection(user)
        .where(userId, isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        postNo = value.docs[0][lastPostNumber] + 1;
      });
    });
  }

  final ImagePicker imagePicker = ImagePicker();
  void selectImage() async {
    try {
      final List<XFile> selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        setState(() {
          images.addAll(selectedImages);
        });
      }
    } on PlatformException catch (e) {
      showloadingForError(context, e.toString());
      select = false;
    }
  }

  List images = [];
  List imagesUrl = [];
  bool select = false;
  File? image;
  String? text;
  int? postNo;

  @override
  void initState() {
    getPostNO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: KprimaryColor)),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "new post ",
                style: TextStyle(fontSize: 20, color: KprimaryColor),
              )
            ],
          ),
          const Divider(
            color: KprimaryColor,
            thickness: 1.5,
            height: 3,
            endIndent: 20,
            indent: 20,
          ),
          Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: KprimaryColor),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                      maxLines: 15,
                      minLines: 10,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: KprimaryColor)),
                        hintText: "What are you thinking ?",
                        filled: false,
                        fillColor: Color.fromARGB(0, 255, 255, 255),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width - 20,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length + 1,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      select = !select;
                                    });
                                  },
                                  child: Container(
                                    color: const Color.fromRGBO(
                                        173, 194, 240, 0.308),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                5.5,
                                        color: KprimaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: 150,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Image.file(File(images[index - 1].path)),
                                    ],
                                  ),
                                );
                        }),
                  ),
                  select == false
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  selectImage();
                                },
                                child: const SelectMethod(
                                  icon: Icon(
                                    Icons.image_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  text: "Pick gallery",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    final image = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                    if (image == null) {
                                      return;
                                    }
                                    final imageTem = File(image.path);
                                    setState(() {
                                      images.add(imageTem);
                                      this.image = imageTem;
                                      select = false;
                                    });
                                  } on PlatformException catch (e) {
                                    showloadingForError(context, e.toString());
                                    select = false;
                                  }
                                },
                                child: const SelectMethod(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  text: "Pick camera",
                                ),
                              ),
                            ]),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GeneralButton(
                text: " Post",
                onTap: () async {
                  if (images.isNotEmpty || text != null) {
                    showloading(context);

                    for (int i = 0; i < images.length; i++) {
                      Reference ref = FirebaseStorage.instance.ref().child(
                          "${FirebaseAuth.instance.currentUser!.uid}/$posts/$postNo/$i");
                      await ref.putFile(File(images[i].path));
                      ref.getDownloadURL().then((value) {
                        imagesUrl.add(value);
                      });
                    }
                    Future.delayed(const Duration(seconds: 2), () async {
                      await FirebaseFirestore.instance.collection(posts).add({
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        postPicsList: imagesUrl,
                        postContent: text,
                        postTime: Timestamp.now().toDate(),
                        postNumber: postNo
                      });
                      await FirebaseFirestore.instance
                          .collection(user)
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({lastPostNumber: postNo});

                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  } else {
                    showloadingForError(context,
                        " The post is empty you can add text or images ");
                  }
                }),
          )
        ]),
      ),
    ));
  }
}

class SelectMethod extends StatelessWidget {
  const SelectMethod({required this.icon, required this.text});
  final String? text;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: KprimaryColor,
            border: Border.all(),
            borderRadius: BorderRadius.circular(5)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          icon!,
          Text(
            text!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ]));
  }
}
