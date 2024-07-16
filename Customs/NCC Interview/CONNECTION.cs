// using System;
//
// class CONNECTION
// {
//     class Union
//     {
//         private int[] rank;
//         private int[] parent;
//
//         public Union(int size)
//         {
//             rank = new int[size];
//             Array.Fill(rank, 1);
//             parent = new int[size];
//             for (int i = 0; i < size; i++)
//             {
//                 parent[i] = i;
//             }
//         }
//
//         public int Find(int x)
//         {
//             if (parent[x] != x)
//             {
//                 parent[x] = Find(parent[x]);
//             }
//
//             return parent[x];
//         }
//
//         public bool MakeUnion(int x, int y)
//         {
//             int xRoot = Find(x);
//             int yRoot = Find(y);
//             if (xRoot == yRoot)
//                 return false;
//             if (rank[xRoot] < rank[yRoot])
//             {
//                 parent[xRoot] = yRoot;
//             }
//             else if (rank[xRoot] > rank[yRoot])
//             {
//                 parent[yRoot] = xRoot;
//             }
//             else
//             {
//                 parent[xRoot] = yRoot;
//                 rank[yRoot]++;
//             }
//
//             return true;
//         }
//     }
//
//     static void Main(string[] args)
//     {
//         string[] input = Console.ReadLine().Split();
//         int n = int.Parse(input[0]);
//         int m = int.Parse(input[1]);
//         Union u = new Union(n);
//         int components = n;
//         int extraEdges = 0;
//
//         for (int i = 0; i < m; i++)
//         {
//             input = Console.ReadLine().Split();
//             int x = int.Parse(input[0]);
//             int y = int.Parse(input[1]);
//             if (u.MakeUnion(x, y))
//             {
//                 components--;
//             }
//             else
//             {
//                 extraEdges++;
//             }
//         }
//
//         int result = components - 1;
//         Console.WriteLine(result <= extraEdges ? result : -1);
//     }
// }