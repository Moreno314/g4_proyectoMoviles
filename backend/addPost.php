<?php
header("Access-Control-Allow-Origin: *");
$db = mysqli_connect("localhost", "root", "", "flutter_grupo4");

if (!$db) {
    echo "Database connect error: " . mysqli_error($db);
}

$title = $_POST['title'] ?? '';
$body = $_POST['body'] ?? '';
$category_name = $_POST['category_name'] ?? '';

echo "Title: " . $title . "\n";
echo "Body: " . $body . "\n";
echo "Category Name: " . $category_name . "\n";

$query = "INSERT INTO post_table(titulo, cuerpo, nombre_curso) VALUES ('" . $title . "','" . $body . "','" . $category_name . "')";
$result = $db->query($query);

if ($result) {
    echo "Data inserted successfully";
} else {
    echo "Error inserting data: " . mysqli_error($db);
}
?>


