const CardsItiHover = () => {
  const cardsIti = document.querySelectorAll('.card-iti')

  if (cardsIti==null) {return;}

  cardsIti.forEach((card) => {
    const cardItiDescription = card.querySelector('.card-iti-description')
    // const cardCategory = card.querySelector('.card-iti-category')



    card.onmouseover = (e) => {
      // if (cardCategory!=null) {cardCategory.classList.remove("card-element-invisible")};
      if (cardItiDescription!=null) {cardItiDescription.classList.add("card-iti-element-up")};
      if (cardItiDescription!=null) {cardItiDescription.classList.remove("card-iti-element-invisible")};
    }

    card.onmouseout= (e) => {

      // if (cardCategory!=null) {cardCategory.classList.add("card-element-invisible")};
      if (cardItiDescription!=null) {cardItiDescription.classList.remove("card-iti-element-up")};
      if (cardItiDescription!=null) {cardItiDescription.classList.add("card-iti-element-invisible")};

    }
  });

}
export default CardsItiHover;
