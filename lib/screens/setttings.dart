import 'package:flutter/material.dart';
import 'package:local_storage/shared_preference.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int favColor = Colors.white.value;
  SaveAppColor pref = SaveAppColor();
  @override
  void initState() {
    initColor();
    super.initState();
  }

  initColor() async {
    favColor = await pref.getData();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    pref.saveData(favColor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(favColor),
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Center(
          child: Column(
            children: [
              RadioListTile(
                title: Text('Green'),
                value: Colors.green.value,
                groupValue: favColor,
                onChanged: (int? color) {
                  setState(() {
                    favColor = color!;
                  });
                  pref.saveData(color!);
                },
              ),
              RadioListTile(
                title: Text('blue'),
                value: Colors.blue.value,
                groupValue: favColor,
                onChanged: (int? color) {
                  setState(() {
                    favColor = color!;
                  });
                  pref.saveData(color!);
                },
              ),
              RadioListTile(
                title: Text('red'),
                value: Colors.red.value,
                groupValue: favColor,
                onChanged: (int? color) {
                  setState(() {
                    favColor = color!;
                  });
                  pref.saveData(color!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
