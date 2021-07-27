let turnCounter = 1
const grid = {
  "a1": null, "a2": null, "a3": null,
  "b1": null, "b2": null, "b3": null,
  "c1": null, "c2": null, "c3": null,
};

$(document).ready(function () {
  $(".grid").click(clickHandler);
  $("#ghostButton").click(newGame);
});

let clickCount = 1;

function newGame() {
  location.reload();
  return false;
}

function clickHandler(event) {
  let clickedBlock = event.currentTarget.id;
  // console.log(`Click no. ${clickCount}. You clicked ${clickedBlock}`);
  if (clickCount % 2 === 0) {
    grid[clickedBlock] = "O";
  } else {
    grid[clickedBlock] = "X";
  }
  updateDisplay(grid);
  checkWinner(grid);

  if (checkWinner(grid) != true) {
    noWinner(grid);
  }

  clickCount++;

  // let isEmpty = true;
  // First attempt at creating game over mechanism always returned Game Over when C3 clicked!
  // for (const [key, value] of Object.entries(grid)) {
  //   if (value == null) {
  //     isEmpty = true;
  //   } else {
  //     isEmpty = false;
  //   }
  // }
  // if (!isEmpty) {
  //   console.log("GAME OVER...!");
  // }
}

function checkWinner(grid) {

  let winner = false;
  let winnerxo;
  let whowon;
  //COLUMNS:
  if (grid["a1"] != null && grid["a1"] == grid["b1"] && grid["a1"] == grid["c1"]) {
    winner = true;
    winnerxo = grid["a1"];
  } else if (grid["a2"] != null && grid["a2"] == grid["b2"] && grid["a2"] == grid["c2"]) {
    winner = true;
    winnerxo = grid["a2"];
  } else if (grid["a3"] != null && grid["a3"] == grid["b3"] && grid["a3"] == grid["c3"]) {
    winner = true;
    winnerxo = grid["a3"];
  }
  //ROWS:
  else if (grid["a1"] != null && grid["a1"] == grid["a2"] && grid["a1"] == grid["a3"]) {
    winner = true;
    winnerxo = grid["a1"];
  } else if (grid["b1"] != null && grid["b1"] == grid["b2"] && grid["b1"] == grid["b3"]) {
    winner = true;
    winnerxo = grid["b1"];
  } else if (grid["c1"] != null && grid["c1"] == grid["c2"] && grid["c1"] == grid["c3"]) {
    winner = true;
    winnerxo = grid["c1"];
  }
  //DIAGONALS:
  else if (grid["a1"] != null && grid["a1"] == grid["b2"] && grid["a1"] == grid["c3"]) {
    winner = true;
    winnerxo = grid["a1"];
  } else if (grid["a3"] != null && grid["a3"] == grid["b2"] && grid["a3"] == grid["c1"]) {
    winner = true;
    winnerxo = grid["a3"];
  };

  if (winner === true) {
    // if (winnerxo = "X") {
    //   console.log("Player 1 wins!");
    // } else if (winnerxo = "O") {
    //   console.log("Player 2 wins!");
    console.log(`Game over - ${winnerxo} wins the game!`);
    $("#ghost").addClass("afterWin").removeClass("whileGame").text(`${winnerxo} wins! Click the button to play again`);
    $("#ghostButton").addClass("showButton").removeClass("whileGame");




    for (const [key, value] of Object.entries(grid)) {
      if (value === winnerxo) {
        $(`#${key}`).addClass("winner").removeClass("grid").off("click");
      } else if (value != winnerxo && value != null) {
        $(`#${key}`).addClass("loser").removeClass("grid").off("click");
      }
      else {
        $(`#${key}`).addClass("blank").removeClass("grid").off("click");
      }
    }
    return true;
  }
}

function updateDisplay(grid) {
  for (const [key, value] of Object.entries(grid)) {
    if (value !== null) {
      $(`#${key}`).addClass("selected").removeClass("grid").text(value).off("click");
    }
  }
};

function noWinner(grid) {
  if (Object.values(grid).every(block => block != null)) {
    console.log("No winner - Game over :(");
    for (const [key, value] of Object.entries(grid)) {
      // $(`#${key}`).addClass("blank").removeClass("grid");
      $("#ghost").addClass("afterWin").removeClass("whileGame").text("Draw - no winner! Click the button to play again");
      $("#ghostButton").addClass("showButton").removeClass("whileGame");
    }
  }
}
