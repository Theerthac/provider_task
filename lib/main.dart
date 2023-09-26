import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<UserInputProvider>(
      create: (context) => UserInputProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
final textcontroller = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                controller: textcontroller,
                decoration: const InputDecoration(
                    hintText: 'Text...', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
               
                Provider.of<UserInputProvider>(context, listen: false)
                    .updateInput(textcontroller.text);
                
              },
              color: const Color.fromARGB(255, 126, 192, 127),
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<UserInputProvider>(builder: (context, value, child) {
              return Center(
                child: Expanded(
                  child: Text(value._userInput),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}



class UserInputProvider extends ChangeNotifier {
  
  String _userInput = '';


  void updateInput(String input) {
    _userInput = input;
    notifyListeners();
  }
}
