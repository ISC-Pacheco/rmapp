<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "prueba_tec";
    $table_users="rm_usuarios";
    $table = "rm_bienes";


    //si obtenemos una accion esta hace la operacion en base de datos
    $action = $_POST["action"];

    $conn = new mysqli($servername,$username,$password,$dbname);
    //verifica la conexion
    if($conn->connect_error){
        die("Error de coexion:".$conn->connect_error);
        return;
    }
    //si la coneccion funciona usaremos las tablas de la bd
    if ("VALIDATION"==$action){
        //$user_id=$_POST['$user_id'];
        $rm_username=$_POST['$rm_username'];
        $rm_password=$_POST['$rm_password'];
        $sql = "SELECT * FROM $table_users 
         WHERE rm_username='$rm_username' 
           AND rm_password='$rm_password' 
           LIMIT 1";
        $result = $conn->query($sql);
        if ($rm_username && $rm_password == $result){
            echo "ok";
            if ($result->num_rows==1){
                while ($row=$result){
                    $db_data[] = $row;
                }
                echo json_decode($db_data);
            }
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
    // Esta accion debuelve todos los bienes materiales existentes en la bd
    if ("GET_ALL"== $action){
        $db_data = array();
        $sql = "SELECT id,nombre,caracteristicas,num_inventario,nick,serie,costo,stock,id_color,id_tipob,id_tipoadqui,fechadqui,condicion,id_categoria,id_proveedor,id_modelo,id_estado,id_marca,created_at,updated_at,factura 
        from $table 
        ORDER BY id DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while ($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            //envia los datos guardados en un json
            echo json_decode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
    //Añade un nuevo Bien Material
    if ("ADD_BIEN"==$action){
        $nombre = $_POST["nombre"];
        $caracteristicas = $_POST["caracteristicas"];
        $num_inventario = $_POST["num_inventario"];
        $nick= $_POST["nick"];
        $serie=$_POST["serie"];
        $costo = $_POST["costo"];
        $stock = $_POST["stock"];
        $id_color = $_POST["id_color"];
        $id_tipob = $_POST["id_tipob"];
        $id_tipoadqui = $_POST["id_tipoadqui"];
        $fechadqui = $_POST["fechadqui"];
        $condicion = $_POST["condicion"];
        $id_categoria = $_POST["idcategoria"];
        $id_proveedor = $_POST["id_proveedor"];
        $id_modelo = $_POST["id_modelo"];
        $id_estado = $_POST["id_estado"];
        $id_marca = $_POST["id_marca"];
        $created_at = $_POST["created_at"];
        $updated_at = $_POST["updated_at"];
        $factura = $_POST["factura"];
        $sql = "INSERT INTO $table (id,nombre,caracteristicas,num_inventario,nick,serie,costo,stock,id_color,id_tipob,id_tipoadqui,fechadqui,condicion,id_categoria,id_proveedor,id_modelo,id_estado,id_marca,created_at,updated_at,factura)  
        VALUES ('$nombre','$caracteristicas','$num_inventario','$nick','$serie','$costo','$stock','$id_color','$id_tipob','$id_tipoadqui','$fechadqui','$condicion','$id_categoria','$id_proveedor','$id_modelo','$id_estado','$id_marca','$created_at','$updated_at','$factura')";
        $result = $conn->query($sql);
        echo "agregado";
        $conn->close();
        return;
    }
    //Actualiza un Bien Material
    if ("UPDATE_BIEN"== $action){

        $id_bien = $_POST['$id'];
        $nombre = $_POST["nombre"];
        $caracteristicas = $_POST["caracteristicas"];
        $num_inventario = $_POST["num_inventario"];
        $nick= $_POST["nick"];
        $serie=$_POST["serie"];
        $costo = $_POST["costo"];
        $stock = $_POST["stock"];
        $id_color = $_POST["id_color"];
        $id_tipob = $_POST["id_tipob"];
        $id_tipoadqui = $_POST["id_tipoadqui"];
        $fechadqui = $_POST["fechadqui"];
        $condicion = $_POST["condicion"];
        $id_categoria = $_POST["idcategoria"];
        $id_proveedor = $_POST["id_proveedor"];
        $id_modelo = $_POST["id_modelo"];
        $id_estado = $_POST["id_estado"];
        $id_marca = $_POST["id_marca"];
        $created_at = $_POST["created_at"];
        $updated_at = $_POST["updated_at"];
        $factura = $_POST["factura"];
        $sql="
        UPDATE $table 
        SET nombre='$nombre',caracteristicas='$caracteristicas',num_inventario='$num_inventario',
            nick='$nick',serie='$serie',costo='$costo',stock='$stock',id_color='$id_color',
            id_tipob='$id_tipob', id_tipoadqui='$id_tipoadqui',fechadqui='$fechadqui',condicion='$condicion',idcategoria='$id_categoria',id_proveedor='$id_proveedor',
            id_modelo='$id_modelo',id_estado='$id_estado',id_marca='$id_marca',created_at='$created_at',updated_at='$updated_at',factura='$factura' 
        WHERE id='$id_bien'";
        if ($conn->query($sql)===TRUE){
            echo "Datos actualizados";
        }else{
            echo "error";
        }
        $conn->close();
    }
    //Borra un bien material
    if ('DELETE_BIEN'== $action){
        $id_bien=$_POST['$id_bien'];
        $sql="DELETE FROM $table WHERE id=$id_bien";
        if ($conn->query($sql)===TRUE){
            echo "Datos borrados";
        }else{
            echo "error";
        }
        $conn->close();
    }

?>