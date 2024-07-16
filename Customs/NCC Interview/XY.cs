// using System;
//
// class XY
// {
//     static void Main(string[] args)
//     {
//         short numberOfLine = short.Parse(Console.ReadLine());
//
//         for (int i = 0; i < numberOfLine; i++)
//         {
//             // Read the values of n and k
//             string[] inputs = Console.ReadLine().Split();
//             int n = int.Parse(inputs[0]);
//             int k = int.Parse(inputs[1]);
//
//             // Determine the cell type
//             char cellType = GetCellType(n, k);
//
//             // Print the result
//             Console.WriteLine(cellType);
//         }
//     }
//
//     static char GetCellType(int n, int k)
//     {
//         if (n == 1)
//         {
//             return 'X';
//         }
//
//         int previousRowLength = 1 << (n - 2); // 2^(n-2)
//         if (k <= previousRowLength)
//         {
//             // If k is in the first half
//             return GetCellType(n - 1, k) == 'X' ? 'X' : 'Y';
//         }
//
//         // If k is in the second half
//         return GetCellType(n - 1, k - previousRowLength) == 'X' ? 'Y' : 'X';
//     }
// }