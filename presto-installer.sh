# A script to install presto and its dependencies 
# Keith Boehler
echo "Hello, lets get started!"
echo "Current user: "  $(whoami)

# To look for our install direcotry. Anything that gets downloaded manually or is done from
# source will be put here. 
ASTROSOFT=$HOME/ASTROSOFT
if [ ! -d $ASTROSOFT ]; then
	echo "Making astrosoft direcotry... "
	mkdir $ASTROSOFT
fi 

## Getting a few things 
sudo apt-get -qq update
sudo apt-get -qq --yes install csh gfortran autoconf meson libglib2.0-dev libcfitsio-bin libcfitsio-doc libcfitsio-dev libpng.dev zlib1g-dev libfftw3-bin libfftw3-dev

# Get anaconda

# Get FFTW

# Get PGPLOT

# Get PRESTO


