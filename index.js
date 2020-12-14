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


app.get('/movies', (req, res) => {
  res.json(topMovies);
});

app.get('/movies/:title', (req, res) => {
  res.send('Successful GET request returning data on single movie');
});

app.get('/movies/genres/:title', (req, res) => {
  res.send("Successful GET request returning data about a genre of a movie by it's title");
});

app.get('/movies/directors/:name', (req, res) => {
  res.send('Successful GET request returning data about a director by name');
});

app.post('/users', (req, res) => {
  res.send('Successful POST request allowing new user to register');
});

app.put('/users/:username', (req, res) => {
  res.send('Successful PUT request allowing existing user to update their information');
});

app.post('/users/:username/movies/:title', (req, res) => {
  res.send('Successful POST request allowing user to add a movie to their favorites list');
});

app.delete('/users/:username/movies/:title', (req, res) => {
  res.send('Successful POST request allowing user to remove a movie from their favorites list');
});

app.delete('/users/:username', (req, res) => {
  res.send('Successful DELETE request allowing user to deregister');
});

// listen for requests
app.listen(8080, () => {
  console.log('Your app is listening on port 8080.');
});