<?php
    $host = 'localhost' ;
    $dbname = 'Enterprise_db' ; 
    $username = 'postgres' ; 
    $password = 'XENON' ; 

    $dsn = "pgsql : host = $host ; port = 5432 , dbname = $dbname ; user = $username ; password = $password" ; 

    try {
        $conn = new PDO($dsn) ; 
        if($conn)
        {
            echo " Connexion à la base de données $dbname réussie avec succès ! " ; 
        }
    } 
    catch (PDOException $e) {
        echo $e->getMessage() ; 
        
    }
?> 