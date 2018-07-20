scp -P 2222 ..\weather\* root@localhost:/usr/datasets/weather
ssh root@localhost -p 2222 command hadoop fs -mkdir /user/raj_ops/weather
ssh root@localhost -p 2222 command hadoop fs -copyFromLocal /usr/datasets/weather/* /user/raj_ops/weather/
ssh root@localhost -p 2222 command mysql -uroot -phadoop -e "CREATE DATABASE HW; CREATE TABLE weather (id VARCHAR(15), date DATE, tmin VARCHAR(5), tmax VARCHAR(5), snow VARCHAR(5), snwd VARCHAR(5), rcpc VARCHAR(5))"  
ssh root@localhost -p 2222 command "sqoop export --connect jdbc:mysql://localhost/HW --table weather --username root --password hadoop --export-dir /user/raj_ops/weather -m 8 --input-fields-terminated-by ',' --lines-terminated-by '\n'"
ssh root@localhost -p 2222 command mysql -uroot -phadoop -e "USE HW; SELECT count(*) FROM weather"
ssh root@localhost -p 2222 command mysql -uroot -phadoop -e "USE HW; SELECT * FROM weather ORDER BY id, date LIMIT 10;"
