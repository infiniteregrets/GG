# GG

Automating the Set Card Game, but literally!

## About

This script goes to <https://www.setgame.com/set/puzzle> and solves the daily challenge without even requiring a single keypress. We make a simple GET request to the game website and fetch the daily image indexes of the daily challenge. All images present in the daily challenge are encoded at a certain index, but we don't hardcode this. Just looking at the indices, we can easily figure the pattern and put the card attributes in a particular fashion and have a loop do a local encoding for us.

Using the card encoding, we decode the given cards for the day and solve them using the following criteria:

- They all have the same number or have three different numbers.
- They all have the same shape or have three different shapes.
- They all have the same shading or have three different shadings.
- They all have the same color or have three different colors.

For more information refer to the wiki page: <https://en.wikipedia.org/wiki/Set_(card_game)>

After solving the game we use selenium to automate the daily challenge for us, i.e. we fetch the cards by their xpath and just click on them with a time lapse for the elements to load nicely.

## Why?

I don't know. This game has amazed me, bothered me, given me sleepless nights, challenged me and what not. Almost an year and a half ago, I tried to figure out how I could generate all posible sets to ever exist, which would be to generate all possible sets from 81C12 -> 12C3, but just couldn't figure out how I could do that. This problem is commonly known as generating subsets of size k. While being familiar with the idea of power sets, I used the filter function to get the subsets of size 3 but little did I know about the time complexity or even had the idea about the recursion involved in generating the power set.

Haskell solution of generating all sets of size k: [./sets.hs](Sets.hs)

Looking back, I have learnt a lot and this little script is sort of a milestone for me and very close to my heart.

## Credits

Thank you Alice!
