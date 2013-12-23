wordsies = require '../lib/words.coffee'
words = wordsies.words()

newCount = (word) ->
  word = word.toLowerCase()
  return 1  if word.length <= 3
  word = word.replace(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, "")
  word = word.replace(/^y/, "")
  word.match(/[aeiouy]{1,2}/g).length

ones = []
twos = []
threes = []

for word in words
  count = newCount word
  if count is 1
    ones.push word
  else if count is 2
    twos.push word
  else if count is 3
    threes.push word

console.log threes

module.exports = 

  producePhrase: (size) ->
    phrase = ""
    sylToGo = size
    while sylToGo > 0
      if sylToGo is 1
        phrase += ones[parseInt(Math.random()*ones.length)]
        sylToGo = 0
      else if sylToGo is 2
        phrase += twos[parseInt(Math.random()*twos.length)]
        sylToGo = 0
      else if sylToGo is 3
        phrase += threes[parseInt(Math.random()*threes.length)]
        sylToGo = 0
      else
        word = words[parseInt(Math.random()*words.length)]
        wordSyl = newCount word
        if (sylToGo > wordSyl) and (sylToGo - wordSyl >= 0)
          console.log sylToGo
          phrase += word += " "
          sylToGo -= wordSyl
    console.log phrase
    return phrase