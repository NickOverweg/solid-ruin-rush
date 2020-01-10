class SoundManager {
  private SoundFile[] sounds = new SoundFile[24];

  public SoundManager() {
    loadSounds();
  }

  private void loadSounds() {
    sounds[0] = new SoundFile(ruinrush2.this, "./Sound/Jewel/Revive.wav");
    sounds[1] = new SoundFile(ruinrush2.this, "./Sound/Gun/GunReload.mp3");
    sounds[2] = new SoundFile(ruinrush2.this, "./Sound/Background/bg_Theme.wav");
    sounds[3] = new SoundFile(ruinrush2.this, "./Sound/GameOverScreen/Tragic.wav");
    sounds[4] = new SoundFile(ruinrush2.this, "./Sound/MainMenu/mm_Theme.wav");
    sounds[5] = new SoundFile(ruinrush2.this, "./Sound/Jumping/Jumping.wav");
    sounds[6] = new SoundFile(ruinrush2.this, "./Sound/Footstep/Walking.wav");
    sounds[7] = new SoundFile(ruinrush2.this, "./Sound/DeathScream/Scream.wav");
    sounds[8] = new SoundFile(ruinrush2.this, "./Sound/DeathScream/Fail.wav");
    sounds[9] = new SoundFile(ruinrush2.this, "./Sound/Magnet/MagnetPull.wav");
    sounds[10] = new SoundFile(ruinrush2.this, "./Sound/Button/ButtonPress.wav");
    sounds[11] = new SoundFile(ruinrush2.this, "./Sound/GameOverScreen/GameOver.wav");
    sounds[12] = new SoundFile(ruinrush2.this, "./Sound/SplashScreen/Logo.wav");
    sounds[13] = new SoundFile(ruinrush2.this, "./Sound/Treasure/Coin.wav");
    sounds[14] = new SoundFile(ruinrush2.this, "./Sound/PickUp/Pickup.wav");
    sounds[15] = new SoundFile(ruinrush2.this, "./Sound/Handgun/Shot.mp3");
    sounds[16] = new SoundFile(ruinrush2.this, "./Sound/Monster/Death.wav");
    sounds[17] = new SoundFile(ruinrush2.this, "./Sound/Monster/Hit.wav");
    sounds[18] = new SoundFile(ruinrush2.this, "./Sound/Gun/GunShot.mp3");
    sounds[19] = new SoundFile(ruinrush2.this, "./Sound/Shotgun/ShotgunShot.wav");
    sounds[20] = new SoundFile(ruinrush2.this, "./Sound/Crossbow/CrossbowShot.flac");
    sounds[21] = new SoundFile(ruinrush2.this, "./Sound/Crossbow/CrossbowReload.wav");
    sounds[22] = new SoundFile(ruinrush2.this, "./Sound/Shotgun/ShotgunReload.wav");
  }

  public void playSound(int soundNr) {
    if (sounds[soundNr].isPlaying() == 0)
      sounds[soundNr].play();
  }

  public void forcePlaySound(int soundNr) {
    sounds[soundNr].play();
  }

  public void stopSound(int soundNr) {
    if (sounds[soundNr].isPlaying() == 1)
      sounds[soundNr].stop();
  }

  public void loopSound(int soundNr) {
    sounds[soundNr].loop();
  }

  public boolean soundIsPlaying(int soundNr) {
    return sounds[soundNr].isPlaying() > 0;
  }
}