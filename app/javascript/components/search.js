const algoliaSearch = document.querySelector("#algoliaSearch");

var client = algoliasearch("3RYHYKB43F", "3a905383f2fa9939638d31ce42c7e063");
var index = client.initIndex('Itinerary');
index.search('something', { hitsPerPage: 10, page: 0 })
  .then(function searchDone(content) {
    console.log(content)
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });

const grid = document.querySelector(".row");

const html = (json) => {
const new_html = `
      <div class="col-xs-12 col-sm-6 col-md-4">
        <div class="card" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('${json.picture_url}');">
          <a class="card-link" href="/itineraries/${json.id}"></a>
          <div class="card-category card-element-invisible">Popular</div>
          <div class="card-description">
            <div class="card-infos">
              <h2>${json.title}</h2>
              <a class="card-link" href="/itineraries/${json.id}"></a>
                  <p>${json.activities}</p>
            </div>
          </div>
        </div>
      </div>`;
  return new_html;
    };


const  addItineraryCard = (json) => {
  grid.insertAdjacentHTML('beforeend', html(json));
};


const search = () => {
  algoliaSearch.addEventListener('keyup', (event) => {
    grid.innerHTML = "";
    var keyword = event.currentTarget.value;
    index.search(keyword, function(err, content) {

      content.hits.forEach(element => {
       addItineraryCard(element)
     });

    });
  });
}

export default search;



// function getUrlVars() {
//     var vars = {};
//     var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
//         vars[key] = value;
//     });
//     return vars;
// }

// console.log(getUrlVars());
