import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    return  Scaffold(
      body:DecoratedBox(

        decoration:  BoxDecoration(
          image: DecorationImage(
              image: data['isDayTime']?const AssetImage('assets/day.png'):const AssetImage('assets/night.png'),
              fit: BoxFit.cover,
          ),

        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    icon: const Icon(
                        Icons.location_on,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/chooseLocation');
                      setState(() {
                        data = result;
                      });
                    },
                    label: const Text(
                        'Select Locations',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['Location'],
                      style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 28,
                      )
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                    data['Time'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
