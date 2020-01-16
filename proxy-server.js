const http = require('http');
const httpProxy = require('http-proxy');

const proxy = httpProxy.createProxyServer({});

const server = http.createServer((req, res) => {
	if (req.headers.host === 'editor.logigator-local-dev.com') {
		console.log('Proxy Request ' + req.headers.host + req.url);
		proxy.web(req, res, {
			target: 'http://127.0.0.1:8202'
		});
	} else if (req.headers.host === 'logigator-local-dev.com') {
		console.log('Proxy Request ' + req.headers.host + req.url);
		proxy.web(req, res, {
			target: 'http://127.0.0.1:8201'
		});
	} else if (req.headers.host === 'api.logigator-local-dev.com') {
		console.log('Proxy Request ' + req.headers.host + req.url);
		res.setHeader('Access-Control-Allow-Credentials', 'true');
		res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
		res.setHeader('Access-Control-Allow-Methods', 'GET,POST,OPTIONS');
		res.setHeader('Access-Control-Allow-Origin', req.headers.origin);
		res.setHeader('Cache-Control', 'no-store');
		proxy.web(req, res, {
			target: 'http://127.0.0.1:8203'
		});
	}
});

server.listen(80);
