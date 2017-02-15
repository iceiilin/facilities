# workshopper-more

**Implement `workshop-app more` command for more detailed docs**

[![NPM](https://nodei.co/npm/workshopper-more.png?downloads=true&stars=true)](https://nodei.co/npm/workshopper-more/) [![NPM](https://nodei.co/npm-dl/workshopper-more.png?months=3)](https://nodei.co/npm/workshopper-more/)

```js
var more = require('workshopper-more')

workshopper({

    name        : 'Fancy workshop'

    // ... more options

  , commands    : [{
          name    : 'more' // name of the command arg
        , menu    : false  // don't show this in the main menu
        , short   : 'm'    // shortcut, `-m`
        , handler : more   // defer to workshopper-more to do its thang
    }]
})
```

Then, in each exercise for which you have more data than can fit on the problem statement, create a *more.md* alongside the *problem.md* and the user can `workshop-app more` to view that file. Alternatives include `workshop-app --more`, `workshop-app -m`.

## License

**workshopper-more** is Copyright (c) 2014 Rod Vagg [@rvagg](https://twitter.com/rvagg) and contributors licensed under the MIT License. All rights not explicitly granted in the MIT License are reserved. See the included [LICENSE.md](./LICENSE.md) file for more details.
