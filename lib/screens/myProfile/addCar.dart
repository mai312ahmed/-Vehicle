import 'dart:io';
import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/core1/const.dart';
import 'package:car_store/screens/signup/singup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'addPost.dart';
import 'package:dropdown_search/dropdown_search.dart';

List images = [];
List imagesUrl = [];

List safetyAndDriverAssistanceSystemSave = [];
List exteriorSave = [];
List entertainmentSave = [];
List interiorSave = [];
List comfortSave = [];
List safetyAndDriverAssistanceSystemSelect = [false, false, false];
List exteriorSelect = [false, false];
List entertainmentSelect = [false, false];
List comfortSelect = [false, false];
List interiorSelect = [];
String? descriptin;
List carSpecifications = [
  null,
  null,
  null,
  null,
];

class AddCar extends StatefulWidget {
  const AddCar({super.key});
  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  String? brand;
  String? model;
  String? year;
  String? price;
  String? km;
  String? trim;
  String? type;
  String? interiorColor;
  String? exteriorColor;
  String? transmission;
  String? fuel;
  String? doors;
  String? cylinder;
  String? warranty;
  int? carNO;
  getCarNO() async {
    await FirebaseFirestore.instance
        .collection(user)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        carNO = value.data()![lastCarNumber] + 1;
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

  bool select = false;
  File? image;
  @override
  void initState() {
    getCarNO();
    super.initState();
  }

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon:
                            const Icon(Icons.arrow_back, color: KprimaryColor)),
                    const Text(
                      "Add car ",
                      style: TextStyle(
                          fontSize: 20,
                          color: KprimaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: carsBrand,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Company"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) async {
                      setState(() {
                        brand = value;
                      });
                      modelsList.clear();
                      await FirebaseFirestore.instance
                          .collection(models)
                          .doc(brand)
                          .get()
                          .then((value) {
                        var m = value.data()![models];
                        for (int i = 0; i < m.length; i++) {
                          modelsList.add(m[i]);
                        }
                        setState(() {
                          modelsList;
                        });
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: modelsList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Models"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        model = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: years,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Year"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        year = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Add pic",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
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
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 140,
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
                const SizedBox(
                  height: 10,
                ),
                const Text("Car specifications",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Feature(
                  feature: 'Price',
                  index: 0,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                ),
                Feature(
                  feature: 'km',
                  index: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: trimList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Trim"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        trim = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: carTypeList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Car type"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        type = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: interiorColorList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Interior color"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        interiorColor = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: exteriorColorList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "Exterior color"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        exteriorColor = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: transmissionList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "transmission"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        transmission = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: fuelTypeList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "fuel type"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        fuel = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(),
                  ),
                  child: DropdownSearch<String>(
                    items: doorsList,
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    dropdownSearchDecoration:
                        const InputDecoration(hintText: "doors"),
                    showSearchBox: true,
                    searchFieldProps:
                        const TextFieldProps(cursorColor: KprimaryColor),
                    onChanged: (value) {
                      setState(() {
                        doors = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Feature(
                  feature: 'cylinder',
                  index: 2,
                  validator: (value) {},
                ),
                Feature(
                  feature: 'warranty',
                  index: 3,
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Car features",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                FeaturePlus(
                  select: safetyAndDriverAssistanceSystemSelect,
                  view: safetyAndDriverAssistanceSystemList,
                  lable: "Safety & driver assistance systems",
                ),
                const SizedBox(
                  height: 10,
                ),
                FeaturePlus(
                  select: interiorSelect,
                  view: interiorList,
                  lable: "Interior",
                ),
                const SizedBox(
                  height: 10,
                ),
                FeaturePlus(
                  select: exteriorSelect,
                  view: exteriorList,
                  lable: "exterior",
                ),
                const SizedBox(
                  height: 10,
                ),
                FeaturePlus(
                  select: entertainmentSelect,
                  view: entertainmentList,
                  lable: "entertainment",
                ),
                const SizedBox(
                  height: 10,
                ),
                FeaturePlus(
                  select: comfortSelect,
                  view: comfortList,
                  lable: "comfort",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Car describtion",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: MediaQuery.of(context).size.width - 16,
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    onChanged: (value) {
                      setState(() {
                        descriptin = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GeneralButton(
                    text: "post",
                    onTap: () async {
                      price = carSpecifications[0];
                      km = carSpecifications[1];
                      cylinder = carSpecifications[2];
                      warranty = carSpecifications[3];
                      if (images.isNotEmpty &&
                          brand != null &&
                          model != null &&
                          year != null &&
                          km != null &&
                          price != null) {
                        showloading(context);

                        for (int i = 0; i < images.length; i++) {
                          Reference ref = FirebaseStorage.instance.ref().child(
                              "${FirebaseAuth.instance.currentUser!.uid}/$cars/$carNO/$i");
                          await ref.putFile(File(images[i].path));
                          ref.getDownloadURL().then((value) {
                            imagesUrl.add(value);
                          });
                        }

                        Future.delayed(const Duration(seconds: 2), () async {
                          await FirebaseFirestore.instance
                              .collection("cars")
                              .add({
                            ownerId: FirebaseAuth.instance.currentUser!.uid,
                            carNumber: carNO,
                            carPicsList: imagesUrl,
                            carDescriptin: descriptin,
                            exterior: exteriorSave,
                            interior: interiorSave,
                            entertainment: entertainmentSave,
                            safetyAndDriverAssistanceSystem:
                                safetyAndDriverAssistanceSystemSave,
                            comfort: comfortList,
                            carBrand: brand,
                            carModel: model,
                            carYear: year,
                            carPrice: price,
                            carKm: km,
                            carTrim: trim,
                            carType: type,
                            carInteriorColor: interiorColor,
                            carExteriorColor: exteriorColor,
                            carTransmission: transmission,
                            carFuelType: fuel,
                            carDoors: doors,
                            carCylinder: cylinder,
                            carWarranty: warranty
                          });
                          await FirebaseFirestore.instance
                              .collection(user)
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({lastCarNumber: carNO});

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          images.clear();
                          imagesUrl.clear();
                        });
                      } else {
                        showloadingForError(context,
                            " You must select the brand , model,manufacturing year , mileage , price and add at least one image ");
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Feature extends StatelessWidget {
  const Feature(
      {required this.feature, required this.index, required this.validator});
  final String? feature;
  final int index;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: (MediaQuery.of(context).size.width - 32) / 2,
                child: Text(feature!)),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(color: KprimaryColor, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(color: KprimaryColor, width: 3)),
                ),
                onChanged: (value) {
                  carSpecifications[index] = value;
                },
                validator: validator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeaturePlus extends StatefulWidget {
  const FeaturePlus({
    super.key,
    this.lable,
    required this.select,
    required this.view,
  });
  final String? lable;
  final List select;
  final List view;
  @override
  State<FeaturePlus> createState() => _FeaturePlusState();
}

class _FeaturePlusState extends State<FeaturePlus> {
  bool feature = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                border: Border.all(), borderRadius: BorderRadius.circular(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.lable!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 35,
                )
              ],
            ),
          ),
        ),
        feature == true
            ? Center(
                child: SizedBox(
                  height: widget.view.length.toDouble() * 40,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ListView.builder(
                      itemCount: widget.view.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.select[index] = !widget.select[index];
                              switch (widget.lable) {
                                case "Safety & driver assistance systems":
                                  {
                                    if (widget.select[index] == true) {
                                      safetyAndDriverAssistanceSystemSave
                                          .add(widget.view[index]);
                                    } else {
                                      safetyAndDriverAssistanceSystemSave
                                          .remove(widget.view[index]);
                                    }
                                    break;
                                  }
                                case "interior":
                                  {
                                    if (widget.select[index] == true) {
                                      interiorSave.add(widget.view[index]);
                                    } else {
                                      interiorSave.remove(widget.view[index]);
                                    }
                                    break;
                                  }
                                case "exterior":
                                  {
                                    if (widget.select[index] == true) {
                                      exteriorSave.add(widget.view[index]);
                                    } else {
                                      exteriorSave.remove(widget.view[index]);
                                    }
                                    break;
                                  }
                                case "entertainment":
                                  {
                                    if (widget.select[index] == true) {
                                      entertainmentSave.add(widget.view[index]);
                                    } else {
                                      entertainmentSave
                                          .remove(widget.view[index]);
                                    }
                                    break;
                                  }
                                case "comfort":
                                  {
                                    if (widget.select[index] == true) {
                                      comfortSave.add(widget.view[index]);
                                    } else {
                                      comfortSave.remove(widget.view[index]);
                                    }
                                    break;
                                  }
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all()),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.view[index],
                                    style: const TextStyle(fontSize: 18)),
                                widget.select[index] == true
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
    );
  }
}
