// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

import "bootstrap";
import "../plugins/flatpickr"
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { flatpickr } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  flatpickr(".datepicker", {});
});

const batch = 'the-spot'; // change to your own batch id
const baseUrl = `https://wagon-chat.herokuapp.com/${batch}/messages`;

// Your turn to code!
const clearMessages = () => {
  document.querySelectorAll("li").forEach((elem) => {
    elem.remove();
  });
};

const addMessage = (message, author, date) => {
  const time = Math.round((Date.now() - new Date(date)) / 60000);
  document.querySelector(".list-unstyled").insertAdjacentHTML("afterbegin", `<li><b>${author}</b> : ${message}`);
};

document.getElementById('comment-form').addEventListener("submit", (event) => {
  event.preventDefault();

  const message = document.getElementById("your-message").value;
  const name = document.getElementById("your-name").value;

  fetch(`${baseUrl}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ author: name, content: message })
  })
    .then(response => response.json())
    .then((data) => {
      addMessage(data.content, data.author, data.created_at);
    });
});

const refresh = () => {
  fetch(`${baseUrl}`)
    .then(response => response.json())
    .then((data) => {
      clearMessages();
      data.messages.forEach((message) => {
        addMessage(message.content, message.author, message.created_at);
      });
    });
};

document.addEventListener('turbolinks:load', () => {
  setInterval(refresh, 1000);
});


const button = document.getElementById("chat-button");
console.log(button);

const chatDiv = document.getElementById("chatroom");

button.addEventListener('click', (event) => {
  console.log("hello");
  chatDiv.classList.toggle("chatroom-display");
})
