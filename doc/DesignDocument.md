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
![alt text](https://raw.github.com/Xander1989/UvAcourses/master/doc/voorbeeld2.jpg)


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

