<?php
    include ("conexion.php");

    $email = $_POST['email'];
    $password = $_POST['password'];
    session_start();

    $query = "SELECT * FROM user WHERE email='$email' AND password='$password'";
    $result = $conexion->query($query);
    $rows = mysqli_fetch_array($result);

    if ($rows) {
        $rol = $rows['rol'];
        $userId = $rows['userId'];
        
        if ($rol == '1') {
            $_SESSION['userId'] = $userId;
            header("Location: viewAdmin.php");
            exit();
        } elseif ($rol == '2') {
            $_SESSION['userId'] = $userId;
            header("Location: viewClient.html");
            exit();
        }
    }

    echo "<script> alert('Error... Data don't match :('); window.location = 'index.html' </script>";
    mysqli_free_result($result);
    mysqli_close($conexion);
?>