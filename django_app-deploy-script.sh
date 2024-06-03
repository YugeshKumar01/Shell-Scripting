#!/bin/bash

<<task
This script to to deploy django application as a docker container
task

# git cloning ..

git_clone (){
	if [[ -d "django-notes-app" ]]; then
		echo "Error: 'django-notes-app' folder already exists or failed to clone the repository."
	else
		
		git clone https://github.com/YugeshKumar01/django-notes-app.git
		echo "Repository cloned successfully."

	fi
}


required_software() {
    echo "Checking and installing required software..."

    # Update package list only if necessary
    sudo apt-get update

    # Check if Docker is installed, and install if not
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed. Installing Docker..."
        sudo apt-get install docker.io -y
    else
        echo "Docker is already installed."
    fi

    # Check if Docker Compose is installed, and install if not
    if ! command -v docker-compose &> /dev/null; then
        echo "Docker Compose is not installed. Installing Docker Compose..."
        sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose                           # getting error of python3 that's why use this to download docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
        
    else
        echo "Docker Compose is already installed."
    fi
}

# deploy function 
deploy() {
    echo "Deploying application using docker-compose..."

     COMPOSE_DIR="/home/ubuntu/shell-Scripting/django-notes-app" # chnage the path according to your configuration


    # Check if the directory exists
    if [ ! -d "$COMPOSE_DIR" ]; then
        echo "Error: Directory $COMPOSE_DIR does not exist."
        exit 1
    fi

    # Navigate to the directory
    cd "$COMPOSE_DIR" || { echo "Error: Failed to change directory to $COMPOSE_DIR."; exit 1; }

    # Check if the docker-compose.yml file exists in the directory
    if [ ! -f "docker-compose.yml" ]; then
        echo "Error: docker-compose.yml not found in $COMPOSE_DIR."
        exit 1
    fi 
  

    # Check if containers are already running
    if docker-compose ps | grep 'Up'; then
        echo "Application is already running."
    else
        # Bring up the application services
        docker-compose up -d

        if [ $? -eq 0 ]; then
            echo "Application deployed successfully."
        else
            echo "Failed to deploy application."
            exit 1
        fi
    fi
}


# function calling.
git_clone
required_software
deploy
