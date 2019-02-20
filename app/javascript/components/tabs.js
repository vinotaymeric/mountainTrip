const initTabs = () => {
  const tabList = document.querySelector('#tab-list');
  const tabMap = document.querySelector('#tab-map');
  if ((tabList == null) || (tabMap == null)) {
    return ;
  }

  const contentList = document.querySelector('#content-list');
  const contentMap = document.querySelector('#content-map');

 tabList.addEventListener('click', function(event) {
  if (contentList.hidden == true) {
    console.log("coucou")
    tabList.classList.toggle("active");
    tabMap.classList.toggle("active");
    contentList.hidden = false;
    contentMap.hidden = true;
  }
 });

 tabMap.addEventListener('click', function(event) {
  if (contentList.hidden == false) {
    tabList.classList.toggle("active");
    tabMap.classList.toggle("active");
    contentList.hidden = true;
    contentMap.hidden = false;
  }
 });
}

export default initTabs;