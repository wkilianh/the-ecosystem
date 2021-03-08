import "jquery-bar-rating";

const initStarRating = () => {
  $('#rating_co2').barrating({
    theme: 'css-stars'
  });
  $('#rating_waste').barrating({
    theme: 'css-stars'
  });
  $('#rating_resources').barrating({
    theme: 'css-stars'
  });
  $('#rating_diyeffort').barrating({
    theme: 'css-stars'
  });
  $('#rating_ecocost').barrating({
    theme: 'css-stars'
  });
  $('#rating_avg').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
