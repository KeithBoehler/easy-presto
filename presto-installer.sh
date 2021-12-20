#!/usr/bin/bash

# A script to install presto and its dependencies 
# Keith Boehler
echo "Hello, lets get started!"
echo "Current user: "  $(whoami)

INSTALLER_DIR=$PWD

# To look for our install direcotry. Anything that gets downloaded manually or is done from
# source will be put here. 
ASTROSOFT=$HOME/ASTROSOFT
if [[ ! -d $ASTROSOFT ]]; then
	echo "Making astrosoft direcotry... "
	mkdir $ASTROSOFT
fi 

## Getting a few things 
echo "Getting things we need from apt... "
#sudo apt-get update
#sudo apt-get --yes install csh gfortran autoconf meson libglib2.0-dev libcfitsio-bin libcfitsio-doc libcfitsio-dev libpng.dev zlib1g-dev libfftw3-bin libfftw3-dev make libx11-dev
echo "Done. "

# Get FFTW
echo "Getting FFTW... "
#FFT_DIR=$ASTROSOFT/fftw-3.3.10
#cd $ASTROSOFT
#wget fftw.org/fftw-3.3.10.tar.gz # Remove comment when done testing 
#tar -zxf fftw-3.3.10.tar.gz
#cd $ASTROSOFT/fftw-3.3.10
./configure --prefix=$HOME --enable-shared --enable-single --enable-sse --enable-sse2 --enable-avx --enable-avx2 --enable-fma
#make
#make check
#make install
#make installcheck
echo "Done. "
# Get PGPLOT
echo "Starting PRESTO... "
#cd $ASTROSOFT
#wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot5.2.tar.gz
#tar -zxf pgplot5.2.tar.gz
#mv pgplot pgplot_src
#if [[ ! -d $ASTROSOFT/pgplot ]]; then
#	echo "Making pgplot target dir... "
#	mkdir $ASTROSOFT/pgplot
#fi 
#cd $ASTROSOFT/pgplot
#cp $ASTROSOFT/pgplot_src/drivers.list $ASTROSOFT/pgplot/

# Uncommend the XWindow and PS drivers. Those are the ones i use
#sed -i '/^!.* XWDRIV /s/^!//' drivers.list
#sed -i '/^!.* PSDRIV /s/^!//' drivers.list

# Doing the makemake
#$ASTROSOFT/pgplot_src/makemake $ASTROSOFT/pgplot_src linux g77_gcc

# Change the fortrancompiler to gfortran
#sed -i 's/FCOMPL=g77/FCOMPL=gfortran/g' makefile
#make
#source $HOME/zsh_astro
#make cpg
#ld -shared -o libcpgplot.so --whole-archive libcpgplot.a
echo "Done. "

# Get TEMPO
echo "Getting TEMPO... "
#cd $ASTROSOFT
#git clone git://git.code.sf.net/p/tempo/tempo
#cd $ASTROSOFT/tempo
#./prepare
#./configure --prefix=$HOME
#make
#make install


echo "Done. "
# Get CFITS IO
#echo "Getting CFITSIO"
#cd $ASTROSOFT
#wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.48.tar.gz
#tar -zxf cfitsio-3.48.tar.gz
#cd $ASTROSOFT/cfitsio-3.48
#./configure --prefix=$HOME
#make
#make install
#echo "Done. "
# Get Python
echo "Getting python 3.7 from anaconda set... "
cd $ASTROSOFT
#wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
#bash $ASTROSOFT/Anaconda3-2021.11-Linux-x86_64.sh
source ~/.bashrc
#conda create --name pulsar python=3.7
#conda activate pulsar
#conda install scipy numpy astropy
echo "Done. "
# Get PRESTO
echo "Getting PRESTO itself..."
cd $ASTROSOFT
git clone http://github.com/scottransom/presto.git
cd presto




echo "Find Pulsars!!"
