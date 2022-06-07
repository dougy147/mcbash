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

For `00:1A:79:xx:xx:xx`-like MAC addresses (the most commonly used), there are $16^6$ possibilities (≈16.7million). Collision probability on sparsely populated servers is low by definition.

## Instructions for careless minds

Power is all relative, and this program's is quite low; even pretty harmless. However, I must release myself of any responsibility in the way you will use this program. Indeed, it might be unappropriate in some countries.

As far as I understand (i.e. poorly), imperative programming is like stacking bricks on top of each other.
If there's nothing wrong stacking, climbing the pile might.
That way, it's unnecessary to say I'm only responsible for sharing a recipe one would find all the ingredients thanks to any search engine.

So, illegality is not contained in that program. It can only be in its user's purposes.
Please use that script consciously, on your personal goods only.


## How did that help ?

If you're cool enough to know what to do with this and find this program useful, I'd be glad and thankful :

`bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`
