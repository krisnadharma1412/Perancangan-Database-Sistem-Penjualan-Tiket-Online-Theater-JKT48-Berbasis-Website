<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
 .button {
	 background-color: #1686d9;
	 border: 2px solid white;
	 border-radius: 30px;
	 text-decoration: none;
	 padding: 10px 28px;
	 color: white;
	 margin-top: 10px;
	 display: inline-block;
}
 .button:hover {
	 background-color: white;
	 color: #1686d9;
	 border: 2px solid #1686d9;
}
 .bg-modal {
	 background-color: rgba(0, 0, 0, 0.8);
	 width: 100%;
	 height: 100%;
	 position: absolute;
	 top: 0;
	 display: none;
	 justify-content: center;
	 align-items: center;
}
 .modal-contents {
	 height: 300px;
	 width: 500px;
	 background-color: white;
	 text-align: center;
	 padding: 20px;
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
    
    
    <a href="#" id="button" class="button">Click Me</a>
    
    <div class="bg-modal">
        <div class="modal-contents">
    
            <div class="close">+</div>
            <img src="https://richardmiddleton.me/comic-100.png" alt="">
    
            <form action="">
                <input type="text" placeholder="Name">
                <input type="email" placeholder="E-Mail">
                <a href="#" class="button">Submit</a>
            </form>
    
        </div>
	</div>
</body>
<script>
    document.getElementById('button').addEventListener("click", function() {
	document.querySelector('.bg-modal').style.display = "flex";
});

document.querySelector('.close').addEventListener("click", function() {
	document.querySelector('.bg-modal').style.display = "none";
});
</script>
</html>