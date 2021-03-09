const clearBadgeConversation = () => {
  const nickname = document.getElementById('nickname').innerText
  const clickbleNames = document.querySelectorAll('.clickble-name')
  if (clickbleNames.length > 0){
    clickbleNames.forEach(x => {
      x.addEventListener('click', function (e) {
          const user_unseen = x.innerText
          const user_useen_badge = document.getElementById(user_unseen)
          if (user_useen_badge !== null){
            const num = parseInt(user_useen_badge.innerText)
            user_useen_badge.innerText = "0"
            user_useen_badge.style.display = "none"
            const navBadge = document.querySelector(".nav-badge")
            const msgDropdownBadge = document.querySelector(".msg-dropdown-badge")
            if (num < msgDropdownBadge.innerText.replace(/ /g,'')){
              msgDropdownBadge.innerText -= num
              navBadge.innerText -= num
            } else {
              msgDropdownBadge.innerText = "0"
              navBadge.innerText = "0"
              msgDropdownBadge.style.display = "none";
              navBadge.style.display = "none";
            }
          }
      })
    })
  }  
}

export {clearBadgeConversation}