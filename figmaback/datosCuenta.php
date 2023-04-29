<?php
include 'conexion.php';

if(isset($_POST['tipo']))
$tipo=$_POST['tipo'];
$consulta = mysqli_query($conexion,'SELECT
                                    usuario.Nombre,
                                    usuario.Apellido,
                                    usuaro.Correo
                                    FROM
                                    usuario
                                   ')
or die("Fallo la consulta");

$nfilas=mysqli_num_rows($consulta);
$Fila=mysqli_fetch_array($consulta);
    if($nfilas > 0){
    print '[';
    for ($i=0;$i<$nfilas;$i++){
        print '{';
        print '"Nombre":"'.$Fila["Nombre"].'",';
        print '"Apellido":"'.$Fila["Apellido"].'",';
        print '"Correo":"'.$Fila["Correo"].'",';
        if($i==$nfilas-1){
        print "}";
        }else{
        print "},";
        }
        $Fila=mysqli_fetch_array($consulta);
}
print "]";
}
mysqli_close($conexion);

?>