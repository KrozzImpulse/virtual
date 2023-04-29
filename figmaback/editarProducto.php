<?php
//Agregar el alter table para modificar el producto

include 'conexion.php';

$ID=$_POST['id'];
$Nombre=$_POST['nombre'];
$Descripcion=$_POST['descripcion'];
$Cantidad=$_POST['cantidad'];
$Precio=$_POST['precio'];
$Modelo=$_POST['modelo'];
$linkimagen=$_POST['foto'];


$consulta= mysqli_query($conexion, 'UPDATE producto SET Cantidad = "'.$Cantidad.'" , Precio = "'.$Precio.'" , Nombre= "'.$Nombre.'" , Modelo = "'.$Modelo.'" , Foto = "'.$linkimagen.'" , Descripcion = "'.$Descripcion.'" WHERE Producto_ID = "'.$ID.'"')
or die("Fallo");

 header('Location: '.$frontEndSketis.'articulos.html');

?>
