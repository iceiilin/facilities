const path = require('path')
    , fs   = require('fs')


function more (workshopper) {
  var meta     = workshopper.getExerciseMeta(workshopper.current)
    , moreFile
    , exercise


  if (!meta)
    return workshopper.error('No exercise selected')

  moreFile = path.join(meta.dir, './more.md')

  if (!fs.existsSync(moreFile)) {
    return workshopper.error(
        'No more information, use `'
      + workshopper.appName
      + ' print` to show exercise problem statement for "'
      + meta.name
      + '"'
    )
  }

  workshopper.print.file(workshopper.appName, workshopper.appDir, moreFile)
}


module.exports = more