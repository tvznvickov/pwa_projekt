<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP CSS Primer</title>
    <style>
        <?php
            echo "
                body {
                    background-color: #d3d3d3;
                    margin: 0 auto;
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

                .slika img {
                    width: 100%;
                
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
                    min-height: 100vh;
                }

                #content-wrap {
                    padding-bottom: 2.5rem;
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

                .suzi {
                    width: 90%;
                    margin: 0 auto;
                }

                .about {
                    font-weight: bold;
                }
            ";
        ?>
    </style>
</head>
<body>
<?php 
include 'connect.php'; 
include 'nav.html';
define('UPLPATH', 'img/'); 

$id = $_GET['id'];

$query = "SELECT * FROM vijesti WHERE id=?";
$stmt = $dbc->prepare($query);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows > 0) {
    $row = $result->fetch_assoc();
} else {
    echo "Nema rezultata za zadani ID.";
    exit();
}

$date = new DateTime($row['date']);

$formatted_date = $date->format('d. F Y');

?>
<div id="page-container">
<div id="content-wrap">
<?php
echo '<div class="naslovni_tab">';
echo '    <h2>' . ucfirst($row['category']) . '</h2>';
echo '</div>';
?>
<div class="clanci">
<section role="main"> 
    <div class="row">
        <div class="suzi">
            <h1 class="title"><?php 
                echo $row['title']; 
            ?></h1> 
            <p><?php 
                echo "<span>".$formatted_date."</span>"; 
            ?></p> 
            </div> 
            </div>
            <section class="slika"> 
                <?php 
                echo '<img src="' . UPLPATH . $row['picture'] . '">'; 
                ?> 
            </section> 
        <div class="suzi">
        <section class="about"> 
            <p> 
                <?php 
                echo "<i>".$row['about']."</i>"; 
                ?> 
            </p> 
        </section> 
        <section class="sadrzaj"> 
            <p> 
                <?php 
                echo nl2br($row['content']);
                ?> 
            </p> 
        </section> 
        </div>
    </section>
    </div>
    </div>
    
    <footer id="footer">
        <h4>Nikola Vickov - 2024.</h4>
       </footer>
     </div>
</body>
</html>