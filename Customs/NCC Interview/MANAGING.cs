using System;

public class Managing
{
    static void Main()
    {
        // Read input
        string[] firstLine = Console.ReadLine().Split();
        int n = int.Parse(firstLine[0]);
        int k = int.Parse(firstLine[1]);
        int[] profits = new int[n];
        for (int i = 0; i < n; i++)
        {
            profits[i] = int.Parse(Console.ReadLine());
        }

        Console.WriteLine(MaxProfit(profits, k));
    }

    static int MaxProfit(int[] arr, int k)
    {
        int n = arr.Length;
        int[] dp = new int[n + 1];
        int[] prefixSum = new int[n + 1];

        // Calculate prefix sums
        for (int i = 1; i <= n; i++)
        {
            prefixSum[i] = prefixSum[i - 1] + arr[i - 1];
        }

        for (int i = 1; i <= n; i++)
        {
            dp[i] = dp[i - 1]; // Default to not taking the current project
            for (int j = 1; j <= k && i - j >= 0; j++)
            {
                int currentSum = prefixSum[i] - prefixSum[i - j];
                dp[i] = Math.Max(dp[i], (i - j > 0 ? dp[i - j - 1] : 0) + currentSum);
            }
        }

        return dp[n];
    }
}