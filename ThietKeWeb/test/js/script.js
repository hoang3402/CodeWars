//script bài làm

window.onload = () => {
    document.getElementById("1").addEventListener("mouseover", () => {
        document.querySelector('.sub_menu').classList.add("show");
    })
    document.getElementById("1").addEventListener("mouseout", () => {
        document.querySelector('.sub_menu').classList.remove("show");
    })
}

function Click(className) {
    document.querySelector("#warp > nav > .active").classList.remove('active');
    const button = document.querySelector("#warp > nav > button." + className);
    button.classList.add('active');
}