package com.markham.hadoop;

import org.apache.storm.Config;
import org.apache.storm.LocalCluster;
import org.apache.storm.topology.TopologyBuilder;
import org.apache.storm.utils.Utils; 

public class StormExample {

	public static void main(String[] args) {
		//It is a comma separated value file (although only one word per line is written)
        RecordFormat format = new DelimitedRecordFormat().withFieldDelimiter(",");
        SyncPolicy syncPolicy = new CountSyncPolicy(1000);
 
        //Rotate files after 127MB (Hortonworks default fileblock size is 128MB)
        FileRotationPolicy rotationPolicy = new FileSizeRotationPolicy(127.0f, FileSizeRotationPolicy.Units.MB);
 
        DefaultFileNameFormat fileNameFormat = new DefaultFileNameFormat();
        //The files are written in this HDFS folder
        fileNameFormat.withPath("/storm-data");
        //Files start with the following filename prefix
        fileNameFormat.withPrefix("RandomWords-");
        //Files end with the following suffix
        fileNameFormat.withExtension(".csv");
 
        //HDFS bolt
        HdfsBolt bolt =
            new HdfsBolt().withFsUrl("hdfs://namenode:8020")
                .withFileNameFormat(fileNameFormat)
                .withRecordFormat(format)
                .withRotationPolicy(rotationPolicy)
                .withSyncPolicy(syncPolicy);
		TopologyBuilder builder = new TopologyBuilder();

		builder.setSpout("twitter", new StormSpout());
		builder.setBolt("print", new StormBolt());

		Config conf = new Config();

		LocalCluster cluster = new LocalCluster();

		cluster.submitTopology("test", conf, builder.createTopology());

		Utils.sleep(10000);
		cluster.shutdown();
		System.out.println("Done");
	}

}
