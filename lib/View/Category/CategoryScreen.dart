import 'package:Motivation/View/Category/PublicationsByCategory.dart';
import 'package:Motivation/components/notificatonsComponent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
/* 
  void _runFilter(String enteredKeyword) {
    List<member> results = [];
    if (enteredKeyword.isEmpty) {
      results = _listMembresinit;
    } else {
      results = _listMembresinit
          .where((member) => member.phone!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _listMembres = results;
    });
  }
 */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        /*    padding: EdgeInsets.only(left: 15, right: 10), */
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              "Category ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.only(top: 18),
          )
        ]),
      ),
      Container(
        padding: EdgeInsets.only(top: 2, bottom: 2),
        width: MediaQuery.of(context).size.width * .9,
        child:
            /** AutoCompleteTextField<member>(
                            suggestionsAmount: 200,
                            clearOnSubmit: false,
                            controller: _searchController,
                            style: TextStyle(fontFamily: 'orkney', color: ColorsApp.blue, fontWeight: FontWeight.bold),
                            decoration: new InputDecoration(
                              hintText: "Entrer le numero",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    // width: 10
                                  )),
                              suffixIcon: Container(
                                  child: Icon(Icons.search, color: Colors.white),
                                  decoration: new BoxDecoration(
                                    color: Colors.blue,
                                    border: Border.all(color: Colors.blue),
                                  )),
                            ),
                            textChanged: (input) {
                              _runFilter(input);
                            },
                            suggestions: _listMembresinit,
                            itemBuilder: (context, suggestion) => new Padding(
                                child: InkWell(
                                  child: new ListTile(
                                    title: new Text(suggestion.Nom!, style: TextStyle(fontFamily: 'orkney')),
                                  ),
                                  onTap: () {
                                    _runFilter(suggestion.Nom!);
                                    setState(() {
                                      _filter.text = suggestion.phone.toString();
                                      _listMembres[0] = suggestion;
                                    });
                                  },
                                ),
                                padding: EdgeInsets.all(0)),
                            itemFilter: (suggestion, input) => suggestion.Nom!.toLowerCase().contains(input.toLowerCase()),
                          ) */
            TextFormField(
          // enabled: enableMail,
          // textCapitalization: TextCapitalization.words,
          onChanged: (value) {},
          // controller: message,
          validator: (value) {
            if (value == "") {
              return "veillez remplir se champs";
            } else {
              return null;
            }
          },
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  // width: 10
                )),
            fillColor: Colors.grey,
            hintText: "Message",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
            width: MediaQuery.of(context).size.width * .9,
            margin: EdgeInsets.only(top: 10),
            child: (GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("name"),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PublicationsByCategory()));
                    },
                  );
                },
                itemCount: 50))),
      ),
    ])));
  }
}
