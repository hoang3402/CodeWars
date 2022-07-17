import java.util.Arrays;

class Solution {
  public static String camelCase(String input) {
    return input.replaceAll("([A-Z])", " $1");
  }
}

class Solution {
    public static String camelCase(String input) {
      String result = "";
      for (int i = 0; i < input.length(); i++)
      {
        if (Character.isUpperCase(input.charAt(i))) result += " ";
        result += input.charAt(i);
      }
      return result;
    }
  }