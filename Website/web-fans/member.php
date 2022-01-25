<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Finpro] Database System - JKT48</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <!-- =============================================navigation bar============================================= -->
    <div id="head">
        <a href="index.html"><p id="name">JKT48</p></a>
        <div id="navigation">
            <span id="linkss">
				<a href="#" target="">Member</a>
				<a href="schedule.php" target="">Jadwal</a>
				<a href="profile.php" target="">Profil</a>
			</span>
        </div>
        <div id="line"></div>
    </div>
    <!-- =============================================popular member============================================= -->
    <div id="section">
        <div class="member">
            <?php require '../conn/member.php';?>
        </div>
    </div>
    <!-- =============================================footer section============================================= -->
    <div id="footer">
        <hr>
        <p>CREATE WITH ❤ BY <a href="">HAFIZHMO</a></p>
        <img src="../assets/indo.png">
    </div>
</body>
</html>