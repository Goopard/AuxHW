Exporting table from HDFS to MySQL and launching some quaries:
All steps listed below are embodied in the run_sqoop.bat script.
1) First, we transfer the weather data to the hdp sandbox via ssh.
2) Load the weather data into HDFS.
3) Prepare MySQL database and tables: we create the HW database with the tables HW.weather (target table) and HW.staging_weather (auxilury staging table).
4) Run the sqoop export of the weather dataset from the hdfs with the target and staging tables as mentioned in the previous step.
5) Delete the staging table HW.staging_weather since we won't need it any more.
6) Finally, run some quaries.

Configuring and using Flume agent to stream some data into HDFS:
All steps listed below are embodied in the scripts run_flume_agent.bat and run_file_filler_for_flume_agent.bat (the last one only manages the population of the input file, no Flume logic in it).
1) First, we create a flume_conf.yaml file, which will be the configuration file for our Flume agent. It will have theese options:
    Source: A single TAILDIR source, which will monitor the changes in one file group, which consist of a single file - output file of the run_file_filler_for_flume_agent.bat script.
    Channel: just a single ordinary memory channel.
    Sink: A single HDFS sink, since we want to stream the data into hdfs. 
2) Load the configuration file and the input text into the hdp sandbox via ssh.
3) Run Flume agent with a given configuration file.
4) Run the run_file_filler_for_flume_agent.bat script.
5) Watch the Flume agent dealing with the changes in the output file and loading them into HDFS. 