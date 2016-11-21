

!function (d, s, id)
{
    var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
    if (!d.getElementById(id))
    {
        js = d.createElement(s);
        js.id = id;
        js.src = p + "://platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
    }
}
(document, "script", "twitter-wjs");

window.twttr = (function (d, s, id) 
{
    var t, js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement(s);
    js.id = id;
    js.src = "//platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js, fjs);
    return window.twttr || (t = 
    {
        _e : [],
        ready : function (f)
        {
            t._e.push(f) 
        }
    });
}
(document, "script", "twitter-wjs")) // twitter callback

if (typeof twttr !== 'undefined') {
twttr.ready(function (twttr) 
{
    twttr.events.bind('tweet', function (event) { });
});} 

if (typeof twttr === 'undefined') {
    !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
    }    else {
  twttr.widgets.load();
}
