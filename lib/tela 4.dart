import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Tela4 extends StatefulWidget {
  final String data;
  final int passos;
  final String duracao;
  final double distancia;
  final int calorias;

  Tela4({
  required this.data,
  required this.passos,
  required this.duracao,
  required this.distancia,
  required this.calorias,
});

@override
_Tela4State createState() => _Tela4State();
}




class _Tela4State extends State<Tela4> {
  final dfDate = new DateFormat('dd/MM/yyyy');
  final dfDateWithoutYear = new DateFormat('dd-MM');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/seta.svg',
              width: 40,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent, // Make the app bar itself transparent
          elevation: 0, // Remove the shadow
          centerTitle: true,
          title: Text(dfDateWithoutYear.format(dfDate.parse(widget.data)), style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        body: Column(
          children: [
            SvgPicture.asset(
              'assets/grafico.svg',
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InformacaoItem(titulo: widget.passos.toString(), subtitulo: "Passos"),
                      Container(
                        color: Color(0x54000000),
                        width: 1,
                      ),
                      InformacaoItem(titulo: widget.duracao, subtitulo: "Duração"),
                    ],
                  ),),
                  Container(
                    color: Color(0x54000000),
                    height: 1,
                  ),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InformacaoItem(titulo: widget.distancia.toString(), subtitulo: "Distância", textoAuxiliar: "km",),
                      Container(
                        color: Color(0x54000000),
                        width: 1,
                      ),
                      InformacaoItem(titulo: widget.calorias.toString(), subtitulo: "Calorias", textoAuxiliar: "kcal",),
                    ],
                  ),)
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class InformacaoItem extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String? textoAuxiliar;

  InformacaoItem({
    required this.titulo,
    required this.subtitulo,
    this.textoAuxiliar,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 50,
                  height: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Color(0xc9333333),
                ),
              ),
              textoAuxiliar!=null?Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    textoAuxiliar!,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xc9333333),
                    ),
                  ),
                ],
              ):Container()
            ],
          ),
          Text(subtitulo,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25, color: Color(0xc9333333)),
          ),
        ],
      ),
    );
  }
}
