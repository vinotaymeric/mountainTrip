Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


## authentification avant création trip 
# à ajouter au controller trip 
before_action :authenticate_user!

## generation  des vues du user 
`rails generate devise:views users`