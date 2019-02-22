const logo = document.querySelector('.navbar-mountain.navbar-fixed-top.fixed-navbar');
const links = document.querySelectorAll('.navbar-mountain-link');
const navbar = document.querySelector('.navbar-mountain');

const greyLogo = () => {
  links.forEach((link) => {link.classList.add("grey")});
  navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"> <img src="https://res.cloudinary.com/dzxrdf9za/image/upload/v1550791855/logo-mountain.png" ></a>');
}

const whiteLogo = () => {
  navbar.insertAdjacentHTML('afterbegin', '<a href="/" class="navbar-mountain-logo"><img src="https://res.cloudinary.com/dzxrdf9za/image/upload/v1550791855/logo-mountain-white.png" ></a>');
}

const InitUpdateNavbar = () => {
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
  const form = document.querySelector('.my-form')
  console.log(form==null)
  if (form == null) {
    navbar.classList.add("fixed-navbar");
    navbar.insertAdjacentHTML('afterend', '<div style="height: 72px;"><div>') ;
    greyLogo();
  }
  else {
    whiteLogo();
  }
}

export { InitUpdateNavbar, fixNavbar, whiteLogo, greyLogo};

