import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/crud/edit.dart';
import 'add.dart';


class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {

  final _db = FirebaseFirestore.instance.collection("leads").snapshots();
  var docs;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('list from firestore'),
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
        stream: _db,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print('testtt');
            return Text('connection error');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('loading...');
          }
          print('before');
           docs = snapshot.data!.docs;
         // return Text('${docs.length}');
        //  print(docs[0]['id']);
         print(snapshot.data!.docs[0]['name']);
         // print(snapshot.data?.docs[0].data.toString());
          return ListView.builder(
            itemCount: docs.length,  //4
              itemBuilder: (context,index){
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(docs[index]['name']), //1
                subtitle:Text(docs[index]['disignation']),
                trailing: Row(
                 mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // Navigator.pushNamed(context, '/edit',
                        // arguments: {
                        //   'name' : docs[index]['name'],
                        //   'disignation' : docs[index]['disignation'],
                        //
                        // }
                        // );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Edit(

                        )));
                      },
                        child: Icon(Icons.edit)),
                    SizedBox(width: 10,),
                    Icon(Icons.delete)
                  ],
                )
              );
              });
        },
      ),
    );
  }
}
