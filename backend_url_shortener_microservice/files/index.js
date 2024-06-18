require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const dns = require('node:dns');
const bodyParser = require('body-parser');

// Basic Configuration
const port = process.env.PORT || 3000;

const url_map_lol = {}
var R_INDEX = 1

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));
app.use(bodyParser.urlencoded({ extended: true }));


app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});


app.post('/api/shorturl', function(req, res) {
  try {
    let U = new URL(req.body.url)
    dns.lookup(U.hostname, (err, address, family) => {
      if(err) {
        res.json({ error: 'invalid url' });
        return
      };
      url_map_lol[`${R_INDEX}`] = req.body.url
      res.json({
        original_url: req.body.url,
        short_url:R_INDEX
      })
      R_INDEX++
      return
    });
  } catch (error) {
    res.json({ error: 'invalid url' });
  }
  
});

app.get('/api/shorturl/:url_id', function(req, res) {
  if(new RegExp(/^\d+$/).test(req.params.url_id)){
    let id = parseInt(req.params.url_id)
    res.redirect(url_map_lol[`${id}`]);
  } else {
    res.json({ error: 'invalid url' });
  }
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
