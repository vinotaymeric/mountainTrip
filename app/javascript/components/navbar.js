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
  if (form == null) {
    console.log("je suis là")
    navbar.classList.add("fixed-navbar")
    navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"> <img src="https://www.dropbox.com/s/1uau2vsrtyss16f/logo-mountain.png?dl=0" ></a>');
    navbar.insertAdjacentHTML('afterend', '<div style="height: 72px;"><div>') ;
  }
  else {
    navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"><img src="https://www.dropbox.com/s/yfs5e12f5usgu2b/logo-mountain-white.png?dl=0" ></a>');
  }
}

export { InitUpdateNavbar, fixNavbar};

