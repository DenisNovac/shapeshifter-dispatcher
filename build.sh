# this is the last working version after last release 3.0.1
git checkout b936dc8004db276a5b639bbe6377895284e8d8c9

# run:
docker run -it --rm -v "$(pwd)":/go --network host golang:tip-trixie go build -buildvcs=false

# or
# interactive mod activated
# inside the container:
#git config --global --add safe.directory /go
#go build

chmod +x shapeshifter-dispatcher