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
  const logo = document.querySelector('.navbar-mountain.navbar-fixed-top.fixed-navbar')
  const form = document.querySelector('.form-container')
  const navbar = document.querySelector('.navbar-mountain')
  const links = document.querySelectorAll('.navbar-mountain-link')
  if (form == null) {
    console.log("je suis là")
    navbar.classList.add("fixed-navbar")
    links.forEach((link) => {link.classList.add("grey")});
    navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"> <img src="../../assets/images/logo-mountain.png" ></a>');
    navbar.insertAdjacentHTML('afterend', '<div style="height: 72px;"><div>') ;
  }
  else {
    console.log("je suis là")
    navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"><img src="/../../../assets/images/logo-mountain-white.png" ></a>');
  }
}

export { InitUpdateNavbar, fixNavbar};

