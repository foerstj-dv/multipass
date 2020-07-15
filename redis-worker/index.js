const keys = require('./keys');
const redis = require('redis');

const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strategy: () => 1000
});
const sub = redisClient.duplicate();

function fib(index) {
    if (index < 2) {
        return 1;
    }
    // deliberately using very bad recursive fibonacci calculation
    return fib(index-1) + fib(index-2);
}

sub.on('message', (channel, message) => {
    const index = parseInt(message);
    console.log('on message '+message, index);
    const fibVal = fib(index);
    console.log('on message: fib val', fibVal);
    redisClient.hset('values', message, fib(parseInt(message)));
});
sub.subscribe('insert');
