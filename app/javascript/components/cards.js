const CardsHover = () => {
  const cards = document.querySelectorAll('.card')

  cards.forEach((card) => {
    const cardUser = card.querySelector('.card-user')
    const cardDescription = card.querySelector('.card-description')
    const cardCategory = card.querySelector('.card-category')

    card.onmouseover = (e) => {
      cardUser.classList.remove("card-element-invisible");
      cardCategory.classList.remove("card-element-invisible");
      cardDescription.classList.add("card-element-up");
    }

    card.onmouseout= (e) => {
      cardUser.classList.add("card-element-invisible");
      cardCategory.classList.add("card-element-invisible");
      cardDescription.classList.remove("card-element-up");
    }
  });

}
export default CardsHover;
