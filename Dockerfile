FROM ubuntu:22.04
LABEL author="Ruben Orduz"
#requirements
RUN apt-get update -y && \
    apt install software-properties-common -y && \
    apt-get install python3 python3-pip -y && \
    python3 -m pip install --upgrade pip
# Add work directory
WORKDIR /app
# copy requirements file
COPY ./requirements.txt /app/
# pip install
RUN pip3 install -r requirements.txt


# Run the notebook
CMD ["jupyter", "notebook", "--allow-root", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
