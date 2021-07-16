const express = require('express');
const jsonGraphqlExpress = require('json-graphql-server');
const data = require('./data');
const cors = require('cors');
const PORT = process.env.PORT || 5000;
const hostname = '127.0.0.1'
const app = express();

app.use(cors());
app.get('/', (req, res) => res.redirect('/graphql'));
app.use('/graphql', jsonGraphqlExpress.default(data));
app.listen(PORT, hostname, () => console.log(`Listening on port ${PORT}!`));
