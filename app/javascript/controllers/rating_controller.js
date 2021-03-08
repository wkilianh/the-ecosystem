import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'stars' ];
  static values = { url: String };

  connect() {
    console.log(this.starsTarget);
    console.log(this.urlValue);
    this.load();
  }

  load() {
    fetch(this.urlValue)
        .then(response => console.log(response))
        // .then(response => response.json())
        // .then(data => console.log(data));
    }

  fetchStars = (event) => {
    event.preventDefault();
    const input = document.getElementsByName('rating[co2]');
    console.log(input);
    // FormData()
    // console.log(input.value)
  }

// no work: const input = event.currentTarget.getElementsByName('rating[co2]');

// document.getElementsByName('rating[co2]')

  // fetchStars = (event) => {
  //   // console.log(event.target)
  //   console.log(this.urlValue)
  //   fetch(this.urlValue, { headers: { accept: "application/json" }})
  //     .then(response => response.json())
  //     .then(data => console.log(data));
  // }



    // const post_id = 1;
    // const rating_id = 2
    // fetch('/posts/${post_id}/ratings/${rating_id}')
    // .then(response => response.json())
    // .then((data) => {
    //   console.log(data);
      // this.starsTarget.innerHTML = '<div class="single-stars"><h1>${data}</h1></div>';
      // }

}


// href="/posts/1/ratings?rating%5Bco2%5D=5"
