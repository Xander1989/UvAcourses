UvAcourses
==========

De app UvAcourses is bedoelt voor studenten van de UvA. Het idee is dat de studenten zich kunnen registreren met hun eigen studentennummer en email adres en vervolgens met de app kunnen browsen door de verschillende faculateiten en de alle vakken(courses) die daar gegeven worden.
Student kunnen vervolgens deze vakken in een winkel toevoegen aan hun profiel waarmee ze dus op een simpele manier kunnen bijhouden welke vakken ze volgen. Daarbij wordt er een onderscheid gemaakt tussen vakken die men op het moment aan het volgens is (courses i'm taking) en vakken die men eventueel wil gaan volgens (courses i m shopping).
De app bevat verder alle informatie van vakken zoals:

- name
- vak code
- ects
- jaar
- periode waarin het gegeven wordt
- instituut waaraan het gegeven wordt
- omschrijving
- timetable
- college materiaal
- leer doelen
- deelname cijfers
- bijzonderheden 

Structuur
=========

De volgende punten zullen behandeld worden in de structuur:

- Algehele structuur van de pagina's
- De onderliggende structuur van de pagina's (classes, methods, etc.)
- Opzet en inhoud van de database

Pagina structuur
----------------

Er zijn in principe 2 mogelijkheden waarin de app zich kan bevinden.
- Niet ingelogde gebruiker
- Ingelogde gebruiker

### Niet ingelogde gebruiker

Dit is de basis van de website, alle pagina's die beschikbaar zijn op dit moment zijn voornamelijk statisch pagina's met basis informatie.
Het is op dit moment NIET mogelijk om door de verschillende vakken heen te zoeken/bladeren, hiervoor dient men zich eerst te registreren.




![alt text](https://raw.github.com/Xander1989/UvAcourses/master/doc/voorbeeld1.jpg)




### Ingelogde gebruiker

Wanneer een gebruiker zich heeft geregistreerd kan hij vervolgens inloggen.
De gebruiker wordt dan geforward naar zijn/haar persoonlijke pagina.
Op de persoonlijke pagina van elke gebruiker staat aangegeven welke courses hij volgt en eventueel wil gaan volgens:

- courses i'm shopping
- courses i'm taking
- recently viewed





![alt text](https://raw.github.com/Xander1989/UvAcourses/master/doc/voorbeeld2.jpg)



Onderliggende structuur
-----------------------

Er komen in totaal 4 classes:

- Static pages
- Users
- courses

### Static Pages


Dit zijn de pagina's die altijd beschikbaar zijn, of men nu ingelogd is of niet. deze zijn als volgt:

- Home
- Contact
- Help
- About

Voorbeeld van hoe dit eruit kan zien:

  	def home
  	end

  	def help
  	end

  	def contact
  	end

  	def about
  	end

### Users

Dit gaat om de studenten die gebruik zullen maken van de app.
De verschillende methods en hun return arguments zijn als volgt:

- Nieuwe user aanmaken
- Creëren van een user in de database
- Veranderen van het profiel van een user
- verwijderen van het profiel van een user
- Courses die een user volgt(courses i'm taking)
- Courses die een user wil volgens(courses i'm shopping)

Voorbeeld van hoe dit eruit kan zien:

  	def new
 		@user = User.new
  	end


	def create
		@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to UvAcourses!"
      redirect_to @user
    else
      render 'new'
     end
  	end 


	def edit
	end


	def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted."
      redirect_to users_url
  	end

	
	def take
	end


	def shop
	end

 
### Courses

Dit zijn de vakken die geregistreerde gebruikers moeten kunnen bekijken, volgen en shoppen(eventueel gaan volgen).
de Class courses zal de volgende methods krijgen:

- nieuwe course aanmaken
- laten zien van de courses in een tabel
- creëren van een course in de database
- aanpassen van een course (edit)
- updaten van een course
- verwijderen van een course

Alle gegevens van alle courses staan in  groot bestand wat eerst geupload wordt naar de database.
De benodigde gegevens voor een course worden dan d.m.v een get command verkregen.


Database
--

Er zullen 4 verschillende classes opgenomen worden in de database

- Users
- Courses
- Staff
- User_Courses

### Users
Users registreren zich d.m.v studienummer en email adres.
Er komen dus 3 dingen in de database te staan.

- ID
- Studienummer
- Email adres

### Courses
Alle informatie van alle courses staat verzameld in 1 bestand. Deze wordt opgedeeld in de database in de volgende dingen:

- naam
- acode
- code
- sgid
- ects
- jaar
- periode
- instituut
- omschrijving
- timetable
- lectura_material
- leer_doelen
- deelnemers_aantal
- bijzonderheden
- toetsing

###Staff

- ID
- name
- URL

### User_Courses

- User ID
- Course ID
- Courses being Shopped or taken

De relaties tussen de verschillende Database classes zijn als volgt:

- User has many 'courses i'm taking'
- User has many 'courses i'm shoping'
- Staff has many 'courses'
- Course belongs to 'Staff'
- User_Courses belongs to 'User'

Style guide
==

Er zal gebruikt gemaakt worden van de volgende [Style guide](
https://github.com/bbatsov/ruby-style-guide)


Voorbeeld:

 	# bad
   	def some_method()
   	  # body omitted
   	end

   	# good
  	 def some_method
   	 # body omitted
   	end

   	# bad
   	def some_method_with_arguments arg1, arg2
    # body omitted
   	end

   	# good
   	def some_method_with_arguments(arg1, arg2)
    # body omitted
   	end


