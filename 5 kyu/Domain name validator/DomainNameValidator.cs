using System;
using System.Linq;
public class DomainNameValidator
{
    public bool validate(string domain)
    {
        System.Console.WriteLine(domain);
        if (domain.Length <= 1 || domain.Length >= 254) return false;

        string[] a;
        a = domain.Split('.');

        if (a.Length < 2) return false;

        foreach (var item in a)
        {
            if (item.Length > 63 || item.Length == 0) return false;
            if (item.Any(c => !Char.IsLetterOrDigit(c) && c != '-')) return false;
            if (item.ElementAt(0) == '-' || item.EndsWith("-")) return false;
            if (item.Any(c => c == 'ň')) return false;
        }

        bool num = false, digit = false, symbol = false;
        foreach (var i in a[a.Length - 1])
        {
            if (Char.IsNumber(i))
            {
                num = true;
            }
            if (Char.IsLetter(i))
            {
                digit = true;
            }
            if (Char.IsSymbol(i) || i == '-')
            {
                symbol = true;
            }
        }
        System.Console.WriteLine(num + " " + digit + " " + symbol);
        if (num && symbol) return true;
        if (!digit) return false;

        return true;
    }
}

////

public class DomainNameValidator
{
    public bool validate(string domain)
    {
        if (domain.Length > 253)
            return false;
        Regex re = new Regex(@"^(?!-)[a-z0-9-]{1,63}(?<!-)(?:\.(?!-)[a-z0-9-]{1,63}(?<!-)){0,125}\.(?!-)(?![0-9]+$)[a-z0-9-]{1,63}(?<!-)$", RegexOptions.IgnoreCase);
        Match m = re.Match(domain);
        return m.Success;
    }
}

////


public class DomainNameValidator
{
    public bool validate(string domain)
    {
        if (domain.Length > 253)
            return false;
        return Regex.IsMatch(domain,
          @"^(([\da-z]|([\da-z][\da-z-]{0,61}[\da-z]))\.){1,126}([a-z]|([\da-z][\da-z-]{0,61}[\da-z])(?<=\..*?[a-z-].*?)())$",
          RegexOptions.IgnoreCase);
    }
}

////

public class DomainNameValidator
{
    public bool validate(string domain) =>
        System.Text.RegularExpressions.Regex.IsMatch(domain,
          @"(?xi)
            ^                               # start
            (?=.{0,253}$)                   # total length restriction
            (                               
                (?=[^.]*\D[^.]*(\.|$))      # level must contain non-digit symbol
                (?!-)                       # level must not start with minus
                [a-z0-9-]{1,63}             # level charset
                (?<!-)                      # level must not end with minus
                (\.|$)                      # levels separator
            ){2,127}                        # total levels number restriction
            (?<!\.)                         # must not be dot before end
            $                               # end
        ");
}