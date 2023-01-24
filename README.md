# espressomd
A docker to espressoMD package 

First, build the image with :

```bash
docker build .
```

To run, just 

```bash
docker run -it -p 8888:8888/tcp 922e114e2e81 /bin/bash
```