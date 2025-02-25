# linux-cpp Docker

This project makes a linux-based cpp Docker container with the following features:

- cpp compiler
- Boost libraries

To build an publish the image run the following docker commands

```
docker build -t pathwaytechnologies/linux-cpp .

docker login -u $USERNAME -p $PASSWORD
docker push pathwaytechnologies/linux-cpp:$TAGNAME
```

# Boost

Boost libraries version 1.75.0 are installed at:

```
/usr/include/boost
/usr/lib/
```
