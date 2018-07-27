<!DOCTYPE html>
<html lang="en">
<head>
<title>Futurism Chatbot</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script>
	var carServiceHost = '<%=com.ibm.cto.Configuration.getInstance().CAR_SERVICE_HOST %>';
	
	// enters data in input box once an option has been selected
    function optionSelected(option) {
    	document.getElementById("inputBox").value = option.value;
    	simulateEnterOn('#inputBox')
    }
    
    function simulateEnterOn(selector) {
    	const event1 = new KeyboardEvent('keyup', {
    		keyCode: 13,
    		bubbles: true,
    	  });
    	document.querySelector(selector).dispatchEvent(event1);
    }
</script>
</head>
<body>
	<header class="_demo--heading">
		<div class="_demo--container">
			<a class="wordmark" href="index.jsp">
				<span class="wordmark--left">Futurism</span>
				<span class="wordmark--right">Chatbot</span>
			</a>
			
			<!--nav class="heading-nav">
				<a class="heading-nav--item chatbot" href="./">
					Chatbot
				</a>
			</nav-->
		</div>
	</header>
	<div class="_demo--container">
		<article class="_demo--content base--article page" ref="chatbot">
			<div class="_content--dialog">
				<div class="chat-window">
					<div class="chat-box">
						<div class="chat-box--pane">
							<div class="chat-box--item_WATSON chat-box--item chat-box--item_HIDDEN">
								<div class="chat-box--container">
									<div class="img-container chat-box--avatar chat-box--avatar_WATSON">
										<img src="images/icons/avatar-watson.svg" class="chat-box--avatar-img">
									</div>
									<div class="chat-box--message">
										<div class="chat-box--message-vertical">
											<p class="chat-box--message-text base--p" id="chatMessageBox1"></p>
											<select class="options" name="options" onchange="optionSelected(this)" hidden="true"></select>
										</div>
									</div>
								</div>
							</div>
							<div class="chat-box--item_YOU chat-box--item chat-box--item_HIDDEN">
								<div class="chat-box--container">
									<div class="chat-box--message">
										<div class="chat-box--message-vertical">
											<p class="chat-box--message-text base--p" id="chatMessageBox2"></p>
											<select class="options" name="options" onchange="optionSelected(this)" hidden="true"></select>
										</div>
									</div>
									<div class="img-container chat-box--avatar chat-box--avatar_YOU">
										<img src="images/icons/avatar-me.svg" class="chat-box--avatar-img" />
									</div>
								</div>
							</div>
							<!-- adding extra space hack -->
							<div class="loader">
								<div class="loader--fallback"><img src="images/watson.gif" width="50" alt=""></div>
							</div>
						</div>
					</div>
	
					<input id="inputBox" type="text" placeholder="Type a response and hit enter" value="" autocomplete="off" class="chat-window--message-input base--text-input ui-input-message" />
					<input type="button" value="Speak" class="base--button ui-button-microphone" />
				</div>
			</div>

			

			<div class="ui-transcription"></div>
		</article>

	</div>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/socket.io-1.3.7.js"></script>
	<script src="js/watson-speech.js"></script>
  	<script src="js/talk-to-watson.js"></script>
</body>
</html>
