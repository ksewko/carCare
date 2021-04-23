import 'package:flutter/material.dart';
import 'package:movierental/model/db_manager.dart';
import 'package:movierental/model/movie.dart';
import 'package:provider/provider.dart';

class AddMovie extends StatefulWidget {
  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final DBManager getDB = DBManager();

  final FocusNode titleNode = FocusNode();
  final FocusNode actorNode = FocusNode();
  final FocusNode descNode = FocusNode();
  final FocusNode yearNode = FocusNode();

  // capture input from TextField
  var titleController = TextEditingController();
  var actorController = TextEditingController();
  var descController = TextEditingController();
  var releasedYearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final getDB = Provider.of<DBManager>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add new Movie'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Movie Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(actorNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Please enter Movie Title' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: actorNode,
                  controller: actorController,
                  decoration: InputDecoration(
                    labelText: 'Movie Actor(s)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(descNode);
                  },
                  validator: (val) =>
                      val.isEmpty ? 'Please enter Movie Actor(s)' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: descNode,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: 'Movie Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(yearNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: yearNode,
                  keyboardType: TextInputType.number,
                  controller: releasedYearController,
                  decoration: InputDecoration(
                    labelText: 'Movie Release Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Please enter Movie released year' : null,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Movie newMovie = Movie(
                          titleController.text,
                          actorController.text,
                          int.parse(releasedYearController.text),
                          descController.text ?? "");

                      getDB.addMovie(newMovie).then((i) {
                        titleController.clear();
                        actorController.clear();
                        releasedYearController.clear();
                        descController.clear();
                        newMovie = null;
                      });
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
