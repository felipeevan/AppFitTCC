import 'package:appfit/consts.dart';
import 'package:appfit/tela2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tela1 extends StatefulWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.width*0.09,
                child: Semantics(
                  label: "81% concluído",
                  child: SvgPicture.asset("assets/circulo.svg", width: MediaQuery.of(context).size.width*0.6),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SvgPicture.asset("assets/progress.svg", width: MediaQuery.of(context).size.width*0.8,)
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Semantics(
                label: "7455 passos",
                child: Row(
                  children: [
                    SvgPicture.asset("assets/steps.svg", width: 30,),
                    SizedBox(width: 12,),
                    Text("7455", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xff757575)),)
                  ],
                ),
              ),
              Semantics(
                label: "1127 calorias",
                child: Row(
                  children: [
                    SvgPicture.asset("assets/fire.svg", width: 30,),
                    SizedBox(width: 12,),
                    Text("1127", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xff757575)),)
                  ],
                ),
              )
            ],
          ),
          Semantics(
            label: "PULSEIRA CONECTADA VIA BLUETOOTH",
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PULSEIRA CONECTADA", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),),
                  SizedBox(width: 5,),
                  SvgPicture.asset("assets/bluetooth.svg",),
                ],
              ),
            )
          ),
          Container(
            height: 55.0,
            width: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: ConstsService.linearGradientPadrao
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tela2()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text('COMEÇAR', style: TextStyle(color: Colors.white, fontSize: 20.8),),
            ),
          ),
        ],
      ),
    );
  }
}
