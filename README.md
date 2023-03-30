# espressomd
A docker to espressoMD package 

First, build the image with :

```bash
docker build .
```

Before run the docker image, let's create a volume to share data between docker and your pc kernel

```bash
mkdir data
```

Now, to run, just 

```bash
docker run -it -p 8888:8888/tcp -v ./data:~/data image_id /bin/bash
```

Now, just need to run inside your container the command

```bash
jupyter-notebook --no-browser --port 8888
```
