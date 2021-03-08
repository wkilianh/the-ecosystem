const toggleUser = () => {
  const nickname = document.getElementById('nickname').innerText
  var clickbleNames = document.querySelectorAll('.clickble-name')
  if (clickbleNames.length > 0){
    clickbleNames.forEach(x => {
      x.addEventListener('click', function (e) {
        clickbleNames.forEach (y => {
          y.style.backgroundColor = ""
        })
        x.style.backgroundColor = "#73d58b"
      })
    })
    clickbleNames[clickbleNames.length-1].style.backgroundColor = "#73d58b"
  }
  

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
}

export {toggleUser}