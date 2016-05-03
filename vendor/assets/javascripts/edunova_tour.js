//This is just a random
var ready;
ready = function() {

 var tour = new Tour({
  steps: [
  {
    element: "#introduction",
    content: "<h3> explore through our vast collection of notes </h3> <br/><ul style='padding-left:3px;font-size:15px;'>  look at what other people are learning { <b> top labels </b> } <br/> <br/> narrow your search with your intrests { <b> filter notes via labels </b> }</ul> ",
    backdrop: true,
    placement: "bottom",
    path: "/"

  },
  {
    element: "#section_learn",
    content: "<h3> Learn what you aspire to and be what you want </h3> <br/><ul style='padding-left:3px;font-size:15px;'> create note and learn new things { <b> create new note </b> } <br/> <br/> manage your created note/s { <b> my notes </b> } </ul>" ,
    backdrop: true,
    placement: "bottom",
    path: "/notes"
  },
  {
    element: "#section_feeds",
    content: "<h3>Check your daily learning guide </h3> <br/> <br/> <ul style='padding-left:3px;font-size:15px;'>Know about what your friends are learning on edunova { <b> newsfeed </b> } <br/> <br/> Follow users, get followed and search people on edunova { <b> manage your connections </b> } </ul> ",
    backdrop: true,
    placement: "bottom",
    path: "/feeds"
  },
  {
    element: "#toappend",
    content: "<h3>profile page</h3> <br/><br/> <ul style='padding-left:3px;font-size:15px;'>Your profile speaks about your talent. Complete it and update it regularly { <b> edit your profile </b> } <br/> <br/> Follow users after you know what they are passionate about { <b> follow people </b> } </ul> ",
    backdrop: true,
    placement: "bottom",
    path: "/profiles/vaibhavgeek"
  }
] , 

  onEnd: function (tour) {
    window.location.href = "/notes"
  },

});

// Initialize the tour
tour.init();

    $('#tour-go').click(function () {
        // Start the tour
        tour.restart();
    });

};
$(document).ready(ready);
$(document).on('page:load', ready);

