
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/main.css">

     
     <!-- TASKS --><!-- TASKS --><!-- TASKS --><!-- TASKS --><!-- TASKS    
    
        - make the markers disapear when the toggle goes back
        - makes it zooom to the station when clicked!!      
     
      TASKS --><!-- TASKS --><!-- TASKS --><!-- TASKS --><!-- TASKS -->


    </head>
    <body>    
        <div id="container">
            <div id="wrapper">
                <div id="logo"><h1>CitiBikes</h1></div>
                <ul>
                    <?php 

                        $json = file_get_contents("http://appservices.citibikenyc.com/data2/stations.php", true);
                        $decode = json_decode($json, true);
                        $stations = $decode[results];
                    ?>

                    <?php    foreach ($stations as  $station): ?>
                        <li class="each_station">
                            <div class = "stationname"> <img src="img/littlebike.png"> <h2>  <?php echo $station[label]; ?> </h2> </div>
                            <div class = "stationinfo">
                                <div class = "bikes"> <p> Available Bikes <strong><?php echo $station[availableBikes]; ?></strong> </p> </div>
                                <div class = "docks"> <p> Available Docks <strong> <?php echo $station[availableDocks]; ?> </strong> </p> </div>
                                <div class = "longitude hidden"> <p> <strong> <?php echo $station[longitude]; ?> </strong> </p> </div>
                                <div class = "latitude hidden"> <p> <strong> <?php echo $station[latitude]; ?> </strong> </p> </div>
                            </div>
                        </li>
                    <?php endforeach; ?> 


                </ul>
            </div>
            <div id="map-canvas"/>
        </div> 


        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCk2Uli23Ith6cpvminqwvCc3DH6tjIg7c&sensor=true"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

        <script src="js/main.js"></script>
    
    </body>
</html>

