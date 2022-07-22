const hre = require("hardhat")
const fs = require("fs")


async function convertAllToURI() {
    let baseDir = "../artwork/original/"
    let filenames = fs.readdirSync(baseDir)
    filenames.forEach(async (filename) => {
        let fullURI = await convertToURI(filename, baseDir)
        let txtFilename = filename.replace(".png", ".txt")
        txtFilename = txtFilename.replace(".svg", ".txt")
        fs.writeFileSync(`../artwork/base64/${txtFilename}`, fullURI)
    })
}

async function convertToURI(filename, baseDir) {
    let base64 = fs.readFileSync(`${baseDir}${filename}`, { encoding: "base64" })
    // you can also do data:image/svg+xml;base64
    let fullURI = `data:image/png;base64,${base64}`
    return fullURI
}

convertAllToURI()

module.exports = {
    convertToURI
}