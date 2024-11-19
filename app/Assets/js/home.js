let mybutton = document.getElementById("myBtn");

window.onscroll = function () {
  if (window.scrollY > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "block";
  }
};

mybutton.addEventListener("click", function () {
  window.scrollTo({
    top: 0,
    behavior: "smooth", 
  });
});