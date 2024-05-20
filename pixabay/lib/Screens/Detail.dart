import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Detail extends StatefulWidget {
  final String? image;
  const Detail({Key? key,required this.image}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Scareen'),
      ),
      body: Container(
        // color: Colors.blue,
        height: 700,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 500,
                  width: double.infinity,
                  child: Image.network(widget.image!,fit: BoxFit.cover,)),
              IconButton(onPressed: (){
                setWallpaper();
              }, icon: Icon(Icons.wallpaper)),
            ],
          ),
        ),
      ),
    );
  }
  setWallpaper() async {
    try {
      await AsyncWallpaper.setWallpaper(
         url: widget.image!,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: true,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
        'Failed to get wallpaper.';
    }
  }
}
