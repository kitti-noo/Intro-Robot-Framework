# Robot Framework

## Installation

```
python (recommended version = 3.9(++))
pip install robotframework
robot --version
```

**For Selenium Library**

```
pip install robotframework-seleniumlibrary or pip install -r requirements.txt
```

**For Puppeteer Library + Playwright**

```
pip install --upgrade robotframework-puppeteerlibrary
python -m playwright install
pyppeteer-install
```

## Execute by tag

- robot -d {{result directory}} -v browser:${browser} -i {{tag_name}} file.robot

## Execute by test name

- robot -d {{result directory}} -v browser:${browser} -t "{{test name}}" file.robot

Execute by test suite

- robot -d {{result directory}} -v browser:${browser} file.robotpip install --upgrade robotframework-puppeteerlibrary

python -m playwright install
pyppeteer-install
