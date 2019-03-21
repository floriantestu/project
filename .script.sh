YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
ORANGE='\033[1;33m'
NC='\033[0m' # No Color

mkdir -p Sources
mkdir -p Includes
mkdir -p Binary
mkdir -p Build
mkdir -p Config
mkdir -p Documentation


printf "${YELLOW}   [ CHECK PACKAGE ]\n${NC}"
if [ $1 -eq 0 ]; then
    # Doxygen
    if [ -f "Doxyfile" ]; then
        echo "Dir exists" &> /dev/null
    else
        wget https://raw.githubusercontent.com/floriantestu/project/master/Doxyfile &> /dev/null
    fi
    dpkg -s doxygen &> /dev/null
    if [ $? -eq 0 ]; then
        printf "${GREEN} Doxygen${NC} = ${BLUE} [ OK ]${NC}\n"
    else
        sudo apt-get install doxygen
        printf "${GREEN} Doxygen${NC} = ${ORANGE} [ ADDED ]${NC}\n"
    fi
    # Python 3
    dpkg -s python3-pip &> /dev/null
    if [ $? -eq 0 ]; then
        printf "${GREEN} Python3${NC} = ${BLUE} [ OK ]${NC}\n"
    else
        sudo apt-get install python3-pip
        printf "${GREEN} Python3${NC} = ${ORANGE} [ ADDED ]${NC}\n"
    fi
    # Conan
    pip3 list 2>&1 | grep -F conan > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        printf "${GREEN} Conan${NC} = ${BLUE} [ OK ]${NC}\n"
        mkdir -p Conan
        if [ -f "Conan/conan_config" ]; then
            echo "Dir exists" &> /dev/null
        else
            touch conan_config
            mv conan_config Conan
            # wget https://raw.githubusercontent.com/floriantestu/project/master/Doxyfile &> /dev/null
        fi
    else
        pip3 install conan
        mkdir -p Conan
        touch conan_config
        mv conan_config Conan
        echo -e "[requires]\n\n[options]\n\n[generators]" >> conan_config
        conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan $?
        if [ $? -ne 0 ]; then
            printf "${RED}WARNING${NC} reboot to finish the configuration, relaunch \"make config\" for works"
            # sleep 10
            # sudo reboot
        else
            printf "${GREEN} Conan${NC} = ${ORANGE} [ ADDED ]${NC}\n"
        fi
    fi
else
    # REMOVE Doxygen
    dpkg -s doxygen &> /dev/null
    if [ $? -eq 0 ]; then
        sudo apt-get remove doxygen
        printf "${GREEN} Doxygen${NC} = ${ORANGE} [ Has been uninstall ]${NC}\n"
    else
        printf "${GREEN} Doxygen is already uninstall${NC}\n"
    fi

    # REMOVE Conan
    pip3 list 2>&1 | grep -F conan > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        pip3 uninstall conan
        printf "${GREEN} Conan${NC} = ${ORANGE} [ Has been uninstall ]${NC}\n"
    else
        printf "${GREEN} Conanis already uninstall${NC}\n"        
    fi

    # Remove Python 3
    dpkg -s python3-pip &> /dev/null
    if [ $? -eq 0 ]; then
        sudo apt-get remove python3-pip
        printf "${GREEN} Python3${NC} = ${ORANGE} [ Has been uninstall ]${NC}\n"
    else
        printf "${GREEN} Python3 is already uninstall${NC}\n"
    fi
fi


# #Boost CPP
# dpkg -s libboost1.62-all-dev &> /dev/null
# if [ $? -eq 0 ]; then
#     printf "${GREEN} Boost${NC} = ${BLUE} [ OK ]${NC}\n"
# else
#     sudo apt-get install libboost1.62-all-dev
#     printf "${GREEN} Boost${NC} = ${ORANGE} [ ADDED ]${NC}\n"
# fi



# if grep -r  "#include <boost/" ./Includes; then 
#     printf "OK\n"
# else
#     printf "KO\n"
# fi

# for entry in "Includes"/*
# do

#   echo "$entry"
# done
