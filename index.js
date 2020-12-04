const express = require("express"),
    morgan = require("morgan");

const app = express();

// terminal logger
app.use(morgan('common'));

// static public folder
app.use(express.static('public'));

// error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});


let topMovies = [
    {
      title: 'The Lost Boys',
      director: 'Joel Shumacher',
      year: '1987'
    },
    {
      title: 'Day of the Dead',
      director: 'George A. Romero',
      year: '1985'
    },
    {
      title: 'Return of the Living Dead',
      director: 'Dan O\'Bannon',
      year: '1985'
    },
    {
      title: 'They Live',
      director:'John Carpenter',
      year: '1988'
    },
    {
      title: 'Fright Night',
      director:'Tom Holland',
      year: '1985'
    },
    {
      title: 'Videodrome',
      director:'David Cronenberg',
      year: '1983'
    },
    {
      title: 'Beetlejuice',
      director:'Tim Burton',
      year: '1988'
    },
    {
      title: 'The Blob',
      director:'Chuck Russell',
      year: '1988'
    },
    {
      title: 'Dreamscape',
      director:'Joseph Ruben',
      year: '1984'
    },
    {
      title: 'Poltergeist',
      director:'Tobe Hooper',
      year: '1982'
    }
  ];

app.get('/', (req, res) => {
    res.send('Index test text,  say that 10 times fast')
});

app.get('/movies', (req, res) => {
  res.json(topMovies);
});

// listen for requests
app.listen(8080, () => {
  console.log('Your app is listening on port 8080.');
});