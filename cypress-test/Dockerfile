FROM cypress/included

# Set the working directory inside the container
WORKDIR /app

RUN apt-get update && apt-get install -y inotify-tools wget nano && apt-get clean

# Copy files to the working directory
COPY . .

RUN ls -al cypress

# Command to run the application
ENTRYPOINT ["/app/startup.sh"]