<?php

	$user = "root";
	$password = "";
	$server = "localhost";
	$database = "bank";

	$conexion = mysqli_connect($server, $user, $password, $database) or die ("Unable to connect database server");

?>