<!DOCTYPE html>

<html>
<head>
<link href="index.css" type="text/css" rel="stylesheet" >
<title>Donator-Info</title>
</head>
<body>
    <div id="header">
        <h1>Donator Information</h1>
    </div>

<div id = "func3">
<table cellspacing = "8px" cellpadding = "14px" style = "border: 1px solid rgb(0, 0, 0);">
<tr><th >donator_fname </th><th> donator_lame </th><th> donate_place </th>
	<th> total_donate_amount </th>
</tr>


<?php
#Functionality 3: For a particular donor, show which organizations they donated to and the total amount donated
#get the user input 
$givenName = $_POST["donator_fname"];
$surname = $_POST["donator_lname"];
try {
    $dbh = new PDO('mysql:host=localhost;dbname=animaldb', "root", "");
    #user name and password for mysql when using XAMPP ios "root" and a blank password
}
catch(PDOException $e){
    echo "Error! Connected to Database unsucessfully!" . "<br/>";
    die();
}


#SQL query
$stmt = $dbh->prepare("SELECT donator_fname, donator_lname, donate_place, SUM(donate_amount) as total_donate_amount
FROM donor
WHERE donator_fname = :givenName and donator_lname = :surname
GROUP BY donator_fname, donator_lname, donate_place
");
$stmt->bindParam(':givenName', $givenName);
$stmt->bindParam(':surname', $surname);
$stmt->execute();

#check if there is no match for the given user input
$count = $stmt->rowCount();
if ($count < 1){
	echo "<div style ='font:25px Gill Sans MT;color:#0000ff'>No Matches in your searching...</div>";
}

#print the result in a table
foreach($stmt as $row) {
    echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td></tr>";
    }
$dbh = null;

?>
</table>
<a href="index.html">Back to Home Page</a><br>
</div>
</body>
</html>
