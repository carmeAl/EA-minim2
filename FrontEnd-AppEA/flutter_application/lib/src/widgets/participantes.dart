import 'package:flutter/material.dart';
import 'package:flutter_application/utils/constants.dart';

import '../../infrastructure/models/grupo_populate.dart';
import '../../infrastructure/models/ticket.dart';
import 'package:get/get.dart';

import '../../infrastructure/models/user.dart';

class Participantes extends StatefulWidget {
  const Participantes({super.key});

  @override
  ParticipantesState createState() => ParticipantesState();
}

class ParticipantesState extends State<Participantes> {
  final GrupoPopulate grupoPopulate = Constants.grupoPopulate;
  List<User> userList = Constants.grupoPopulate.users;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(128, 119, 119, 0.973),
          textStyle: const TextStyle(
            fontFamily: 'NerkoOne',
            fontSize: 20.0,
          )),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('participantes'.tr),
                content: Container(
                  height: 300.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: userList.isNotEmpty
                      ? ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _participante(context, index,
                                userList); //llamamos funcion widget _grupo
                          })
                      : Text('aviso_noGrupos'.tr,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                ),

                //Card(
                //     color: const Color.fromARGB(255, 197, 162, 226),
                //     child: GestureDetector(
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: grupoPopulate.users
                //             .map((user) => ListTile(
                //                   title: Text('${user.name} ${user.surname}'),
                //                   trailing: Icon(
                //                     Icons.check_box,
                //                     color: isUserComplete(user.id),
                //                   ),
                //                 ))
                //             .toList(),
                //       ),
                //       onTap: () {
                //         Navigator.pushNamed(context, '/sendInBox_screen');
                //         Constants.userEnviarMsn=user

                //         //await _grupoRepository.getPopulateGrupo(grupoList[index].id);

                //         //Navigator.pushNamed(context, '/list_ticket_screen');
                //       },
                //     )),
                actions: <Widget>[
                  TextButton(
                    child: Text('cerrar'.tr),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Text("${'participantes'.tr}: ${grupoPopulate.users.length}"),
    );
  }

  MaterialColor isUserComplete(String idUser) {
    //Buscamos si hay algun completado falso de este usuario
    bool encontrado = false;
    bool hayAlgunCompletado =
        false; //Esto nos sirve para cuando un usuario no tiene ningun completado en ningun ticket
    for (Ticket ticket in Constants.grupoPopulate.tickets) {
      int i = 0;
      hayAlgunCompletado = false;
      while (!encontrado && i < ticket.completado.length) {
        if (ticket.completado[i].usuario == idUser) {
          hayAlgunCompletado = true;
          if (!ticket.completado[i].completado) {
            encontrado = true;

            return Colors.grey;
          }
        }

        i++;
      }
    }
    if (!hayAlgunCompletado) {
      return Colors.grey;
    }
    return Colors.green;
  }

  Widget _participante(BuildContext context, int index, List<User> userList) {
    return Card(
      color: const Color.fromARGB(255, 197, 162, 226),
      child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/sendInBox_screen');
                Constants.userEnviarMsn=userList[index];
            },
            title: Text("${userList[index].name} ${userList[index].surname}",
                style: const TextStyle(fontSize: 30.0)),
            trailing: Icon(
              Icons.check_box,
              color: isUserComplete(userList[index].id),
            ),
          )),
    );
  }
}
