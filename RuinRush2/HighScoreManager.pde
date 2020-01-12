class HighscoreManager implements IHighscore{
  int loadHighscore() { 
    //Load the suspicious txt file
    String[] hs = loadStrings("definetlyNotHighscore.txt");
    int highscore = 0;
    
    //Load the highscore
    for (int i = 0; i < hs.length; i++) {
      highscore = Integer.parseInt(hs[i], 2);
    }
    return highscore;
  }
  
  void setHighscore(float h){
    //Change the highscore to new one
    highscore = (int)h;
    highscoreText.t = "Highscore\n" + highscore;
  
    //Create array to save because for some odd reason we need an array
    String[] hs = new String[] { "" + Integer.toBinaryString(highscore)};
  
    //Save the array with only one element to a non suspicious txt file
    saveStrings("definetlyNotHighscore.txt", hs);
  }
}
