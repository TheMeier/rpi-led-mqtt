# rpi-led-mqtt



installed from source

* <https://github.com/eclipse/paho.mqtt.c.git> (tag v1.3.8)

```bash
git checkout v1.3.8
cmake -DPAHO_WITH_SSL=TRUE -DPAHO_BUILD_DOCUMENTATION=FALSE -DPAHO_BUILD_STATIC=TRUE -DPAHO_BUILD_SAMPLES=TRUE
make
sudo make install
```

* <https://github.com/eclipse/paho.mqtt.cpp> (tag 1.2.0)

```bash
git checkout v1.3.8
cmake -DPAHO_WITH_SSL=TRUE -DPAHO_BUILD_DOCUMENTATION=FALSE -DPAHO_BUILD_STATIC=TRUE -DPAHO_BUILD_SAMPLES=TRUE
make
sudo make install
```

run

```bash
sudo ./led-mqtt -t "text line 1" -u "text line 2" -S 'tcp://127.0.0.1:1883'
```
