import requests
from bs4 import BeautifulSoup
import itertools
from selenium import webdriver
import time

game_url = "https://www.setgame.com/set/puzzle"
page = requests.get(game_url)
soup = BeautifulSoup(page.text, "html.parser")
nums = list(
    map(
        lambda x: int("".join(x)),
        list(
            map(
                lambda x: list(filter(str.isdigit, x)),
                list(
                    map(
                        lambda x: x.a.img["src"],
                        soup.find_all("div", {"class": "set-card-td"}),
                    )
                ),
            )
        ),
    )
)
colors = ["R", "P", "G"]
shapes = ["S", "D", "O"]
numbers = [1, 2, 3]
shadings = ["SO", "ST", "OP"]


class Card:
    def __init__(self, color, number, shape, shading, index):
        self.color = color
        self.number = number
        self.shape = shape
        self.shading = shading
        self.index = index


cards = []
index = 0
for color in colors:
    for number in numbers:
        for shape in shapes:
            for shading in shadings:
                index += 1
                card = Card(color, number, shape, shading, index)
                cards.append(card)
do_cards = [cards[i - 1] for i in nums]

subsets = list(itertools.combinations(do_cards, 3))
desugar = list(
    map(
        lambda x: list(zip(*list(map(lambda y: list(y.__dict__.values()), x)))), subsets
    )
)
clickable = list(
    filter(
        lambda x: all(
            list(map(lambda y: (len(y) == len(set(y))) or (len(set(y)) == 1), x[0:-1]))
        ),
        desugar,
    )
)
result = list(map(lambda x: list(map(lambda y: nums.index(y) + 1, x[-1])), clickable))
driver = webdriver.Chrome()
driver.get("https://www.setgame.com/set/puzzle")
for i in result:
    for j in i:
        driver.find_element_by_xpath(
            f'//*[@id="block-system-main"]/div/center/form/table/tbody/tr[1]/td[1]/table/tbody/tr[1]/td/div[{str(j)}]/a/img'
        ).click()
        time.sleep(0.3)
    time.sleep(0.3)
