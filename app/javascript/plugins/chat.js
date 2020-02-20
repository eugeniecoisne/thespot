const batch = 'the-spot'; // change to your own batch id
const baseUrl = `https://wagon-chat.herokuapp.com/${batch}/messages`;

// Your turn to code!
const runChat = () => {
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
};
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

export { runChat, refresh };
