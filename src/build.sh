gcc -fPIC --shared `pkg-config --cflags libspreadsheet-1.12` gnumeric-support.c -o gnumeric-support.so `pkg-config --libs libspreadsheet-1.12` 
