 import 'package:flutter/material.dart';

//manin e a função incial que recebe o myApp( que é o  o app inteiro)
void main() {
  runApp(const MyApp());
}

//criando um widtge custumizado que recebe todos os outros
//no caso ira receber os paginas( as paginas tvbbm são widthe )
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//padrão
  @override
  //build e metodo que já existe na classe StatelessWidget
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    print('decrement $count');
  }

  void increment() {
    setState(() {
      count++;
    });

    print('increment $count');
  }

  void leftPeople() {
    setState(() {
      count = count - count;
      print('$count');
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/blur-office.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                fontSize: 30,
                color: isFull ? Colors.red : Colors.pink,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(60),
              child: Text('$count',
                  style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red : Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: Size(100, 100),
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  //a funçã com () usa o retorno e adicioan n botão , sem o parametro não usa o retorno
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    'saiu',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.transparent : Colors.white,
                      fixedSize: Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  child: Text(
                    'Entrou',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                )
              ],
            ),
                Padding(
                padding: EdgeInsets.all(60),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                TextButton(
                  onPressed: leftPeople,
                  style: TextButton.styleFrom( 
                    backgroundColor: Colors.yellow,
                    side: BorderSide( width: 40, color: Colors.white, style:  BorderStyle.solid)
                  ),
                  child: Text('Pedir para $count  sair', style: TextStyle(color: Colors.black, fontSize: 16, ),),
                ) 
              ],
            ) 
                )
          ],
        ),
        
      ),
    );
  }
}

//criando a pagina Home
