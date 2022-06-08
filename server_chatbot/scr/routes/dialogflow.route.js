const chatbot = require('../chatbot/chatbot')
module.exports = app =>{

    app.post('/message/text/send', async(req, res) => {
        console.log(req)
        const {text, email, sessionId } = req.body
        const resultQuery = await chatbot.textQuery(text, email, sessionId)
        console.log(resultQuery)
        const resObj = {
            intentName: resultQuery.intent.displayName,
            userQuery: resultQuery.queryText,
            fulfillmentText: resultQuery.fulfillmentText
        }
        res.send(resObj)
    })

}