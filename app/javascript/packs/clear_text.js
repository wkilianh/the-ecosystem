
const clearText = () => {
  sentMsg = document.querySelector('.form-control')
  if (sentMsg){
    sentMsg.addEventListener('keyup', function (e) {
      if (e.key === 'Enter') {
          sentMsg.submit()
        sentMsg.value = ""
      }
    });
  }
}

export { clearText };
