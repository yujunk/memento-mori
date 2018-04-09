# DEAR NEXT ASSESSOR:

####CONTEXT:
* I am going to work on this project beyond the scope of this assessment, which is why my site has the current set up it has. 
* It is supposed to be a clone/adaptation of an existing site. I will send you log in details separately. One login is for Testator (person writing will), and the other for Deputy (person who has been assigned by Testator to view their entry).
* I have some questions (in section below) to ask during the assessment, as I would like to source for opinions before I begin my next features.
* I finished my assessment requirements on Saturday evening, but began to work a little on other features after. Please use this commit for the assessment as it is the version that is also deployed on Heroku: https://github.com/yujunk/memento-mori/tree/fc68c8da857205a701700f3c174b307118a09701
* Heroku link: https://mementomori.herokuapp.com/

####ASSESSMENT CRITERIA:
* *CONTACTS* & *ADVISORY* are the main pages for evaluation.
* *DIFFERENT USER VIEWS* are available - only visible changes is that Sidebar will have less links for Deputy role.
* I only made *one Model Rspec* instead of the two Models required as I only have one Model (User) that can be used for the assessment criteria. I attempted to make *two Integration Rspecs* to make up for it but got slightly stuck on the 2nd one though I think I know what the problem is now after talking to Sheng this morning. Hope that's ok.
... Completed Integration spec: contacts_spec.rb
... Incomplete: sign_ups_spec.rb

####QUESTIONS FOR DISCUSSION:
1. **Best way to handle Testator and Deputies**
Objective: To achieve the two VERY different views for Testator and Deputy.
a) I currently am using enums but I don't think it is appropriate (please see the site I want to clone). Should I use Single Table Inheritance to achieve this or perhaps separate Testator & Deputy tables?
b) If STI is appropriate, I still am not too sure how to manage an association between Deputy & Testator. Do I add a foreign key onto the User table, but assign foreign key to itself?
c) Before settling on enums for the purpose of this assessment, I tried STI *type* but wanted to assign enums to this type but got an error as described in: https://github.com/rails/rails/issues/14136 - Is there a way to include enums in STI *type*?
d) If I have the current set up now where I am using enums, would it be possible for me to have a Testator class and Deputy class inherit from User class? 

2. **Best way to store multiple documents**
If I have multiple documents that I want to upload per line item in the **vital_documents** table, would you advice that I (a) create a json array column? or (b) create a separate **documents_uploaded** table with a one-to-many relationship to **vital_documents**?

3. **How to implement Google Places API in relation to Maps API**
Should I put both scripts in as in what I have done (one is commented out)? I surprisingly can't find any documentations on this but maybe I am not looking at the right places:
-- Location: /views/advisory/index.html.erb (line 12-17)
-- Objective: Is to access these (so like ALL listed lawyers offices in an area where the user is located: https://developers.google.com/places/web-service/supported_types

4. **Best way to achieve next view for a form**
Please view the site I want to clone. If you go into "About Me" section and "Vital Documentation - Add Another", a Modal pops up for inputting information. The form then changes with different entry details when you select different document types. 
a) Is the form fields loaded via AJAX? 
b) If I want to break up my form fields into different sections and have the user click 'Next' on the modal, is that done via AJAX too?
c) Can I have a rendered partial view call upon another partial view? Example:
-- \_addvitaldocuments.html.erb
-- once javascript works properly, goes to: \_ajax_form.html.erb
d) What sort of keywords should I use to look up how to achieve this?

First attempt can be seen in **this** version of the commit: 
-- JS event listener: assets/javascripts/vital_documents.js

5. **How to use pg_search scopes for a more "elastic" search**
I have currently used SQL syntax for my search in Contacts because it is more elastic in searching for all types of results. However, initially, I was trying to experiment with pg_search to achieve same results but failed. How do I go about this with pg_search?