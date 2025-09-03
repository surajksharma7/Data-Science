from selenium import webdriver
from selenium.webdriver.chrome.service import Service

s = Service()

webdriver.Chrome(service= s )