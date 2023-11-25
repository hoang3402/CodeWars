using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public class TopWords
{
    public static List<string> Top3(string text)
    {
        Console.WriteLine(text);
        // Sử dụng regex để tìm các từ trong văn bản
        var matches = Regex.Matches(text, @"[A-Za-z']+(?:'[A-Za-z]+)?");

        // Dùng HashSet để đếm số lần xuất hiện của từng từ
        var wordCounts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        foreach (Match match in matches)
        {
            var word = match.Value.ToLower();
            if (word.Equals("'") || word.Equals("'''")) {
              continue;
            }
            if (wordCounts.ContainsKey(word))
            {
                wordCounts[word]++;
            }
            else
            {
                wordCounts[word] = 1;
            }
        }

        var topWords = wordCounts.OrderByDescending(pair => pair.Value)
                                .Take(3)
                                .Select(pair => pair.Key)
                                .ToList();

        return topWords;
    }
}

public class TopWords
{
    public static List<string> Top3(string s)
    {
        return Regex.Matches(s.ToLowerInvariant(), @"('*[a-z]'*)+")
            .GroupBy(match => match.Value)
            .OrderByDescending(g => g.Count())
            .Select(p => p.Key)
            .Take(3)
            .ToList();
    }
}