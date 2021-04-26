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

## Dirty hack in matrix submodule :(

```diff
diff --git a/include/threaded-canvas-manipulator.h b/include/threaded-canvas-manipulator.h
index 5768d91..7b94db3 100644
--- a/include/threaded-canvas-manipulator.h
+++ b/include/threaded-canvas-manipulator.h
@@ -19,6 +19,7 @@

 #include "thread.h"
 #include "canvas.h"
+#include <string>

 namespace rgb_matrix {
 //
@@ -77,6 +78,7 @@ public:

   // Implement this and run while running() returns true.
   virtual void Run() = 0;
+  virtual void set_option(const std::string key, const std::string value) {};

 protected:
   inline Canvas *canvas() { return canvas_; }
```


run

```bash
sudo ./led-mqtt -t "text line 1" -u "text line 2" -S 'tcp://127.0.0.1:1883'
```
