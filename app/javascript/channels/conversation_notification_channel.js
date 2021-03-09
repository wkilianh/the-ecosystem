// import consumer from "./consumer";

// const initConversationNotificationCable = () => {
//   const navBadge = document.querySelector('.nav-badge');
//   const msgDropdownBadge = document.querySelector('.msg-dropdown-badge')
//   const nickname = document.getElementById('nickname');
//   const clickbleNames = document.querySelectorAll('.clickble-name')

//   if (nickname){
    
//   }
  
//   // if (messagesContainer) {
//   //   messagesContainer.lastElementChild.scrollIntoView();
//   //   const id = messagesContainer.dataset.conversationId;
//   //   consumer.subscriptions.create({ channel: "ConversationNotificationChannel", id: id }, {
//   //     received(data) {
//   //       data = stringToHTML(data)
//   //       // console.log()
//   //       if (data.children[0].children[0].children[0].children[0].innerHTML !== nickname.innerText){
//   //         data.children[0].children[0].setAttribute("style","float:left")
//   //       }else{
//   //         data.children[0].children[0].setAttribute("style","float:right")
//   //       }
//   //       console.log(nickname.innerText,data.children[0].children[0].children[0].children[0].innerHTML)
//   //       messagesContainer.insertAdjacentHTML('beforeend', data.innerHTML);
//   //       messagesContainer.lastElementChild.scrollIntoView()
//   //     },
//   //   });
//   // }

//   const stringToHTML = (str) => {
//     var parser = new DOMParser();
//     var doc = parser.parseFromString(str, 'text/html');
//     return doc.body;
//   };
// }

// export { initConversationNotificationCable };