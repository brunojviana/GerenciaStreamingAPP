const config = require('../config/key')

const projectId = config.googleProjectId;
const sessionId = config.dialogFlowSessionId

var dialogflow = require('dialogflow');
    var sessionClient = new dialogflow.SessionsClient({
        credentials: {
            private_key: config.googlePrivateKey,
            client_email: config.googleClientEmail
        }
    }
);

const textQuery = async(userText, userEmail, sessionId) => {
    const sessionPath = sessionClient.sessionPath(projectId, sessionId+userEmail, sessionId);
    const request = {
        session: sessionPath,
        queryInput:{
            text:{
                text:userText,
                languageCode: config.dialogFlowSessionLanguageCode
            }
        }
    }

    try{
        const response = await sessionClient.detectIntent(request)
        return response[0].queryResult
    }catch(err){
        console.log(err)
        return err
    }
}

module.exports = {
    textQuery
}