
<?php




$target_dir = $_SERVER['DOCUMENT_ROOT'] . "/images/";

$target_file0 = $target_dir . basename($_FILES["fileToUpload"]["name"][0]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][0], $target_file0);

$target_file1 = $target_dir . basename($_FILES["fileToUpload"]["name"][1]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][1], $target_file1);

$target_file2 = $target_dir . basename($_FILES["fileToUpload"]["name"][2]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][2], $target_file2);

$target_file3 = $target_dir . basename($_FILES["fileToUpload"]["name"][3]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][3], $target_file3);

$target_file4 = $target_dir . basename($_FILES["fileToUpload"]["name"][4]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][4], $target_file4);

$target_file5 = $target_dir . basename($_FILES["fileToUpload"]["name"][5]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][5], $target_file5);

$target_file6 = $target_dir . basename($_FILES["fileToUpload"]["name"][6]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][6], $target_file6);

$target_file7 = $target_dir . basename($_FILES["fileToUpload"]["name"][7]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][7], $target_file7);

$target_file8 = $target_dir . basename($_FILES["fileToUpload"]["name"][8]);
move_uploaded_file($_FILES["fileToUpload"]["tmp_name"][8], $target_file8);



?>

