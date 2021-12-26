# easy-presto
The `easy-presto` project is an installer for Scott Ransom's [PRESTO](https://github.com/scottransom/presto), PulsaR Exploration and Search TOolkit! The goal of this script is to gather and install its many depenencies and help students hit the ground running in their radio astronomy projects that need PRESTO. 

When making this sript I did so in an Ubuntu 20.04 LTS minimal install running in a VM. It should work with any other linux distribution that using the apt package manager. The motive for this target is to have a stable and popular base that could be chosen and make the fewest assumptions on what is pre-installed. 

Please submit any issues you run into and include a screenshot of error masseges. 

## How to use?

Once this has been cloned, or idealy made part of PRESTO itself, navigate into the easy presto directory with `cd easy-presto` 

Then simply type `./presto-installer.sh` and watch it work (or take a nap if the computer is working technically so are you)

If you get a permission error you need to allow the file execute permissions with `chmod +x presto-installer.sh`




