import Fastify from 'fastify';

const server = Fastify({
    logger: true,
});

server.get('/', async () => {
    return { hello: 'world' };
});

const start = async () => {
    try {
        await server.listen({
            port: 3000,
            host: '127.0.0.1',
        });
        server.log.info(`Server is running at http://localhost:3000`);
    } catch (err) {
        server.log.error(err);
        process.exit(1);
    }
};

start();
