export function getFileType(filename) {
    console.log("Filename: " + filename)
    let extToFileType = {'rb': 'ruby', 'py': 'python', 'js': 'javascript'}
    let regexp = /([a-zA-Z\d-_\s]+)\.([a-zA-z]+)/
    let matches = regexp.exec(filename)
    console.log("Matches: " + matches)
    if (matches != null && matches.length > 1) {
        let filetype = extToFileType[matches[2]]
        if (filetype !== undefined)
            return filetype
    }
    return "text/plain"

}