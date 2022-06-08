```
 ░█▄▒▄█░▄▀▀░██▄▒▄▀▄░▄▀▀░█▄█
 ░█▒▀▒█░▀▄▄▒█▄█░█▀█▒▄██▒█▒█
```

`mcbash` (for **m**ac **c**hecker **bash** version) scans for valid MAC addresses on Stalker Portal servers.
It's a fast, modular and easy to use script.
Just feed it with a server URL or IP, and let it check by itself.

When a valid MAC is found, it is stored in a file here -> `$HOME/.config/mcbash`

<p align="center">
<img src="mcbash.gif" width="80%" />
</p>

## Documentation

As servers may differ in the way they handle requests, one need to adapt.

The key feature of `mcbash` is **flexibility**. It comes with handy options to manage your requests. Check that with `mcbash --help` or `man mcbash`.

| Option | Functionality                                                |
|:------:|--------------------------------------------------------------|
| **-k** | Store expired MAC (valid addresses but expired accounts)     |
| **-p** | Make a break every **X** requests                            |
| **-d** | Break duration (in seconds)                                  |
| **-s** | Stop McBash after **X** tested MACs                          |
| **-t** | Consider request a timeout after **X** seconds               |
| **-u** | Server's URL/IP (URL or IP is mandatory, option `-u` is not) |
| **-w** | Wait **X** seconds between each requests                     |
| **-h** | Print this help menu                                         |

Exemple : `mcbash myfake$erver.org:8080 -w 1.5 -p 10 -d 3 -s 1500 -t 2`

## Installation

```
git clone https://github.com/dougy147/mcbash
cd mcbash
sudo make install
```
Then simply launch :
```
mcbash
```
or directly with arguments :
```
mcbash my-fakedns.org:8080 -t 4 -L '00:1A:79:AB:CD:EF'
```

### Size sometimes matters

For `00:1A:79:xx:xx:xx`-like MAC addresses (the most commonly used), there are $16^6$ possibilities (≈16.7million). Collision probability on sparsely populated servers is low by definition.

## Instructions for the careless mind

Power is all relative, and this program's is pretty low; even quite harmless. However, I must release myself of any responsibility in the way you will use this program. Indeed, its use might be unappropriate in your country.

As far as I understand (i.e. poorly), imperative programming is like stacking bricks on top of each other.
If there's nothing wrong stacking, climbing the pile might.
That way, it's unnecessary to say I'm only responsible for sharing a recipe one could find all the ingredients thanks to any search engine.

So, illegality is not contained in that program. It can only be in its user's behavior.
Please use that script consciously, with and on your personal goods only.

## Good critics are worth it

Don't just pass by, and help improve `mcbash`. Pull requests are open $24/7$.

## How did that help ?

If you (1) are cool enough to know what to do with this and (2) find this program useful, I'd be glad and thankful :

`bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`
