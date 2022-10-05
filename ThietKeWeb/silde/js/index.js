window.onload = () => {
    const items = document.querySelector('.items');
    const itemsImg = document.querySelectorAll('.items img');
    var itemWidth = itemsImg[0].offsetWidth;
    var index = 0;

    // every time change size, we need to adjust the width of the items
    window.addEventListener('resize', () => {
        itemWidth = document.querySelectorAll('.items img')[0].offsetWidth;
        items.style = 'transform: translateX(-' + itemWidth * index + 'px)';
    })

    function hmm() {
        index++;
        if (index > itemsImg.length - 1)
            index = 0;
        items.style = 'transform: translateX(-' + itemWidth * index + 'px)';
    }

    setInterval(hmm, 5000);
}