import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryWidget extends StatelessWidget {
  HistoryWidget({this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 3),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                                "${(data['transfert'] != null ? 'Transfert' : data['depense'] != null ? 'Depense' : data['revenues'] != null ? 'Revenues' : data['achat'] != null ? 'Achat' : data['credit'] != null ? 'Credit' : data['depot'] != null ? 'Depot' : data['retrait'] != null ? 'Retrait' : "Inconnu")} De: ")
                          ],
                        ),
                        Text("XAF ${data['montant']} ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: "Initié le " +
                                DateFormat("yyyy-MM-dd").format(
                                    DateFormat("yyyy-MM-dd").parse(
                                        (data['date'] ))),
                            children: [])),
                       Row(
                      children: [
                        Text(
                          "Status : " +
                              """${data["status"] == 0 ? "Annulé " : data["status"] == 1 ? "Réussi " : data["status"] == 2 ? "Initié " : data["status"] == 3 ? "En attente " : ""}""",
                          style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                              fontSize: 10),
                        ),
                        data["status"] == 0
                            ? Icon(Icons.circle_rounded,
                                size: 10, color: Colors.red)
                            : data["status"] == 1
                                ? Icon(Icons.circle_rounded,
                                    size: 10, color: Colors.green)
                                : data["status"] == 2
                                    ? Icon(Icons.circle_rounded,
                                        size: 10, color: Colors.cyan)
                                    : data["status"] == 3
                                        ? Icon(Icons.circle_rounded,
                                            size: 10, color: Colors.blue)
                                        : Text("")])
                      ],
                    ),
                  )
                ]))));
  }
}
