<?php 
    session_start();
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>Prijava</title>
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
                    margin-top: 10px;
                    width: 50%;
                    text-align: left;
                    padding: 20px 10px 10px 10px;
                    background-color: white;
                }

                .clanci a{
                    color: black;
                    text-decoration: none;
                }

                .clanci a:hover{
                    background-color: grey;
                    color: white;
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
<div id="page-container">
<div id="content-wrap">
    <?php
    include 'nav.html';
    ?>
    <div class="clanci">
        <section role="main"> 
    <div class="row">
    <div class="suzi">
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <label for="username">Korisničko ime:</label>
        <input type="text" id="username" name="username" required><br><br>
        <label for="password">Lozinka:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Prijavi se">
    </form><br>
    <?php

        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "projektbaza";
        $port = 3300;

        $conn = new mysqli($servername, $username, $password, $dbname, $port);

        if ($conn->connect_error) {
            die("Povezivanje nije uspjelo: " . $conn->connect_error);
        }

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $user = $_POST['username'];
            $pass = $_POST['password'];

            $sql = "SELECT id, ime, prezime, username, password, prava FROM users WHERE username = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("s", $user);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 1) {
                $row = $result->fetch_assoc();
                if (password_verify($pass, $row['password']) && $row['prava'] == 1) {
                    $_SESSION['user_id'] = $row['id'];
                    $_SESSION['username'] = $row['username'];

                    echo "<script>window.location.href = 'administracija.php';</script>";
                    exit(); 

                } else {
                    echo "Nemate pravo pristupa administraciji!";
                }
            } else {
                echo "Unijeli ste pogrešno korisničko ime ili lozinku.";
            }

            $stmt->close();
        }

        $conn->close();
    ?>
    <br><br><a href="registracija.php">Ako nemaš korisnički račun, registriraj se!</a>
</div>
</div>
</div>
</div>

<footer id="footer">
    <h4>Nikola Vickov - 2024.</h4>
</footer>
</div>
</body>
</html>