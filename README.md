# mcbash

`mcbash` (for **m**ac **c**hecker **bash** version) scans for valid MAC addresses on Stalker Portal servers.

It's a fast, modular and user-friendly script.
Just feed it with a server URL or IP, and let it check by itself.

<p align="center">
<img src="mcbash.gif" width="80%" />
</p>

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

### MACs are stored

Did you close your terminal ? Don't worry, when a valid MAC is found, it is stored in `mcbash` directory : `$HOME/.mcbash`.

### Size sometimes matters

For `00:1A:79:xx:xx:xx`-like MAC addresses (the most commonly used), there are $16^6$ possibilities (≈16.7million). Collision probability on sparsely populated servers is low by definition. So, there won't be too much matches on small ones!

### "I hate the colors"

- Solution 1 : join the colorblind gang.

- Solution 2 : colors are set with `tput` (e.g. `tput setf 1`). Change its value from 0 to 7. If you know of a more universal/efficient way to color text, please contact me.


### Go full command line 😎

When executing `mcbash` with arguments (except for `-u` and `--range` alone), it will generally assume you know what you're doing, and won't ask questions.
Else, it will prompt you for settings. Check below for options you can manually set.

### Adapt to your needs

As servers may differ in the way they handle requests, one need to adapt.

The key feature of `mcbash` is **flexibility**. It comes with handy options to manage your requests. `mcbash --help` display most common options. For *"advanced"* settings, read the manual (`man mcbash`).

| Option                  | Functionality                                                |
|-------------------------|--------------------------------------------------------------|
| **`-k`**, `--keep`      | Store expired MAC (valid addresses but expired accounts)     |
| **`-b`**, `--break`     | Make a break every **X** requests                            |
| **`-d`**, `--pause-for` | Break duration (in seconds)                                  |
| **`-s`**, `--stop`      | Stop McBash after **X** tested MACs                          |
| **`-t`**, `--timeout`   | Consider request a timeout after **X** seconds               |
| **`-u`**, `--url`       | Server's URL/IP (URL or IP is mandatory, option `-u` is not) |
| **`-w`**, `--wait`      | Wait **X** seconds between each requests                     |


By default, MACs are checked randomly. If you want to screen a specific range, use `--range`.

|       Option       | Functionality                                |
|:------------------:|----------------------------------------------|
|     `--range`      | Check MACs in sequential order               |
| **`-F`**, `--from` | Set first MAC to check (`--range` is forced) |
|  **`-L`**, `--to`  | Set last MAC to check (`--range` is forced)  |

#### Change default parameters

The config file (`mcbash.conf`) is created during the install process here : `$HOME/.mcbash`. Change some values according to your needs.

### Use examples

The program sleeps 1.5 seconds between each requests, pauses every 10 requests for 3 seconds, stops after 1500 MACs checkeds, and consider timeout after 2 seconds (timeouts trigger a pause to avoid flood) :

- `mcbash my-fakedns.org:8080 -w 1.5 -b 10 -d 3 -s 1500 -t 2`

Scan from first (`-F`) to last (`-L`) provided MAC :

- `mcbash my-fakedns.org:8080 -F 00:1A:79:00:00:00 -L 00:1A:79:00:11:11`


## Instructions for the careless mind

Power is all relative, and this program's is pretty low; even quite harmless. However, I must release myself of any responsibility in the way you will use this program. Indeed, its use might be unappropriate in your country.

As far as I understand (i.e. poorly), imperative programming is like stacking bricks on top of each other.
If there's nothing wrong stacking, climbing the pile might.
That way, it's unnecessary to say I'm only responsible for sharing a recipe one could find all the ingredients thanks to any search engine.

So, illegality is not contained in that program. It can only be in its user's behavior.
Please use that script consciously, with and on your personal goods only.

## Constructive critics are worth it

Don't just pass by, and help improve `mcbash`. Pull requests are open $24/7$.

## How did that help ?

If you (1) are cool enough to know what to do with this 😎 and (2) find this program useful, I'd be glad and thankful :

`bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`
