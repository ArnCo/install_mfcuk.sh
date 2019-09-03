# install_mfcuk.sh
Script to install mfcuk r65 with libnfc-1.5.1 and work with ACR122 NFC reader

To install, just clone the repository and execute the bash script. This should create a "builds/nfc" folder and compile without errors (but loads of warnings).

To run, simply use:
```
LD_LIBRARY_PATH=<whereyoubuiltthebinary>/builds/nfc/libnfc-1.5.1/libnfc/.libs mfcuk-r65/src/mfcuk
```
Then read the readme of mfcuk :)
