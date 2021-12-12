#!/usr/bin/bash

# A script to install presto and its dependencies 
# Keith Boehler
echo "Hello, lets get started!"
echo "Current user: "  $(whoami)

# To look for our install direcotry. Anything that gets downloaded manually or is done from
# source will be put here. 
ASTROSOFT=$HOME/ASTROSOFT
if [[ ! -d $ASTROSOFT ]]; then
	echo "Making astrosoft direcotry... "
	mkdir $ASTROSOFT
fi 

## Getting a few things 
#echo "Getting things we need from apt... "
#sudo apt-get -qq update
#sudo apt-get -qq --yes install csh gfortran autoconf meson libglib2.0-dev libcfitsio-bin libcfitsio-doc libcfitsio-dev libpng.dev zlib1g-dev libfftw3-bin libfftw3-dev make
#echo "Done. "
# Get anaconda

# Get FFTW
#echo "Getting FFTW... "
#FFT_DIR=$ASTROSOFT/fftw-3.3.10
#cd $ASTROSOFT
#wget fftw.org/fftw-3.3.10.tar.gz # Remove comment when done testing 
#tar -zxf fftw-3.3.10.tar.gz
#cd $ASTROSOFT/fftw-3.3.10
#./configure --prefix=$HOME --enable-shared --enable-single --enable-sse --enable-sse2 --enable-avx --enable-avx2 --enable-fma
#make
#make check
#make install
#make installcheck
#echo "Done. "
# Get PGPLOT
echo "Starting PRESTO... "
cd $ASTROSOFT
#wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot5.2.tar.gz
tar -zxf pgplot5.2.tar.gz
mv pgplot pgplot_src
if [[ ! -d $ASTROSOFT/pgplot ]]; then
	echo "Making pgplot target dir... "
	mkdir $ASTROSOFT/pgplot
fi 
cd $ASTROSOFT/pgplot
cp $ASTROSOFT/pgplot_src/drivers.list $ASTROSOFT/pgplot/

# Uncommend the XWindow and PS drivers. Those are the ones i use
sed -i '/^!.* XWDRIV /s/^!//' drivers.list
sed -i '/^!.* PSDRIV /s/^!//' drivers.list
echo "Done. "
# Get PRESTO


