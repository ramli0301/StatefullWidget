import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { male, female }

class _MyHomePageState extends State<MyHomePage> {
  String name = "", address = "";

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  Gender? jenisKelamin = Gender.male;
  bool? nilaiCheckbox = false;
  List<String> content = ["Instagram", "Walpapers", "Banner", "Resume"];
  String contentGroup = "";

  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Profile Canva App",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Divider(),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            maxLines: 1,
            controller: addressController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email Address",
            ),
          ),
          Divider(),
          Text(
            "Genre",
            style: TextStyle(fontSize: 14),
          ),
          ListTile(
            leading: Radio(
              value: Gender.male,
              groupValue: jenisKelamin,
              onChanged: (Gender? value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),
            title: Text("Male"),
          ),
          ListTile(
            leading: Radio(
              value: Gender.female,
              groupValue: jenisKelamin,
              onChanged: (Gender? value) {
                setState(() {
                  jenisKelamin = value;
                });
              },
            ),
            title: Text("Female"),
          ),
          Divider(),
          Text("Browse Content"),
          for (var item in content)
            Row(
              children: [
                Radio(
                  value: item,
                  groupValue: contentGroup,
                  onChanged: (newValue) {
                    setState(() {
                      contentGroup = newValue.toString();
                    });
                  },
                ),
                Text(item),
              ],
            ),
          Container(
            width: 200,
            height: 50,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  address = addressController.text;
                });
              },
              child: Text("Save"),
            ),
          ),
          Divider(),
          Text(
            "Your Name: ${name} ",
          ),
          Divider(),
          Text(
            "Your Address: ${address} ",
          ),
          Divider(),
          Text(
            "Your Genre: ${jenisKelamin} ",
          ),
          Divider(),
          Text(
            "Your Content: ${contentGroup} ",
          )
        ],
      ),
    );
  }
}
