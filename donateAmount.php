<!DOCTYPE html>
<html>
<head>
<link href="index.css" type="text/css" rel="stylesheet" >
</head>
<body>

    <div id="header">
        <h1>Information of a total donated amount in 2018</h1>
    </div>
<div id = "func4">
<table cellspacing = "10px" cellpadding = "20px" style = "border: 1px solid rgb(0, 0, 0);">

<tr>
  <th>Organization Name  </th><th>Total donate amount in 2018</th>
</tr>


<?php
#Functionality 4: show the total amount donated for 2018 to a selected organization.
#get the user input 
$rescurer = $_POST["rescurer_name"];
$shelter =  $_POST["shelter_name"];
$SPCA =  $_POST["SPCA_name"];

try {
  $dbh = new PDO('mysql:host=localhost;dbname=animaldb', "root", "");
  #user name and password for mysql when using XAMPP ios "root" and a blank password
}
catch(PDOException $e){
  echo "Error! Connected to Database unsucessfully!" . "<br/>";
  die();
}


#check if the selected organization is SPCA
if(!empty($SPCA)){
  #SQL query
  $stmt1 = $dbh->prepare("select donate_place, sum(donate_amount) as total_amount from donor D  
  where D.donate_place = :SPCA and Year(D.donate_date) = 2018");
  $stmt1->bindParam(':SPCA', $SPCA);
  $stmt1->execute();
 
  #print the result in a table
  foreach($stmt1 as $row) {
    echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
    
    #check if there is no match for the given user input
    if(empty($row['donate_place'])){
      echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";
    }
    
  }
  
#check if the selected organization is rescurer organization
}else if(!empty($rescurer)){
  #SQL query
  $stmt1 = $dbh->prepare("select donate_place, sum(donate_amount) as total_amount from donor D  
  where D.donate_place = :rescurer and Year(D.donate_date) = 2018");
  $stmt1->bindParam(':rescurer', $rescurer);
  $stmt1->execute();
 
  #print the result in a table
  foreach($stmt1 as $row) {
    echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
    
    #check if there is no match for the given user input
    if(empty($row['donate_place'])){
      echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";
    }
    
  }

#check if the selected organization is shelter
}else{
  #SQL query
  $stmt1 = $dbh->prepare("select donate_place, sum(donate_amount) as total_amount from donor D
  where D.donate_place = :shelter and Year(D.donate_date) = 2018");
  $stmt1->bindParam(':shelter', $shelter);
  $stmt1->execute();

  #print the result in a table
  foreach($stmt1 as $row) {
    echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
  }
  
  #check if there is no match for the given user input
  if(empty($row['donate_place'])){
    echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";
  }
}

$dbh = null;

?>
</table>
<a href="index.html">Back to Home Page</a><br>
</div>
</body>
</html>



