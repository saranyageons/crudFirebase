import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add.dart';

class DataLoad extends StatefulWidget {
  const DataLoad({super.key});

  @override
  State<DataLoad> createState() => _DataLoadState();
}

class _DataLoadState extends State<DataLoad> {

  final CollectionReference _db = FirebaseFirestore.instance.collection('leads');

  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('list from firestore'),
         centerTitle: true,
         actions: <Widget>[
           ElevatedButton(
               onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Add()));
               },
               child: Text('add')
           )
         ],
       ),
      body: StreamBuilder(
        stream: _db.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['disignation']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => _update(documentSnapshot),
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () => _delete(documentSnapshot.id),
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
          nameController.text = documentSnapshot['name'];
          designationController.text = documentSnapshot['disignation'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
              padding: EdgeInsets.only(
            top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20
          ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: designationController,
                  decoration: InputDecoration(labelText: 'Designation'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = nameController.text;
                      final String design = designationController.text;

                      if (design != null) {
                        await _db.doc(documentSnapshot!.id).update(({"name" : name, "disignation" : design}));
                        nameController.text = '';
                        designationController.text = '';
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Update'))
              ],
            ),
          );
        });
  }

 Future<void> _delete(String id) async {
    await _db.doc(id).delete();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You have Successfully deleted')));
 }
}
