function topThreeWords(text) {
    const words = text.toLowerCase().match(/\b[a-z']+\b/g);

    if (!words) {
        return [];
    }

    const cleanWords = words.map(word => word.replace(/[^a-z']+/g, '')).filter(Boolean);

    const wordCount = {};
    cleanWords.forEach((word) => {
        wordCount[word] = (wordCount[word] || 0) + 1;
    });

    const sortedWords = Object.keys(wordCount).sort((a, b) => wordCount[b] - wordCount[a]);

    const topThreeWords = sortedWords.slice(0, 3);

    return topThreeWords;
}

///

let topThreeWords = text => {
    let dict = new Map();
    text.replace(/[A-z']+(?=[ ]+|$)/g, match => {
        let word = match.toLowerCase();
        dict.set(word, dict.has(word) ? dict.get(word) + 1 : 1);
    });
    dict.delete("'");
    return [...dict].sort((a, b) => b[1] - a[1]).map(a => a[0]).slice(0, 3);
};

///

function topThreeWords(text) {
    let words = {}
    text.toLowerCase().replace(/([A-Za-z][A-Za-z']*)/g, match => {
        let c = words[match] || 0
        words[match] = ++c
    })
    return Object
        .keys(words)
        .sort(function (a, b) { return words[b] - words[a] })
        .slice(0, 3)
}

///

const topThreeWords = text => {
    let total = (text.toLowerCase().match(/\b[a-z']+\b/g) || []).reduce((acc, cur) => (acc[cur] = (acc[cur] || 0) + 1, acc), {});
    return Object.keys(total).sort((a, b) => total[b] - total[a]).slice(0, 3);
};

///

function topThreeWords(text) {
    text = text.replace(/\,/g, '')
    text = text.replace(/\./g, '')
    text = text.replace(/\?/g, '')
    text = text.replace(/\!/g, '')
    text = text.replace(/  /g, ' ')
    text = text.replace(/\\/g, '')
    text = text.replace(/\//g, '')
    text = text.trim()
    text = text.toLowerCase()
    array = text.split(' ')
    hash = {}

    // return if just ''
    if (array[0] == '') return []

    // put in hash
    for (word of array) {
        if (word in hash) {
            hash[word] += 1
        }
        else hash[word] = 1
    }

    // get rid of single quote matches
    delete hash["'"]

    // copy to array
    let arrayToSort = []
    for (key in hash) arrayToSort.push([key, hash[key]])

    // sort the array by frequency
    let sorted = arrayToSort.sort((a, b) => b[1] - a[1])

    // get the top three
    let result = []
    for (let i = 0; i < 3; i += 1) {
        if (sorted[i]) result.push(sorted[i][0])
    }
    return result
}