from kombu.mixins import ConsumerMixin
from kombu import BrokerConnection

from kombu import BrokerConnection

from kombu import Exchange, Queue

# Event exchange queues
EXCHANGE_EVENT          = Exchange('on.events', type='topic')
QUEUE_GRAPH_FINISH      = Queue('local.graph.finished',
                                EXCHANGE_EVENT,
                                routing_key='graph.finished.*')
class C(ConsumerMixin):
    def __init__(self, connection):
        self.connection = connection
        return

    def get_consumers(self, Consumer, channel):
        return [Consumer(QUEUE_GRAPH_FINISH, callbacks = [self.on_message])]

    def on_message(self, body, message):
        print("body: %r" % (body,))
        print("msg: %r" % (message.delivery_info,))
        message.ack()

with BrokerConnection("amqp://guest:guest@localhost:5672") as connection:
    try:
        C(connection).run()
    except KeyboardInterrupt:
        print ("exit")
