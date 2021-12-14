import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<AccountScreen> createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  
  final prefs_key = 'prefs_key';
  TextEditingController name = TextEditingController();
  String username = '';
  AccountScreenState() {
    _readPreferences().then((value) {
      setState(() {
        username = value;
      });
    });
  }

  Future<String> _readPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    var value = await prefs.getString(prefs_key);
    return value ?? '';
  }

  void _writePrefs(String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefs_key, value);
  }

  
  void SaveSettings(String name){
    setState(() {
      username = name;
      _writePrefs(username);
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The username is:',
            ),
            Text(
              '$username',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            ElevatedButton(
              onPressed:(){
                SaveSettings(name.text); //do we need save.text?
              },
              child: Text('Save'),
            ),
            
          ],
        ),
      ),
      
    );
  }
}