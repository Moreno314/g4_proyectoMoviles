<?php
header("Access-Control-Allow-Origin: *");
$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");

if (!$db) {
    echo "Database connect error: " . mysqli_error($db);
}

$comment = $_POST['comment'] ?? '';
$user_email = $_POST['user_email'] ?? '';
$post_id = $_POST['post_id'] ?? '';
$curDate=date('d/m/Y') ?? '';


$query = "INSERT INTO comments(comment,user_email,post_title,comments_date) VALUES ('" . $comment . "','" . $user_email . "','" . $post_id . "','" . $curDate . "')";
$result = $db->query($query);

if ($result) {
    echo "Data inserted successfully";
} else {
    echo "Error inserting data: " . mysqli_error($db);
}
?>


