###

1. nêu sự hiểu biết mối quan hệ giữa tầng 1 và tầng 2, vật lý - liên kết

Tầng vật lý mô tả cách dữ liệu thực sự được truyền trên phương tiện mạng. tầng liên kết dữ liệu xác định cách các luồng bit này được ghép lại với nhau thành các phần dữ liệu có thể quản lý được.

Ethernet là cách triển khai nổi tiếng nhất của các tầng liên kết vật lý và dữ liệu

2. // tầng 2 và tầng 3, liên kết - mạng

tầng liên kết dữ liệu lấy các gói từ tầng mạng và đóng gói chúng thành các Frames. Sau đó, nó gửi từng frame bit-by-bit trên phần cứng. Ở receiver, tầng liên kết dữ liệu nhận tín hiệu từ phần cứng và tập hợp chúng thành Frames.

3. 3 - 4 mạng - vận chuyển

tầng Mạng là tầng thứ ba của Mô hình OSI. Nó chịu trách nhiệm phân phối các packets từ source-to-destination hoặc host-to-host lưu trữ trên nhiều mạng. tầng này lấy dữ liệu từ tầng vận chuyển, thêm tiêu đề của nó và chuyển tiếp nó đến tầng liên kết.

4. các giao thức liên quan đến cài đặt vận hành về mail mair

- Giao thức SMTP dùng để thực hiện nhiệm vụ gửi mail
- Giao thức phổ biến hiện nay đó là POP và IMAP dùng để thực hiện nhiệm vụ nhận mail hay truy xuất dữ liệu mail server

5. UDP VS TCP nêu ngắn gọn, ứng dụng của 2 giao thức

   TCP

   - Đảm bảo rằng dữ liệu đến đúng như khi được gửi.
   - Kiểm tra lỗi các luồng dữ liệu.
   - Header 20 byte cho phép 40 byte dữ liệu tùy chọn.
   - Chậm hơn UDP.
   - Tốt nhất cho các ứng dụng yêu cầu độ tin cậy.
   - Thường dùng cho HTTPS, HTTP, SMTP, POP, FTP, etc

   UDP

   - Không đảm bảo dữ liệu đến.
   - Không cung cấp tính năng kiểm tra lỗi.
   - Header 8 byte chỉ cho phép dữ liệu bắt buộc.
   - Nhanh hơn TCP.
   - Tốt nhất cho các ứng dụng yêu cầu tốc độ.
   - Video conferencing, streaming, DNS, VoIP, etc
