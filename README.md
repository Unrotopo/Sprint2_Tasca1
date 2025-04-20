📊 Projecte de Bases de Dades - Exercicis SQL
Aquest repositori conté diversos exercicis de modelatge de bases de dades amb enfocament pràctic. Cada nivell representa un escenari del món real on s'ha de dissenyar l'estructura de la base de dades tenint en compte les relacions i les dependències entre dades.

📂 Contingut
Nivell 1
🕶️ Exercici 1 - Òptica "Cul d'Ampolla"
Disseny d'una base de dades per gestionar una òptica que vol informatitzar la gestió de clients/es i vendes d’ulleres.

Informació emmagatzemada:

Proveïdors:

Nom, adreça completa, telèfon, fax, NIF.

Ulleres:

Marca, graduació dels vidres, tipus i color de muntura, color dels vidres, preu.

Clients/es:

Nom, adreça, telèfon, correu electrònic, data de registre, client/a recomanador/a.

Empleats/des:

Vinculació amb la venda de cada ullera.

🍕 Exercici 2 - Pizzeria Online
Modelatge d’una base de dades per a una aplicació web que permet fer comandes de menjar a domicili o recollida en botiga.

Informació emmagatzemada:

Clients/es: Nom, cognoms, adreça, localitat, província, telèfon.

Localitats i Províncies: Estructura jeràrquica separada en dues taules.

Comandes:

Data/hora, tipus (domicili o recollida), productes, preu total.

Productes: Pizzes, hamburgueses i begudes (nom, descripció, imatge, preu).

Categories de pizza: Les pizzes pertanyen a una categoria.

Botigues: Ubicació (adreça, localitat, província), gestió de comandes.

Empleats/des: Nom, cognoms, NIF, telèfon, rol (cuiner/a o repartidor/a), vinculat al lliurament.

Nivell 2
📺 Exercici 1 - YouTube (Versió reduïda)
Modelatge d’una base de dades simplificada per a una plataforma de vídeos.

Informació emmagatzemada:

Usuaris/es:

Email, contrasenya, nom d’usuari/ària, data de naixement, sexe, país, codi postal.

Vídeos:

Títol, descripció, mida, arxiu, durada, thumbnail, reproduccions, likes/dislikes, estat (públic/ocult/privat), etiquetes, data/hora de publicació, usuari/ària que el publica.

Canals:

Nom, descripció, data de creació. Creats per usuaris/es.

Subscripcions:

Usuaris/es poden seguir canals d'altres.

Playlists:

Nom, data de creació, estat (pública/privada).

Comentaris:

Text, data/hora, likes/dislikes per part d'altres usuaris/es.

📘 Tecnologies
MySQL / SQL

Modelatge ER i normalització

Disseny de bases de dades relacionals

🧠 Objectius del Projecte
Entendre i aplicar les regles de normalització de bases de dades.

Dissenyar estructures de dades realistes i funcionals.

Dominar les relacions entre entitats (1:N, N:M).

Representar escenaris reals en forma de models de dades.

✅ Estat del projecte
🚧 En desenvolupament: cada exercici es completa progressivament amb la seva documentació i scripts SQL corresponents.
