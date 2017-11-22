# stop script on error
set -e

# run pub/sub sample app using certificates downloaded in package
printf "\nRunning AWS IoT application on RaspberryPi...\n"
# -e: Your AWS IoT Endpoint
# -t: Your thingName
# -r: Path to root certificate
# -c: Path to pem key
# -k: Path to private key

python main.py -e iot-endpoint.iot.region.amazonaws.com -t RaspberryPi -r root-CA.crt -c RaspberryPi.cert.pem -k RaspberryPi.private.key
