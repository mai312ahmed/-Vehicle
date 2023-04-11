import 'dart:io';

import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/core1/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../signup/singup.dart';
import 'addPost.dart';

class AddWorkshop extends StatefulWidget {
  const AddWorkshop({super.key});

  @override
  State<AddWorkshop> createState() => _AddWorkshopState();
}

class _AddWorkshopState extends State<AddWorkshop> {
  List images = [];
  List imagesUrl = [];
  bool select = false;
  List selected = [false, false, false, false];
  File? image;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? info;
  bool feature = false;
  bool elec = false;
  bool general = false;
  bool mecha = false;
  bool airCon = false;
  GlobalKey<FormState> formkey = GlobalKey();
  int? workshopNo;
  getworkshopNO() async {
    await FirebaseFirestore.instance
        .collection(user)
        .where(userId, isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        workshopNo = value.docs[0][lastWorkshopNumber] + 1;
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

  @override
  void initState() {
    getworkshopNO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formkey,
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
                    "New workshop ",
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WorkshopFormField(
                      hint: 'Enter your workShop name',
                      lable: 'Name',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "field is required";
                        }
                        return null;
                      },
                      onChange: (value) {
                        name = value;
                      },
                      minline: 1,
                      maxline: 2,
                    ),
                    WorkshopFormField(
                      lable: "Phone",
                      hint: "Enter your phone number",
                      onChange: (value) {
                        phone = value;
                      },
                      validate: (value) {
                        return null;
                      },
                      minline: 1,
                      maxline: 2,
                    ),
                    WorkshopFormField(
                      lable: "Email",
                      hint: "Enter your email",
                      onChange: (value) {
                        email = value;
                      },
                      validate: (value) {
                        return null;
                      },
                      minline: 1,
                      maxline: 2,
                    ),
                    WorkshopFormField(
                      hint: 'Enter your workShop address',
                      lable: 'Address',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "field is required";
                        }
                        return null;
                      },
                      onChange: (value) {
                        address = value;
                      },
                      minline: 1,
                      maxline: 3,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              feature = !feature;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Work shop main services",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Icon(
                                  feature == false
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  size: 35,
                                )
                              ],
                            ),
                          ),
                        ),
                        feature == true
                            ? Center(
                                child: SizedBox(
                                  height:
                                      workshopServicesList.length.toDouble() *
                                          40,
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: ListView.builder(
                                      itemCount: workshopServicesList.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              switch (
                                                  workshopServicesList[index]) {
                                                case mechanics:
                                                  {
                                                    setState(() {
                                                      mecha = !mecha;
                                                      selected[index] = mecha;
                                                    });
                                                    break;
                                                  }
                                                case electricity:
                                                  {
                                                    setState(() {
                                                      elec = !elec;
                                                      selected[index] = elec;
                                                    });
                                                    break;
                                                  }
                                                case refrigerationAndAirConditioning:
                                                  {
                                                    setState(() {
                                                      airCon = !airCon;
                                                      selected[index] = airCon;
                                                    });
                                                    break;
                                                  }
                                                case generalServices:
                                                  {
                                                    setState(() {
                                                      general = !general;
                                                      selected[index] = general;
                                                    });
                                                    break;
                                                  }
                                              }
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 3),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all()),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    workshopServicesList[index],
                                                    style: const TextStyle(
                                                        fontSize: 18)),
                                                selected[index] == true
                                                    ? const Icon(Icons.check)
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WorkshopFormField(
                      lable: "Addition infoemation",
                      hint: "Write moer infoemation about your workshop",
                      onChange: (value) {
                        info = value;
                      },
                      validate: (value) {
                        return null;
                      },
                      minline: 3,
                      maxline: 10,
                    ),
                    const Text(
                      "add pictures",
                      style: TextStyle(
                          fontSize: 20,
                          color: KprimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
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
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5.5,
                                          color: KprimaryColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    height: 150,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.file(
                                            File(images[index - 1].path)),
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
                                          .pickImage(
                                              source: ImageSource.camera);
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
                                      showloadingForError(
                                          context, e.toString());
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
                    const SizedBox(
                      height: 20,
                    ),
                    GeneralButton(
                        text: "Add workshop",
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            showloading(context);
                            for (int i = 0; i < images.length; i++) {
                              Reference ref = FirebaseStorage.instance.ref().child(
                                  "${FirebaseAuth.instance.currentUser!.uid}/$workshops/$workshopNo/$i");
                              await ref.putFile(File(images[i].path));
                              ref.getDownloadURL().then((value) {
                                imagesUrl.add(value);
                              });
                            }

                            Future.delayed(const Duration(seconds: 2),
                                () async {
                              await FirebaseFirestore.instance
                                  .collection(workshops)
                                  .add({
                                ownerId: FirebaseAuth.instance.currentUser!.uid,
                                workshopPicsList: imagesUrl,
                                workshopAddress: address,
                                workshopEmail: email,
                                workshopName: name,
                                workshopPhone: phone,
                                workshopNumber: workshopNo,
                                additionInfo: info,
                                electricity: elec,
                                mechanics: mecha,
                                generalServices: general,
                                refrigerationAndAirConditioning: airCon
                              });
                              await FirebaseFirestore.instance
                                  .collection(user)
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({lastWorkshopNumber: workshopNo});

                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          }
                        })
                  ],
                ),
              )
            ]))));
  }
}

class WorkshopFormField extends StatelessWidget {
  const WorkshopFormField({
    super.key,
    required this.lable,
    required this.hint,
    required this.onChange,
    required this.validate,
    required this.minline,
    required this.maxline,
  });
  final String lable;
  final String hint;
  final ValueSetter onChange;
  final String? Function(String?)? validate;
  final int minline;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          minLines: minline,
          maxLines: maxline,
          decoration: InputDecoration(
              labelText: lable,
              hintText: hint,
              labelStyle: const TextStyle(color: KprimaryColor, fontSize: 20),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: KprimaryColor, width: 1.5)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: KprimaryColor, width: 2),
              )),
          onChanged: onChange,
          validator: validate,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
