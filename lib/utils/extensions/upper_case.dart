extension Word on String{
  myWord(){
    String newWord = '';
    for(int i=0; i<length;i++){
      if(i % 2 == 0){
        newWord += this[i].toUpperCase();
      }else{
        newWord += this[i].toLowerCase();
      }
    }
    return newWord;
  }
}