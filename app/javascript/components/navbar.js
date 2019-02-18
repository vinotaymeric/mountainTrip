const InitUpdateNavbar = () => {
  const navbar = document.querySelector('.navbar-mountain')

  if (navbar == null) {
    return ;
  }

  document.addEventListener('scroll', (e) => {
    console.log("je suis là")
    const intViewportHeight = window.innerHeight;

    if (window.scrollY < intViewportHeight/3) {
      navbar.classList.remove("navbar-mountain")
    } else {
      navbar.classList.add("navbar-mountain")
    }
  })
}

export default InitUpdateNavbar;

