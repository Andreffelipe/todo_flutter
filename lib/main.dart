import 'package:flutter/material.dart';

import 'models/itens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();
  //metodo contrutor da classe
  HomePage() {
    items = [];
    //items.add(Item(title: "Item 1", done: false));
    //items.add(Item(title: "Item 2", done: true));
    //items.add(Item(title: "Item 3", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskController = TextEditingController();

  void add() {
    setState(() {
      widget.items.add(
        Item(
          title: newTaskController.text,
          done: false,
        ),
      );
      newTaskController.text = "";
      //ou
      newTaskController.clear();
    });
  }

  void remove(int index){
    setState((){
      widget.items.removeAt(index);
    });
  }

  Future load() async{
    
  }

  @override
  Widget build(BuildContext context) {
    //Ao retornar uma page usar Scaffold
    return Scaffold(
      appBar: AppBar(
        // title aceita propriedade image
        //title: Text("Meu App"),
        title: TextFormField(
          controller: newTaskController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "nova tarefa",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        // renderiza no começo da appbar // menu do app
        //*leading: Text("menu"),

        // botão de ação no final do appBar
        //* actions: <Widget>[
        //*   Icon(Icons.brush),
        //* ],
      ),
      body: ListView.builder(
        // acessando variavel na class pai
        itemCount: widget.items.length,
        // //index do item que ele esta percorrendo
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return Dismissible(
            child: CheckboxListTile(
            title: Text(item.title),
            //key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
            },
          );
            key: Key(item.title),
            background: Container(
              color: Colors.red,
              child: Text("texto"),
              onDismissed: (direction){
                print(direction);
                remove(index);
              }
            )
          )
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
