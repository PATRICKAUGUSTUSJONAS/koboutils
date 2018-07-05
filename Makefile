.PHONY: default
default: clean test build

ver := $(shell git describe --tags --always --dirty)
ldflags := -X main.version=$(ver)

.PHONY: clean test build
clean:
	rm -rfv build

test:
	go test ./...

build:
	go build -ldflags "$(ldflags)" -o "build/kobo-find" ./kobo-find
	go build -ldflags "$(ldflags)" -o "build/kobo-info" ./kobo-info

release: clean
	go get -v github.com/tcnksm/ghr
	go get -v github.com/mholt/archiver/cmd/archiver
