const clearBadgeConversation = () => {
  const nickname = document.getElementById('nickname').innerText
  var clickbleNames = document.querySelectorAll('.clickble-name')
  if (clickbleNames.length > 0){
    clickbleNames.forEach(x => {
      x.addEventListener('click', function (e) {
          var user_unseen = x.innerText
          var user_useen_badge = document.getElementById(user_unseen)
          if (user_useen_badge !== null){
            console.log(user_unseen+" "+user_useen_badge.innerText)
            var num = user_useen_badge.innerText
            user_useen_badge.innerText = 0
            user_useen_badge.style.display = "none"
            var navBadge = document.querySelector(".nav-badge")
            var msgDropdownBadge = document.querySelector(".msg-dropdown-badge")
            if (num < msgDropdownBadge.innerText){
              msgDropdownBadge.innerText -= num
              navBadge.innerText -= num
            } else {
              msgDropdownBadge.innerText = 0
              navBadge.innerText = 0
              msgDropdownBadge.style.display = "none";
              navBadge.style.display = "none";
            }
          }
      })
    })
  }  
}
  //   if (document.querySelector(".nav-badge").innerText > user_unseen){
  //     document.querySelector(".nav-badge").innerText -= user_unseen
  //   } else {
  //     document.querySelector(".nav-badge").innerText = "0"
  //     document.querySelector(".nav-badge").style.display = "none";
  //   }
  // }
  

      // user_unseen = document.querySelector(`#${x.text}`).innerText
      // document.querySelector(`#${x.text}`).innerText = "0"
      // document.querySelector(`#${x.text}`).style.display = "none";

      // if (document.querySelector(".nav-badge").innerText > user_unseen){
      //   document.querySelector(".nav-badge").innerText -= user_unseen
      // } else {
      //   document.querySelector(".nav-badge").innerText = "0"
      //   document.querySelector(".nav-badge").style.display = "none";
      // }

      // if (document.querySelector(".msg-dropdown-badge").innerText > user_unseen){
      //   document.querySelector(".msg-dropdown-badge").innerText -= user_unseen
      // } else {
      //   document.querySelector(".msg-dropdown-badge").innerText = "0"
      //   document.querySelector(".msg-dropdown-badge").style.display = "none";
      // }


export {clearBadgeConversation}