const CardsHover = () => {
  const cards = document.querySelectorAll('.card')

  cards.forEach((card) => {
    const cardUser = card.querySelector('.card-user')
    const cardDescription = card.querySelector('.card-description')
    const cardCategory = card.querySelector('.card-category')
    const cardText = card.querySelector('.card-comment')

    card.onmouseover = (e) => {
      cardUser.classList.remove("card-element-invisible");
      cardCategory.classList.remove("card-element-invisible");
      cardDescription.classList.add("card-element-up");
      cardText.classList.remove("card-element-invisible");
    }

    card.onmouseout= (e) => {
      cardUser.classList.add("card-element-invisible");
      cardCategory.classList.add("card-element-invisible");
      cardDescription.classList.remove("card-element-up");
      cardText.classList.add("card-element-invisible");
    }
  });

}
export default CardsHover;
