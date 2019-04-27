---
title: Unleash Redis's full potential
date: 2019-04-27 08:39:43
tags:
- redis
- streams
- keydb
- hfxbus
categories:
- Redis
---

I think most people don't use Redis's full potential. The same goes for Elasticsearch, but I'll tell you about it in another post. In the present market I have observed many teams and companies using wide scope tools to complete small parts of their solutions or problems. It is very simple to think of a tool that solves a specific problem without thinking of all the burden generated to maintain it and make it sustainable in the long run.

### How do you know Redis?

If you were to list the keywords about it what would be the first? By experience, most people would say: "cache", "key-value", "in memory database".

Not that all of this is incorrect, they are features of Redis. Now I'll tell you how I would describe Redis: **an application for storing and managing machine state cycles.**

Stateless applications are not useful without inputs and outputs, this can be thought of with an external machine state that is handled by your application. Note: Being stateless to me is almost a commandment when we are talking about SOA.

### Now I'll show you a little more than Redis can do.

Have you read [Redis In Action eBook](https://redislabs.com/community/ebook/)? You should, this will open your horizons.

A use case is for example scheduled jobs, which you can easily build with the [Redis Sorted Sets](https://redis.io/commands#sorted_set). Tip: Think about the criterion to rank as the timestamp of your job scheduling.

Now you're probably ready to get to know [KeyDB](https://github.com/JohnSully/KeyDB) if you want to achieve stratospheric levels of performance.

One question that I am asked most often is about persistence: "I am not ok with losing my states stored in Redis, so I think it is only useful for caching." What do you think?

**Strongly disagree**, have you read about [AOFs and RDBs](https://redis.io/topics/persistence)? I imagine you need performance and reliability, how to solve this if the AOF guarantees me persistence, but it destroys the performance and the RDB is just the opposite? Simple: Create two Redis (or KeyDB) implementation tiers, one for high performance (RDB) and one for high reliability (AOF), so your application can connect with either (or both) when you need one features.

### Do you use Kafka or RabbitMQ?

Remember that what I am going to say now is a thought bias of mine: you probably don't need them or you would get a better result with [Redis Streams](https://redis.io/topics/streams-intro) (implemented in Redis 5.0). Think about the possibilities for microservices, SOA, event-sourcing, CQRS, SCS.

In this last point (which I personally think was a sensational feature implemented in Redis), to exploit that potential I created [HFXBus](https://www.npmjs.com/package/hfxbus) that will help you create a battle-ready SOA environment.

### Yes, I am a big fan of Redis/KeyDB.

I have no problem with alternatives or implementations, all that I am talking about depends a lot on the architecture of your environment. I know there are weaknesses in it, as the implementation of Redis Cluster could have a better architecture (I'll also comment on this in another post).

I hope I've helped you think outside the box with Redis, going way beyond the cache.