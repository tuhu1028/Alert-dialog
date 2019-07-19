import 'package:flutter/material.dart';

/*alert dialog, popup, bottom sheet, dropdown button*/
void main() => runApp(MyApp());
String dropdownValue = 'One';
Color pink = HexColor("FFBFF8");

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _AlertButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          child: Text('Show Alert Dialog'),
          onPressed: () {
            bookAlertDialog(context);
          }),
    );
  }
}

class _BottomSheetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show Bottom Sheet Dialog'),
      onPressed: () {
        bookBottomDialog(context);
      },
    );
  }

  void bookBottomDialog(BuildContext context) {
    var bottomDialog = Container(
      color: Colors.white,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'This is the modal bottom sheet. Slide down to dismiss.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 24.0,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: pink,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0))),
      ),
    );
    showBottomSheet(
        context: context, builder: (BuildContext context) => bottomDialog);
  }
}

void bookAlertDialog(BuildContext buildContext) {
  var alertDialog = AlertDialog(
    title: Text('Đặt hàng thành công'),
    content: Text('Mô tả'),
    actions: <Widget>[
      new FlatButton(
        child: Text('Accept'),
        onPressed: () {
          Navigator.of(buildContext).pop(ConfirmDismissCallback);
        },
      ),
      new FlatButton(
          onPressed: () {
            Navigator.of(buildContext).pop();
          },
          child: new Text('Close')),
    ],
  );

  showDialog(
      context: buildContext, builder: (BuildContext context) => alertDialog);
}
class _DropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {

      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }



}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[_AlertButton()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[_BottomSheetButton()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[_DropDownButton()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
