const express = require('express');

const app = express();

app.use(express.json());

app.get('/getXRealUserId', async (req, res) => {
    console.log("> getXRealUserId");
    const cookie = req.query.cookie;
    const cianId = req.query.cianId;

    if (cianId === '100') {
        res.send({XRealUserId: '101', finAuth: true});
        return;
    }

    if (cookie === '777') {
        res.send({XRealUserId: '777', finAuth: true});
        console.log("< getXRealUserId found by cookie authorized user");
        return
    }

    if (cookie === '666') {
        res.send({XRealUserId: '666', finAuth: false});
        console.log("< getXRealUserId found by cookie unauthorized user");
        return
    }

    console.log("< getXRealUserId unknown cookie");
    res.send({});
});

app.get('/generateFinauthCookie', async (req, res) => {
    console.log("> generateFinauthCookie");
    // if (!!req.cookies.finauth) {
    //     res.send();
    //     console.log("< generateFinauthCookie exit 1");
    //     return;
    // }
    const userId = 'xxxx-xxxx';
    const cookie = `${userId}`;
    const maxAge = 12 * 60 * 60 * 1000;
    const expire = new Date();
    expire.setTime(expire.getTime() + maxAge);

    // res.cookie('finauth', cookie, {maxAge: maxAge, domain: 'localhost', path: '/', httpOnly: true, secure: true});
    res.cookie('finauth', cookie, {maxAge: maxAge, domain: 'localhost', path: '/'});
    console.log("< generateFinauthCookie exit 2");
    res.send({XRealUserId: userId, finAuth: false});
});

module.exports = app.listen(process.env.PORT || 3002, () => console.log(`Listen on ${process.env.PORT || 3002}`));
