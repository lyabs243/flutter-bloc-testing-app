# Flutter bloc - testing-app

A simple more / less game with weather and time feature to learn well Flutter bloc library.
The app has following features:

<h2>Principles</h2>

A small game of plus or minus, the principle is that the application will generate a random number between 1 and 500, and the objective of the user will be to find this number through a small edit text where he will type the number and will validate it, he will have up to 5 tries, if he finds the number or his tries are over, the game will end and he can replay, if the number is greater than the one sought, the app will display smaller, if it's small, the app will display greater.

This application will have two languages: English and French, the application will have two themes: light and dark, the language and theme values will persist even if the application is closed.

This app will come with a special feature which displays the weather of the user's location using open weather map, if app fails to retrieve the weather, at the weather part there will be a message telling this to the user, while app is reloading the weather, there will be a circular progress to indicate this, if the user has not given permission to access the location there will be a message on the weather part, for all these messages there will be a button which will give the possibility to try again. Note that the weather will load when opening the application and each time the user starts a new game.

The application will display in the left corner the number of lives when the game is running and the time of the device which will change every second in the right corner.
