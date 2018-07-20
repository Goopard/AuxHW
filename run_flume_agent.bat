scp -P 2222 input.txt root@localhost:/usr/datasets/input.txt
scp -P 2222 flume_conf.yaml root@localhost:/usr/flume_conf.yaml
ssh root@localhost -p 2222 command touch /usr/taildir_position.json
ssh root@localhost -p 2222 command touch /usr/output.txt
ssh root@localhost -p 2222 command flume-ng agent --conf conf --conf-file flume_conf.yaml --name a1 -Dflume.root.logger=INFO,console