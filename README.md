# linux-cpp Docker

This project makes a linux-based cpp Docker container with the following features:

- cpp compiler
- git
- Boost libraries 1.87.0

To build an publish the image run the following docker commands

```
docker build -t pathwaytechnologies/linux-cpp .

docker login -u $USERNAME -p $PASSWORD
docker push pathwaytechnologies/linux-cpp:$TAGNAME
```

# Boost

Boost libraries are installed at:

```
/usr/include/boost
/usr/lib/
```
