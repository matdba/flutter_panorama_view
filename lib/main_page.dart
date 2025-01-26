import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panorama/panorama.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('خانه هوشمند'),
      ),
      body: Stack(
        children: [
          Panorama(
            animSpeed: 0.001,
            sensorControl: SensorControl.None,
            hotspots: [
              Hotspot(
                latitude: -15.0,
                longitude: -129.0,
                width: 90,
                height: 80,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(const CircleBorder()),
                        backgroundColor: WidgetStateProperty.all(Colors.black38),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: 'درب باز شد',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                      child: const Icon(Icons.open_in_browser),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: const Center(child: Text('باز کردن درب')),
                    ),
                  ],
                ),
              ),
            ],
            child: Image.asset('assets/images/panorama.jpg'),
          ),
        ],
      ),
    );
  }
}
