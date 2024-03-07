FROM jupyter/minimal-notebook:python-3.10

# start jupyterlab i dir med data og src
WORKDIR /app

# to mount volumes, enabling write Notebooks to host
RUN mkdir -p /app/src /app/data && chown 1000 /app/src

# download data
RUN wget -P /app/data --content-disposition https://figshare.com/ndownloader/files/37729413 https://figshare.com/ndownloader/files/37729416 https://figshare.com/ndownloader/files/37729419 https://figshare.com/ndownloader/files/36028100

# extract L6 raster
RUN tar -zxvf /app/data/geospatial-python-raster-dataset.tar.gz -C /app/data/

## RUN mv brogmwvolledigeset.zip brpgewaspercelen_definitief_2020_small.gpkg status_vaarweg.zip /app/data

# install jupyterlab with geospatial dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt && rm requirements.txt

# install variable browser
# https://medium.com/@heshanottawa/variable-inspector-in-jupyter-notebook-or-jupyterlab-mac-os-5639f12bbfb (https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html)
RUN pip install lckr-jupyterlab-variableinspector


EXPOSE 8888
