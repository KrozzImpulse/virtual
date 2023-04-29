<?php

include 'conexion.php';

$nombre = $_POST["nombre"];
$descripcion = $_POST["descripcion"];
$modelo = $_POST["modelo"];
$cantidad = $_POST["cantidad"];
$precio = $_POST["precio"];
$marca = $_POST["marca"];
$articulo=$_POST["articulo"];
$linkImagen;
$valFK;
$articuloFK;

$valoresPermitidos="abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ";
$espacio=" ";
$validarEspacioN=substr($nombre,0,1);
  if($validarEspacioN===$espacio)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosEN.js"> </script>';
    return false;
  }
$validarEspacioD=substr($descripcion,0,1);
  if($validarEspacioD===$espacio)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosED.js"> </script>';
    return false;
  }
  $validarEspacioM=substr($modelo,0,1);
    if($validarEspacioM===$espacio)
    {
      echo '<script src = "'.$frontEndSketis.'Assets/js/datosEM.js"> </script>';
      return false;
    }
  if (strlen($nombre)<3)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosMN.js"> </script>';
    return false;
  }
  if (strlen($descripcion)<3)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosMD.js"> </script>';
    return false;
  }
  if (strlen($modelo)<3)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosMM.js"> </script>';
    return false;
  }
for ($i=0; $i<strlen($nombre); $i++)
{
  if(strpos($valoresPermitidos,substr($nombre,$i,1))===false)
  {
    echo '<script src = "'.$frontEndSketis.'Assets/js/datosIN.js"> </script>';
    return false;
  }
}

$target_path = $frontEndSketis+"Assets/bd/";
$target_path = $target_path . basename( $_FILES['imagenGuardada']['name']);

    if(move_uploaded_file($_FILES['imagenGuardada']['tmp_name'], $target_path)) {
        $linkImagen = basename( $_FILES['imagenGuardada']['name']);
    }
        else{
            echo "Ha ocurrido un error, trate de nuevo!";
        }

switch ($marca){
    case "Apex":
        $valFK = 1;
        break;
    case "Aniplex":
        $valFK = 2;
        break;
    case "Bandai/Tamashii Nations":
        $valFK = 3;
        break;
        case "Banpresto":
            $valFK = 4;
            break;
    case "Furyu":
        $valFK = 5;
        break;
    case "Good Smiles Company":
        $valFK = 6;
        break;
        case "Kotobukiya":
            $valFK = 7;
            break;
        case "Megahouse":
            $valFK = 8;
            break;
    case "Mighty Jaxx":
        $valFK = 9;
        break;
    case "PLUM":
        $valFK = 10;
        break;
    case "SEGA":
        $valFK = 11;
        break;
    case "Square Enix":
        $valFK = 12;
        break;
    case "RIBOSE":
        $valFK = 13;
        break;
    case "Taito":
        $valFK = 14;
        break;
}

switch ($articulo){
    case "Plushie":
        $articuloFK = 1;
        break;
    case "Gunpla":
        $articuloFK = 2;
        break;
    case "Figmas":
        $articuloFK = 3;
        break;
}

$consulta = mysqli_query($conexion, "insert into producto (Marca_FK, Articulo_FK, Cantidad, Nombre, Foto, Modelo, Descripcion, Precio)
values ('$valFK', '$articuloFK', '$cantidad', '$nombre', '$linkImagen', '$modelo', '$descripcion', '$precio')")
or die ("Error en consulta");


    mysqli_close($conexion);
?>
