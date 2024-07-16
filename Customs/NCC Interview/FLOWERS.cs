// using System;
//
// public class FLOWERS
// {
//     const int MOD = 1000000007;
//
//     public static void Main()
//     {
//         long N = long.Parse(Console.ReadLine());
//
//         if (N == 1)
//         {
//             Console.WriteLine(5);
//             return;
//         }
//
//         long[,] A =
//         {
//             { 0, 1, 0, 0, 0 },
//             { 1, 0, 1, 0, 0 },
//             { 1, 1, 0, 1, 1 },
//             { 0, 0, 1, 0, 1 },
//             { 1, 0, 0, 0, 0 }
//         };
//
//         long[,] result = MatrixPower(A, N - 1);
//
//         long[] initial = { 1, 1, 1, 1, 1 };
//         long finalResult = 0;
//
//         for (int i = 0; i < 5; i++)
//         {
//             for (int j = 0; j < 5; j++)
//             {
//                 finalResult = (finalResult + result[i, j] * initial[j]) % MOD;
//             }
//         }
//
//         Console.WriteLine(finalResult);
//     }
//
//     static long[,] MatrixMultiply(long[,] A, long[,] B)
//     {
//         int size = A.GetLength(0);
//         long[,] C = new long[size, size];
//
//         for (int i = 0; i < size; i++)
//         {
//             for (int j = 0; j < size; j++)
//             {
//                 for (int k = 0; k < size; k++)
//                 {
//                     C[i, j] = (C[i, j] + A[i, k] * B[k, j]) % MOD;
//                 }
//             }
//         }
//
//         return C;
//     }
//
//     static long[,] MatrixPower(long[,] A, long exp)
//     {
//         int size = A.GetLength(0);
//         long[,] result = new long[size, size];
//
//         for (int i = 0; i < size; i++)
//         {
//             result[i, i] = 1;
//         }
//
//         while (exp > 0)
//         {
//             if ((exp % 2) == 1)
//             {
//                 result = MatrixMultiply(result, A);
//             }
//
//             A = MatrixMultiply(A, A);
//             exp /= 2;
//         }
//
//         return result;
//     }
// }