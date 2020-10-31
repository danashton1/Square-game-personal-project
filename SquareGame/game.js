function Startpositionplayer(obj) {
    obj.style.top = 0 + "px";
    obj.style.left = 0 + "px";
}

function Startpositionball(obj) {
    obj.style.top = 100 + "px";
    obj.style.left = 100 + "px";
}

function Startpositionfood(obj) {
    obj.style.top = Math.random() * gamespace.clientHeight + "px";
    obj.style.left = Math.random() * gamespace.clientWidth + "px";
}

function Moveplayer() {
    var gamesound = document.getElementById("gamesound");
    gamesound.play();
    var gameover = document.getElementById("eataudio");
    var mx;
    mx = parseInt(player1.style.left) + xInc;
    if (mx < 0 || mx > gamespace.clientWidth - player.clientWidth) {

        window.clearInterval(interval);
        gamesound.pause();
        gameover.play();
        Highscore()
    } else {
        player1.style.left = mx + "px";
    }
    var my;
    my = parseInt(player1.style.top) + yInc;
    if (my < 0 || my > gamespace.clientHeight - player.clientHeight) {

        window.clearInterval(interval);
        gamesound.pause();
        gameover.play();
        Highscore()
    } else {
        player1.style.top = my + "px";
    }
}

function MoveBall() {
    xx = xx + xxInc;
    if (xx <= 0 || xx >= gamespace.clientWidth - imgSquare.width) {
        xxInc = -xxInc;
    } else {
        imgSquare.style.left = xx + "px";
    }
    yy = yy + yyInc;
    if (yy <= 0 || yy >= gamespace.clientHeight - imgSquare.height) {
        yyInc = -yyInc;
    } else {
        imgSquare.style.top = yy + "px";
    }
}


function CollisionFood(obj1, obj2) {
    var player0 = obj1.getBoundingClientRect();
    var food0 = obj2.getBoundingClientRect();
    var eat = document.getElementById("eataudio");
    if (player0.left < food0.left + food0.width && player0.left + player0.width > food0.left &&
        player0.top < food0.top + food0.height && player0.top + player0.height > food0.top) {

        food1.style.top = Math.random() * gamespace.clientHeight + "px";
        food1.style.left = Math.random() * gamespace.clientWidth + "px";

        score = score + 1;
        parScore.innerText = "Score: " + score;
        eat.play();
    }
}

function CollisionSquare(obj1, obj2) {
    var gamesound = document.getElementById("gamesound");
    var gameover = document.getElementById("eataudio");
    var player0 = obj1.getBoundingClientRect();
    var square0 = obj2.getBoundingClientRect();
    if (player0.left < square0.left + square0.width && player0.left + player0.width > square0.left &&
        player0.top < square0.top + square0.height && player0.top + player0.height > square0.top) {

        window.clearInterval(interval);
        gamesound.pause();
        gameover.play();
        Highscore();
    }
}

function Highscore() {

    window.location.href = "Scoreboard.aspx?currentscore=" + score;
}