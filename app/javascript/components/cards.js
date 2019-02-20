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
      if (cardUserAvatar!=null) {cardUserAvatar.classList.remove("card-element-invisible")};
      if (cardCategory!=null) {cardCategory.classList.remove("card-element-invisible")};
      if (cardDescription!=null) {cardDescription.classList.add("card-element-up")};
      if (cardText!=null) {cardText.classList.remove("card-element-invisible")};
      if (cardIcon!=null) {cardIcon.classList.remove("card-element-invisible")};
    }

    card.onmouseout= (e) => {
      if (cardUserAvatar!=null) {cardUserAvatar.classList.add("card-element-invisible")};
      if (cardCategory!=null) {cardCategory.classList.add("card-element-invisible")};
      if (cardDescription!=null) {cardDescription.classList.remove("card-element-up")};
      if (cardText!=null) {cardText.classList.add("card-element-invisible")};
      if (cardIcon!=null) {cardIcon.classList.add("card-element-invisible")};
    }
  });

}
export default CardsHover;
