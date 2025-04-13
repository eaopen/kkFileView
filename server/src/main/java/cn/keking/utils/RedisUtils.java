package cn.keking.utils;

import org.redisson.Redisson;
import org.redisson.api.RBucket;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.stereotype.Component;

@Component
public class RedisUtils {

	private final RedissonClient redissonClient;

	public RedisUtils(Config config) {
		this.redissonClient = Redisson.create(config);
	}

	public boolean isExist(String key) {
		RBucket<Object> bucket = redissonClient.getBucket(key);
		return bucket.size() > 0;
	}
}
