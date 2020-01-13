static class DistanceCalc{
  static float getDistance(int x1, int x2, int y1, int y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }
}
