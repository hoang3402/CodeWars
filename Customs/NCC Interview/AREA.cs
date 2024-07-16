// using System;
// using System.Collections.Generic;
//
// class AREA
// {
//     static void Main()
//     {
//         var input = Console.ReadLine().Split();
//         int N = int.Parse(input[0]);
//         int M = int.Parse(input[1]);
//         int[,] grid = new int[N, M];
//
//         for (int i = 0; i < N; i++)
//         {
//             input = Console.ReadLine().Split();
//             for (int j = 0; j < M; j++)
//             {
//                 grid[i, j] = int.Parse(input[j]);
//             }
//         }
//
//         Console.WriteLine(GetMaxRectangleArea(grid, N, M));
//     }
//
//     static int GetMaxRectangleArea(int[,] grid, int N, int M)
//     {
//         int[] heights = new int[M];
//         int maxArea = 0;
//
//         for (int i = 0; i < N; i++)
//         {
//             for (int j = 0; j < M; j++)
//             {
//                 heights[j] = grid[i, j] == 0 ? 0 : heights[j] + 1;
//             }
//
//             maxArea = Math.Max(maxArea, LargestRectangleInHistogram(heights));
//         }
//
//         return maxArea;
//     }
//
//     static int LargestRectangleInHistogram(int[] heights)
//     {
//         Stack<int> stack = new Stack<int>();
//         int maxArea = 0;
//         int index = 0;
//
//         while (index < heights.Length)
//         {
//             if (stack.Count == 0 || heights[stack.Peek()] <= heights[index])
//             {
//                 stack.Push(index++);
//             }
//             else
//             {
//                 int height = heights[stack.Pop()];
//                 int width = stack.Count == 0 ? index : index - stack.Peek() - 1;
//                 maxArea = Math.Max(maxArea, height * width);
//             }
//         }
//
//         while (stack.Count > 0)
//         {
//             int height = heights[stack.Pop()];
//             int width = stack.Count == 0 ? index : index - stack.Peek() - 1;
//             maxArea = Math.Max(maxArea, height * width);
//         }
//
//         return maxArea;
//     }
// }