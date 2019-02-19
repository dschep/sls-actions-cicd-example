console.log(process.env.GITHUB_REF)
module.exports = () => process.env.GITHUB_REF && process.env.GITHUB_REF.split('refs/head/')[1]
