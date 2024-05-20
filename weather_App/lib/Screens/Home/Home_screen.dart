import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loading_animation_kit/flutter_loading_animation_kit.dart';
import 'package:weather_app/Api/ApiRepo.dart';
import 'package:weather_app/Screens/Home/ModelClass.dart';
import 'package:weather_app/Screens/Home/second.dart';

class HomeScreen extends StatefulWidget {
  final String? cityName;

  const HomeScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostModal? object;
  bool isLoading = false;
  List<String> dayList=['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  List<Forecast> forCastDay=[];
  // List<Map<S>> 

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    ApiClass().loadApiData(widget.cityName!, context).then((value) {
      setState(() {
        object = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading == true)
          ? Center(
              child: FourCirclePulse(),
            )
          : SingleChildScrollView(
            child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                        child: Container(
                          height: 110,
                          width: 160,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Second()));
                                  },
                                  icon: Icon(Icons.list)),
                              Text(object == null ? '' : object!.location.name),
                            ],
                          ),
                        ),
                      ),
                      if (object != null)
                        Container(
                          height: 200,
                          width: 210,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(190)),
                              ),
                          child: Image(
                            image: AssetImage('assets/Image/img.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                    ],
                  ),
                  (object == null)
                      ? Align(
                    alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/Image/1.jpg'),
                          Text("No City Found!! Please Try again.")
                        ],
                      ))
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 250,
                              ),
                              Text(
                                object!.current.tempC.toString(),
                                style:
                                    TextStyle(fontSize: 60, color: Colors.orange),
                              ),
                              Row(
                                children: [
                                  Text(
                                    object!.current.condition.text,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      CupertinoIcons.greaterthan,
                                      size: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today Fri',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '24~39 C',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Divider(),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: 700,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('16'),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text('data'),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text('39 C'),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),

                              Row(
                                children: [
                                  Column(
                                    children: [
                                      for (var i in dayList)
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(i.toString()),
                                      ),
                                      Container(
                                        height: 100,
                                        width: 300,
                                        child: ListView.builder(
                                            itemCount: object!.forecast.forecastday.length,
                                            itemBuilder: (context,index){
                                         return ListTile(
                                            title: Text(object!.forecast.forecastday[index].date.toString()),
                                          );
                                        },),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.thermometer,
                                        color: Colors.red,
                                      ),
                                      Text('Temperature Felt'),
                                      Text('36'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      // Icon(,color: Colors.red,),
                                      Text('💧'),
                                      Text('Humidity'),
                                      Text('36'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        color: Colors.green,
                                      ),
                                      Text('Visibility'),
                                      Text('36'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.thermometer,
                                        color: Colors.red,
                                      ),
                                      Text('Temperature Felt'),
                                      Text('36'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.thermometer,
                                        color: Colors.red,
                                      ),
                                      Text('Temperature Felt'),
                                      Text('36'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.thermometer,
                                        color: Colors.red,
                                      ),
                                      Text('Temperature Felt'),
                                      Text('36'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                ],
              ),
          ),
    );
  }
}
