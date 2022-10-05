function loop() {
    var today = new Date();

    document.getElementById('date').innerHTML = 'Hôm nay ngày ' + String(today.getDate()).padStart(2, '0') + ' tháng ' + String(today.getMonth() + 1).padStart(2, '0') + ' năm ' + today.getFullYear() + '.';
    document.getElementById('time').innerHTML = 'Hiện tại là: ' + today.getHours() + ' giờ ' + today.getMinutes() + ' phút ' + today.getSeconds() + ' giây';
}

setInterval(loop, 900);
