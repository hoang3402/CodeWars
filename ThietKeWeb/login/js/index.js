
document.getElementById('username').addEventListener('input', function () {
    if (document.getElementById('username').value == '') {
        document.getElementById('error-username').style.display = 'inline';
    } else {
        document.getElementById('error-username').style.display = 'none';
    }
})

document.getElementById('password').addEventListener('input', function () {
    if (document.getElementById('password').value === '') {
        document.getElementById('error-password').style.display = 'inline';
    } else {
        document.getElementById('error-password').style.display = 'none';
    }
})

document.getElementById('re-password').addEventListener('input', function () {
    if (document.getElementById('re-password').value === '') {
        document.getElementById('error-re-password-null').style.display = 'inline';
    } else {
        document.getElementById('error-re-password-null').style.display = 'none';
    }
    if (document.getElementById('re-password').value != document.getElementById('password').value) {
        document.getElementById('error-re-password-not-match').style.display = 'inline';
    } else {
        document.getElementById('error-re-password-not-match').style.display = 'none';
    }
})