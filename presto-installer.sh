#!/usr/bin/bash

# A script to install presto and its dependencies 
# Keith Boehler
echo "Hello, lets get started!"
echo "Current user: "  $(whoami)

INSTALLER_DIR=$PWD

# To look for our install direcotry. Anything that gets downloaded manually or is done from
# source will be put here. 
export ASTROSOFT=$HOME/ASTROSOFT
if [[ ! -d $ASTROSOFT ]]; then
	echo "Making astrosoft direcotry... "
	mkdir $ASTROSOFT
fi 

## Getting a few things 
echo "Getting things we need from apt... "
sudo apt-get update
sudo apt-get --yes install csh gfortran autoconf meson libglib2.0-dev libcfitsio-bin libcfitsio-doc libcfitsio-dev libpng.dev zlib1g-dev libfftw3-bin libfftw3-dev make libx11-dev python3.8-venv virtualenv libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libgdbm-dev lzma lzma-dev tcl-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev curl build-essential python-openssl
echo "Done. "

# Get FFTW
echo "Getting FFTW... "
#FFT_DIR=$ASTROSOFT/fftw-3.3.10
cd $ASTROSOFT
wget fftw.org/fftw-3.3.10.tar.gz # Remove comment when done testing 
tar -zxf fftw-3.3.10.tar.gz
cd $ASTROSOFT/fftw-3.3.10
./configure --prefix=$HOME --enable-shared --enable-single --enable-sse --enable-sse2 --enable-avx --enable-avx2 --enable-fma
make
make check
make install
make installcheck
echo "Done. "
# Get PGPLOT
echo "Starting PGPLOT... "
cd $ASTROSOFT
wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot5.2.tar.gz
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

# Doing the makemake
$ASTROSOFT/pgplot_src/makemake $ASTROSOFT/pgplot_src linux g77_gcc

# Change the fortrancompiler to gfortran
sed -i 's/FCOMPL=g77/FCOMPL=gfortran/g' makefile
make
source $INSTALLER_DIR/zsh_astro
make cpg
ld -shared -o libcpgplot.so --whole-archive libcpgplot.a
echo "Done. "

# Get TEMPO
echo "Getting TEMPO... "
cd $ASTROSOFT
git clone git://git.code.sf.net/p/tempo/tempo
cd $ASTROSOFT/tempo
./prepare
./configure --prefix=$HOME
make
make install


echo "Done. "
# Get CFITS IO
echo "Getting CFITSIO"
cd $ASTROSOFT
wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.48.tar.gz
tar -zxf cfitsio-3.48.tar.gz
cd $ASTROSOFT/cfitsio-3.48
./configure --prefix=$HOME
make
make install
echo "Done. "
# Get Python
echo "Getting python env set... "
cd $ASTROSOFT
# https://medium.datadriveninvestor.com/how-to-install-and-manage-multiple-python-versions-on-linux-916990dabe4b
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo "# Pyenv environment variables" >> $HOME/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"# Pyenv initialization' >> $HOME/.bashrc
echo 'if command -v pyenv 1>/dev/null 2>&1; then' >> $HOME/.bashrc
echo '  eval "$(pyenv init --path)"' >> $HOME/.bashrc
echo 'fi' >> $HOME/.bashrc

sourc  $HOME/.bashrc

pyenv install 3.7.10
mkdir prestopy

pyenv local 3.7.10
python -m venv py3.7.10_presto

source $ASTROSOFT/py3.7.10_presto/bin/activate

pip install scipy numpy astropy
echo "Done. "
# Get PRESTO
echo "Getting PRESTO itself..."
cd $ASTROSOFT
git clone http://github.com/scottransom/presto.git
echo $PRESTO


sed -i 's/ppgplot_libraries = ["cpgplot", "pgplot", "X11", "png", "m"]/ppgplot_libraries = ["cpgplot", "pgplot", "X11", "png", "m","gfortran"]/g' setup.py

cd $PRESTO/src
make makewidsom
make prep
make
cd $PRESTO; pip install .

python tests/test_presto_python.py

echo "Find Pulsars!!"
