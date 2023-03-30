# mcbash

`mcbash` is a fast, modular and user-friendly script to find valid MAC addresses on some IPTV platforms.

Just feed it with a server URL or IP, and let it check by itself.

<p align="center">
<img src="mcbash.gif" width="80%" />
</p>


## Quick start

```
git clone https://github.com/dougy147/mcbash
cd ./mcbash
sudo make install
```

For Arch users, there is an up-to-date package on the AUR (e.g. `yay -S mcbash`)

## Functionalities

As servers may differ in the way they handle requests, one need to adapt.

The key feature of `mcbash` is **flexibility**. It comes with handy options to manage your requests. `mcbash --help` display most common options. For *"advanced"* settings, read the manual (`man mcbash`).

| Option                  | Functionality                                                |
|-------------------------|--------------------------------------------------------------|
| **`-u`**, `--url`       | Server's URL/IP                                              |
| **`-w`**, `--wait`      | Wait **X** seconds between each requests                     |
| **`-b`**, `--break`     | Make a break every **X** requests                            |
| **`-d`**, `--pause-for` | Break duration (in seconds)                                  |
| **`-s`**, `--stop`      | Stop McBash after **X** tested MACs                          |
| **`-t`**, `--timeout`   | Consider request a timeout after **X** seconds               |
| **`-k`**, `--keep`      | Store expired MACs (valid addresses but expired accounts)    |
| **`-np`**, `--default`  | Don't ask for parameters. Use default configuration          |


By default, MACs are pseudo-randomly checked. If you want to screen sequentially, use `--range`. This option allows you to specify lower and upper bounds.

| Option             | Functionality                                |
|:------------------:|----------------------------------------------|
|     `--range`      | Check MACs in sequential order               |
| **`-F`**, `--from` | Set first MAC to check (`--range` is forced) |
|  **`-L`**, `--to`  | Set last MAC to check (`--range` is forced)  |


The use of a proxy and credentials is supported thanks to `curl`.

| Option                    | Functionality                                           |
|:-------------------------:|---------------------------------------------------------|
| **`-P`**, `--proxy`       | Set the proxy URL (any authentication method supported  |
| **`-pu`**, `--proxy-user` | Set your proxy credentials `user:password`              |


This exotic option makes `mcbash` exclusively output valid MACs to stdout (useful if you want to redirect stdout to another program).

| Option                    | Functionality             |
|:-------------------------:|---------------------------|
| `--show-only-mac`         | Only outputs found MACs   |


## Useful infos

### Default parameters are configurable

The config file `$HOME/.mcbash/mcbash.conf` is created during the install process. It contains a set of default options you can change according to your needs.

### MACs are stored

Did you close your terminal ? Don't worry, when a MAC is found, it is immediately stored in `$HOME/.mcbash` directory.

### Size sometimes matters

For `00:1A:79:xx:xx:xx`-like MAC addresses (the most commons), there are $16^6$ possibilities (≈16.7million). Collision probability on sparsely populated servers is low by definition. So, there won't be too much matches on small ones!

### macOS compatibility

macOS runs a dinosaur version of bash. But `mcbash` won't allow its users to be left behind. That's why its code is meant to stay retro-compatible. How kind from this little script 😎!


## Usage examples

- *Example 1* : `mcbash -u my-fakedns.org:8080 -w 1.5 -b 10 -d 3 -s 1500 -t 2`

The program waits 1.5 seconds between each requests, makes a break every 10 requests for 3 seconds, stops after 1500 MACs checked, and considers a request timeouted after 2 seconds (timeouts trigger a pause to avoid flood).


- *Example 2* : `mcbash -u my-fakedns.org:8080 -F 00:1A:79:00:00:00 -L 00:1A:79:00:11:11`

Scans sequentially from `00:1A:79:00:00:00` to `00:1A:79:00:11:11`.


- *Example 3* : `mcbash -u my-fakedns.org:8080 --proxy http://localhost:12345 --proxy-user user:pwd`

Establishes communications through proxy `http://localhost:12345`, with `user:pwd` username and password.


## Instructions for the careless mind

Power is all relative, and this program's is pretty low; even quite harmless. However, I must release myself of any responsibility in the way you will use it. Indeed, its use might be unappropriate in your country.

As far as I understand (i.e. poorly), imperative programming is like stacking bricks on top of each other.
If there's nothing wrong stacking, climbing the pile might.
That way, it's unnecessary to say I'm only responsible for sharing a recipe one could find all the ingredients thanks to any search engine.

So, illegality is not contained in that program. It can only be in its user's behavior.
Please use that script consciously, with and on your personal goods only.

## Constructive critics are worth it

Don't just pass by, and help improve `mcbash`. Pull requests are open $24/7$.

### Special thanks to contributors

<a href="https://github.com/ian10951">
  <img src="https://avatars.githubusercontent.com/u/11910714?v=4" width='50px'>
</a>


### Feel free

If mcbash has been of any help to you, I'd be glad and thankful !

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/dougy147)

BTC : `bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`

