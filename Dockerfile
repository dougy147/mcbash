FROM alpine:latest as runner

# install dependencies
RUN apk update && apk add --no-cache \
    gcc make bash ncurses curl wget ffmpeg sudo

# install mcbash from local directory
WORKDIR /mcbash
COPY . .
RUN make && make install
