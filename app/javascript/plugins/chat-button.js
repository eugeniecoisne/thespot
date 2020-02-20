const display = () => {
  const button = document.getElementById("chat-button");
  console.log(button);

  const chatDiv = document.getElementById("chatroom");

  button.addEventListener('click', (event) => {
    chatDiv.classList.toggle("chatroom-display");
  })
};

export { display };
