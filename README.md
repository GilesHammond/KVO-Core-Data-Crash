# KVO-Core-Data-Crash
Reproducing a crash when setting a NSKeyValueObserver to nil when deallocating a NSManagedObject.

How to use:
- Run the project in debug
- From the KVOTest->File menu select Get Subjects 3 or 4 times
- You should see the termination “deallocated while key value observers were still registered”
