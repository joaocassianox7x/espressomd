FROM ghcr.io/espressomd/docker/ubuntu-22.04:cb0a2886ebd6a4fbd372503d7b46fc05fb1da5d5

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow


RUN git clone https://github.com/espressomd/espresso.git
ADD install.sh .
RUN bash install.sh

RUN pip3 install --user nbformat notebook 'jupyter_contrib_nbextensions==0.5.1'
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable rubberband/main
RUN jupyter nbextension enable exercise2/main
RUN pip3 install --user nbformat notebook jupyterlab
RUN pip install -U "jupyter-server<2.0.0"

RUN cp espresso/build/ipypresso .
RUN mkdir -p data
CMD ["./ipypresso","notebook","--no-browser","--allow-root","--ip='0.0.0.0'"]
