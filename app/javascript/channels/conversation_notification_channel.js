import consumer from "./consumer";

const initConversationNotificationCable = () => {

  
  window.addEventListener( "pageshow", function ( event ) {
    var historyTraversal = event.persisted || ( typeof window.performance != "undefined" && window.performance.navigation.type === 2 );
    if ( historyTraversal ) {
      // Handle page restore.
      //alert('refresh');
      window.location.reload();
    }
  });

  // document.addEventListener('change', (event) =>{
  //   event.locaion.reload()
  //   window.onpopstate=function()
  // {
  //   document.locaion.reload()
  // }
  // })

  // window.onpopstate=function()
  // {
  //   // alert("Back/Forward clicked!");
  //   // location.reload();
  //   // window.location.replace(window.location.pathname + window.location.search + window.location.hash);
  //   document.locaion.reload()
  //   // initConversationNotificationCable()
  // }

  const stringToHTML = (str) => {
    var parser = new DOMParser();
    var doc = parser.parseFromString(str, 'text/html');
    return doc.body;
  };

  const nickname = document.getElementById('nickname');
  if (nickname !== null){
    const navBadge = document.querySelector('.nav-badge');
    const msgDropdownBadge = document.querySelector('.msg-dropdown-badge')

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