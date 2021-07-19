import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_storage/file_read_write.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  FileStorageData fileStorageData=FileStorageData();

  @override
  void initState(){
    super.initState();
    fileStorageData.readCounter().then((value){
      setState(() {
        counter=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Local Storage'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            )
          ],
        ),
        body: Center(
          child: Text('the Counter Is : $counter'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
            fileStorageData.writeCounter(counter);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
