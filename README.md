# Jupyter Data Exploration podman image
### Podman image intended to be used as base for data exploration tasks with python and jupyter.

Clone or download the repo as a zip and expand into a new directory.      
Go trough each file and fill in the credentials.      
Use `python jpwd.py` in the jpwd dir to generate credentials.          

<br>

Change to the new directory and do:       
`podman-compose build`            
Wait for the image to finish.

<br>

New image will show up on `podman image list`     
to test do:        
`podman run -it -p 8888:8888 --name jupyter-explore IMAGE_NAME_OR_ID`

to run unattended do:        
`podman run -id -p 8888:8888 --name jupyter-explore IMAGE_NAME_OR_ID`

A Jupyter notebook will be running at `https://127.0.0.1:8888`
