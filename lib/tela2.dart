import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tela2 extends StatefulWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  var kms = 0.0;
  var tempo = Duration(seconds: 0);
  var kcal = 0.0;

  var running = false;

  Timer? periodicTimer;


  @override
  Widget build(BuildContext context) {
    String printDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    }

    return Scaffold(
      backgroundColor: Color(0xff323232),
      appBar: AppBar(
        backgroundColor: Color(0xff323232),
        title: const Text('Corrida', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(((kms * 10).truncate() / 10).toString(), style: const TextStyle(color: Colors.white, fontSize: 90, fontWeight: FontWeight.w600, height: 0.9),),
              const SizedBox(width: 15,),
              const Text("km", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/clock.svg", height: 30, width: 30,),
                  const SizedBox(height: 5,),
                  Text(printDuration(tempo), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/fire.svg", height: 30, width: 30,),
                  const SizedBox(height: 5,),
                  Text("${kcal.toStringAsFixed(0)} kcal", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/valentines-heart.svg", height: 30, width: 30,),
                  const SizedBox(height: 5,),
                  const Text("-", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: !running?[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(!running){
                      running = true;
                      periodicTimer = Timer.periodic(Duration(seconds: 1), (timer) {
                        setState(() {
                          kms = kms + 0.02;
                          tempo = tempo + Duration(seconds: 1);
                          kcal = kcal + 0.5;
                        });
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero
                ),
                child: SvgPicture.asset("assets/play.svg", width: 130,),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.zero
                ),
                child: SvgPicture.asset("assets/stop.svg", width: 130,),
              )
            ]:[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    running = false;
                    periodicTimer?.cancel();
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.zero
                ),
                child: SvgPicture.asset("assets/pause.svg", width: 130,),
              )
            ],
          )
        ],
      ),
    );
  }
}
