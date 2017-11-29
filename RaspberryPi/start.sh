# stop script on error
set -e

#Check if pip is installed
s=`dpkg -s python-pip | grep Status`
if [[ $s == *"installed"* ]]; then
  echo "Pip is installed"
else
  echo 'Installing pip'
  sudo apt install python-pip
fi

#Check if paho mqtt library is installed
if python -c "import paho.mqtt.client" &> /dev/null; then
    echo 'Paho library is already installed'
else
    echo 'Installing paho library'
    sudo pip install paho-mqtt python-etcd
fi

# Read the Unique Serial Number of a RaspberryPi
# serialNumber="RaspberryPi"
serialNumber=$(grep -i Serial /proc/cpuinfo | cut -d : -f2)
echo "harwareId is: $serialNumber"

# Check to see if root CA file exists, download if not
if [ ! -f ./root-CA.crt ]; then
  printf "\nDownloading AWS IoT Root CA certificate from Symantec...\n"
  curl https://www.symantec.com/content/en/us/enterprise/verisign/roots/VeriSign-Class%203-Public-Primary-Certification-Authority-G5.pem > root-CA.crt
fi

# run pub/sub sample app using certificates downloaded in package
echo "Running AWS IoT application on device..."
# -e: Your AWS IoT Endpoint
# -t: Your thingName (Unique Serial Number)
# -r: Path to root certificate
# -c: Path to pem key
# -k: Path to private key

python device.py -e <ENDPOINT>.iot.<REGION-NAME>.amazonaws.com -t "$serialNumber" -r root-CA.crt -c <PEM-KEY-PATH>.cert.pem -k <PRIVATE-KEY-PATH>.private.key
