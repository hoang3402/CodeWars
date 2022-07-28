public class LopHoc
{
    int SoLuongHS = 0;
    HocSinh[] DanhSachHS;

    // Default max 300 hoc sinh
    public LopHoc()
    {
        this.DanhSachHS = new HocSinh[300];
    }

    public LopHoc(int SoLuongHS)
    {
        this.SoLuongHS = SoLuongHS;
        this.DanhSachHS = new HocSinh[SoLuongHS];
    }

    public int GetSLHS()
    {
        return SoLuongHS;
    }

    public void NhapDanhSachHS()
    {
        for (int i = 0; i < SoLuongHS; i++)
        {
            Console.WriteLine("Nhap thong tin hoc sinh thu " + (i + 1));
            Console.Write("Nhap ho: ");
            string Ho = Console.ReadLine() ?? "NULL";
            Console.Write("Nhap ten: ");
            string Ten = Console.ReadLine() ?? "NULL";
            Console.Write("Nhap diem toan: ");
            // ?? có nghĩa là nếu Toan không null thì lấy Toan, nếu Toan null thì lấy "-1"
            float Toan = float.Parse(Console.ReadLine() ?? "-1");
            Console.Write("Nhap diem van: ");
            float Van = float.Parse(Console.ReadLine() ?? "-1");
            DanhSachHS[i] = new HocSinh(Ho, Ten, Toan, Van);
        }
    }

    
}