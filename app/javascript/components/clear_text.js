const clearText = () => {
  var elm = document.querySelector('#new_message .form-control')
  if (elm){
    elm.addEventListener('keyup', (e) => {
      if (e.key === 'Enter') {
        elm.value = ""
      }
    });
  }
  document.addEventListener('change', (event) => {
    clearText()
  });
}

export {clearText}