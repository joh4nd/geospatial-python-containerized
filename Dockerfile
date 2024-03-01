FROM jupyter/minimal-notebook:python-3.10

# start jupyterlab i dir med data og src
WORKDIR /app

# to mount volumes, enabling write Notebooks to host
RUN mkdir -p /app/src /app/data && chown 1000 /app/src

# download data
RUN wget -P /app/data --content-disposition https://figshare.com/ndownloader/files/37729413 https://figshare.com/ndownloader/files/37729416 https://figshare.com/ndownloader/files/37729419

## RUN mv brogmwvolledigeset.zip brpgewaspercelen_definitief_2020_small.gpkg status_vaarweg.zip /app/data

# install jupyterlab
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

EXPOSE 8888
