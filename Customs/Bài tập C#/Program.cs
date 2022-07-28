// public class Program
// {
//     public static void Main()
//     {
//         HocSinh[] arr;

//         AddStudent(out arr);
//         int SL = arr[0].GetSLHS();
//         float temp_Toan = SumToan(arr);
//         float temp_Van = SumVan(arr);

//         Console.WriteLine("Diem trung binh toan cua ca lop: " + (float)(temp_Toan / SL));
//         Console.WriteLine("Diem trung binh van cua ca lop: " + (float)(temp_Van / SL));

//         Console.WriteLine("Xap sep hoc sinh theo ho ten");
//         SortOderByHoTen(ref arr, SL);
//         PrintDanhSach(arr);

//         Console.WriteLine("Xap sep hoc sinh theo diem trung binh");
//         SortOderByDTB(ref arr, SL);
//         PrintDanhSach(arr);
//     }

//     private static void AddStudent(out HocSinh[] arr)
//     {
//         Console.Write("Nhap so luong hoc sinh: ");
//         int SL = int.Parse(Console.ReadLine() ?? "0");
//         arr = new HocSinh[SL];
//         for (int i = 0; i < SL; ++i)
//         {
//             Console.WriteLine("Nhap thong tin hoc sinh thu " + (i + 1));
//             Console.Write("Nhap ho: ");
//             string Ho = Console.ReadLine() ?? "NULL";
//             Console.Write("Nhap ten: ");
//             string Ten = Console.ReadLine() ?? "NULL";
//             Console.Write("Nhap diem toan: ");
//             // ?? có nghĩa là nếu Toan không null thì lấy Toan, nếu Toan null thì lấy "-1"
//             float Toan = float.Parse(Console.ReadLine() ?? "-1");
//             Console.Write("Nhap diem van: ");
//             float Van = float.Parse(Console.ReadLine() ?? "-1");
//             arr[i] = new HocSinh(Ho, Ten, Toan, Van);
//         }
//     }

//     private static float SumToan(HocSinh[] arr)
//     {
//         int SL = arr[0].GetSLHS();
//         float temp_Toan = 0;
//         for (int i = 0; i < SL; i++)
//         {
//             temp_Toan += arr[i].GetToan();
//         }
//         return temp_Toan;
//     }

//     private static float SumVan(HocSinh[] arr)
//     {
//         int SL = arr[0].GetSLHS();
//         float temp_Van = 0;
//         for (int i = 0; i < SL; i++)
//         {
//             temp_Van += arr[i].GetVan();
//         }
//         return temp_Van;
//     }

//     private static void PrintDanhSach(HocSinh[] arr)
//     {
//         int SL = arr[0].GetSLHS();
//         Console.WriteLine("Ho" + "\t" + "Ten" + "\t" + "Toan" + "\t" + "Van" + "\t" + "Diem TB");
//         for (int i = 0; i < SL; i++)
//         {
//             Console.WriteLine(arr[i].GetHo() + "\t" + arr[i].GetTen() + "\t" + arr[i].GetToan() + "\t" + arr[i].GetVan() + "\t" + arr[i].DTB());
//         }
//     }

//     private static void SortOderByHoTen(ref HocSinh[] arr, int SL)
//     {
//         for (int i = 0; i < SL - 1; i++)
//         {
//             for (int j = i + 1; j < SL; j++)
//             {
//                 if (arr[i].GetHo().ToLower() == arr[j].GetHo().ToLower())
//                 {
//                     if (arr[i].GetTen()[0] > arr[j].GetTen()[0])
//                     {
//                         HocSinh temp = arr[i];
//                         arr[i] = arr[j];
//                         arr[j] = temp;
//                     }
//                 }
//                 else if (Char.ToLower(arr[i].GetTen()[0]) > Char.ToLower(arr[j].GetTen()[0]))
//                 {
//                     HocSinh temp = arr[i];
//                     arr[i] = arr[j];
//                     arr[j] = temp;
//                 }
//             }
//         }
//     }

//     private static void SortOderByDTB(ref HocSinh[] arr, int SL)
//     {
//         for (int i = 0; i < SL - 1; i++)
//         {
//             for (int j = i + 1; j < SL; j++)
//             {
//                 if (arr[i].DTB() > arr[j].DTB())
//                 {
//                     HocSinh temp = arr[i];
//                     arr[i] = arr[j];
//                     arr[j] = temp;
//                 }
//                 else if (arr[i].GetHo().ToLower() == arr[j].GetHo().ToLower())
//                 {
//                     if (Char.ToLower(arr[i].GetTen()[0]) > Char.ToLower(arr[j].GetTen()[0]))
//                     {
//                         HocSinh temp = arr[i];
//                         arr[i] = arr[j];
//                         arr[j] = temp;
//                     }
//                 }
//             }
//         }
//     }
// }
