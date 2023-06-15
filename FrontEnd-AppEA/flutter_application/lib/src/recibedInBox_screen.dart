
import 'package:flutter/material.dart';
import 'package:flutter_application/repositories/inBox_repository.dart';
import 'package:flutter_application/repositories/inBox_repository_impl.dart';
import 'package:flutter_application/utils/constants.dart';
import 'package:get/get.dart';

import '../infrastructure/models/in_box.dart';






class RecibedInBoxItemWidget extends StatelessWidget {
  final InBox inBox;

  const RecibedInBoxItemWidget({super.key, required this.inBox});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("${inBox.idUsuarioOrigen} --> ${inBox.asunto}"),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(inBox.msn),
        ),
      ],
    );
  }
}

class RecibedInBoxListWidget extends StatelessWidget {
  final Widget child;
  final List<InBox> listInBox;

  const RecibedInBoxListWidget({super.key, required this.child,required this.listInBox});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listInBox.length,
      itemBuilder: (context, index) {
        return RecibedInBoxItemWidget(inBox: listInBox[index]);
      },
    );
  }
}

class RecibedInBoxScreen extends StatelessWidget {
   RecibedInBoxScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 226, 221),
      appBar: AppBar(
                    title:Text('MSN recibidos',style:
                                TextStyle(fontFamily: 'aBlackLives', fontSize: 30.0, color: Colors.white)),
          shadowColor: const Color.fromRGBO(128, 119, 119, 0.973),
          backgroundColor: const Color.fromRGBO(128, 119, 119, 0.973)),
      body: RecibedInBoxListWidget(
        listInBox: Constants.listInBox,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(128, 119, 119, 0.973),
                  textStyle: const TextStyle(
                    fontFamily: 'NerkoOne',
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, '/list_grupo_screen');
                },
                child: const Text(
                    'Texto del botón'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}