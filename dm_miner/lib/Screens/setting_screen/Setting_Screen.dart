import 'package:dm_miner/Screens/provider/Provider_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    final providerVar = Provider.of<ProviderClass>(context,listen: true);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(CupertinoIcons.back),
          ),
          title: Text('Setting'),
        ),
        body: ListTile(
            title: Text('Theme'),
            // subtitle: (providerVar.isTheme==true)?Text('Dark'):Text('Ligth'),
            trailing: (providerVar.isTheme == true)
                ? IconButton(onPressed: () {
                  setState(() {
                    providerVar.isTheme=false;
                  });
            }, icon: Icon(CupertinoIcons.moon))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        providerVar.isTheme=true;
                      });
                    }, icon: Icon(CupertinoIcons.sun_max))));
  }
}
