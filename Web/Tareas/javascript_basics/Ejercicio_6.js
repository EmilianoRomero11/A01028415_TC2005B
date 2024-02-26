function hackerSpeak(string) {
    const String = string.replace(/[aeios]/gi, function(match) {
      if (match.toLowerCase() === 'a') return '4'
      if (match.toLowerCase() === 'e') return '3'
      if (match.toLowerCase() === 'i') return '1'
      if (match.toLowerCase() === 'o') return '0'
      if (match.toLowerCase() === 's') return '5'
      return match
    })
    return String
  }
  
  const string = 'Javascript es divertido'
  const hS = hackerSpeak(string)
  console.log(hS)