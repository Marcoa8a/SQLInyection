<?php
    session_start();

    $connection = new PDO('mysql:host=localhost;dbname=bank', 'root', '');
    
    // Verificar la conexión
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }

    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "SELECT * FROM user WHERE email=:email AND password=:password";
    $stmt = $connection->prepare($query);
    $stmt->bindParam(":email", $email, PDO::PARAM_STR);
    $stmt->bindParam(":password", $password, PDO::PARAM_STR);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $rol = $row['rol']; // Cambiado de $rows a $row
        $userId = $row['userId'];
        
        if ($rol == '1') {
            $_SESSION['userId'] = $userId;
            header("Location: viewAdmin.php");
            exit();
        } elseif ($rol == '2') {
            $_SESSION['userId'] = $userId;
            header("Location: viewClient.html");
            exit();
        }
    } else {
        header("Location: index.html?error=1");
        exit();
    }

    $stmt->close();
    $connection->close();
?>

