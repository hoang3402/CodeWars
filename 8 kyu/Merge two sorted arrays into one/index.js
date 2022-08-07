function mergeArrays(arr1, arr2) {
    var a = new Set(arr1);
    arr2.forEach(element => {
        a.add(element);
    });
    return Array.from(a).sort((a, b) => a - b);
}

function mergeArrays(arr1, arr2) {
    return Array.from(new Set(arr1.concat(arr2).sort((a, b) => (a - b))));
}

function mergeArrays(a, b) {
    return [...new Set(a.concat(b))].sort((a, b) => a - b)
}