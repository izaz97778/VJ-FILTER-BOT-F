
# Don't Remove Credit @VJ_Bots
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10.8-slim-buster

# Switch to Archive repositories for the EOL Buster distribution
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list

# Update, Upgrade, and Install Git in one layer
RUN apt-get update && apt-get upgrade -y && \
    apt-get install git -y && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

# Upgrade pip and install requirements
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# Set up the working directory
RUN mkdir /VJ-FILTER-BOT
WORKDIR /VJ-FILTER-BOT
COPY . /VJ-FILTER-BOT

CMD ["python", "bot.py"]
