<?php 

include 'connect.php';


$stmt = $con->prepare("INSERT INTO `users`(`username`, `email`) VALUES ('zaky','zaky@gmail.com'");
$stmt->execute();

$count = $stmt->rowCount();

if ($count > 0) {
    echo "User Added Successfully";
} else {
    echo "Failed to Add User";
}

// $stmt = $conn->prepare("SELECT * FROM users");
// $stmt->execute();
// // $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
// $users = $stmt->fetch(PDO::FETCH_ASSOC);
// echo "<pre>";
// print_r($users);
// echo "</pre>";

// echo json_encode($users);

//  انشاء علاقه
// ALTER TABLE `notes` ADD FOREIGN KEY (`notes_usres`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;