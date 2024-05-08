import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanderwiseproject/tg_ui/tghome/tghome.dart';

class RegPay extends StatefulWidget {
  const RegPay({super.key});

  @override
  State<RegPay> createState() => _RegPayState();
}

class _RegPayState extends State<RegPay> {
 
  XFile? image;
  String? photoUrl;

  Future<void> saveData(String photoUrl) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = <String, String>{
      "photoUrl": photoUrl,
       "user_type": "tour guide"
    };

    await db
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(user)
        .onError((e, _) => print("Error writing document: $e"));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Saved.')));

         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) => TgHome()));
  }

  void loadData() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef =
        db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
      
        photoUrl = data['photoUrl'];

        setState(() {});
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final ImagePicker picker = ImagePicker();
// Pick an image.
              image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                photoUrl = image!.path;
              }

              setState(() {});
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                      image: photoUrl == null
                          ? Image.asset(
                              'assets/profile_image.png',
                            ).image
                          : Image.network(photoUrl!).image)),
            ),
          ),
        
          OutlinedButton(
              onPressed: () async {
          
              if (image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please select a profile photo.')));
                } else {
                  File file = File(image!.path);

                  final storageRef =
                      FirebaseStorage.instance.ref('profile_pics');

                  final mountainsRef = storageRef
                      .child("${FirebaseAuth.instance.currentUser!.uid}.jpg");

                  try {
                    if (kIsWeb) {
                      mountainsRef.putData(await image!.readAsBytes());
                      String path = await mountainsRef.getDownloadURL();
                      print(path);
                      saveData(
                      
                           path);
                    } else {
                      mountainsRef.putFile(file);
                      String path = await mountainsRef.getDownloadURL();
                      print(path);
                      saveData(
                    
                           path);
                    }
                  } on Exception catch (e) {
                 
                  }
                }
              },
              child: Text('Save Changes'))
        ],
      ),
    );
  }

  
}
