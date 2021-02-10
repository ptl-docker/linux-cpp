# Based on the latest tagged release of the official gcc image
FROM gcc:9.3.0

# Add additional packages
RUN apt update && apt -y install gcc g++ cmake libacl1-dev libncurses5-dev pkg-config
