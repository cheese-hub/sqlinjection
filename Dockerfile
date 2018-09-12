FROM jupyter/base-notebook
MAINTAINER Rajesh Kalyanam <rkalyanapurdue@gmail.com>

RUN conda update -n base conda

RUN conda install sqlite

RUN mkdir $HOME/app && fix-permissions $HOME/app

#unfortunately chown here cannot interpret env variables
#hence the hardcoded UID, GID
COPY --chown=1000:100 app $HOME/app/

COPY --chown=1000:100 SQLInjection.ipynb $HOME/

# makes running the following commands easier
WORKDIR $HOME/app

USER $NB_UID

#Setup database
RUN python server_init.py

RUN chmod +x EmailCloud
RUN chmod +x RecoverDatabase

ENV PATH=$HOME/app:$PATH

WORKDIR $HOME

CMD ["start-notebook.sh","--NotebookApp.token=","--NotebookApp.password="]
