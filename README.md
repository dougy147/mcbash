# mcbash

`mcbash` is a fast, modular and user-friendly script to find valid MAC addresses on some IPTV platforms.

Just feed it with a server URL or IP, and let it check by itself.

<p align="center">
<img src="./assets/mcbash.gif" width="80%" />
</p>


## Quick start

```
git clone https://github.com/dougy147/mcbash
cd ./mcbash
sudo make install
```

For Arch users, there is an up-to-date package on the AUR (e.g. `yay -S mcbash`)

## Functionalities overview

As servers may differ in the way they handle requests, one need to adapt. The key feature of `mcbash` is **flexibility**. It comes with handy options to manage your requests. 

| Requests                  | Functionality                                                |
|---------------------------|--------------------------------------------------------------|
| **`-u`**, `--url`         | Server's URL/IP                                              |
| **`-w`**, `--wait`        | Wait **X** seconds between each requests                     |
| **`-b`**, `--break`       | Make a break every **X** requests                            |
| **`-d`**, `--pause-for`   | Break duration (in seconds)                                  |
| **`-s`**, `--stop`        | Stop McBash after **X** tested MACs                          |
| **`-t`**, `--timeout`     | Consider request a timeout after **X** seconds               |
| **`-P`**, `--proxy`       | Set the proxy URL (any authentication method supported)      |
| **`-pu`**, `--proxy-user` | Set your proxy credentials `user:password`                   |


| Scan mode                 | Functionality                                                |
|---------------------------|--------------------------------------------------------------|
| `--mac-file`              | Choose a file to read MACs from (MACs should be line by line)|
| `--seq`                   | Check MACs in sequential order (`--range` is forced)         |
| `--range`                 | Set a range for checked MACs                                 |
| **`-F`**, `--from`        | Set range lower boundary (lowest MAC value to check)         |
|  **`-L`**, `--to`         | Set range higher boundary (highest MAC value to check)       |
| `--prefix`                | Select MACs prefix when screening in random mode             |


| Others                    | Functionality                                                |
|---------------------------|--------------------------------------------------------------|
| **`-k`**, `--keep`        | Store expired MACs (valid addresses but expired accounts)    |
| **`-np`**, `--default`    | Don't ask for parameters. Use default configuration          |
| `--show-only-mac`         | Only outputs found MACs                                      |
| `--no-checkpoint`         | Don't store checkpoints                                      |

`mcbash --help` displays most common options. 

For *advanced* settings, read the manual : `man mcbash`.


### Scan randomly, sequentially, or from file

By default, MACs are *pseudo*-randomly generated and checked (random mode). 
If you want to screen sequentially, use `--seq` (sequential mode). 
You can also read MACs from a file (line by line) with `--mac-file your_file.txt`.

### Scan inside a range

In sequential mode you need to specify lower and upper bounds of the range of MACs you want to scan (i.e. the "lowest" and "highest" MAC values).
You can do that in random mode too, with the option `--range`.

### Checkpoints

When screening sequentially, `mcbash` creates a checkpoint file, storing last checked MAC.
You can specify `--no-checkpoint` to bypass that (i.e. no checkpoint will then be saved).

### Proxy works

The use of a proxy and credentials is supported. Thanks to `curl`, any protocol works.
Here is an example with proxy and credentials use : `--proxy http://localhost:12345 --proxy-user user:pwd`.

### Default parameters

The configuration file `$HOME/.config/mcbash/mcbash.conf` contains default options. You can change them according to your needs.

### MACs are stored

When a valid MAC is found, it is immediately stored in `$HOME/.mcbash` directory.

## Misc

### Size sometimes matters

For `00:1A:79:xx:xx:xx`-like MAC addresses (most commons), there are $16^6$ possibilities (≈16.7million). Collision probability on sparsely populated servers is low by definition. So, there won't be too much matches on small ones!

### macOS compatibility

macOS runs a dinosaur version of bash. But `mcbash` won't allow its users to be left behind. That's why its code is meant to stay retro-compatible. How kind from this little script 😎!


## Usage examples

- **Example 0** : `mcbash`

Easiest way to use it! `mcbash` guides you and adapts to your requests.

- **Example 1** : `mcbash -u my-fakedns.bla:8080 -w 1.5 -b 10 -d 3 -s 1500 -t 2`

The program waits 1.5 seconds between each requests, makes a break every 10 requests for 3 seconds, stops after 1500 MACs checked, and considers a request timeouted after 2 seconds (timeouts trigger a pause to avoid flood).


- **Example 2** : `mcbash -u my-fakedns.bla:8080 -F 00:1A:79:00:00:00 -L 00:1A:79:00:11:11`

Scans sequentially from `00:1A:79:00:00:00` to `00:1A:79:00:11:11`.


- **Example 3** : `mcbash -u my-fakedns.bla:8080 --proxy http://localhost:12345 --proxy-user user:pwd`

Establishes communications through proxy `http://localhost:12345`, with `user:pwd` username and password.


## Instructions for the careless mind 🧠

Power is all relative, and this program's is pretty low; even quite harmless. However, I must release myself of any responsibility in the way you will use it. Indeed, its use might be unappropriate in your country.

As far as I understand (i.e. poorly), imperative programming is like stacking bricks on top of each other.
If there's nothing wrong stacking, climbing the pile might.
That way, it's unnecessary to say I'm only responsible for sharing a recipe one could find all the ingredients thanks to any search engine.

So, illegality is not contained in that program. It can only be in its user's behavior.
Please use that script consciously, with and on your personal goods only.


## Special thanks to contributors !

<a href="https://github.com/ian10951">
  <img src="https://avatars.githubusercontent.com/u/11910714?v=4" width='50px'>
</a>


## Feel free ! 😎

If `mcbash` has been of any help to you, I'd be glad and thankful !

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/dougy147)

BTC : `bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`

