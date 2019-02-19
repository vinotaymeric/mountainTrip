const CardsHover = () => {
  const card = document.querySelector('.card')

  const cardUser = document.querySelector('.card-user')
  const cardDescription = document.querySelector('.card-description')
  const cardCategory = document.querySelector('.card-category')

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


}
export default CardsHover;
