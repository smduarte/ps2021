# PStr 2021 - Lab 3
## Spark Structured streaming

[Notebook with Lecture examples](https://nbviewer.jupyter.org/github/smduarte/ps2021/blob/master/lab3/ProStr2021_Lecture3.ipynb)

[Structured Programing Exercises](https://nbviewer.jupyter.org/github/smduarte/ps2021/blob/master/lab3/ProStr2021_Lab3.ipynb)


## Docker image for Jupyter Lab, with Google Drive support.

Use @campus.fct.unl.pt account to mount google drive.

Atualizar a imagem:

`docker pull smduarte/ps2021-jupyterlab`

Correr a imagem:

`docker run --network psnet -p 8888:8888 -p 8080:8080 smduarte/ps2021-jupyterlab`
