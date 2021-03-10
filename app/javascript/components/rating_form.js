


export { toggleForm };
const toggleForm = () => {
  console.log('Hi!');
  const ratingForm = document.querySelector("#rating-form");
  const ratingButton = document.querySelector("#rating-button");

  ratingButton.addEventListener("click", (event) => {
      // console.log('Hi again!');
      ratingForm.classList.toggle("not-visible")
    });
}
