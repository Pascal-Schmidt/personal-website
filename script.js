let elements = document.getElementById('active-buttons').querySelectorAll('ul, li, a');

elements.forEach(i => {
  i.addEventListener('click', function(e) {
    document.querySelector(".sidenav a.active-list").classList.remove("active-list");
    e.target.classList.add('active-list');
    
  });
});

