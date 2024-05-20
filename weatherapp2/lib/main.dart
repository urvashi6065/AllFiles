import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp2/Api/Api_Calling.dart';
import 'package:weatherapp2/screens/searchscreen.dart';
import 'package:weatherapp2/weather_model/Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(cityName: 'Ahmedabad',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? cityName;
  const MyHomePage({super.key, required this.cityName});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherModel? object;


  @override
  void initState() {
    // TODO: implement initState
    ApiCallingClass().loadApiData(widget.cityName).then((value) {
      setState(() {
        object=value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            )),
        // title: Text('Weather',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Stack(
          children: [
            Image(
              image: AssetImage('assets/img_2.png'),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                              ),
                              Text(
                                object!.location.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '07:50 pm - Monday, 9 Nov 2020',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '24\u2103',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 85,
                                    fontWeight: FontWeight.w300),
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage('assets/1.png'),
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Night',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30)),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                Text(
                                  'km/h',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 50,
                                      color: Colors.white38,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
