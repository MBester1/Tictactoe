<?php   
session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="tictac.css">

    <title>Tic-Tac-Toe!!</title>
</head>

<body>
    
    <h1>Welcome to tic-tac-toe!!</h1>
    <p>Please click on a block to select it...</p>
    <table>
        <thead>
            <tr>
                <th>
                    <div class="cols">
                    </div>
                </th>
                <th>
                    <div id="col1" class="cols">
                        - 1 -
                    </div>
                </th>
                <th>
                    <div id="col2" class="cols">
                        - 2 -
                    </div>
                </th>
                <th>
                    <div id="col3" class="cols">
                        - 3 -
                    </div>
                </th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td>
                    <div id="rowA" class="rows">
                        - a -
                    </div>
                </td>
                <td>
                <form action="tictactoe.php" method="get">
                <!-- <button type="submit" name="selected" class="grid" value="a1"></button> -->
                <input type="submit" name="selected" class="grid" value="a1">
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="a2">X</button>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="a3"></button>
                </td>
            </tr>

            <tr>
                <td>
                    <div id="rowB" class="rows">
                        - b -
                    </div>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="b1"></button>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="b2"></button>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="b3"></button>
                </td>
            </tr>

            <tr>
                <td>
                    <div id="rowC" class="rows">
                        - c -
                    </div>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="c1"></button>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="c2"></button>
                </td>
                <td>
                <button type="submit" name="selected" class="grid" value="c3"></button>
                </td>
            </tr>
        </tbody>
    </table>
    <p id="ghost" class="whileGame"></p>
    <button id="ghostButton" class="whileGame"> Click me ...</button>

    </form>

    <?php

//     $grid = array(
//       "a1"=> null, "a2"=> null, "a3"=> null,
//       "b1"=> null, "b2"=> null, "b3"=> null,
//       "c1"=> null, "c2"=> null, "c3"=> null,
//     );

// if ($grid[$_GET["selected"]]!=null){
// echo $grid[$_GET["selected"]];
// } else {
//     $grid[$_GET["selected"]] = $grid[$_GET["value"]];
//     echo $grid[$_GET["selected"]];
// }
?>
<h1>
    <?php 
echo $_GET['selected'];
?>
</h1>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
    <script src="app.js"></script> -->
</body>

</html>