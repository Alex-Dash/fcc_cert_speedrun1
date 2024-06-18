// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});

 
app.get("/api/:date", function (req, res) {
  try {
    let dt_raw = req.params.date
    let dt = new Date()
    if(new RegExp(/^\d+$/).test(dt_raw)){
      dt = new Date(parseInt(dt_raw))
    } else {
      dt = new Date(decodeURIComponent(dt_raw))
    }
    if(isNaN(dt.valueOf())){
      res.json({error: "Invalid Date"})
      return
    }
    res.json({
      unix: dt.getTime(),
      utc: dt.toGMTString()
    })
  } catch (error) {
    res.json({error: error})
  }
});

app.get("/api/", function (req, res) {
  let dt = new Date()
  res.json({
    unix: dt.getTime(),
    utc: dt.toGMTString()
  })
});



// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
