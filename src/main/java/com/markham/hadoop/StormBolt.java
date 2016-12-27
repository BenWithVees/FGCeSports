package com.markham.hadoop;

import org.apache.storm.topology.BasicOutputCollector;
import org.apache.storm.topology.OutputFieldsDeclarer;
import org.apache.storm.topology.base.BaseBasicBolt;
import org.apache.storm.tuple.Tuple;

public class StormBolt extends BaseBasicBolt {

	public void execute(Tuple tuple, BasicOutputCollector collector) {
		
		System.out.println(tuple);
	}

	@Override
	public void declareOutputFields(OutputFieldsDeclarer arg0) {

	}

}
