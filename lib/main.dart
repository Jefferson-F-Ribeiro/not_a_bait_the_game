import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'NOT A BAIT',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  String username = " ", password = " ", email = " ";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
              child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Usuário'),
                  onChanged: (value) {
                    username = value;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Senha'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (username != " " && password != " ") {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(nome: username)));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alerta!'),
                            content:
                                Text('Por favor, preencha todos os campos!'),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text("Login",
                      style: TextStyle(
                        color: Color(0x9c750470),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          )),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  String nome;

  MyHomePage({required this.nome});

  @override
  Widget build(BuildContext context) {
    User myUser = User(username: this.nome, name: " ", lv: 1, email: " ");
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(125.0),
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      'Bem vindo, ${myUser.username}!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => GamePage()));
                          },
                          child: Text("INICIAR O JOGO",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                        Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ranking()));
                          },
                          child: Text('RANKING',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                        Center(
                            child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserForm(user: myUser),
                              ),
                            );
                          },
                          child: Text("PERFIL",
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                      ]),
                )),
              ],
            ),
          ),
        ));
  }
}

class GamePage extends StatelessWidget {
  final String title = "Stage select";

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // The title text which will be shown on the action bar
            title: Text("SELECIONE O STAGE"),
          ),
          body: Container(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('STAGE 1',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: style,
                onPressed: null,
                child: const Text('STAGE 2',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: style,
                onPressed: null,
                child: const Text('STAGE 3',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: style,
                onPressed: null,
                child: const Text('STAGE 4',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: style,
                onPressed: null,
                child: const Text('STAGE 5',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          )))),
    );
  }
}

class Ranking extends StatelessWidget {
  final String title = "Ranking";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // The title text which will be shown on the action bar
            title: Text("RANKING"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("STAGE 1: O pontos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("STAGE 2: O pontos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("STAGE 3: O pontos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("STAGE 4: O pontos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text("STAGE 5: O pontos",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ))),
    );
  }
}

class User {
  String username;
  String name;
  int lv;
  String email;

  User(
      {required this.username,
      required this.name,
      required this.lv,
      required this.email});
}

class UserForm extends StatefulWidget {
  final User user;

  UserForm({required this.user});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Editar perfil'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                'Level: ${widget.user.lv}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Update the user object with the new values
                  widget.user.name = _nameController.text;
                  widget.user.email = _emailController.text;
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: Text('SALVAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
