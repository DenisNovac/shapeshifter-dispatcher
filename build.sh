# it seems they broke it after that version
git checkout ee69ff1fd3ac35e7fbfef16b711a464d90c94b02

# run:
docker run -it --rm -v "$(pwd)":/go --network host golang:tip-trixie go build -buildvcs=false

# or
# interactive mod activated
# inside the container:
#git config --global --add safe.directory /go
#go build

chmod +x shapeshifter-dispatcher