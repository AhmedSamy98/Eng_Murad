<?php

include '../connect.php';


$noteid = filterRequest('id');
$title    = filterRequest('title');
$content = filterRequest('content');

$stmt = $con->prepare("UPDATE `notes` SET 
`notes_title`= ? ,`notes_content`= ?  WHERE notes_id = ?");

$stmt->execute(array($title, $content, $noteid));

$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array('status' => 'User Added Successfully'));
} else {
    echo json_encode(array('status' => 'Failed to Add User'));
}

