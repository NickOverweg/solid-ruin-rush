public static class Easing
{

  public static float Linear (float k) {
    return k;
  }

  public static class Quadratic
  {
    public static float In (float k) {
      return k*k;
    }

    public static float Out (float k) {
      return k*(2 - k);
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return 0.5*k*k;
      return -0.5*((k -= 1)*(k - 2) - 1);
    }
  };

  public static class Cubic
  {       
    public static float In (float k) {
      return k*k*k;
    }

    public static float Out (float k) {
      return 1 + ((k -= 1)*k*k);
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return 0.5*k*k*k;
      return 0.5*((k -= 2)*k*k + 2);
    }
  };

  public static class Quartic
  {       
    public static float In (float k) {
      return k*k*k*k;
    }

    public static float Out (float k) {
      return 1 - ((k -= 1)*k*k*k);
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return 0.5*k*k*k*k;
      return -0.5*((k -= 2)*k*k*k - 2f);
    }
  };

  public static class Quintic
  {       
    public static float In (float k) {
      return k*k*k*k*k;
    }

    public static float Out (float k) {
      return 1 + ((k -= 1)*k*k*k*k);
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return 0.5*k*k*k*k*k;
      return 0.5*((k -= 2)*k*k*k*k + 2);
    }
  };

  public static class Sinusoidal
  {       
    public static float In (float k) {
      return 1 - cos(k*PI/2);
    }

    public static float Out (float k) {
      return sin(k*PI/2);
    }

    public static float InOut (float k) {
      return 0.5*(1 - cos(PI*k));
    }
  };

  public static class Exponential
  {       
    public static float In (float k) {
      return k == 0? 0 : pow(1024, k - 1);
    }

    public static float Out (float k) {
      return k == 1? 1 : 1 - pow(2, -10*k);
    }

    public static float InOut (float k) {
      if (k == 0) return 0;
      if (k == 1) return 1;
      if ((k *= 2) < 1) return 0.5*pow(1024, k - 1);
      return 0.5*(-pow(2, -10*(k - 1)) + 2);
    }
  };

  public static class Circular
  {       
    public static float In (float k) {
      return 1 - sqrt(1 - k*k);
    }

    public static float Out (float k) {
      return sqrt(1 - ((k -= 1)*k));
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return -0.5*(sqrt(1 - k*k) - 1);
      return 0.5f*(sqrt(1 - (k -= 2)*k) + 1);
    }
  };

  public static class Elastic
  {
    public static float In (float k) {
      if (k == 0) return 0;
      if (k == 1) return 1;
      return -pow( 2, 10*(k -= 1))*sin((k - 0.1)*(2*PI)/0.4);
    }

    public static float Out (float k) {
      if (k == 0) return 0;
      if (k == 1) return 1;
      return pow(2, -10*k)*sin((k - 0.1)*(2*PI)/0.4) + 1;
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return -0.5*pow(2, 10*(k -= 1))*sin((k - 0.1)*(2*PI)/0.4);
      return pow(2, -10*(k -= 1))*sin((k - 0.1)*(2*PI)/0.4)*0.5 + 1;
    }
  };

  public static class Back
  {
    static float s = 1.70158;
    static float s2 = 2.5949095;

    public static float In (float k) {
      return k*k*((s + 1)*k - s);
    }

    public static float Out (float k) {
      return (k -= 1)*k*((s + 1)*k + s) + 1;
    }

    public static float InOut (float k) {
      if ((k *= 2) < 1) return 0.5*(k*k*((s2 + 1)*k - s2));
      return 0.5*((k -= 2)*k*((s2 + 1)*k + s2) + 2);
    }
  };

  public static class Bounce
  {       
    public static float In (float k) {
      return 1 - Out(1 - k);
    }

    public static float Out (float k) {         
      if (k < (1/2.75)) {
        return 7.5625*k*k;
      } else if (k < (2/2.75)) {
        return 7.5625*(k -= (1.5/2.75))*k + 0.75;
      } else if (k < (2.5/2.75)) {
        return 7.5625 *(k -= (2.25/2.75))*k + 0.9375;
      } else {
        return 7.5625*(k -= (2.625/2.75))*k + 0.984375;
      }
    }

    public static float InOut (float k) {
      if (k < 0.5) return In(k*2)*0.5;
      return Out(k*2 - 1)*0.5 + 0.5;
    }
  };
}