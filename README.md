If you twist it hard enough, `mcbash` will stand for Yet Another MAC Scanner.

<p align="center">
<img src="./assets/mcbash.gif" width="80%" />
</p>

## Quick start

```console
$ wget https://raw.githubusercontent.com/dougy147/mcbash/refs/heads/master/bin/mcbash
$ chmod +x ./mcbash
$ ./mcbash
```

## Overview

`mcbash --help` displays most common options.

### Requests

| Option                       | Functionality                                                |
|------------------------------|--------------------------------------------------------------|
| **`-u`**, `--url`            | Server's URL/IP                                              |
| **`-w`**, `--wait`           | Wait **X** seconds between each requests                     |
| **`-b`**, `--break`          | Make a break every **X** requests                            |
| **`-d`**, `--pause-for`      | Break duration (in seconds)                                  |
| **`-s`**, `--stop`           | Stop McBash after **X** tested MACs                          |
| **`-t`**, `--timeout`        | Consider request a timeout after **X** seconds               |
| **`-P`**, `--proxy`          | Set the proxy URL (any authentication method supported)      |
| **`-pu`**, `--proxy-user`    | Set your proxy credentials `user:password`                   |
| `--proxy-file`               | Read proxy IPs from a file. Rotation when request timeout    |
| **`-EA`**, `--enhanced-auth` | Add SN and DevID1 to GET request (and save them if match)    |

### Scan mode

| Option                    | Functionality                                                |
|---------------------------|--------------------------------------------------------------|
| `--mac-file`              | Choose a file to read MACs from (MACs should be line by line)|
| `--seq`                   | Check MACs in sequential order (`--range` is forced)         |
| `--range`                 | Set a range for checked MACs                                 |
| **`-F`**, `--from`        | Set range lower boundary (lowest MAC value to check)         |
|  **`-L`**, `--to`         | Set range higher boundary (highest MAC value to check)       |
| `--prefix`                | Select MACs prefix when screening in random mode             |

### Others

| Option                    | Functionality                                                |
|---------------------------|--------------------------------------------------------------|
| **`-k`**, `--keep`        | Store expired MACs (valid addresses but expired accounts)    |
| **`-np`**, `--default`    | Don't ask for parameters. Use default configuration          |
| `--show-only-mac`         | Only outputs found MACs                                      |
| `--no-checkpoint`         | Don't store checkpoints                                      |

For *advanced* settings, read the manual : `man mcbash`.

To change default options, simply edit `$HOME/.config/mcbash/mcbash.conf`.

## Usecase examples

```console
$ mcbash -F 00:1A:79:00:00:00 -L 00:1A:79:00:11:11 --seq
```

Scans sequentially from `00:1A:79:00:00:00` to `00:1A:79:00:11:11`.


```console
$ mcbash --proxy http://localhost:12345 --proxy-user user:pwd
```

Uses specified proxy `http://localhost:12345`, with `user:pwd` username and password.


```console
$ mcbash --proxy-file /path/to/proxies-list.txt
```

Uses proxies listed in a file (format must be IP[:PORT], one line = one proxy). Auto-rotates if proxy fails.


```console
$ mcbash --mac-file ./path/to/your-MACs-list.txt
```

Scans using your own list of MACs (one line = one MAC).

## Install

### From source

```console
$ git clone https://github.com/dougy147/mcbash
$ cd ./mcbash
$ make install
```

### ArchLinux

```console
$ yay -S mcbash
```

## DISCLAIMER

> bla bla bla don't hurt anyone with this tool, including yourself 3;)

## Special thanks to contributors !

<a href="https://github.com/ian10951">
  <img src="https://avatars.githubusercontent.com/u/11910714?v=4" width='50px'>
</a>
<a href="https://github.com/jojo141185">
  <img src="https://avatars.githubusercontent.com/u/6240522?v=4" width='50px'>
</a>


## Feel free ! 😎

If `mcbash` has been of any help to you, I'd be glad and thankful !

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/dougy147)

BTC : `bc1q4cflj0e3hwcn5edut654je86upn37p37gut5yk`

