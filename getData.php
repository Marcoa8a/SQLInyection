<?php
    include 'conexion.php';

    if (isset($_GET['option'])) {
        $option = $_GET['option'];

        $query = "";
        if ($option === 'Account') {
            $query = "SELECT * FROM account";
        } elseif ($option === 'Branch') {
            $query = "SELECT * FROM branch";
        } elseif ($option === 'Client') {
            $query = "SELECT * FROM client";
        } elseif ($option === 'User') {
            $query = "SELECT * FROM user";
        }

        $result = $conexion->query($query);

        if ($result->num_rows > 0) {
            echo "<table border='1'>";
            
            $row = $result->fetch_assoc();
            echo "<tr>";
            foreach ($row as $key => $value) {
                echo "<th>$key</th>";
            }
            echo "</tr>";

            do {
                echo "<tr>";
                foreach ($row as $value) {
                    echo "<td>$value</td>";
                }
                echo "</tr>";
            } while ($row = $result->fetch_assoc());

            echo "</table>";
        } else {
            echo "No se encontraron datos.";
        }
    } else {
        echo "Opción no especificada.";
    }

    $conexion->close();
?>
