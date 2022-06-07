# mc

`mc` (for `mc checker`) is an easy to use tool scanning for valid MAC addresses on Stalker Portal servers.

Feed it with a URL, then it generates random MACs and tries them on the server.

When a valid MAC is found, it is stored in your `$HOME` directory -> `$HOME/.config/mc`

As servers differ in the way they handle requests, one need to adapt. The key feature of `mc` is flexibility.

## Documentation

- *-k* : Keep expired MAC (accounts expired)

- *-p* : Make a break every [X] requests

- *-d* : Break duration (in seconds)

- *-s* : Stop McBash after [X] tested MACs

- *-t* : Timeout after [X] seconds

- *-u* : Server's URL/IP (URL or IP is mandatory, option `-u` is not)

- *-w* : Wait [X] seconds between each requests

- *-h* : Help menu

Exemple : `mc my-dns.com:8080 -w 1.5 -p 10 -d 3 -s 150 -t 2`

## Installation

```
git clone https://github.com/dougy147/mc
cd mc
sudo make install
```
Then simply launch :
```
mc
```
or directly with arguments :
```
mc your-dns.com:25461 -t 4
```


## Donate

If you're cool enough to know what to do with this and find this script useful, I'd be glad and thankful :

`bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`
