#include <bits/stdc++.h>

using namespace std;
#define Max 100
typedef int MaTranINT[Max][Max];
typedef double MaTranDOUBLE[Max][Max];

void menu()
{
    cout << "\t\t\tMenu - 12101005" << endl;
    cout << "[0] Thoat khoi chuong trinh" << endl;
    cout << "[1] Nhap vao 1 ngay va tim ngay truoc do (ngay thang nam)" << endl;
    cout << "[2] Nhap so nguyen co 2 chu so va in ra cach doc" << endl;
    cout << "[3] Nhap vao so tien quy doi thanh 1000, 2000, 3000, 5000, 10000, 20000 sao cho so to tien le la it nhat" << endl;
    cout << "[4] Sap xep mang 1 chieu so thuc tang dan" << endl;
    cout << "[5] Tim so am cuoi cung trong mang so thuc" << endl;
    cout << "[6] Tim 2 gia tri gan nhau nhat trong mang" << endl;
    cout << "[7] Liet ke cac gia tri chan có it nhat 1 lan can cung la chan" << endl;
    cout << "[8] Chuyen n thanh so nhi phan" << endl;
    cout << "[9] Tinh tong cac so chia het cho 3" << endl;
    cout << "[10] Dem so phan tu duong va chia het cho 7" << endl;
    cout << "[11] Cho biet mang co so chan nhieu hon hay it hon so le" << endl;
    cout << "[12] Phan tu xuat hien nhieu nhat" << endl;
    cout << "[13] Kiem tra mang doi xung" << endl;
    cout << "[14] Noi mang a va b thanh c" << endl;
    cout << "[15] Them 1 phan tu X vao mang A tai vi tri X" << endl;
    cout << "[16] Xoa phan tu tai vi tri k trong mang a" << endl;
    cout << "[17] Liet ke day con tang" << endl;
    cout << "[18] Tinh tong cac gia tri nam tren bien cua ma tran" << endl;
    cout << "[19] Hoan Doi 2 dong tren ma tran" << endl;
    cout << "[20] Hoan Doi 2 cot tren ma tran" << endl;
    cout << "[21] Xoa 1 cot tren ma tran" << endl;
    cout << "[22] Xuat duong cheo chinh cua ma tran" << endl;
    cout << "[23] Xuat duong cheo phu cua ma tran" << endl;
    cout << "[24] Tich 2 ma tran" << endl;
}

// Nhập ngày và tìm ngày trước đó
int isLeapYear(int year)
{
    if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
        return 1;
    else
        return 0;
}

bool checkDate(int day, int month, int year)
{
    int temp = 0;
    int max; // là max số ngày của 1 tháng

    if (year < 1582) {
        cout << "Nam khong hop le" << endl;
        temp++;

    } else {
        temp--;
    }

    if (month < 1 || month > 12) {
        cout << "Thang khong hop le" << endl;
        temp++;

    } else {
        temp--;
    }

    switch (month) {
    case 4:
    case 6:
    case 9:
    case 11:
        max = 30;
        break;
    case 2:
        max = 28 + isLeapYear(year);
        break;
    default:
        max = 31;
    }

    if (day < 1 || day > max) {

        cout << "Ngay khong hop le" << endl;

        temp++;

    } else {
        temp--;
    }
    if (temp == -3) {
        return true;

    } else {
        return false;
    }
}

int top(int m, int y)
{
    switch (m) {
    case 4:
    case 6:
    case 9:
    case 11:
        return 30;
    case 2:
        return 28 + ((y % 4 == 0 && y % 100) || y % 400 == 0);
    default:
        return 31;
    }
}

void yesterday(int day, int month, int year)
{
    if (!checkDate(day, month, year)) {
        return;
    }
    if (day == 1) {
        if (month == 1) {
            month = 12;
            year--;
        } else
            month--;
        day = top(month, year);
    } else {
        day--;
    }

    cout << day << "/" << month << "/" << year << endl;
}

// Nhập mảng 1 chiều
void InputArray(MaTranINT a, int& n)
{
    cout << "So luong phan tu = ";
    cin >> n;
    for (int i = 0; i < n; i++) {
        cout << "a[" << i << "] = ";
        cin >> *a[i];
    }
}
void InputArray(MaTranDOUBLE a, int& n)
{
    cout << "So luong phan tu = ";
    cin >> n;
    for (int i = 0; i < n; i++) {
        cout << "a[" << i << "] = ";
        cin >> *a[i];
    }
}

// Nhập mảng 2 chiều
void InputArray(MaTranINT a, int& n, int& m)
{
    cout << "hang = ";
    cin >> n;
    cout << "cot = ";
    cin >> m;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cout << "a[" << i << " " << j << "] = ";
            cin >> a[i][j];
        }
    }
}
void InputArray(MaTranDOUBLE a, int& n, int& m)
{
    cout << "hang = ";
    cin >> n;
    cout << "cot = ";
    cin >> m;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cout << "a[" << i << " " << j << "] = ";
            cin >> a[i][j];
        }
    }
}

// Xuất mảng 1 chiều
void XuatMang1(MaTranINT a, int i, int j)
{
    int start = i, end = j;
    for (int i = start; i <= end; i++) {
        cout << *a[i] << " ";
    }
    cout << endl;
}
void XuatMang1(MaTranDOUBLE a, int i, int j)
{
    int start = i, end = j;
    for (int i = start; i < end; i++) {
        cout << *a[i] << " ";
    }
    cout << endl;
}

// Xuất mảng 2 chiều (ma trận)
void XuatMang2(MaTranINT a, int n, int m)
{
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cout << a[i][j] << " ";
        }
        cout << endl;
    }
}
void XuatMang2(MaTranDOUBLE a, int n, int m)
{
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cout << a[i][j] << " ";
        }
        cout << endl;
    }
}

// Viết chương trình nhập 1 số nguyên có 2 chữ số. Hãy in ra cách đọc của số nguyên này.
string DocChuSo(int n)
{
    if (n < 10 || n >= 100) {
        return "Chi doc duoc so co 2 chu so!";
    }
    if (n == 10) {
        return "muoi";
    }
    string result,
        So[10] = { "khong", "mot", "hai", "ba", "bon", "nam", "sau", "bay", "tam", "chin" };
    int count = 0;
    while (n > 0) {
        int temp = n % 10;
        n = n / 10;
        count++;
        switch (count) {
        case 2:
            result.insert(0, " muoi ");
            result.insert(0, So[temp]);
            break;
        default:
            result.insert(0, So[temp]);
            break;
        }
    }
    if (result.find("mot muoi") != string::npos) {
        result.replace(result.find("mot muoi"), 8, "muoi");
    }
    if (result.find("muoi khong") != string::npos) {
        result.replace(result.find("muoi khong"), 10, "muoi");
    }
    if (result.find("muoi nam") != string::npos) {
        result.replace(result.find("muoi nam"), 8, "muoi lam");
    }
    return result;
}

// Nhap vao so tien quy doi thanh 1000, 2000, 3000, 5000, 10000, 20000 sao cho so to tien le la it nhat
void ChuyenDoiTien(int n)
{
    if (n >= 20000) {
        cout << "20000: " << n / 20000 << endl;
        n %= 20000;
    }
    if (n >= 10000) {
        cout << "10000: " << n / 10000 << endl;
        n %= 10000;
    }
    if (n >= 5000) {
        cout << "5000: " << n / 5000 << endl;
        n %= 5000;
    }
    if (n >= 2000) {
        cout << "2000: " << n / 2000 << endl;
        n %= 2000;
    }
    if (n >= 1000) {
        cout << "1000: " << n / 1000 << endl;
        n %= 1000;
    }
}

// Sap xep mang 1 chieu so thuc tang dan
void SapXepMang1Chieu(MaTranDOUBLE a, int n)
{
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (*a[i] > *a[j]) {
                swap(a[i], a[j]);
            }
        }
    }
}
void SapXepMang1Chieu(MaTranINT a, int n)
{
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (*a[i] > *a[j]) {
                swap(a[i], a[j]);
            }
        }
    }
}

// Viết hàm xuất ra hệ nhị phân của số nguyên n
unsigned int BaseBinary(int n)
{
    unsigned rem, i = 1, sum = 0;
    do {
        rem = n % 2;
        sum += (i * rem);
        n /= 2;
        i *= 10;
    } while (n > 0);
    return sum;
}

// Kiểm tra mảng có đối xứng không?
bool isPalindrome(MaTranINT a, int n)
{
    int first = 0, last = n - 1;
    while (first <= last) {
        if (*a[first] != *a[last]) {
            return false;
        }
        first++;
        last--;
    }
    return true;
}

// Liệt kê dãy con tăng
void lietKeDayConTang(MaTranINT a, int n)
{
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            if (*a[j] > *a[j + 1]) {
                XuatMang1(a, i, j);
                i = j + 1;
            }
        }
    }
}

// Tích 2 ma trận
void Tich2MaTran(MaTranINT a, int n, int m, MaTranINT b, int k, int l)
{
    // hàng là n, k; cột là m, l;
    if (n != l) {
        cout << "Khong the tinh duoc ma tran!" << endl;
        return;
    }
    MaTranINT result;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            result[i][j] = 0;
            for (int r = 0; r < k; r++) {
                result[i][j] += a[i][r] * b[r][j];
            }
            cout << result[i][j] << "\t";
        }
        cout << endl;
    }
}

// tìm số âm cuối cùng trong mảng các số thực.
int TimSoAm(MaTranDOUBLE a, int n)
{
    for (int i = n - 1; i >= 0; i--) {
        if (*a[i] < 0)
            return *a[i];
    }
    return 0;
}

// Hãy cho biết phần tử nào trong mảng xuất hiện nhiều nhất?
bool Tim(int a[], int& SLPT, int SoCanTim)
{
    for (int i = 1; i < SLPT + 1; i++) {
        if (SoCanTim == a[i])
            return true;
    }
    return false;
}

void Them(int a[], int& SLPT, int SoCanThem)
{
    for (int i = 0; i < SLPT; i++) {
        if (!Tim(a, SLPT, SoCanThem)) {
            a[SLPT] = SoCanThem;
            SLPT += 1;
        }
    }
}

// Tìm phần tử xuất hiện nhiều nhất
void PhanTuXuatHienNhieuNhat(MaTranINT a, int n)
{
    int max = 1, count_temp = 1, slpt = 1;
    int count[n], only[n];

    SapXepMang1Chieu(a, n);
    // lấp toàn bộ count để đếm nếu không thì sẽ toàn là giá trị rác
    for (int i = 0; i < n; i++) {
        count[i] = 0;
    }
    // lọc các phần tử
    for (int i = 0; i < n; i++) {
        Them(only, slpt, *a[i]);
    }
    for (int i = 1; i < slpt; i++) {
        for (int j = 0; j < n; j++) {
            if (only[i] == *a[j]) {
                count[i]++;
            }
        }
        if (count[i] > max) {
            max = count[i];
        }
    }
    cout << "Phan tu xuat hien nhieu nhat la ";
    for (int i = 1; i < slpt; i++) {
        if (count[i] == max) {
            cout << only[i] << " ";
        }
    }
    cout << endl;
}

// tìm 2 giá trị gần nhau nhất trong mảng
void HaiGiaTriGanNhau(MaTranDOUBLE a, int n)
{
    double min = 999, temp;
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            temp = abs(*a[j] - *a[i]);
            if (temp < min) {
                min = temp;
            }
        }
    }
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            temp = abs(*a[j] - *a[i]);
            if (temp == min) {
                cout << "2 gia tri gan nhau la "
                     << "[" << *a[i] << "]"
                     << "[" << *a[j] << "]" << endl;
            }
        }
    }
}

// Viết hàm tính tổng các số chia hết cho 3 trong mảng số nguyên
int TotalNumberOf3(MaTranINT a, int n)
{
    int result = 0;
    for (int i = 0; i < n; i++) {
        if (*a[i] % 3 == 0) {
            result += *a[i];
        }
    }
    return result;
}

// Đếm số dương chia hết cho 7 trong mảng
int CountNumberDiv7(MaTranINT a, int n)
{
    int result = 0;
    for (int i = 0; i < n; i++) {
        if (*a[i] > 0 && *a[i] % 7 == 0) {
            result++;
        }
    }
    return result;
}

// Hãy cho biết mảng số nguyên có số chẵn nhiều hơn hay ít hơn số lẻ?
void ChanItHayNhieu(MaTranINT a, int n)
{
    int Chan = 0, Le = 0;
    for (int i = 0; i < n; i++) {
        if (*a[i] % 2 == 0) {
            Chan++;
        } else {
            Le++;
        }
    }
    if (Chan == Le) {
        cout << "Chan le bang nhau";
        return;
    } else if (Chan > Le) {
        cout << "Chan nhieu hon le";
        return;
    } else {
        cout << "Le nhieu hon chan";
        return;
    }
}

// Cho 2 mảng a, b. Hãy tạo mảng c bằng cách nối mảng a và mảng b vào mảng c
void NoiMang(MaTranINT a, int n, MaTranINT b, int m, MaTranINT c, int& slpt)
{
    slpt = 0;
    for (int i = 0; i < n; i++, slpt++) {
        *c[slpt] = *a[i];
    }
    for (int i = 0; i < m; i++, slpt++) {
        *c[slpt] = *b[i];
    }
    cout << "Mang c: ";
    for (int i = 0; i < slpt; i++) {
        cout << *c[i] << " ";
    }
    cout << endl;
}

// Cho mảng 1 chiều các số nguyên. Hãy viết hàm liệt kê các giá trị chẵn có ít nhất 1 lân cận cũng là giá trị chẵn.
void LietKeGiaTriChan(MaTranINT a, int n)
{
    for (int i = 0; i < n; i++) {
        if (*a[i] % 2 == 0 && (*a[i + 1] % 2 == 0 || (*a[i - 1] % 2 == 0 && i - 1 >= 0))) {
            cout << *a[i] << " ";
        }
    }
}

// Xóa phần tử tại vị trí k trong mảng a.
void Delete(MaTranINT a, int& SLPT, int ViTri)
{
    ViTri--;
    for (int i = ViTri; i < SLPT; i++) {
        *a[i] = *a[i + 1];
    }
    SLPT--;
}

// Thêm 1 phần tử x vào mảng a tại vị trí x.
void insert(MaTranINT a, int& SLPT, int PhanTuCanThem, int ViTri)
{
    SLPT++;
    ViTri--;
    for (int i = SLPT; i > ViTri; i--) {
        *a[i] = *a[i - 1];
    }
    *a[ViTri] = PhanTuCanThem;
}

// Tính tổng các giá trị nằm trên biên của ma trận
int TinhTongCacGiaTriTrenBien(MaTranINT a, int n, int m)
{
    int result = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (i == 0 || j == 0 || i == n - 1 || j == m - 1) {
                result += a[i][j];
            }
        }
    }

    return result;
}

// Hoán vị 2 dòng trên ma trận
void HoanVi2Dong(MaTranINT a, int n, int m, int DongDoi1, int DongDoi2)
{
    int b; // Dùng để hoán đổi
    for (int i = 0; i < m; i++) {
        b = a[DongDoi1][i];
        a[DongDoi1][i] = a[DongDoi2][i];
        a[DongDoi2][i] = b;
    }
}

// Hoán vị 2 cột trên ma trận
void HoanVi2Cot(MaTranINT a, int n, int m, int Cot1, int Cot2)
{
    int b; // Dùng để hoán đổi
    for (int i = 0; i < n; i++) {
        b = a[i][Cot1];
        a[i][Cot1] = a[i][Cot2];
        a[i][Cot2] = b;
    }
}

// Xóa 1 cột trong ma trận
void Xoa1Cot(MaTranINT a, int n, int& m, int CotCanXoa)
{
    m -= 1;
    for (int i = 0; i < n; i++) {
        for (int j = CotCanXoa; j < m; j++) {
            a[i][j] = a[i][j + 1];
        }
    }
}

bool IsMaTranVuong(int n, int m)
{
    return (n == m ? true : false);
}

// Xuất đường chéo chính trong ma trận
void XuatDuongCheoChinh(MaTranINT a, int n, int m)
{
    if (!IsMaTranVuong(n, m)) {
        cout << "Khong phai la ma tran vuong!!" << endl;
        return;
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (i == j) {
                cout << a[i][j] << " ";
            }
        }
    }
}

// Xuất đường chéo phụ trong ma trận
void XuatDuongCheoPhu(MaTranINT a, int n, int m)
{
    if (!IsMaTranVuong(n, m)) {
        cout << "Khong phai la ma tran vuong" << endl;
        return;
    }
    for (int i = 0, j = m - 1; i < n; i++, j--) {
        cout << a[i][j] << " ";
    }
}

int main()
{
    MaTranINT a, b, q;
    MaTranDOUBLE c, d;
    int n, m, k, l, LuaChon, slpt, x, ViTri;
    int dd, mm, yy;
Try:
    menu();
    cin >> LuaChon;
    switch (LuaChon) {
    case 0: {
        cout << "Chao tam biet <3" << endl;
        return 0;
    }
    case 1: {
        cout << "Nhap ngay thang nam: ";
        cin >> dd >> mm >> yy;
        yesterday(dd, mm, yy);
        system("pause");
        system("cls");
        goto Try;
    }
    case 2: {
        cout << "So can doc: ";
        cin >> n;
        cout << "Doc la: " << DocChuSo(n) << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 3: {
        cout << "Nhap vao so tien ban muon doi: ";
        cin >> n;
        cout << "Voi " << n << " thi se doi duoc " << endl;
        ChuyenDoiTien(n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 4: {
        InputArray(c, n);
        SapXepMang1Chieu(c, n);
        cout << "Da sap xep xong mang 1 chieu" << endl;
        cout << "Ban co muon xem mang sau khi sap xep khong?" << endl;
        cout << "[1] Co || Khac 1 la khong" << endl;
        cin >> LuaChon;
        if (LuaChon == 1) {
            XuatMang1(c, 0, n);
        }
        system("pause");
        system("cls");
        goto Try;
    }
    case 5: {
        InputArray(c, n);
        cout << "So am cuoi cung cua mang la " << TimSoAm(c, n) << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 6: {
        InputArray(c, n);
        HaiGiaTriGanNhau(c, n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 7: {
        InputArray(a, n);
        LietKeGiaTriChan(a, n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 8: {
        cout << "n = ";
        cin >> n;
        cout << BaseBinary(n) << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 9: {
        InputArray(a, n);
        cout << "Tong cac so chia het cho 3 = " << TotalNumberOf3(a, n) << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 10: {
        InputArray(a, n);
        cout << "Co " << CountNumberDiv7(a, n) << " duong va chia het cho 7" << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 11: {
        InputArray(a, n);
        ChanItHayNhieu(a, n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 12: {
        InputArray(a, n);
        PhanTuXuatHienNhieuNhat(a, n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 13: {
        InputArray(a, n);
        if (isPalindrome(a, n)) {
            cout << "Mang doi xung" << endl;
        } else {
            cout << "Mang khong doi xung" << endl;
        }
        system("pause");
        system("cls");
        goto Try;
    }
    case 14: {
        cout << "Nhap mang A" << endl;
        InputArray(a, n);
        cout << "Nhap mang B" << endl;
        InputArray(b, m);
        NoiMang(a, n, b, m, q, slpt);
        system("pause");
        system("cls");
        goto Try;
    }
    case 15: {
        InputArray(a, n);
        cout << "Phan tu muon them? ";
        cin >> x;
        cout << "Vi tri muon them?(bat dau tu 1) ";
        cin >> ViTri;
        insert(a, n, x, ViTri);
        XuatMang1(a, 0, n - 1);
        system("pause");
        system("cls");
        goto Try;
    }
    case 16: {
        InputArray(a, n);
        cout << "Nhap vi tri muon xoa ";
        cin >> l;
        Delete(a, n, l);
        XuatMang1(a, 0, n - 1);
        system("pause");
        system("cls");
        goto Try;
    }
    case 17: {
        InputArray(a, n);
        cout << "Day con tang gom" << endl;
        lietKeDayConTang(a, n);
        system("pause");
        system("cls");
        goto Try;
    }
    case 18: {
        InputArray(a, n, m);
        cout << "Tong cac phan tran tren bien cua ma tran = " << TinhTongCacGiaTriTrenBien(a, n, m) << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 19: {
        InputArray(a, n, m);
    NhapLai_19:
        cout << "Nhap 2 dong muon doi ";
        cin >> k >> l;
        if (k > n || l > n || l < 0 || k < 0) {
            cout << "Khong hop le" << endl;
            goto NhapLai_19;
        }
        k -= 1;
        l -= 1;
        HoanVi2Dong(a, n, m, k, l);
        XuatMang2(a, n, m);
        system("pause");
        system("cls");
        goto Try;
    }
    case 20: {
        InputArray(a, n, m);
    NhapLai_20:
        cout << "Nhap 2 dong muon doi ";
        cin >> k >> l;
        if (k > m || l > m || l < 0 || k < 0) {
            cout << "Khong hop le" << endl;
            goto NhapLai_20;
        }
        k -= 1;
        l -= 1;
        HoanVi2Cot(a, n, m, k, l);
        XuatMang2(a, n, m);
        system("pause");
        system("cls");
        goto Try;
    }
    case 21: {
        InputArray(a, n, m);
        cout << "Cot can xoa ";
        cin >> k;
        k -= 1;
        Xoa1Cot(a, n, m, k);
        XuatMang2(a, n, m);
        system("pause");
        system("cls");
        goto Try;
    }
    case 22: {
    NhapLai_22:
        InputArray(a, n, m);
        if (!IsMaTranVuong(n, m)) {
            cout << "Khong phai ma tran vuong" << endl;
            goto NhapLai_22;
        }
        cout << "Duong cheo chinh cua ma tran A la ";
        XuatDuongCheoChinh(a, n, m);
        cout << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 23: {
    NhapLai_23:
        InputArray(a, n, m);
        if (!IsMaTranVuong(n, m)) {
            cout << "Khong phai ma tran vuong" << endl;
            goto NhapLai_23;
        }
        cout << "Duong cheo chinh cua ma tran A la ";
        XuatDuongCheoPhu(a, n, m);
        cout << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    case 24: {
        system("pause");
        system("cls");
        goto Try;
    }
    default: {
        cout << "Error" << endl;
        system("pause");
        system("cls");
        goto Try;
    }
    }
    return 0;
}