# HAI-Learning
The microservice for executing First-Order-Logic commands generated by LLMs

## 📚 Papers

In case you use any of the components for your research, please refer to (and cite) the papers:

[Creating Local World Models using LLMs.](https://aile3.ijs.si/dunja/SiKDD2024/Papers/IS2024_-_SIKDD_2024_paper_22.pdf) M. D. Longar, E. Novak, M. Grobelnik. Slovenian KDD Conference, Ljubljana, 2024.


## ☑️ Requirements

Before starting the project make sure these requirements are available:

- [python]. For running the app. Alternatively, one can use conda (see next point).
- [prolog](https://www.swi-prolog.org/). For executing the logic commands.
- [conda]. For setting up your research environment and python dependencies.
- [git]. For versioning your code.

This app was developed and tested using Python 3.10 and Prolog 9.2.5. 

## 🛠️ Setup

### Create a python environment

First create the virtual environment where the service will store all the modules.

#### Using venv

Using the `venv` command, run the following commands:

```bash
# create a new virtual environment
python -m venv venv

# activate the environment (UNIX)
. ./venv/bin/activate

# activate the environment (WINDOWS)
./venv/Scripts/activate

# deactivate the environment (UNIX & WINDOWS)
deactivate
```

#### Using conda

Install [conda], a program for creating python virtual environments. Then run the following commands:

```bash
# create a new virtual environment
conda create --name hai-learning python=3.10 pip

# activate the environment
conda activate hai-learning

# deactivate the environment
deactivate
```

### Install

To install the project run

```bash
pip install -e .
```

## 🏗️ Development

To start the app in development mode, run the following command in the terminal:

```bash
uvicorn app.main:app --port 4000 --reload
```

This will start the app and listen it on port 4000.

### API Docs

To see the API documentation, visit either:

| URL                         | Description                                         |
| --------------------------- | --------------------------------------------------- |
| http://127.0.0.1:4000/docs  | Automatic iteractive API documentation (Swagger UI) |
| http://127.0.0.1:4000/redoc | Alternative automatic documentation (ReDoc)         |

## 🐳 Dockerize

To dockerize the REST API, run the following command:

```bash
# build the docker image
docker build -t hai-learning .

# run the docker container
docker run -d --name hai-learning -p 4000:4000 hai-learning
```

To change the port number, modify the last line of the `Dockerfile` file.


[python]: https://www.python.org/
[conda]: https://www.anaconda.com/
[git]: https://git-scm.com/


