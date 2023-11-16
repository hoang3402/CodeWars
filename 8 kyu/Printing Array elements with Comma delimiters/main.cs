using System;
using System.Collections.Generic;
using System.Linq;

public class Kata
{
    public static string PrintArray(object[] array)
    {
        List<string> flattenedArray = new List<string>();
        foreach (object item in array)
        {
            if (item is object[])
            {
                flattenedArray.AddRange(((object[])item).Select(x => x.ToString()));
            }
            else
            {
                flattenedArray.Add(item.ToString());
            }
        }
        return string.Join(",", flattenedArray);
    }
}

public class Kata
{
    public static string PrintArray(object[] array)
    {
        return string.Join(",", array.Select(a => a.GetType().IsArray ? string.Join(",", (object[])a) : a));
    }
}