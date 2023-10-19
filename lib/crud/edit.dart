


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});



  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

   final CollectionReference _db = FirebaseFirestore.instance.collection('leads');

  TextEditingController namecontroller = TextEditingController();
  TextEditingController designation = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
  //     if (documentSnapshot != null) {
  //       namecontroller.text = documentSnapshot['name'];
  //       designation.text = documentSnapshot['disignation'];
  //     }
  //     print('Name: ${namecontroller}');
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final argd = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lead form'),
      ),
        body: Form(
            key:_formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      labelText: 'Enter Name'
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: designation,
                  decoration: InputDecoration(
                      labelText: 'Enter Disignation'
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your disignation';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                     print(argd);
                  },
                  child: const Text('Update'),
                ),
              ],
            ))
      // body: StreamBuilder<DocumentSnapshot>(
      //   stream: FirebaseFirestore.instance.collection('leads').doc('id').snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return CircularProgressIndicator();
      //     }
      //     var userData = snapshot.data!.data();
      //
      //     namecontroller.text = userData['name'];
      //     return Form(
      //       key: _formKey,
      //         child: Column(
      //       children: [
      //         TextFormField(
      //           controller: namecontroller,
      //           decoration: InputDecoration(
      //               labelText: 'Enter Name'
      //           ),
      //           // The validator receives the text that the user has entered.
      //           validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return 'Please enter Your name';
      //             }
      //             return null;
      //           },
      //         ),
      //         TextFormField(
      //           controller: designation,
      //           decoration: InputDecoration(
      //               labelText: 'Enter Disignation'
      //           ),
      //           // The validator receives the text that the user has entered.
      //           validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return 'Please enter your disignation';
      //             }
      //             return null;
      //           },
      //         ),
      //       ],
      //     ));
      //   }
      // ),
    );
  }


}
