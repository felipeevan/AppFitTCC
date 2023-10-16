import 'package:appfit/consts.dart';
import 'package:appfit/tela%204.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Tela3 extends StatefulWidget {
  const Tela3({Key? key}) : super(key: key);

  @override
  State<Tela3> createState() => _Tela3State();
}

class _Tela3State extends State<Tela3> {
  var lista = ConstsService.historico;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: lista.length,
        separatorBuilder:(BuildContext context, int index) => SizedBox(height: 30,) ,
        itemBuilder: (_, index){
          return HistoricoItem(lista[index]);
        },
      ),
    );
  }

  Widget HistoricoItem(var item){
    final dfDay = new DateFormat('dd');
    final dfMonth = new DateFormat('MMMM', 'pt');
    final dfDate = new DateFormat('dd/MM/yyyy');

    final dfMinute = new DateFormat('mm:ss');
    final dfOnlyMinute = new DateFormat('mm');


    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Tela4(
              data: item['data'],
              passos: item['passos'],
              duracao: item['tempo'],
              distancia: item['distancia'],
              calorias: item['calorias'],
            ),
          ),
        );

      },
      child: Row(
        children: [
          SvgPicture.asset("assets/img-list.svg"),
          const SizedBox(width: 20,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( "${dfDay.format(dfDate.parse(item['data']))} de ${dfMonth.format(dfDate.parse(item['data']))}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54, height: 1),),
                  const SizedBox(height: 2,),
                  Text("${"Duração: " + dfOnlyMinute.format(dfMinute.parse(item['tempo']))}min",
                    style: TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5,),
                  const Divider()
                ],
              )
          ),
        ],
      ),
    );
  }
}
