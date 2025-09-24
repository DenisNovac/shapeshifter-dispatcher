# run:
docker run -it --rm -v "$(pwd)":/go --network host golang:tip-trixie go build -buildvcs=false

# or
# interactive mod activated
# inside the container:
#git config --global --add safe.directory /go
#go build

chmod +x shapeshifter-dispatcher