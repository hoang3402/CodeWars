public class HocSinh
{
    string Ten;
    string Ho;
    float DiemVan;
    float DiemToan;
    float DiemTrungBinh;

    public HocSinh(string Ho, string Ten, float DiemToan, float DiemVan)
    {
        this.Ten = Ten;
        this.Ho = Ho;
        this.DiemVan = DiemVan;
        this.DiemToan = DiemToan;
        this.DiemTrungBinh = (DiemToan + DiemVan) / 2;
    }

    public float DTB()
    {
        return DiemTrungBinh;
    }

    public float GetToan()
    {
        return DiemToan;
    }
    public float GetVan()
    {
        return DiemVan;
    }

    public string GetTen()
    {
        return Ten;
    }

    public string GetHo()
    {
        return Ho;
    }
}