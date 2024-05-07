function lottery(str){
    let arr = str.split('');
    let result = [];
    for (let i = 0; i < arr.length; i++) {
        if (isNaN(arr[i])) {
            continue;
        }
        if (result.includes(arr[i])) {
            continue;
        }
        result.push(arr[i]);
    }
    return result.length === 0 ? "One more run!" : result.join("");
}

// w123w

function lottery_1(str){
    res = str.replace(/[a-zA-Z]/g,'')
        .split('')
        .filter((x,n,s) => s.indexOf(x) === n)
        .join('');
    return res ? res : 'One more run!'
}

// siebenschlaefer, Walid216

const lottery_2 = str => [...new Set(str.match(/\d/g)).values()].join('') || 'One more run!';
