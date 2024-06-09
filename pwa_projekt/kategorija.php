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

            ";
        ?>
    </style>
</head>
<body>
<?php 
include 'connect.php'; 
include 'nav.html';
define('UPLPATH', 'img/'); 
$kategorija=$_GET['id'];
?>
<div id="page-container">
<div id="content-wrap">
<?php
echo '<div class="naslovni_tab">';
echo '    <h2>' . ucfirst($kategorija) . '</h2>';
echo '</div>';
?>
<div class="clanci">
<section class="zanr"> 
    <?php 
        $query = "SELECT * FROM vijesti WHERE category='$kategorija'";
        $result = mysqli_query($dbc, $query); 
        $i=0;
        while($row = mysqli_fetch_array($result)) { 
            echo '<article>'; 
            echo'<div class="article">'; 
            echo '<div class="sport_img">'; 
            echo '<img src="' . UPLPATH . $row['picture'] . '">';
            echo '</div>'; 
            echo '<div class="media_body">'; 
            echo '<h2 class="title">';
            echo '<a href="clanak.php?id='.$row['id'].'">';
            echo $row['title'];
            echo '</a></h2>';
            echo '<p class="about">';
            echo '<a href="clanak.php?id='.$row['id'].'">';
            echo $row['about'];
            echo '</a></p>';
            echo '</div></div>'; 
            echo '</article>';
        }
    ?> 
    </section>
    </div>
    </div>
    
    <footer id="footer">
        <h4>Nikola Vickov - 2024.</h4>
       </footer>
     </div>
</body>
</html>