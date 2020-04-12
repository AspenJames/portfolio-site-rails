const bgButtons = document.querySelectorAll("button.backgroundToggle");

bgButtons.forEach((button) => {
  button.addEventListener("click", removeBackground);
});

function removeBackground(event) {
  const button = event.target;
  const photoUrl = button.parentElement.dataset.backgroundImage;
  const blackTextElements = [...document.querySelectorAll(".black")];
  const divArr = [...document.querySelectorAll("div")];
  const currentDiv = divArr.filter(
    (div) =>
      div.style.backgroundImage &&
      div.style.backgroundImage === `url("${photoUrl}")`
  )[0];

  currentDiv.style.backgroundImage = "none";
  blackTextElements.forEach((el) => el.classList.remove("black"));
  button.removeEventListener("click", removeBackground);
  button.addEventListener("click", addBackground);
  button.innerText = "Bring the photo back";

  function addBackground() {
    currentDiv.style.backgroundImage = `url("${photoUrl}")`;
    blackTextElements.forEach((el) => el.classList.add("black"));
    button.removeEventListener("click", addBackground);
    button.addEventListener("click", removeBackground);
    button.innerText = "I can't read this";
  }
}
