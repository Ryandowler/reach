// tidy this up!!! , remove test code
$(document).ready(function() {
var asked_signIn = false;
var asked_signOut = false;
var asked_aboutTheirCharity = false;
var asked_category = false;

//reference to the message body to sue ot to auto scroll
var elem = document.getElementById('main-demo-body');
// check if sent an initial message in user doesn input something
var promptedUserAlready = false;
var array = ['a', 'b', 'a', 'c', 'a', 'd'];

    // Annoying Chatbot
    //==================================================================================================================

    $('#chatbot').on('click', '#chatbot-submit', function(e) {
        e.preventDefault();

        message = $('#chatbot-input').val();
        message = message.toLowerCase();
        sendMessage();
        bot(message);
       // clearInterval(botAuto);
    });

    function bot(message) {
        if (message.indexOf('hello') >= 0) {
            var messageArray = [
                'Hello to you too!',
                'I said hello first :)',
                'Greeting, human.'
            ];
            sendMessage(messageArray);
        }

        else if (message.indexOf('help') >= 0) {
            var messageArray = [
                'I can certainly help, what are you trying to find on Reach?',
                'What do you need help with?'
            ];
            sendMessage(messageArray);
        }

        else if (message.indexOf('good morning') >= 0) {

            var messageArray = [
                'Good morning to you too. How are you this morning?',
                'Yeah, its good ',
                'Greeting, human.'
            ];
            sendMessage(messageArray);
        }
		
		// ------- REACH QUESTIONS ----------//
        //1
		else if (message.indexOf('sign i') >= 0 || message.indexOf('sign on') >= 0) {
			asked_signIn = true;
            var messageArray = [
                'Are you trying to sign in?'
            ];
			//send message
            sendMessage(messageArray);
        }
		//2
		else if (message.indexOf('sign ou') >= 0) {
			asked_signOut = true;
            var messageArray = [
                'Are you trying to sign out?'
            ];
			//send message
            sendMessage(messageArray);
        }
        //3
        else if (message.indexOf('charity') >= 0 || message.indexOf('charitie') >= 0  || message.indexOf('org') >= 0) {
            asked_aboutTheirCharity = true;
            var messageArray = [
                'Are you trying to find your organizations (charities)?'
            ];
            //send message
            sendMessage(messageArray);
        }
        //4 test array
        else if (message.indexOf('categ') >= 0) {
            asked_category = true;
            var messageArray = [
                'Are you looking for a particular Category?'
            ];
            //send message
            sendMessage(messageArray);
        }

		// ./end------- REACH QUESTIONS ----------//

		// ------- YES RESPONSES ----------//
        //1
		else if (message.indexOf('yes') >= 0 || message.indexOf('ye') >= 0 || message.indexOf('yea') >= 0 || message.indexOf('yeah') >= 0  || message.indexOf('yess') >= 0  || message.indexOf('y') >= 0  || message.indexOf('yer') >= 0) {
			
			if(asked_signIn){
				asked_signIn = false; //set it back
				var messageArray = [
					'<a href="/users/sign_in">Okay, click here to sign in </a>'
				];
			}
    		//2
    		else if(asked_signOut){
    			asked_signOut = false; //set it back
    			var messageArray = [
    				'<a rel="nofollow" data-method="delete" href="/users/sign_out">Okay, click here to sign out</a>'
    			];
    		}
            //3
            else if(asked_aboutTheirCharity){
                openOrglist();
                asked_aboutTheirCharity = false; //set it back
                var messageArray = [
                    'That information can be found on your profile, Retrieving your profile . . .'
                ];

            }
            //3
            else if(asked_category){
                asked_category = false; //set it back
                var messageArray = [
                    'Which Category do you want to go to?'
                ];

            }
			 //send the message
            sendMessage(messageArray);
        }//end of 'yes' and their response to earlier
        // ./------- YES RESPONSES ----------//

        // ------- NO RESPONSES ----------//
        //1
        else if (message.indexOf('n') >= 0 ) {
            
            if(asked_category){
                asked_category = false; //set it back
                var messageArray = [
                    'Retrieving a random Category . . .'
                ];
            }

            //send the message
            sendMessage(messageArray);

        }
       // -------end- NO RESPONSES ----------//
		
        else if (message.indexOf('x') >= 0) {

            var messageArray = [
                'Okay, so what do you want to talk about?',
                'Okay, what is your problem? I can help',
                'Do you have something to say? Say it. Let it out your chest.'
            ];

            sendMessage(messageArray);
        }

        else if (message.indexOf('nothing') >= 0) {

            var messageArray = [
                'If nothing than you won\' be here, right?',
                'Please continue.',
                'Just say it.'
            ];

            sendMessage(messageArray);
        }

        else if (message == '') {

            var messageArray = [
                'Looks like you didnt type anything',
            ];

            sendMessage(messageArray);
        }

	    //fall back
        else {

            var messageArray = [
                'Oops... I don\'t really know what that means yet.',
                'Developer no make me smart',
                'I\'m pretty stupid at this point, I don\'t really know what to respond to you. Say something else.',
            ];
            sendMessage(messageArray);
        }
    }

    // scroll to the bottom of chat box
    function scrollToMessage() {
        var msgBox = $('#chatbot-message');
        var height = msgBox[0].scrollHeight;
        msgBox.scrollTop(height);
         elem.scrollTop = elem.scrollHeight;
    }

    // sending message
    function sendMessage(message) {
        if (message) {

            $('#chatbot-input').addClass('disabled');
            $('#chatbot-input').attr('disabled', 'disabled');
            $('#chatbot-submit').addClass('disabled');
            $('#chatbot-submit').attr('disabled', 'disabled');

            var respond = message[Math.floor(Math.random() * message.length)];
            //verbally say what the chatbot has said
            var parseResponse = respond.textContent;
            var parseResponse2 = respond.text;
            console.log("hh-> " + parseResponse);
            console.log("hh2-> " + parseResponse2);
            responsiveVoice.speak(respond, "UK English Male");

            setTimeout(function() {
                botPre     = '<span class="message">Bot is writing... <i class="glyphicon glyphicon-pencil"></i></span>';
                botVal     = respond;
                botMessage = $('#chatbot-message').html() + '<p class="from-bot"><span class="user">Bot: </span>' + botPre + '</p>';
                $('#chatbot-input').attr('placeholder', 'Bot is writing...');
                $('#chatbot-message').html(botMessage);
               
                scrollToMessage();
                 elem.scrollTop = elem.scrollHeight;
            }, 800);

            setTimeout(function() {
                botMessageReplace = $('#chatbot-message .from-bot:last-child()');
                botMessage = '<span class="user">Bot: </span>' + botVal;
                $('#chatbot-input').attr('placeholder', 'message...');
                botMessageReplace.html(botMessage);

                 //var tty = botMessage.text;
                 var x5 = botMessage.textContent;
                console.log("this is the bot message 2 :" + botMessage);
                console.log("this is the bot message parced :" + x5);
               
                //responsiveVoice.speak(tty, "UK English Female");
                scrollToMessage();
                $('#chatbot-input').removeClass('disabled');
                $('#chatbot-input').removeAttr('disabled');
                $('#chatbot-submit').removeClass('disabled');
                $('#chatbot-submit').removeAttr('disabled');
            }, 2800);

        } else {
            userVal     = $('#chatbot-input').val();
            userMessage = $('#chatbot-message').html() + '<p class="from-user"><span class="user">You: </span>' + userVal + '</p>';
            $('#chatbot-message').html(userMessage);
            scrollToMessage();
            $('#chatbot-input').val('');

        }
         elem.scrollTop = elem.scrollHeight;
    }
});