module.exports = () => process.env.GITHUB_REF && process.env.GITHUB_REF.split('refs/heads/')[1]
