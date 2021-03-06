import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _pickedFile = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  final file =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  setState(() {
                    _pickedFile = file?.path ?? '';
                  });
                } catch (e) {
                  setState(() {
                    _pickedFile = e.toString();
                  });
                }
              },
              child: Text('Pick photo'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(_pickedFile),
            )
          ],
        ),
      ),
    );
  }
}
