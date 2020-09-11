import 'dart:convert';

import 'package:flutter/material.dart';
import '../details/details.dart';
import '../../models/receipt.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      appBar: _construirAppBar(),
      body: _construirListaCard(),
    );
  }
  
  Widget _construirListaCard() {
    return FutureBuilder(
      future: DefaultAssetBundle
          .of(context)
          .loadString('assets/receitas.json'),
      builder: (context, snapshot) {
        List<dynamic> receipts = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Receipt receipt = Receipt.fromJson(receipts[index]);

            return _construirCard(receipt);
          },
          itemCount: receipts == null ? 0 : receipts.length,
        );
      },
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }

  Widget _construirCard(receipt) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Details(receipt: receipt,),
        ));
      },
      child: SizedBox(
        height: 300,
        child: Card(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    _construirImagemCard(receipt.foto),
                    _construirGradienteCard(),
                    _construirTextoCard(receipt.titulo),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 268,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7),
          ],
        )
      ),
    );
  }

  Widget _construirTextoCard(title) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.white,)
      ),
    );
  }

  Widget _construirImagemCard(photo) {
    return Image.asset(
      photo,
      fit: BoxFit.fill,
      height: 268,
    );
  }
}