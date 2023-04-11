import 'dart:io';
import 'package:car_store/screens/myProfile/addCar.dart';
import 'package:car_store/screens/myProfile/addWorkshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/utilis/constans.dart';
import '../../core1/const.dart';
import '../signup/singup.dart';
import 'addPost.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  var image;
  var newPic;
  String? userName;
  String? profilePic = "";
  getUserInfo() async {
    try {
      await FirebaseFirestore.instance
          .collection(user)
          .where(userId, isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        setState(() {
          userName = value.docs[0][name];
          profilePic = value.docs[0][userProfilePic];
        });
      });
    } on FirebaseException catch (e) {}
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: KprimaryColor,
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        profilePic != ""
                            ? CircleAvatar(
                                radius: 55,
                                backgroundImage: NetworkImage(profilePic!))
                            : const CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    AssetImage("assets/pic/car.png")),
                        GestureDetector(
                          onTap: () {
                            select(context);
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(142, 6, 6, 6),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userName != null ? userName! : "user name",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "- Alwaha workshop    ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "- Alsafa workshop    ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "- Alwaha store    ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "More ...    ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            color: KprimaryColor,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      //  Get.to(() => const AddPost());
                    },
                    child: const Add(text: "  Add post")),
                GestureDetector(
                  onTap: () {
                    // Get.to(() => const AddCar());
                  },
                  child: const Add(
                    text: "  Add your car",
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      // Get.to(() => const AddWorkshop());
                    },
                    child: const Add(text: "  Add workshop")),
                const Add(text: "  Add Store"),
              ],
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(posts)
                  .where(userId,
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    var items = snapshot.data!.docs;
                    return SizedBox(
                      height: items.length.toDouble() * 400,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          //  shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext, i) {
                            return Post(
                              text: items[i]["text"] ?? "",
                              pic: items[i]["pics"],
                              name: userName ?? "user name",
                              profilePic: profilePic ?? "",
                            );
                          }),
                    );
                  } else {
                    return const Text('No posts yet');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              }))
        ],
      ),
    );
  }

  select(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("select"),
            content: SizedBox(
              height: 135,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();

                        try {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image == null) {
                            return;
                          }
                          final imageTem = File(image.path);

                          newPic = imageTem;

                          Reference ref = FirebaseStorage.instance.ref().child(
                              "${FirebaseAuth.instance.currentUser!.uid}/profile");
                          await ref.putFile(File(newPic.path));
                          ref.getDownloadURL().then((value) {
                            setState(() {
                              profilePic = value;
                            });
                          });

                          await Future.delayed(const Duration(seconds: 2),
                              () async {
                            await FirebaseFirestore.instance
                                .collection(user)
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({userProfilePic: profilePic});
                          });
                        } on PlatformException catch (e) {
                          showloadingForError(context, e.toString());
                        }
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
                        Navigator.of(context).pop();

                        try {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (image == null) {
                            return;
                          }
                          final imageTem = File(image.path);

                          newPic = imageTem;

                          Reference ref = FirebaseStorage.instance.ref().child(
                              "${FirebaseAuth.instance.currentUser!.uid}/profile");
                          await ref.putFile(File(newPic.path));
                          ref.getDownloadURL().then((value) {
                            setState(() {
                              profilePic = value;
                            });
                          });

                          await Future.delayed(const Duration(seconds: 2),
                              () async {
                            await FirebaseFirestore.instance
                                .collection(user)
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({userProfilePic: profilePic});
                          });
                        } on PlatformException catch (e) {
                          showloadingForError(context, e.toString());
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
            ),
          );
        });
  }
}

class Add extends StatelessWidget {
  const Add({required this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_outline,
            color: KprimaryColor,
          ),
          Text(
            text!,
            style: const TextStyle(
                color: KprimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class Post extends StatefulWidget {
  Post({
    Key? key,
    required this.text,
    required this.pic,
    required this.name,
    required this.profilePic,
  }) : super(key: key);
  final String text;
  final List pic;
  final String name;
  final String profilePic;
  bool love = false;

  @override
  State<Post> createState() => _PicesState();
}

class _PicesState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.profilePic != ""
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(widget.profilePic))
                        : const CircleAvatar(
                            backgroundImage: AssetImage("assets/pic/car.png")),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          color: KprimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "...",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            Container(
              height: widget.pic.isEmpty ? 0 : 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.pic.length,
                itemBuilder: (BuildContext context, index) {
                  return Row(
                    children: [
                      Image.network(
                        widget.pic[index],
                      ),
                      const SizedBox(
                        width: 2,
                      )
                    ],
                  );
                },
              ),
            ),
            const Divider(
              color: KprimaryColor,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.love = !widget.love;
                          });
                        },
                        icon: widget.love == false
                            ? const Icon(
                                Icons.favorite_border,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              )),
                    const Icon(
                      Icons.comment,
                    ),
                    const Icon(
                      Icons.send_outlined,
                    )
                  ]),
            ),
          ],
        ));
  }
}
