FROM rkalyana/base-notebook
MAINTAINER Rajesh Kalyanam <rkalyanapurdue@gmail.com>

# first some environment variables to make like easier
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER=jovyan \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH=$CONDA_DIR/bin:$PATH \
    HOME=/home/$NB_USER

RUN mkdir $HOME/app && fix-permissions $HOME/app

COPY --chown=1000:100 app $HOME/app/

COPY --chown=1000:100 SQLInjection.ipynb $HOME/

RUN conda install sqlite

# makes running the following commands easier
WORKDIR $HOME/app

USER $NB_UID

#Setup database
RUN python server_init.py

RUN chmod +x EmailCloud
RUN chmod +x RecoverDatabase

ENV PATH=$HOME/app:$PATH

EXPOSE 8888
WORKDIR $HOME

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]

USER $NB_UID
