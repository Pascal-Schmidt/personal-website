function myFunction() {
  var element = document.getElementById("active-buttons");
  var btns = element.getElementsByTagNamegetElementsByTagName("li").getElementsByTagName("a");
  
  for (var i = 0; i < btns.length; i++) {
  
    btns[i].classList.remove("active");
  
  }
  
}