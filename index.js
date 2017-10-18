global.Config = {
  LimiterOptions: {
    redis: {
      host: process.env.REDIS_HOST || '127.0.0.1',
      port: 6379,
      options: {}
    },
    namespace: 'limiter',
    global: {
      limit: 300,
      duration: 60
    }
  }
};

const source = require('./src/');

source();
