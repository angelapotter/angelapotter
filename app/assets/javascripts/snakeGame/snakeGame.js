$(document).ready(function() {
  'use strict';
  // VARIABLES
  // canvas context
  var c = $('#snake__game-canvas')[0].getContext('2d');
  var squareSize = 10;
  // canvas size
  var cSize = (squareSize + 1) * 40 + 1;
  var padding = 1;
  // far edges
  var end = cSize - squareSize - padding;
  // starting position
  var x = padding; var y = padding;
  // movement increment
  var moveBy = squareSize + padding;
  // frames per second
  var FPS = 18;
  // setInterval function
  var intMove = '';
  var oldSquare = [];
  oldSquare[0] = [x, y];
  // var z = 0;
  var times = 1;
  var presses = 1;
  var snakeLength = 1;
  var score = 0;
  var changeInX = 0;
  var changeInY = 0;
  var foodX = 0;
  var foodY = 0;
  var currentLoc = [];
  // var dirLog = [];
  presses = 1;
  // number of movements in the current direction
  var timesThisDir = 0;
  // set canvas size and starting coords
  $('#snake__game-canvas')[0].width = cSize;
  $('#snake__game-canvas')[0].height = cSize;
  c.fillStyle = '#4E5A65';
  c.fillRect(x, y, squareSize, squareSize);
  // function library
  function newSquare(a, b) {
    c.fillStyle = '#4E5A65';
    c.fillRect(a, b, squareSize, squareSize);
  }
  function newFood(f, g) {
    c.fillStyle = 'SpringGreen';
    c.fillRect(f, g, squareSize, squareSize);
  }
  function clearSquare(a, b) {
    c.clearRect(a, b, squareSize, squareSize);
  }
  function resetGame() {
    clearInterval(intMove);
    c.clearRect(0, 0, cSize, cSize);
    x = padding;
    y = padding;
    newSquare(x, y);
    times = 1;
    snakeLength = 1;
    score = 0;
    FPS = 18;
    changeInX = 0;
    changeInY = 0;
    $('#score').html('');
    // for (z in oldSquare) {
      // clearSquare(z[0], z[1]);
      // clearSquare(oldSquare[z][0], oldSquare[z][1]);
    // }
  }
  function gameOver() {
    clearInterval(intMove);
    c.fillStyle = 'black';
    c.font = 'bold 40px sans-serif';
    c.fillText('You died. Score: ' + score, 42, 210);
  }
  function createFood() {
    foodX = (Math.round(Math.random() * (end/moveBy))) * moveBy + padding;
    foodY = (Math.round(Math.random() * (end/moveBy))) * moveBy + padding;
    newFood(foodX,foodY);
  }
  function youAte() {
    if (currentLoc[0] === foodX && currentLoc[1] === foodY) {
      return true;
    }
  }
  function afterEating() {
    createFood();
    snakeLength++;
    FPS = FPS + 0.2;
    score++;
    $('#score').html('score: '+score);
  }
  function youAreInPlayArea() {
    if (x <= end && x >= padding && y >= padding && y <= end) {
      return true;
    }
  }
  function youHitYourTail() {
    for (var i = 0; i < oldSquare.length; i++) {
      if (i < times - 1 && i >= times - snakeLength - 1 && oldSquare[i][0] === currentLoc[0] && oldSquare[i][1] === currentLoc[1]) {
        return true;
      }
    }
  }
  function theresFoodInYourTail() {
    if (oldSquare[times - snakeLength][0] === foodX && oldSquare[times - snakeLength][1] === foodY) {
      return true;
    }
  }
  function youAreGoingBackward(key) {
    if ((changeInX === moveBy && key === 37) || (changeInX === -moveBy && key === 39) || (changeInY === moveBy && key === 38) || (changeInY === -moveBy && key === 40)) {
      return true;
    }
  }
  $(document).keydown(function(e) {
    // movement in any direction
    function mainMove(key, a, b) {
      if (e.keyCode === key) {
        timesThisDir = 0;
        // keep arrows from scrolling
        e.preventDefault();
        // snake is allowed to go backward only if its length is 1
        if (!youAreGoingBackward(key) || snakeLength === 1) {
          clearInterval(intMove);
          intMove = setInterval(function() {
            // set loc of next square
            x = x + a; y = y + b;
            currentLoc = [x, y];
            // store next loc in array
            oldSquare[times] = currentLoc;
            // store movement in array
            changeInX = currentLoc[0] - oldSquare[times - 1][0];
            changeInY = currentLoc[1] - oldSquare[times - 1][1];
            if (youAreInPlayArea()) {
              // create new square
              newSquare(x,y);
              if (times === 1) {
                createFood();
              }
              if (youAte()) {
                afterEating();
              }
              // if food has appeared in the snake's tail, don't clear that square
              if (times >= snakeLength) {
                if (!(theresFoodInYourTail())) {
                  clearSquare(oldSquare[times - snakeLength][0],oldSquare[times - snakeLength][1]); // clear squares past snake length
                }
              }
              times++;
              timesThisDir++;
            }
            // can't hit walls
            else {
              gameOver();
            }
            if (youHitYourTail()) {
              gameOver();
            }
          }, 1000/FPS);
        }
      }
    }
    // space bar pauses
    if (e.keyCode === 32) {
      e.preventDefault();
      clearInterval(intMove);
    }
    // enter restarts
    if (e.keyCode === 13) {
      resetGame();
    }
    // move right on arrow key
    mainMove(39, moveBy, 0);
    // move left on arrow key
    mainMove(37, -moveBy,0);
    // move up on arrow key
    mainMove(38, 0, -moveBy);
    // move down on arrow key
    mainMove(40, 0, moveBy);
  });
});
