haiku = require '../lib/haiku'

module.exports =
	index: (req, res) ->
    fiveOne = haiku.producePhrase(5)
    seven = haiku.producePhrase(7)
    fiveTwo = haiku.producePhrase(5)
    res.render "newproject",
      metadata:
        title: "Haikugen"
        one: fiveOne
        two: seven
        three: fiveTwo