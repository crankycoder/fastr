import lmdb


env = lmdb.open("/tmp/test", max_dbs=0)
with env.begin(write=True) as txn:
    txn.put("somename".encode(), "somedata".encode())
