# GG

Automating the Set Card Game, but literally!

## About

This script goes to <https://www.setgame.com/set/puzzle> and solves the daily challenge without even requiring a single keypress. We make a simple GET request to the game website and fetch the daily image indexes of the daily challenge. All images present in the daily challenge are encoded at a certain index, but we don't hardcode this. Just looking at the indices, we can easily figure the pattern and put the card attributes in a particular fashion.

Using the card encoding, we fetch the given cards for the day and solve them using the following criteria:

- They all have the same number or have three different numbers.
- They all have the same shape or have three different shapes.
- They all have the same shading or have three different shadings.
- They all have the same color or have three different colors.

For more information refer to the wiki page: <https://en.wikipedia.org/wiki/Set_(card_game)>

After solving the game we use selenium to automate the daily challenge for us, i.e. we fetch the cards by their xpath and just click on them with a time lapse for the elements to load nicely.
