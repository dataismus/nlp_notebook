# nlp_notebook
NLP-geared Jupyter image



# docker run -d --rm -p 10001:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd)/..:/home/jovyan/work \
# --mount type=tmpfs,destination=/data,tmpfs-mode=1777 --name nlp_notebook dataismus/nlp_notebook && \
# sleep 5s && docker container exec -it nlp_notebook jupyter notebook list
