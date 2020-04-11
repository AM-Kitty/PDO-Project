<!DOCTYPE html>
<html>
<head>
<link href="index.css" type="text/css" rel="stylesheet" >
</head>
<body>
    <div id="header">
        <h1>Animal Information in SPCA</h1>
    </div>
<div id = "func1">
<table cellspacing = "10px" cellpadding = "20px" style = "border: 1px solid rgb(0, 0, 0);">
<tr>
  <th>Animal ID  </th><th>Species  </th><th>Current_Locate_SPCA  </th><th>date_arrive_SPCA  </th>
</tr>


<?php
#Functionality 1: Search Animal Information in a given SPCA Location
#get the user input 
$givenSPCA = $_POST["SPCA_branch"];
if(empty($givenSPCA)){
  echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>Empty location!!! Please enter valid SPCA Location.<br>";
}
else{
  try {
  	$dbh = new PDO('mysql:host=localhost;dbname=animaldb', "root", "");
    #user name and password for mysql when using XAMPP ios "root" and a blank password
  }
  catch(PDOException $e){
    echo "Error! Connected to Database unsucessfully!" . "<br/>";
  	die();
  }


  #SQL query
  $stmt = $dbh->prepare("select * from Animal where SPCA_branch_name = :givenSPCA");
  $stmt->bindParam(':givenSPCA', $givenSPCA);
  $stmt->execute();

  #check if there is no match for the given user input
  $count = $stmt->rowCount();
  if ($count < 1){
  	echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";
  }

  #print the result in a table
  foreach($stmt as $row) {
      echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td>
      <td>".$row[8]."</td></tr>";
  }
  $dbh = null;
}
?>
</table>
<a href="index.html">Back to Home Page</a><br>
</div>
</body>
</html>
