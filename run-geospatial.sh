# run project

$ docker build -t geospatial:1.0 .

$ docker run -d -p 8888:8888 --name geospatial-lab -v "$(pwd)/app/src:/app/src" geospatial:1.0

# $ docker exec -it geospatial-lab bash

