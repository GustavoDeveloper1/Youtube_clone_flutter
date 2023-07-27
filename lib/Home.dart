import 'package:flutter/material.dart';
import 'package:test/CustomSearchDelegate.dart';
import 'package:test/screens/Biblioteca.dart';
import 'package:test/screens/EmAlta.dart';
import 'package:test/screens/Inicio.dart';
import 'package:test/screens/Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricoes(),
      const Libary()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/image/youtube.png',
          width: 98,
          height: 22,
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());

                setState(() {
                  _resultado = res!;
                });
              },
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (index) {
            setState(() {
              _indiceAtual = index;
            });
          },
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Em alta', icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: 'Inscrições', icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: 'Biblioteca', icon: Icon(Icons.folder)),
          ]),
    );
  }
}
