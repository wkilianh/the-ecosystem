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
    // clickbleNames[clickbleNames.length-1].style.backgroundColor = "#73d58b"
  }
}

export {toggleUser}