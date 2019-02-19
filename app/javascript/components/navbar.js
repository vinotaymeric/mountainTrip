const InitUpdateNavbar = () => {
  const navbar = document.querySelector('.navbar-mountain')
  var scrollPos = 0;
  if (navbar == null) {
    return ;
  }

  document.addEventListener('scroll', (e) => {

    const intViewportHeight = window.innerHeight;
    if (window.scrollY < intViewportHeight/3) {
      navbar.classList.remove("navbar-invisible");
      navbar.classList.remove("navbar-green");
    }
     else if ((document.body.getBoundingClientRect()).top > scrollPos){
      navbar.classList.remove("navbar-invisible");
      navbar.classList.add("navbar-green")
    } else  {
      navbar.classList.add("navbar-invisible")
    }
    scrollPos = (document.body.getBoundingClientRect()).top;
  })
}

export default InitUpdateNavbar;

