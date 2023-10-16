import 'package:appfit/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tela5 extends StatefulWidget {
  const Tela5({Key? key}) : super(key: key);

  @override
  State<Tela5> createState() => _Tela5State();
}

class _Tela5State extends State<Tela5> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  var imc;
  var resultado;

  @override
  Widget build(BuildContext context) {
    double calculaIMC(double weight, double height) {
      return weight / (height/100 * height/100);
    }

    String calculaResultado(double imc) {
      if (imc < 18.5) {
        return "Abaixo do peso";
      } else if (imc < 24.9) {
        return "Peso normal";
      } else if (imc < 29.9) {
        return "Sobrepeso";
      } else if (imc < 34.9) {
        return "Obesidade Grau 1";
      } else if (imc < 39.9) {
        return "Obesidade Grau 2";
      } else {
        return "Obesidade Grau 3 (Mórbida)";
      }
    }



    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/profile_photo.svg", width: 70,),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Felipe Evangelista", style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold, color: Color(0xff707070)),),
                    Text("22 anos", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xff707070)),)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Theme(
              data: ThemeData().copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                    primary: Colors.blue,

                  )
              ),
              child: TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22.4),
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Peso (kg):',
                    labelStyle: TextStyle(fontSize: 25.6, color: Color(0xff707070))
                ),
              ),
            ),
            SizedBox(height: 20,),
            Theme(
              data: ThemeData().copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.blue,
                ),
              ),
              child: TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22.4),
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Altura (cm):',
                    labelStyle: TextStyle(fontSize: 25.6, color: Color(0xff707070))
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: ConstsService.linearGradientPadrao
              ),
              child: ElevatedButton(
                onPressed: () {
                  double weight = double.tryParse(_pesoController.text) ?? 0;
                  double height = double.tryParse(_alturaController.text) ?? 0;
                  if(widget!=0 && height!=0){
                    double calculatedIMC = calculaIMC(weight, height);
                    String calculatedResult = calculaResultado(calculatedIMC);

                    setState(() {
                      imc = calculatedIMC;
                      resultado = calculatedResult;
                    });
                  }



                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text('CALCULAR IMC', style: TextStyle(color: Colors.white, fontSize: 20.8),),
              ),
            ),
            imc!=null?Column(
              children: [
                SizedBox(height: 30,),
                Text(imc.toStringAsFixed(2), style: TextStyle(fontSize: 83.2, fontWeight: FontWeight.w800, color: Color(0xff707070)),),
                Text(resultado, style: TextStyle(fontSize: 27.2, fontWeight: FontWeight.w600, color: Color(0xff707070),), textAlign: TextAlign.center,)
              ],
            ):Container()


          ],
        ),
      ),
    );
  }
}
