function is(a, b) {
    return Math.abs(Math.abs(a) - Math.abs(b))
}

function solution(list) {
    let end, result = "";
    const length = list.length;

    for (var i = 0; i < length; ++i) {
        var temp_value = list[i];
        end = i;

        do {
            if (is(++temp_value, list[++end]) == 1) {
                break;
            }
            if (end >= length) break;
        } while (temp_value + 1 == list[end + 1])

        if (end - i == 1) {
            result += `${list[i]},`
            i = end - 1;
        } else {
            result += `${list[i]}-${list[end]},`
            i = end;
        }
        if (i > length) break;
    }

    result = result.slice(0, -1);
    return result;
}