from kombu import Exchange, Queue

task_exchange = Exchange("user", type="topic")
queue_user_write = Queue("user.write.queue", task_exchange, routing_key = 'user.write')
queue_user_read = Queue("user.read.queue", task_exchange, routing_key = 'user.read')
queue_notify = Queue("notify", task_exchange, routing_key = "user.#")
