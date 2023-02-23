import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    if (this.gameState[index] == "empty") ;
    setState(() {
      if (this.isCross) {
        this.gameState[index] = "cross";
      } else {
        this.gameState[index] = "circle";
      }
      isCross = !isCross;
    });
  }

  //to reset game
  resetGame() {
    gameState = List.filled(9, "empty");
    this.message = "";
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
  checkWin() {}

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
                // childAspectRatio: 1.0,
                // mainAxisSpacing: 2,
                // crossAxisSpacing: 2,
              ),
              itemBuilder: ((context, i) => SizedBox(
                    width: 10,
                    height: 10,
                    child: MaterialButton(
                      onPressed: () {
                        this.playGame(i);
                      },
                      child: getIcon(this.gameState[i]),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
