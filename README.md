# KVO-Core-Data-Crash
Reproducing a crash when setting a NSKeyValueObserver to nil when deallocating a NSManagedObject.
The issue seems to be related to clearing observations on an NSManagedObject in a module.

How to use:
- Run the project in debug
- From the KVOTest->File menu select Get Subjects 3 or 4 times
- You should see the termination “deallocated while key value observers were still registered”
