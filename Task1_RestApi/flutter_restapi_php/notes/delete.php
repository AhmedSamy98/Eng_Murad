<?php

include '../connect.php';


$noteid = filterRequest('id');

$stmt = $con->prepare("DELETE FORM notes WHERE notes_id = ?");

$stmt->execute(array($noteid));

$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array('status' => 'User Added Successfully'));
} else {
    echo json_encode(array('status' => 'Failed to Add User'));
}

