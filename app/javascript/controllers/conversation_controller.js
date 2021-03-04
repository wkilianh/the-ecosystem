import { initConversationCable } from "../channels/conversation_channel"
import { Controller } from "stimulus";


export default class extends Controller {
  static targets = [ 'conversationcon', 'sendcon'];
  refresh(event) { 

    fetch("/conversations/"+event.currentTarget.dataset.id).then(function (response) {
    	// The call was successful!
    	return response.text();
    }).then(function (html) {
    	// Convert the HTML string into a document object
    	var parser = new DOMParser();
    	var doc = parser.parseFromString(html, 'text/html');
      var messagesContainer = doc.querySelector('#messages')
      var messagesSend = doc.querySelector('#send')
      return [messagesContainer, messagesSend]
    }).then(function (res ){

      var conversation = document.querySelector('.conversation')
      var sendfield = document.querySelector('.sendfield')

      conversation.innerHTML = ''
      sendfield.innerHTML = ''

      conversation.appendChild(res[0]) 
      sendfield.appendChild(res[1]) 

      initConversationCable();
    })
  }
}
