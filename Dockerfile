#start from specific Jupyter base notebook tag
FROM jupyter/base-notebook:61d8aaedaeaf

MAINTAINER Rajesh Kalyanam <rkalyanapurdue@gmail.com>

#install sqlite package for a simple database engine
RUN conda update -n base conda && \
    conda install sqlite

RUN mkdir $HOME/app && fix-permissions $HOME/app

#unfortunately chown here cannot interpret env variables
#hence the hardcoded UID, GID
COPY --chown=1000:100 app $HOME/app/

COPY --chown=1000:100 SQLInjection.ipynb $HOME/

# makes running the following commands easier
WORKDIR $HOME/app

USER $NB_UID

#Setup database & make commands executable
RUN python server_init.py && \
    chmod +x EmailCloud && \
    chmod +x RecoverDatabase

ENV PATH=$HOME/app:$PATH

WORKDIR $HOME

CMD ["start-notebook.sh","--NotebookApp.token="]
