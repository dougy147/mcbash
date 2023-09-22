FROM alpine:latest as runner

# install dependencies
RUN apk update && apk add --no-cache \
    gcc make bash ncurses curl wget

# install mcbash from local directory
WORKDIR /mcbash
COPY . .
RUN make && make install
