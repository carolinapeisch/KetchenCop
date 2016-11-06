# Database Schema
Here are the main indentities of the databas.

* product(name, upc_code?, product_code?, sell_by_date?, image?)

A `Product` may be created when the user makes a new pruchase containing a product or FDA issues a new recall on a product that has not been included in our database. 

* purchase(product(s), region_id, user_id, date)

A `Purchase` can contain a list of `Product`s and our frontend will record the time and location of the purchase then pushes that information along with the list of `Product`s

* recall(product_id, reason, class, region, company contact, date)

A `Recall` is based on web scrapping the [FDA immediate release](http://www.fda.gov/Safety/Recalls/ArchiveRecalls/2016/default.html) page. We are currently using a Ruby gem [Nokogiri](http://www.nokogiri.org/) for searching and parsing HTML. We are reaching our bottleneck because of lacking NLP technology to extract information we want including name of product, UPC code(if not exist there must be an expiration date), region of recall(optional), class of recall(optional) and a image of the product(optional). 

Not every recall article on the FDA site has the same format. Idealy it will come with a UPC code but if not it should at least contain an expiration date and we will classify all products has the same name and expiration date as "recalled".

The `Recall` database is updated every day at noon via another Ruby gem [Rufus Scheduler](https://github.com/jmettraux/rufus-scheduler) to check for new recalls. 

* users(contact_id)

The contact info provided by the user. Could be email or phone.

* ER diagram

A rough ER diagram is shown below:
Blue attributes are obtained from the FDA site and yellow attributes are from the mobile front end. The green attributes can be from both sources.
![alt text](https://github.com/amberMZ/bloomberg_fda/blob/master/document/ERdiagram.png "ER diagram")
