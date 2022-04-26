# First, specify the base Docker image.
# You can see the Docker images from Apify at https://hub.docker.com/r/apify/.
# You can also use any other image from Docker Hub.
FROM apify/actor-python:3.9

# Second, copy just requirements.txt into the actor image,
# since it should be the only file that affects "pip install" in the next step,
# in order to speed up the build
COPY requirements.txt ./
COPY upload_ytvid.py ./
COPY setup_google.py ./
COPY scrape_videos.py ./
COPY outro.mp4 ./
COPY make_compilation.py ./
COPY LICENSE ./
COPY intro.mp4 ./
COPY instalooter_test.py ./
COPY instaloader_test.py ./
COPY googleAPI.json ./
COPY Google.py ./
COPY Credits ./
COPY config.py ./
COPY botTuber.py ./
COPY BotTuber.png ./
# Install the packages specified in requirements.txt,
# Print the installed Python version, pip version
# and all installed packages with their versions for debugging
RUN echo "Python version:" \
 && python --version \
 && echo "Pip version:" \
 && pip --version \
 && echo "Installing dependencies from requirements.txt:" \
 && pip install -r requirements.txt \
 && echo "All installed Python packages:" \
 && pip freeze
RUN python3 botTuber.py -a
# Next, copy the remaining files and directories with the source code.
# Since we do this after installing the dependencies, quick build will be really fast
# for most source file changes.
# Specify how to launch the source code of your actor.
# By default, the main.py file
