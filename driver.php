<!DOCTYPE html>
<html>
<head>
<link href="index.css" type="text/css" rel="stylesheet" >
</head>
<body>
    <div id="header">
        <h1>Driver Information in a Rescue Organization</h1>
    </div>

<div id = "func2">
<table cellspacing = "12px" cellpadding = "8px" style = "border: 1px solid rgb(0, 0, 0);">
<tr>
  <th>Driver fname  </th><th>Driver lname   </th><th>Driver_emergency phone  </th><th>License_plate  </th>
  <th>License_num  </th><th>Work_Rescue_Organization  </th><th>Transport_Animal  </th><th>Transport_from  </th>
</tr>


<?php
#Functionality 2: show all the information for all drivers associated with a particular rescue organization.
#get the user input 
$givenRescue = $_POST["rescurer_name"];

try {
	$dbh = new PDO('mysql:host=localhost;dbname=animaldb', "root", "");
  #user name and password for mysql when using XAMPP ios "root" and a blank password
}
catch(PDOException $e){
  echo "Error! Connected to Database unsucessfully!" . "<br/>";
	die();
}

#SQL query
$stmt = $dbh->prepare("select * from driver where Work_Place = :givenRescue");
$stmt->bindParam(':givenRescue', $givenRescue);
$stmt->execute();

#check if there is no match for the given user input
$count = $stmt->rowCount();
if ($count < 1){
	echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";;
}

#print the result in a table
foreach($stmt as $row) {
    echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td><td>".$row[4]."</td>
    <td>".$row[5]."</td><td>".$row[6]."</td><td>".$row[7]."</td></tr>";
}
$dbh = null;

?>
</table>
<a href="index.html">Back to Home Page</a><br>
</div>
</body>
</html>
