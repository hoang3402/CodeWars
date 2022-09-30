
function changeBackgroundColor() {
    var color = document.getElementById('Color-code').value;
    var regexp = /(?:#|0x)(?:[a-f0-9]{3}|[a-f0-9]{6})\b|(?:rgb|hsl)a?\([^\)]*\)/i;
    console.log(color);
    if (color === undefined || color === '' || !color.match(regexp)) {
        document.getElementById('error-message').innerHTML = 'Mã màu không hợp lệ!';
        return;
    }
    try {
        document.body.style.backgroundColor = color;
        document.getElementById('error-message').innerHTML = 'Đổi màu Background thành công!';
    } catch (e) {
        document.getElementById('error-message').innerHTML = e;
    }
}