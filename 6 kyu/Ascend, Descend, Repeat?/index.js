function ascendDescend(length, minimum, maximum) {
    if (maximum < minimum) {
        return "";
    }

    if (minimum === maximum) {
        var result = "";
        for (var i = 0; i < length; i++) {
            result += minimum;
        }
        return result;
    }

    var result = "";
    var check = true;

    while (result.length < length) {
        if (check) {
            result = result.substring(0, result.length - (minimum.toString()).length);
            for (var i = minimum; i <= maximum; i++) {
                result += i;
            }
            check = false;
        } else {
            result = result.substring(0, result.length - (maximum.toString()).length);
            for (var i = maximum; i >= minimum; i--) {
                result += i;
            }
            check = true;
        }
        if (result.length > length) {
            result = result.substring(0, length);
        }
    }

    return result;
}

function ascendDescend(length, minimum, maximum) {
    let increase = '', descending = '', answer = '';
    for (let i = minimum; i <= maximum; i++) {
        increase += i;
    }
    for (let j = maximum - 1; j > minimum; j--) {
        descending += j;
    }
    for (let k = 0; k < length; k++) {
        answer += increase;
        answer += descending;
    }
    return answer.slice(0, length);
}

function ascendDescend(length, minimum, maximum) {
    if (length === 0 || maximum < minimum) {
        return ''
    };
    if (maximum === minimum) {
        return `${minimum}`.repeat(length)
    };
    let li = [minimum];
    let count = -1;
    let m1 = minimum;
    for (let i = 1; i < length; i++) {
        if (minimum === maximum || minimum === m1) {
            count++
        }
        if (count % 2 === 0) {
            minimum++;
            li.push(minimum)
        }
        else {
            minimum--;
            li.push(minimum);
        }
    }
    let str = li.join('');
    return str.substring(0, length);
}