<?php

include 'conexion.php'; 

$Articulo_ID =$_POST['number'];
$ID_Borrar;


mysqli_query($conexion,'DELETE FROM producto WHERE Producto_ID = '.$Articulo_ID.';')
or die("Fallo");

mysqli_close ($conexion);
?>
