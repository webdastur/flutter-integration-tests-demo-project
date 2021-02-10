import 'package:flutter/material.dart';
import 'constants.dart';
// import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void setText(String newText) {
    FocusScope.of(context).unfocus();
    if (newText != "") {
      _showDialog(newText);
    }
    setState(() {
      text = newText;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDialog(String alertText) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Greeting"),
          content: new Text("Hello, $alertText!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Integration Test'),
      ),
      body: Center(
        child: Container(
          decoration: kGradientStyle,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //     child: SvgPicture.asset(
              //   "assets/text-svgrepo-com.svg",
              //   placeholderBuilder: (context) => CircularProgressIndicator(),
              //   height: 80.0,
              // )),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      key: Key('text-field'),
                      controller: _controller,
                      decoration: kTextInputStyle,
                      validator: (value) =>
                          value.isEmpty ? 'Input some text!' : null,
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              // Text(
              //   text,
              //   style: Theme.of(context).textTheme.headline4,
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () => {
          if (_formKey.currentState.validate())
            {setText(_controller.text)}
          //{setText("Bingo!")}
          else
            (setText(''))
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
