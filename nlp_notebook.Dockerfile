# docker run -d --rm -p 10001:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd)/..:/home/jovyan/work \
# --mount type=tmpfs,destination=/data,tmpfs-mode=1777 --name nlp_notebook dataismus/nlp_notebook && \
# sleep 5s && docker container exec -it nlp_notebook jupyter notebook list

FROM jupyter/scipy-notebook

# Bash preferences, aliases, messages, DNS etc.
RUN echo 'alias jupylist="jupyter notebook list"' >> /home/$NB_USER/.bashrc && \
    echo 'echo "\nGo ahead and type \"jupylist\", see what you find out..\n" ' >> /home/$NB_USER/.bashrc

COPY ./conda_reqs.txt /etc/
COPY ./requirements.txt /etc/

RUN conda install --quiet -y $(cat /etc/conda_reqs.txt) && \
    conda clean --all -f -y && fix-permissions $CONDA_DIR && fix-permissions /home/$NB_USER

RUN pip install -q -U -r /etc/requirements.txt

USER root
RUN apt-get -yq update && \
    apt-get install --no-install-recommends -yq curl
USER $NB_UID

RUN python -m spacy download de_core_news_sm && python -m spacy download en_core_web_sm