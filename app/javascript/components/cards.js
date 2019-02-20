const CardsHover = () => {
  const cards = document.querySelectorAll('.card')

  if (cards==null) {return;}

  cards.forEach((card) => {
    const cardUserAvatar = card.querySelector('.card-user-avatar')
    const cardIcon = card.querySelector('.card-icon')
    const cardDescription = card.querySelector('.card-description')
    const cardCategory = card.querySelector('.card-category')
    const cardText = card.querySelector('.card-comment')

    card.onmouseover = (e) => {
      cardUserAvatar.classList.remove("card-element-invisible");
      cardCategory.classList.remove("card-element-invisible");
      cardDescription.classList.add("card-element-up");
      cardText.classList.remove("card-element-invisible");
      cardIcon.classList.remove("card-element-invisible");
    }

    card.onmouseout= (e) => {
      cardUserAvatar.classList.add("card-element-invisible");
      cardCategory.classList.add("card-element-invisible");
      cardDescription.classList.remove("card-element-up");
      cardText.classList.add("card-element-invisible");
      cardIcon.classList.add("card-element-invisible");
    }
  });

}
export default CardsHover;
