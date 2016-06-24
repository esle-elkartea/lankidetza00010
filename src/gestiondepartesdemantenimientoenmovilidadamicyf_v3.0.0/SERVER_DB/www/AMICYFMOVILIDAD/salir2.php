<?php
session_start();
unset($_SESSION['idTecnico']);
session_destroy();
header("Location: index.php");
?>