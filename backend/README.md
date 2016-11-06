# Cornell Tech + Bloomberg Core Financial Apps
## Company Challenge:
How might we notify grocery buyers of Food and Drug Administration (FDA) food recalls faster and more pervasively than the ineffective and bureaucratic status quo, preventing consumer illness and deaths and saving companies millions in fees and recall costs.
***
# KitchenCop
This is the backend implementation of our app KithenCop using Ruby on Rails. See [documents](https://github.com/amberMZ/bloomberg_fda/tree/master/document) for more detail. 

# Testing
Please use the [Admin Panel](https://kitchencop.herokuapp.com) on Heroku for testing. See full list of [routes](https://github.com/amberMZ/bloomberg_fda/blob/master/document/routes.txt).


For example, to test creating a new `Product`, use the `New Product` button or use the batch upload text field to create multiple `Product`s with JSON formatted as the placeholder. A [JSON formatter](https://jsonformatter.curiousconcept.com/) would be helpful.


To get data from the backend, attach `.json` to the end of the url and it will return a JSON object. 
