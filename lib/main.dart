import 'dart:io';
bool winner =false;
bool isXTurn =true;
int movecount =0;
List<String> values =['1','2','3','4','5','6','7','8','9'];
List<String> combinations =['012','048','036','147','246','258','345','678'];


void main (){
  while (true) {
    winner = false;
    isXTurn = true;
    movecount = 0;
    values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    generateValues();
    getChar();
  }
 //generateValues();
 //getChar();

}


void checkWinner(player){
  for(final item in combinations){
    bool combinationValidity = checkCombination(item, player);
    if(combinationValidity ==true){
      print('🎉$player Won');
      winner =true;
    }
  }
}


bool checkCombination(String combination,String check){
  List<int> numbers = combination.split('').map((item){
  return int.parse(item);
  }).toList();

  bool match = false;
  for(final item in numbers){
    if(values[item] == check){
      match =true;
    }else{
      match =false;
      break;
    }
  }
  return match;
}


void getChar(){
  print("Choose Number For ${isXTurn==true?'X':'O'}");
  int number =int.parse(stdin.readLineSync()!);
  values[number - 1] =isXTurn?'X':'O';
  isXTurn=!isXTurn;
  movecount++;
 if(movecount == 9){
   print('🤝 It\'s a draw!');
   winner = true;
 }else{
   generateValues();
 }
  checkWinner('X');
  checkWinner('O');

 if(winner == false)getChar();
}


void generateValues(){
  print('Welcome to Tic-Tac-Toe!\n');
  print("|   |   |   |");
  print('| ${values[0]} | ${values[1]} | ${values[2]} |');
  print("|___|___|___|");
  print("|   |   |   |");
  print('| ${values[3]} | ${values[4]} | ${values[5]} |');
  print("|___|___|___|");
  print("|   |   |   |");
  print('| ${values[6]} | ${values[7]} | ${values[8]} |');
  print("|___|___|___|");

}