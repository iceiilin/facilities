from kombu.mixins import ConsumerMixin
from queues import queue_user_read
from queues import queue_notify


class C(ConsumerMixin):
    def __init__(self, connection, queue):
        self.connection = connection
        self.queue = queue
        return

    def get_consumers(self, Consumer, channel):
        return [Consumer(self.queue, callbacks=[self.on_message])]

    def on_message(self, body, message):
        print("body: %r" % (body,))
        print("msg: %r" % (message.delivery_info,))
        message.ack()

if __name__ == "__main__":
    from kombu import BrokerConnection
    from kombu.utils.debug import setup_logging

    setup_logging(loglevel='INFO', loggers=[''])
    with BrokerConnection("amqp://guest:guest@10.62.59.225:5672") as connection:
    # with BrokerConnection("amqp://guest:guest@localhost:5672") as connection:
        try:
            # C(connection, queue_user_read).run()
            C(connection, queue_notify).run()
        except KeyboardInterrupt:
            print ("exit")
