import math
import os
import random
import re
import sys

cwd = os.getcwd()
sys.path.append(f"{cwd}\\venv")
sys.path.append(f"{cwd}\\venv\\Lib\\site-packages")

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options

options = Options()
options.add_argument("--headless")
driver = webdriver.Firefox(options=options)
driver.get("https://www.goodreads.com/review/list/151261743-cat?shelf=wtb")

selected_shelf = driver.find_element(By.CLASS_NAME, "selectedShelf")
number_of_books = int(re.search(r"\((.*?)\)", selected_shelf.text).group(1))
book_number = random.randint(1, number_of_books)

page_number = math.ceil(book_number / 20)
pages = driver.find_element(By.ID, "reviewPagination").find_elements(By.XPATH, "*")[1:-1]
page = pages[page_number - 1]
if page.tag_name == "a":
    page_link = page.get_attribute("href")
    driver.get(page_link)

book_number_on_page = book_number % 20
books = driver.find_element(By.XPATH, '//*[@id="booksBody"]').find_elements(By.TAG_NAME, "tr")
book = books[book_number_on_page - 1]
book_link = book.find_element(By.CLASS_NAME, "field.title").find_element(By.CLASS_NAME, "value").find_element(
    By.TAG_NAME, "a").get_attribute("href")
driver.close()
print(book_link)
