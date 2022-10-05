function loop() {
    var today = new Date();

    document.getElementById('date').innerHTML = 'Hôm nay ngày ' + String(today.getDate()).padStart(2, '0') + ' tháng ' + String(today.getMonth() + 1).padStart(2, '0') + ' năm ' + today.getFullYear() + '.';
    document.getElementById('time').innerHTML = 'Hiện tại là: ' + today.getHours() + ' giờ ' + today.getMinutes() + ' phút ' + today.getSeconds() + ' giây';
}

setInterval(loop, 900);

// previews
var index = 0;

var lib = [
    'https://raw.githubusercontent.com/ichte/Planets-Android-Learning/master/earth.jpg',
    'https://raw.githubusercontent.com/ichte/Planets-Android-Learning/master/jupiter.jpg',
    'https://raw.githubusercontent.com/ichte/Planets-Android-Learning/master/neptune.jpg'
]

document.getElementById('temp').src = lib[index];

function next() {
    index = index + 1 > 2 ? 0 : index + 1;
    document.getElementById('temp').src = lib[index];
}

function prev() {
    index = index - 1 < 0 ? 2 : index - 1;
    document.getElementById('temp').src = lib[index];
}

var timer = setInterval(next, 1000);

document.getElementById('temp').addEventListener('mouseover', () => {
    clearInterval(timer);
})

document.getElementById('temp').addEventListener('mouseleave', () => {
    timer = setInterval(next, 1000);
})