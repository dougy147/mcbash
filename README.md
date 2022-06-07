# mc bash

`mc` (bash version) is an easy to use tool scanning for valid MAC addresses on Stalker Portal servers.
Just feed it with a server's URL or IP. It then checks potentially valid MAC addresses.

When a valid MAC is found, it is stored in your `$HOME` directory -> `$HOME/.config/mc`


## Documentation

The key feature of `mc` is **flexibility**. Check that with `mc --help` or `man mc`.

As servers differ in the way they handle requests, one need to adapt.

| Option | Functionality                                                |
|:------:|--------------------------------------------------------------|
| **-k** | Store expired MAC (valid addresses but expired accounts)     |
| **-p** | Make a break every **X** requests                            |
| **-d** | Break duration (in seconds)                                  |
| **-s** | Stop McBash after **X** tested MACs                          |
| **-t** | Timeout after **X** seconds                                  |
| **-u** | Server's URL/IP (URL or IP is mandatory, option `-u` is not) |
| **-w** | Wait **X** seconds between each requests                     |
| **-h** | Print this help menu                                         |

Exemple : `mc myfake$erver.org:8080 -w 1.5 -p 10 -d 3 -s 1500 -t 2`

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

## Size sometimes matters

For `00:1A:79:xx:xx:xx`-like MAC addresses (the most commonly used), there are 16^6 possibilities. The collision probability on small servers is low by definition.

## Instructions for careless minds

Illegality is not contained in that program, only in its user's purposes.
Use that script on your personal goods only.
I am only responsible for sharing a recipe one would find by oneself with any search engine.
Imperative programmation is like stacking bricks on top of each other.
If there's nothing wrong stacking bricks, climbing might.

Last but not least, I'm .

## How did that help ?

If you're cool enough to know what to do with this and find this program useful, I'd be glad and thankful :

`bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`
