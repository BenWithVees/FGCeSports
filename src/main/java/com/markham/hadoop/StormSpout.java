package com.markham.hadoop;

import java.util.Map;

import org.apache.storm.spout.SpoutOutputCollector;
import org.apache.storm.task.TopologyContext;
import org.apache.storm.topology.OutputFieldsDeclarer;
import org.apache.storm.topology.base.BaseRichSpout;
import org.openimaj.stream.provider.twitter.TwitterSearchDataset;
import org.openimaj.util.api.auth.DefaultTokenFactory;
import org.openimaj.util.api.auth.common.TwitterAPIToken;
import org.openimaj.util.function.Operation;

import twitter4j.Query;
import twitter4j.Status;

public class StormSpout extends BaseRichSpout {

	@Override
	public void nextTuple() {
		TwitterAPIToken token = DefaultTokenFactory.get(TwitterAPIToken.class);
		token.consumerKey = "9nNQYKMlf6bBr4xM42Ki91xwA";
		token.consumerSecret = "FjVCzmblOBVwkhszGKjIF0SbfgkuSmRgjwToX477IWuqv74Kif";
		token.accessToken = "369227041-R3w1AM8YFGOiDw683TJvwhUSueFlrDCxlInSfe6h";
		token.accessSecret = "D0OtyCb0lU2KgzzLzTJ46bUguv0V1HVptjTL12LRN5a4M";
		Query query = new Query();
		query.setQuery("hadoop");

		TwitterSearchDataset stream = new TwitterSearchDataset(query, token);
		stream.forEach(new Operation<Status>() {
			public void perform(Status status) {
				System.out.println(status.getUser().getScreenName() + ": " + status.getText());
			}
		});

	}

	@Override
	public void open(Map arg0, TopologyContext arg1, SpoutOutputCollector arg2) {
		// TODO Auto-generated method stub

	}

	@Override
	public void declareOutputFields(OutputFieldsDeclarer arg0) {
		// TODO Auto-generated method stub

	}

}
