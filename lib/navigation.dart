import 'package:appfit/consts.dart';
import 'package:appfit/tela1.dart';
import 'package:appfit/tela3.dart';
import 'package:appfit/tela5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navigation extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Navigation> with SingleTickerProviderStateMixin{
  int _currentIndex = 1;
  final List<Widget> _tabList = [
    Tela3(),
    Tela1(),
    Tela5()
  ];
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
    _tabController.animateTo(_currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: TabBarView(
              controller: _tabController,
              children: _tabList,
              physics: const NeverScrollableScrollPhysics()
          ),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
          ),
          child: Container(
            child: BottomNavigationBar(
              elevation: 5,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index){
                setState(() {
                  _currentIndex = index;
                  _tabController.animateTo(_currentIndex);
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: "Histórico",
                    icon: _currentIndex==0?SvgPicture.asset("assets/HistoricoON.svg"):SvgPicture.asset("assets/Historico.svg")
                ),
                BottomNavigationBarItem(
                    label: "Atividade",
                    icon: _currentIndex==1?SvgPicture.asset("assets/AtividadeON.svg"):SvgPicture.asset("assets/Atividade.svg")
                ),
                BottomNavigationBarItem(
                    label: "Perfil",
                    icon: _currentIndex==2?SvgPicture.asset("assets/PerfilON.svg"):SvgPicture.asset("assets/Perfil.svg")
                ),
              ],
            ),
          ),
        )
    );
  }
}