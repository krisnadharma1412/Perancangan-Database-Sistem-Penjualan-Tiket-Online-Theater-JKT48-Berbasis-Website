
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Finpro] Database System - JKT48</title>
    <link rel="stylesheet" href="../styles.css">
    <style>
        .button {
            background-color: #dd3030;
            text-decoration: none;
            color: white;
            padding: 10px;
            margin-bottom: 1rem;
            display: inline-block;
            font-family: "Inter Demi";
        }
        .button:hover {
            background-color: white;
            color: #dd3030;
        }
        .bg-modal {
            background-color: rgba(0, 0, 0, 0.8);
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            display: none;
            margin: auto;
            justify-content: center;
            align-items: center;
        }
        .modal-contents {
            height: 300px;
            width: 500px;
            background-color: white;
            text-align: center;
            padding: 20px;
            margin: auto;
            position: relative;
            border-radius: 4px;
        }
        input {
            margin: 15px auto;
            display: block;
            width: 50%;
            padding: 8px;
            border: 1px solid gray;
        }
        .close {
            position: absolute;
            top: 0;
            right: 10px;
            font-size: 42px;
            color: #333;
            transform: rotate(45deg);
            cursor: pointer;
        }
        .close:hover {
            color: #666;
        }
    </style>
</head>
<body>
    <!-- =============================================navigation bar============================================= -->
    <div id="head">
        <a href="index.html"><p id="name">JKT48</p></a>
        <div id="navigation">
            <span id="linkss">
            <a href="index.html" target="">Menu Utama</a>
				<a href="#" target="">Jadwal</a>
				<a href="../index.html" target="">keluar</a>
			</span>
        </div>
        <div id="line"></div>
    </div>

    <div class="bg-modal">
        <div class="modal-contents">
            <div class="close">+</div>
            <img src="https://richardmiddleton.me/comic-100.png" alt="">

            <form action="" method="POST">
                <input type="date" name="date" min="2021-01-27" max="2021-02-28">
                <select name="time">
                    <option value="09:00:00 AM">09:00 AM</option>
                    <option value="07:30:00 PM">07:30 PM</option>
                </select>
                <?php require '../conn/setlist.php';?>
                <input type="numeric" placeholder="Slot" name="slot">
                <button type="submit" name="save" id="button-submit" class="button">Submit</button>
            </form>

        </div>
    </div>
    <!-- =============================================popular member============================================= -->
    <div id="section">
        
        <div class="schedule">
            <a href="#" id="button" class="button">+ Buat Acara Baru</a>
            <div class="item">
                <div class="date"><h3>Tanggal</h3></div>
                <div class="time"><h3>Waktu</h3></div>
                <div class="setlist"><h3>Acara</h3></div>
                <div class="limit"><h3>Slot</h3></div>
            </div>
            <?php require '../conn/schedule.php';?>
        </div>
    </div>
    <!-- =============================================footer section============================================= -->
    <div id="footer">
        <hr>
        <p>CREATE WITH ❤ BY <a href="">HAFIZHMO</a></p>
        <img src="../assets/indo.png">
    </div>
</body>
<script>

document.getElementById('button').addEventListener("click", function() {
	document.querySelector('.bg-modal').style.display = "flex";
});

document.querySelector('.close').addEventListener("click", function() {
	document.querySelector('.bg-modal').style.display = "none";
});

document.getElementById('button-submit').addEventListener("click", function() {
	document.querySelector('.bg-modal').style.display = "none";
    location.reload();
    return false;
});

</script>

</html>