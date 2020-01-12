//interface for loading and saving the highscore.
interface IHighscore{
  //this loads the highscore and gives it back.
  public int loadHighscore();
  //this saves the highscore.
  public void setHighscore(float h);  
}
