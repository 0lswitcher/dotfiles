> [!TIP]
> If you're looking for bash scripts, take a look at my [bash-scripts](https://github.com/0lswitcher/bash-scripts) repository since I've moved them there.

### Yo, before cloning any files, I highly recommend reading the following breakdown since my `.bashrc` and `.profile` files are managed a bit differently from the default:

*So first, some context for why my files are like this in the first place:*

I have three different machines that I use on a regular basis-there are other devices used but it's a rarer occasion, so I'm focused on syncronizing these three devices. They're all running NixOS, but I wanted to be able to sync .bashrc configuration and aliases across any of my linux machines for the sake of the future. Previously, I faced an issue where every single time I made an update to my workhorse PC (known as *Oracle*) `.bashrc` file, I'd have to immedietly SSH over to my headless server named *Smith*, and update its `.bashrc` accordingly (though I use `.profile` instead on *Smith* since I SSH into it, and that changes certain behavior), and I found myself getting annoyed with how often I had to update *Smith* to keep up with *Oracle*, and my third machine named *Neo* simply got left in the dust-only getting updated every few months. That's where my solution comes in.

Now, instead of each machine having seperate `.bashrc` files that I'm constantly fighting to update, I have a single shared/common `.bashrc` file that lives in this repository, which each individual machines original `.bashrc` sources from. Then, each machine gets a `.bashrc_local` (or `.profile_local` in *Smith's* case) which only contains the aliases, ascii art, and other configuration that is specific to each machine. This means that common aliases that I would use on every machine like cpa, cpd, cya (these handle copying with varying flags) are synced across each machine daily, but commands that are only used for specific machines are only held on its respective machine. 

This works by first defining a location to save the cached hardcopy of the `.bashrc_shared` from this repo, then defining the url for the repository to pull from, sourcing the newly made cache, then additionally sourcing the `.bashrc_local` file to add in the machine specific configuration. For example, this is what the main `.bashrc` file for *Oracle* looks like, combining `.bashrc_shared` from this repo and `.bashrc_local` from the LFS:

> [!NOTE]
> Even though the `.bashrc_local` and `.profile_local` are kept within this repo, they're only used as a backup. `.bashrc_shared` is the only one sourced over the web.

```
CACHE="$HOME/.cache/bashrc_shared"
URL="https://raw.githubusercontent.com/0lswitcher/dotfiles/refs/heads/main/dots/bash/.bashrc_shared"

# refresh once per day
if [ ! -f "$CACHE" ] || [ $(date +%s -r "$CACHE") -lt $(( $(date +%s) - 86400 )) ]; then
  curl -fsSL "$URL" -o "$CACHE"
fi

source "$CACHE"
[ -f ~/.bashrc_local ] && source ~/.bashrc_local

# limited aliases, all other are kept in .bashrc_local and .bashrc_shared
alias bashrc-pull='curl -fsSL "$URL" -o "$CACHE" && echo "pulled latest .bashrc_shared from repo"'
alias bashrc-update='curl -fsSL "$URL" -o "$CACHE" && echo "pulled latest .bashrc_shared from repo"'
alias bashrc-peek='cat "$CACHE"'
```
> Pulled from *Oracle's* `.bashrc` 

You'll notice a couple things I havent mentioned; the daily refresh, and the handful of aliases in the main `.bashrc`.
The daily refresh is my attempt to balance regular syncronization with offline capabilities and launch speed. If I don't include that refresh section, updating .bashrc_shared wouldn't do anything, and I'd have to source it every time I opened a terminal. This is bad because not only does it require an internet connection, it also slows down the speed of opening the terminal due to it sourcing over the web. Granted, my internet is shit and it isn't a long wait, but I use foot as my terminal purely because of how fast it is, so every second matters to me. To solve this, the individual `.bashrc` (or `.profile`) on each machine will source the `.bashrc_shared` file once a day, removing the slow launch and required internet connection, since it pulls from the cached version thats on the LFS. This created a new problem however of having to wait for the refresh cycle to take place in order to see my new changes to the `.bashrc_shared`. To solve this, I put a few aliases in to manually pull the updated file from the repo whenever I want if desired, and I have another alias to take a look at the cached file to make sure it was updated. the aliases are kept in here (`.bashrc`) rather than within the `.bashrc_shared` or the `.bashrc_local` due to the fact that the variables aren't exported, and referencing the files is slightly different depending on the machine. 

With that being said, this explanation is long enough as is-and fully breaking everything down would make this markdown file way longer than it needs to be. If you're still curious about how everything works, just take a look at the varying `.bashrc` and `.profile` files within this repo, it's not too much to reverse engineer. 

Thanks for reading, and good luck with your `.rc` files!
