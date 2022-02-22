import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingRequest extends StatefulWidget {
  LoadingRequest({this.state});
  final state;
  @override
  _LoadingRequestState createState() => _LoadingRequestState();
}

class _LoadingRequestState extends State<LoadingRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (widget.state)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child:
                         SpinKitChasingDots(
                    color: Colors.blue,
                    size: 30,
                    duration: Duration(seconds: 1),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.63,
                    child: Text(
                      "Traitement en cours veuillez patienter...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(Icons.access_alarm,
                        color: Colors.red, size: 50),
                  ),
                  Center(
                      child: Text(
                    "La Transaction a echoue",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
                ],
              ));
  }
}
