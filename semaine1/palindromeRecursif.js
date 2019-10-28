funtion replace(mot);
    var mot = mot
    function replace(" ", "") {
    }
    function palindrome(mot) {
    if((mot.length == 0) || (mot.length == 1)) {
        return true
    } else {
        if(mot[0]!=mot[mot.length-1]) {
        return false
    } else {
        if(mot.substring(1,mot.length-1))
        return palindrome(mot.substring(1,mot.length-1))
return true
}
}
}
console.log(palindrome("esope reste ici et se repose"))
console.log(palindrome("kayak"))