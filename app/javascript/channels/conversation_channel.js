import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  const nickname = document.getElementById('nickname');
  
  if (messagesContainer) {
    messagesContainer.lastElementChild.scrollIntoView();
    const id = messagesContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        data = stringToHTML(data)
        // console.log()
        if (data.children[0].children[0].children[0].children[0].innerHTML !== nickname.innerText){
          data.children[0].children[0].setAttribute("style","float:left")
        }else{
          data.children[0].children[0].setAttribute("style","float:right")
        }
        messagesContainer.insertAdjacentHTML('beforeend', data.innerHTML);
        messagesContainer.lastElementChild.scrollIntoView()
      },
    });
  }

  const stringToHTML = (str) => {
    var parser = new DOMParser();
    var doc = parser.parseFromString(str, 'text/html');
    return doc.body;
  };
}

export { initConversationCable };


//   function clearText() {
//     var sentMsg = document.querySelector('.form-control')
//     if (sentMsg){
//       sentMsg.addEventListener('keyup', function (e) {
//         if (e.key === 'Enter') {
//           sentMsg.value = ""
//         }
//       });
//     }
//   }
  
  
//   // left << this user's msg   other user's msg >> right
//   function display(){
//     console.log("run")
//     nickname = document.getElementById('nickname').innerText
//     document.querySelectorAll(".message-container").forEach(elm =>{
//       if (elm.children[0] !== undefined){
//         if(elm.children[0].children[0].children[0].innerHTML !== nickname){
//           if (elm.children[0].style.float !== "right"){
//             elm.children[0].style.float = "left"
//           }
          
//         }
//       } 
//     })
//   }

//   document.addEventListener('change', (event) => {
//     clearText()
//   });

// display();

// export { display,clearText};