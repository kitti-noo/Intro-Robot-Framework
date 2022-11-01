# Robot Framework

## Installation
- python (recommended version = 3.9(++))
- pip install robotframework
- robot --version

## Execute by tag
- robot -d {{result directory}} -v browser:${browser} -i {{tag_name}} file.robot

## Execute by test name
- robot -d {{result directory}} -v browser:${browser} -t "{{test name}}" file.robot

Execute by test suite
- robot -d {{result directory}} -v browser:${browser} file.robot
