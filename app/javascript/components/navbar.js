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
    }
     else if ((document.body.getBoundingClientRect()).top > scrollPos){
      navbar.classList.remove("navbar-invisible");

    } else  {
      navbar.classList.add("navbar-invisible")
    }
    scrollPos = (document.body.getBoundingClientRect()).top;
  })
}

const fixNavbar = () => {
  const form = document.querySelector('.form-container')
  const navbar = document.querySelector('.navbar-mountain')
  if (form == null) {
    navbar.classList.add("fixed-navbar")
    navbar.insertAdjacentHTML('afterend', '<div style="height: 72px;"><div>') ;
  }
}

export { InitUpdateNavbar, fixNavbar};

