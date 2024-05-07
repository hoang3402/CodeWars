public class Kata
{
    public static int FindShort(string s)
    {
        var words = s.Split(' ');
        var result = words[0];
        
        foreach (var word in words)
        {
            result = word.Length < result.Length ? word : result;
        }

        return result.Length;
    }
    
    public static int FindShort(string s)
    {
        return s.Split(' ').Min(x => x.Length);
    }
}