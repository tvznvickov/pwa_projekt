<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete'])) { 
        $id = $_POST['id']; 
        $query = "DELETE FROM vijesti WHERE id=$id"; 
        $result = mysqli_query($dbc, $query); 

        if (!$result) {
            die("Delete query failed: " . mysqli_error($dbc));
        } else {
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();
        }
    }

    if (isset($_POST['update'])) { 
        $title = mysqli_real_escape_string($dbc, $_POST['title']); 
        $about = mysqli_real_escape_string($dbc, $_POST['about']); 
        $content = mysqli_real_escape_string($dbc, $_POST['content']); 
        $category = mysqli_real_escape_string($dbc, $_POST['category']);
        $id = mysqli_real_escape_string($dbc, $_POST['id']); 

        $query = "UPDATE vijesti SET title='$title', about='$about', content='$content', category='$category'";
        
        if (!empty($_FILES['pphoto']['name'])) {
            $picture = $_FILES['pphoto']['name']; 
            $target_dir = 'img/'.$picture; 
            if (move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir)) {
                $query .= ", picture='$picture'";
            } else {
                echo "File upload failed.";
            }
        }
        
        $query .= " WHERE id=$id"; 
        $result = mysqli_query($dbc, $query); 

        if (!$result) {
            die("Update query failed: " . mysqli_error($dbc));
        } else {
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();
        }
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['update']) && !isset($_POST['delete'])) {
        $picture = $_FILES['pphoto']['name']; 
        $title = $_POST['title']; 
        $about = $_POST['about']; 
        $content = $_POST['content']; 
        $category = $_POST['category']; 
        $date = date('Y-m-d');

        $target_dir = 'img/'.$picture; 
        move_uploaded_file($_FILES["pphoto"]["tmp_name"], $target_dir); 

        $query = "INSERT INTO vijesti (date, title, about, content, picture, category) 
                  VALUES ('$date', '$title', '$about', '$content', '$picture', '$category')"; 

        $result = mysqli_query($dbc, $query) or die('Error querying database.'); 
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
    <?php
        echo "
            body {
                background-color: #d3d3d3;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            .clanci {
                margin: 0 auto;
                margin-bottom: 20px;
                width: 50%;
                text-align: left;
                padding: 10px 10px 10px 10px;
                background-color: white;
            }

            .clanci a{
                color: black;
                text-decoration: none;
            }

            .article {
                display: flex;
                border-bottom: 1px solid #d3d3d3;
            }

            .sport_img{
                width: 300px;
            }

            .sport_img img {
                width: 300px;
            }

            .media_body {
                float: left;
                padding-left: 10px;
                padding-top: 5px;
            }

            .naslovni_tab {
                background-color: #ffd100;
                margin: 0 auto;
                margin-top: 5px;
                width: 50%;
                text-align: left;
                padding: 5px 10px 5px 10px;
                color: white;
                text-decoration: underline;
            }

            h2 {
                margin: 0;
                padding: 0;
            }

            #page-container {
                position: relative;
                min-height: 200vh;
            }

            #content-wrap {
                padding-bottom: 3.5rem;
                padding-left: 20px;
            }

            #footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                height: 2.5rem;
                text-align: center;
                background-color: gray;
                color: white;
                padding-bottom: 10px;
            }

            label {
                font-weight: bold;
            }

            input[type='text'],
            input[type='file'],
            textarea {
                width: 40%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type='submit'] {
                grid-column: 2;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type='submit']:hover {
                background-color: #45a049;
            }
        ";
    ?>
</style>
</head>
<body>
<?php
    include 'nav.html';
?>
<div id="page-container">
<div id="content-wrap">
<h1>Unos novog članka</h1>
<form id="newsForm" action="" method="post" enctype="multipart/form-data">
    <label for="pphoto">Slika:</label><br>
    <input type="file" name="pphoto" id="pphoto" required><br><br>

    <label for="title">Naslov:</label><br>
    <input type="text" name="title" id="title"><br>
    <div id="errorMessageTitle" style="color: red;"></div><br>
    
    <label for="about">Opis:</label><br>
    <textarea name="about" id="about" rows="4" cols="50"></textarea><br>
    <div id="errorMessageAbout" style="color: red;"></div><br>
    
    <label for="content">Sadržaj:</label><br>
    <textarea name="content" id="content" rows="10" cols="50"></textarea><br>
    <div id="errorMessageContent" style="color: red;"></div><br>
    
    <label for="category">Kategorija:</label><br>
    <input type="text" name="category" id="category"><br>
    <div id="errorMessageCategory" style="color: red;"></div><br>
    
    <input type="submit" value="Unesi Vijest">
</form>

<script>
document.getElementById('title').addEventListener('input', validateForm);
document.getElementById('about').addEventListener('input', validateForm);
document.getElementById('content').addEventListener('input', validateForm);
document.getElementById('category').addEventListener('input', validateForm);

function validateForm() {
    var isValid = true;

    var title = document.getElementById('title');
    var errorMessageTitle = '';
    if (title.value.length < 5 || title.value.length > 100) {
        errorMessageTitle = 'Naslov mora imati između 5 i 100 znakova.<br>';
        isValid = false;
    }
    document.getElementById('errorMessageTitle').innerHTML = errorMessageTitle;

    var about = document.getElementById('about');
    var errorMessageAbout = '';
    if (about.value.length < 10 || about.value.length > 500) {
        errorMessageAbout = 'Opis mora imati između 10 i 500 znakova.<br>';
        isValid = false;
    }
    document.getElementById('errorMessageAbout').innerHTML = errorMessageAbout;

    var content = document.getElementById('content');
    var errorMessageContent = '';
    if (content.value.length < 1) {
        errorMessageContent = 'Sadržaj je obavezan.<br>';
        isValid = false;
    }
    document.getElementById('errorMessageContent').innerHTML = errorMessageContent;

    var category = document.getElementById('category');
    var errorMessageCategory = '';
    if (category.value.length < 1) {
        errorMessageCategory = 'Kategorija je obavezna.<br>';
        isValid = false;
    }
    document.getElementById('errorMessageCategory').innerHTML = errorMessageCategory;

    return isValid;
}

document.getElementById('newsForm').addEventListener('submit', function(event) {
    if (!validateForm()) {
        event.preventDefault();
    }
});
</script>

<br><br><h1>Administracija članaka</h1>
<?php
$query = "SELECT * FROM vijesti"; 
$result = mysqli_query($dbc, $query); 

if (!$result) {
    die("Query failed: " . mysqli_error($dbc));
}

while($row = mysqli_fetch_array($result)) { 
    echo '<form enctype="multipart/form-data" action="" method="POST"> 
    <br>
    <div class="form-item"> 
        <label for="title">Naslov vjesti:</label> 
        <div class="form-field"> 
            <input type="text" name="title" class="form-field-textual" value="'.$row['title'].'"> 
        </div> 
    </div> 
    <div class="form-item"> 
        <label for="about">Kratki sadržaj vijesti (do 50 znakova):</label> 
        <div class="form-field"> 
            <textarea name="about" cols="30" rows="10" class="form-field-textual">'.$row['about'].'</textarea> 
        </div> 
    </div> 
    <div class="form-item"> 
        <label for="content">Sadržaj vijesti:</label> 
        <div class="form-field"> 
            <textarea name="content" cols="30" rows="10" class="form-field-textual">'.$row['content'].'</textarea>
        </div> 
    </div> 
    <div class="form-item"> 
        <label for="pphoto">Slika:</label> 
        <div class="form-field">
            <input type="file" class="input-text" id="pphoto" name="pphoto"/> 
            <br><img src="img/' . $row['picture'] . '" width=100px> 
        </div> 
    </div> 
    <div class="form-item"> 
        <label for="category">Kategorija vijesti:</label> 
        <div class="form-field"> 
            <select name="category" class="form-field-textual">
                <option value="sport" '.($row['category'] == "sport" ? "selected" : "").'>sport</option> 
                <option value="politika" '.($row['category'] == "politika" ? "selected" : "").'>politika</option> 
            </select> 
        </div> 
    </div> 
    <div class="form-item"> 
        <input type="hidden" name="id" class="form-field-textual" value="'.$row['id'].'"> 
        <button type="reset" value="Poništi">Poništi</button> 
        <button type="submit" name="update" value="Prihvati"> Izmjeni</button> 
        <button type="submit" name="delete" value="Izbriši"> Izbriši</button> 
    </div> 
    <br>
</form>'; 
}
mysqli_close($dbc); 
?>
</div>

<footer id="footer">
    <h4>Nikola Vickov - 2024.</h4>
</footer>
</div>
</body>
</html>