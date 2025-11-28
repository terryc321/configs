
<?php

/*
sudo chown -R www-data:www-data /tmp
sudo chmod -R 755 /tmp

sudo chown -R www-data:www-data /var/www/html/images
sudo chmod -R 755 /var/www/html/images

*/


echo "<br>common error 1 : missing semicolon after echo statement";
echo "<br>server DOCUMENT_ROOT = " . $_SERVER['DOCUMENT_ROOT'] ;


echo "<br> basename " . $_FILES["fileToUpload"]["name"];


// $target_dir = $_SERVER['DOCUMENT_ROOT'] . "/books/";
$target_dir = $_SERVER['DOCUMENT_ROOT'] . "/images/";
#$target_file = $_SERVER['DOCUMENT_ROOT'] .  $target_dir . basename($_FILES["fileToUpload"]["name"]);
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);



echo '<br> $target_file is ' . $target_file ;

echo '<br> mary had a little lamb its fleece was sure to go' ;

echo "<br> php is so cool ";

$dest = "/tmp/test.txt";
echo "<br> checking if we can create $dest";
file_put_contents($dest , 'TTTTTEEEESSSSTTTTT!!!!');
if (file_exists( $dest )) {
  echo "<br>We have something for $dest ";
}
else {
 echo "<br>The $dest was not created ";
}


 //Check if the file exists and is readable
 echo "<br> checking the file $dest exists .";
        if (!file_exists($dest)) {
            abort(404, "The file does not exist.");
        }
 echo "<br> checking the file $dest is readable .";
    
        if (!is_readable($dest)) {
            abort(403, "You do not have permission to read this file.");
        }

	echo $dest . " has a size of  " . filesize($dest) . ' bytes';

// $dest file definitely exists . 
echo "<br>///////////////////////////////////////////////////////////////";

// $dest = $_SERVER['DOCUMENT_ROOT'] . '/tmp/test.txt';
// echo "<br> checking if we can create $dest ";
// file_put_contents($dest, 'TTTTTEEEESSSSTTTTT!!!!');
// if (file_exists($dest)) {
//   echo "<br>Theres definitely something at $dest ";
// }
// else {
//  echo "<br>The file $dest simply was not created";
// }

$dest2 = "/tmp/test2.txt" ; 

$output=null;
$retval=null;

echo "<br> checking if we can copy $dest to $dest2 ";
exec("cp $dest $dest2", $output , $retval);
print_r($output);

 echo "<br> checking the file $dest2 exists .";
        if (!file_exists($dest2)) {
            abort(404, "The file does not exist.");
        }
 echo "<br> checking the file $dest2 is readable .";
    
        if (!is_readable($dest2)) {
            abort(403, "You do not have permission to read this file.");
        }

	echo $dest2 . " has a size of  " . filesize($dest2) . ' bytes';


echo "<br>///////////////////////////////////////////////////////////////";


$uploadOk = 1;

$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    echo "<br>its a submission POST";
    echo "<br> file name itself = [" . $_FILES["fileToUpload"]["name"] . "]" ; 
    echo "<br> temp file (holds content) = [" . $_FILES["fileToUpload"]["tmp_name"] . "]" ;
    echo "<br> attempting to get file size ..."; 

    echo "Upload: " . $_FILES["fileToUpload"]["name"] . "<br>";
    echo "Type: " . $_FILES["fileToUpload"]["type"] . "<br>";
    echo "Size: " . ($_FILES["fileToUpload"]["size"] / 1024) . " kB<br>";
    echo "Stored in: " . $_FILES["fileToUpload"]["tmp_name"];
    
    // echo "getimagesize PATH = " . $_FILES["fileToUpload"]["tmp_name"] ;

    // we just assume upload will succeed
    $uploadOk = 1;
    
  // $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
  // if($check !== false) {
  //   echo "<br>File is an image - " . $check["mime"] . ".";
  //   $uploadOk = 1;
  // } else {
  //   echo "File is not an image.";
  //   $uploadOk = 0;
  // }
}

// Check if file already exists
if (file_exists($target_file)) {
  echo "<br>Sorry, file already exists.";
  $uploadOk = 0;
}
else {
 echo "<br>File $target_file does not already exist"; 
}


// Check file size
// if ($_FILES["fileToUpload"]["size"] > 500000) {
//   echo "<br>Sorry, your file is too large.";
//   $uploadOk = 0;
// }

// // Allow certain file formats
// if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
// && $imageFileType != "gif" ) {
//   echo "<br>Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
//   $uploadOk = 0;
// }



// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "<br>Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    echo "<br>The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
  } else {
    echo "<br>Sorry, there was an error uploading your file.";
  }
}

?>

