import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// to add icon image
  var circle = Icon(Icons.circle_outlined);
  var cross = Icon(Icons.cancel_outlined);
  var edit = Icon(Icons.edit_outlined);

  bool isCross = true;
  late String message;
  late List<String> gameState;

  //initialize box with empty value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    // TODO: implement initState
    super.initState();
  }

  //to play game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

  //to reset game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
      this.isCross = true;
    });
  }

  // to get icon image
  getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;

      case ('circle'):
        return circle;
        break;

      case ('cross'):
        return cross;
        break;
    }
  }

  //to check for win
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + " Wins";
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + " Wins";
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + " Wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + " Wins";
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + " Wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + " Wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + " Wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + " Wins";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: gameState.length,
              itemBuilder: ((context, i) => SizedBox(
                    width: 100,
                    height: 100,
                    child: MaterialButton(
                      onPressed: () {
                        if (i < gameState.length) {
                          this.playGame(i);
                        }
                      },
                      child: getIcon(this.gameState[i]),
                    ),
                  )),
            ),
          ),
          Text(message),
          RaisedButton(
            onPressed: () {
              resetGame();
            },
            child: Text("Reset Game"),
          )
        ],
      ),
    );
  }
}
