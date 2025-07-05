import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY Portfolio Apps",
          style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/images.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/daphoto.jpg"),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "MD DANISH",
                        style: TextStyle(fontSize: 32, color: Colors.redAccent),
                      ),
                      Text(
                        "App Developer",
                        style: TextStyle(
                          fontSize: 20,color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          color: Colors.black,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "B-tech in ITE",
                            style: TextStyle(
                              fontSize: 20,color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.computer_rounded,
                          color: Colors.purple,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "MY portfolio apps",
                            style: TextStyle(
                              fontSize: 20,color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Rohini-22, New Delhi",
                              style: TextStyle(
                                fontSize: 20,color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "mddanish10111@gmail.com",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          color: Colors.blueGrey,
                          size: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "7209121151",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "I am student btech third year branch ITE and study form MAIT in delhi,"
                "I want to become a good apps developer in flutter! ",
                style: TextStyle(
                  fontSize: 20,color: Colors.white
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.create_outlined,
                        color: Colors.white,
                        size: 20,
                      ),

                      Text(
                        "Created by Danish",
                        style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ),
              ),
              //Text("Created by Danish",style: TextStyle(fontSize: 20,color: Colors.greenAccent),)
              // Icon(Icons.create_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
