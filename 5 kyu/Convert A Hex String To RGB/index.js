const ConvertHexToDec = { "A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15 };

function hexStringToRGB(hexString) {
    var temp = hexString.toUpperCase().split("");
    var map = {};
    map = Object.assign(map, { "r": hexToDec(temp[1]) * 16 + hexToDec(temp[2]) })
    map = Object.assign(map, { "g": hexToDec(temp[3]) * 16 + hexToDec(temp[4]) })
    map = Object.assign(map, { "b": hexToDec(temp[5]) * 16 + hexToDec(temp[6]) })
    return map;
}

function hexToDec(input) {
    if (input == "#") return;
    if (!Number.isInteger(Number(input))) return ConvertHexToDec[input];

    return Number(input);
}

// 
function hexStringToRGB(h) {
    return {
        r: parseInt(h.slice(1, 3), 16),
        g: parseInt(h.slice(3, 5), 16),
        b: parseInt(h.slice(5, 7), 16)
    };
}

// 
function hexStringToRGB(hex) {
    hex = parseInt(hex.substring(1), 16)
    return { r: hex >> 16, g: (hex & 0x00FF00) >> 8, b: (hex & 0x0000FF) }
}