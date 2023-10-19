import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController disignation = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  CollectionReference collectionRef = FirebaseFirestore.instance.collection('leads');

  @override
  Widget build(BuildContext context) {
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
                    controller: disignation,
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

                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('sucessfully upload')),
                        );
                        Map<String,String>datatosave = {
                          'name': namecontroller.text,
                          'disignation': disignation.text
                        };
                        //add the data to database
                        FirebaseFirestore.instance.collection('leads').add(datatosave);

                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ))
    );
  }
}



