import consumer from "./consumer";

const initConversationNotificationCable = () => {
  const stringToHTML = (str) => {
    var parser = new DOMParser();
    var doc = parser.parseFromString(str, 'text/html');
    return doc.body;
  };
  const nickname = document.getElementById('nickname');
  if (nickname !== null){
    const navBadge = document.querySelector('.nav-badge');
    const msgDropdownBadge = document.querySelector('.msg-dropdown-badge')
    var audio = document.querySelector('.audios')
    audio.volume = 0.2;

    fetch('/conversations').then(function(response) {
      return response.text();
      }).then(function(string) {
          let nicknames = []
          stringToHTML(string).querySelectorAll('.clickble-name').forEach(elm => {
            nicknames.push(document.getElementById(elm.innerText))
          })
          
          fetch('/conversations', { headers: { accept: 'application/json' } })
            .then(response => response.json())
            .then((jsonData) => {
              jsonData.conversations.forEach(element => {
                consumer.subscriptions.create({ channel: "ConversationNotificationChannel", id: element.id}, {
                  received(data) {
                    if (data !== nickname.innerText){
                      audio.play();
                      msgDropdownBadge.innerText = parseInt(msgDropdownBadge.innerText.replace(/ /g,'')) + 1
                      navBadge.innerText = parseInt(navBadge.innerText.replace(/ /g,'')) + 1
                      msgDropdownBadge.setAttribute("style","display: block")
                      navBadge.setAttribute("style","display: block")  
                        nicknames.forEach( elm => {
                          if (elm != null && elm.id == data){
                            elm.innerText = parseInt(elm.innerText) + 1
                            elm.style.display = "block"
                          }
                        })
                    }
                  },
                });
              });
            })
          });
    
    
  }
  



}
export { initConversationNotificationCable };