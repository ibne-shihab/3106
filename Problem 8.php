<?php
$connect=mysqli_connect("localhost","root","","student");

if(isset($_POST["insert"])){
	$id =$_POST["id"];
	$name=$_POST["name"];
	$sess=$_POST["session"];
	$phone=$_POST["ph_number"];
	$city=$_POST["city"];
	;
	$insert="insert into Semester_Reg(ID,Name,Session,Phone_No,City)
	 values('$id','$name','$sess', '$phone', '$city')";
	$result=mysqli_query($connect,$insert);
	if($result==1){
		echo"Successfully insert a record!";
	}else{
		echo"Unsucess";}
}if(isset($_POST["delete"])){
	$id =$_POST["id"];
	$name=$_POST["name"];
	$sess=$_POST["session"];
	$delete="delete from `semester_reg` where ID='$id'
    and Name='$name' and Session='$sess'";
	$result=mysqli_query($connect,$delete);
	if($result==1){
		echo"Successfully delete your record!";
	}else{
		echo"Unsucess";}
} if(isset($_POST["update"])){
	$id =$_POST["id"];
	$name=$_POST["name"];
	$sess=$_POST["session"];
	$phone=$_POST["ph_number"];
	$city=$_POST["city"];
	$insert="update semester_reg  set Name='$name',Session='$sess',Phone_No='$phone',
	 City='$city' where ID='$id'";
	$result=mysqli_query($connect,$insert);
	if($result==1){
		echo"Successfully updated your record!";
	}else{
		echo"Unsucess";}
}if(isset($_POST["select"])){
	$query="SELECT * FROM semester_reg";
	$result=mysqli_query($connect,$query);
	if($result==true){
		echo "All  Registered Students List <br>";
	echo "<table cellpadding=10 border='1'>
	<tr>
		<th>ID</th> 
		<th>Name</th>
		<th>Session</th>
		<th>Phone Number</th>
		<th>City</th>
		
	</tr>";
	if(mysqli_num_rows($result) > 0){
		while($row = mysqli_fetch_array($result)){	
			echo "<tr>";
			echo "<td style='color:black'>" . $row['ID'] ."</td>";
			echo "<td style='color:black'>" . $row['Name'] . "</td>";
			echo "<td style='color:black'>" . $row['Session'] . "</td>";
			echo "<td style='color:black'>" . $row['Phone_No'] . "</td>";
			echo "<td style='color:black'>" . $row['City'] . "</td>";
			echo "</tr>";
		}echo "</table>";
	}
	} else{
		echo "No record found!";
	}
}
//end of show data

?>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration Form</title>
    <style type="text/css">
        body {
            text-align: center;
            font-family: Cambria, Cochin, Georgia, Times, 
            'Times New Roman', serif, sans-serif;
            background-color: antiquewhite;
            padding: 10px;
        }h2 {
            font-size: 30px;
            margin-top: 20px;
            background-color:aquamarine;
            text-align: center;
        }table {
            margin: auto;
            font-size: 20px;
            border-collapse: collapse;
            background-color: blanchedalmond;
        }th, td {
            padding: 10px;
        }th {
            text-align: center;
            vertical-align: middle;   
             }input[type="text"] {
            font-size: 20px;
            width: 100%;
            padding: 5px;
        }input[type="radio"] {
            margin-right: 15px;
        }label {
            color: crimson;
        }
    </style>
</head>
<body>
    <h2>Student's Registration Form</h2>
    <form method="post" action="">
        <table border="1">
            <tr>
                <th>ID</th>
                <td><input type="text" name="id" required></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <th>Session</th>
                <td><input type="text" name="session" required></td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td><input type="text" name="ph_number"></td>
            </tr>
            <tr>
                <th>City</th>
                <td><input type="text" name="city" value=""></td>
            </tr>
            
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" name="insert" value="Insert">
                    <input type="submit" name="select" value="Show">
                    <input type="submit" name="delete" value="Delete">
                    <input type="submit" name="update" value="Update">
                </td>
            </tr>
        </table>
        <br>
        <label style="color: red">N.B.</label> 
        1. To delete a record, please enter your ID, Name, and Session.<br>
        2. You can update all information except the ID Number.<br>
        3. To show all records, enter your ID, Name, and Session.
    </form>
</body>
</html>