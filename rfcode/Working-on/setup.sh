#!/bin/bash
#./setup.sh is a free software, intend for the purpose of automatic installation of RF Communication packages based on GNURadio
#copyright (c) 2016 Author(s): Gorla Praven <gorlapraveen@gmail.com>
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or (at your option) any later version.This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#You should have received a copy of the GNU General Public License  along with this program.  If not, see <https://www.gnu.org/licenses/>.

############################################################

echo checking gnu radio installation and related dependencies......
if [ $(dpkg-query -W -f='${Status}' gnuradio  2>/dev/null | grep -c "no packages" | wc -l ) -gt 0 ]; then
 echo GNURadio not found
 echo Installing it 
 sudo apt -y install gnuradio;
else
 echo 'GNU already Installed........'
fi
echo 
if [ $(dpkg-query -W -f='${Status}' gnuradio-dev libxml2 libxml2-dev bison flex cmake git libaio-dev libboost-all-dev swig  2>/dev/null | grep -c "no packages" | wc -l ) -gt 0 ]; then
 echo 'ADLAM PLuto SDR dependencies not found for GNU Radio... '
 echo 'Installing Adlam Pluto Dependencis for GNU radio......' 
 sudo apt -y install gnuradio-dev libxml2 libxml2-dev bison flex cmake git libaio-dev libboost-all-dev swig;
 sudo apt -y -f install;
else
 echo 'Adlam Pluto Dependencies for GNU already Installed........'
fi
echo
if [ $(dpkg-query -W -f='${Status}' libaio-dev libusb-1.0-0-dev libserialport-dev libxml2-dev libavahi-client-dev autoconf 2>/dev/null | grep -c "no packages" | wc -l ) -gt 0 ]; then
 echo SerialCommunication packages...
 echo Installing them....
 sudo apt -y install libaio-dev libusb-1.0-0-dev libserialport-dev libxml2-dev libavahi-client-dev autoconf;
 sudo apt -y -f install;  
else
 echo 'SerialCommunication packages Already Installed'
fi
echo ################
if [ $(dpkg-query -W -f='${Status}' sigrok*  libserialport0  libserialport-dev 2>/dev/null | grep -c "no packages" | wc -l ) -gt 0 ]; then
 echo Other SerialCommunication packages...
 echo Installing them....
 sudo apt -y install sigrok*  libserialport0  libserialport-dev;
 sudo apt -y -f install; 

else
 echo 'Required SerialCommunication packages Already Installed'
fi

sudo apt -y install gr-iio* libad9361* libgnuradio-iio0 libiio*;


echo
mkdir Adlam_pluto_required
bash -c "cd Adlam_pluto_required && git clone https://github.com/analogdevicesinc/libiio.git gr-libiio"
bash -c "cd Adlam_pluto_required/gr-libiio/ && cmake ."
bash -c "cd Adlam_pluto_required/gr-libiio/ && make"
bash -c "cd Adlam_pluto_required/gr-libiio/ && sudo make install"

bash -c "cd Adlam_pluto_required && git clone https://github.com/analogdevicesinc/libad9361-iio.git gr-libad9361-iio"

bash -c "cd Adlam_pluto_required/gr-libad9361-iio/ && cmake ."
bash -c "cd Adlam_pluto_required/gr-libad9361-iio/ && make"
bash -c "cd Adlam_pluto_required/gr-libad9361-iio/ && sudo make install"



bash -c "cd Adlam_pluto_required &&  git clone https://github.com/analogdevicesinc/gr-iio.git gr-iio"
bash -c "cd Adlam_pluto_required/gr-iio/ && cmake -DCMAKE_INSTALL_PREFIX=/usr ."
bash -c "cd Adlam_pluto_required/gr-iio/ && make"
bash -c "cd Adlam_pluto_required/gr-iio/ && sudo make install"
bash -c "sudo ldconfig"

bash -c "cp -r /usr/local/lib/python2.7/dist-packages/gnuradio/iio /usr/lib/python2.7/dist-packages/gnuradio/"

echo  


echo
echo Installation of Adlam pltuo is completed
echo 
echo
echo Checking Installtion of IEEEE802.11 GNU radio based libraries.

echo Installing required packages


sudo apt-get install liblog4cpp5-dev
bash -c "cd Adlam_pluto_required && git clone https://github.com/bastibl/gr-foo.git gr-foo"
bash -c "cd Adlam_pluto_required/gr-foo && git checkout master"
bash -c "mkdir Adlam_pluto_required/gr-foo/build"
echo 'Installing the gr-foo, a meta package required for GNU Radio IEEE802.11 Implementation'

bash -c "cd Adlam_pluto_required/gr-foo/build && cmake .."
bash -c "cd Adlam_pluto_required/gr-foo/build && make"
bash -c "cd Adlam_pluto_required/gr-foo/build && sudo make install"
bash -c "sudo ldconfig"

echo

bash -c "cd Adlam_pluto_required && git clone https://github.com/bastibl/gr-ieee802-11.git gr-ieee802-11"
bash -c "mkdir Adlam_pluto_required/gr-ieee802-11/build"
echo 'Installing the GNU Radio IEEE802.11 Implementation'
bash -c "cd Adlam_pluto_required/gr-ieee802-11/build && cmake .." 
bash -c "cd Adlam_pluto_required/gr-ieee802-11/build && make"
bash -c "cd Adlam_pluto_required/gr-ieee802-11/build && sudo make install"
bash -c "sudo ldconfig"

echo 
echo Adjusting the Maximum Shared Memory to 2147483648

sudo sysctl -w kernel.shmmax=2147483648

bash -c "cd ../ && python wifi_phy_hier.py"
sudo mkdir ~/.gnuradio
echo [grc]>>~/.gnuradio/config.conf 
echo global_blocks_path = /opt/local/share/gnuradio/grc/blocks >>~/.gnuradio/config.conf 
echo local_blocks_path = /Users/basti/usr/share/gnuradio/grc/blocks >>~/.gnuradio/config.conf 
echo
echo Installing gfortran, lapack, itpp packages

sudo apt -y  install gfortran
sudo apt -y install libatlas-base-dev libblas-dev liblapack-dev
bash -c "cd ../required/itpp-4.3.1/ && mkdir build"
bash -c "cd ../required/itpp-4.3.1/build && cmake .."

bash -c "cd ../required/itpp-4.3.1/build && make"
bash -c "cd ../required/itpp-4.3.1/build && sudo make install."

sudo apt -y install libatlas-base-dev libblas-dev liblapack-dev
sudo apt -f install


echo 'Installing RF-TAP, gr-rftap libraries for gnu radio'
bash -c "cd Adlam_pluto_required && git clone https://github.com/rftap/gr-rftap gr-rftap"
bash -c "mkdir Adlam_pluto_required/gr-rftap/build"
echo 'Installing the gr-rftap, a meta package required for GNU Radio IEEE802.11 Implementation'
bash -c "cd Adlam_pluto_required/gr-rftap/build && cmake .." 
bash -c "cd Adlam_pluto_required/gr-rftap/build && make"
bash -c "cd Adlam_pluto_required/gr-rftap/build && sudo make install"
bash -c "cd Adlam_pluto_required/ && sudo ldconfig"

echo Installing wireshark and tshark.......
sudo apt -y install wireshark*
sudo apt -y install tshark*
sudo apt -y -f install
echo
echo
echo ---------------------------------------------------------------------------
echo 'If there any errors during installation, please manually install individual packages seeking help(https://gitlab.com/gorlapraveen/gnu_radio_localization/blob/master/README.md) this is only for installing Radio Frequency Packages, For any other firefox related packages see other channels'
echo ---------------------------------------------------------------------------

