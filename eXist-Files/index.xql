xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html5";
declare option output:media-type "text/html";

(: Daten in eine Referenz laden :)
let $data := collection("/db/apps/modulpruefung/data")

(: get all :)
let $dokumentKeyList := distinct-values($data//recipe/@key)


return
    <html>
        <head>
            <meta charset="UTF-8"/>
            <link rel="stylesheet" href="./style.css" />
            <title>Overview</title>
        </head>
        <body>
            <nav>
                <a href="./index.xql" class="homelink">Home</a>
                <form action="./search.xql" method="GET">
                    <input type="text" class="q" placeholder="Suchen ..." name="q"/>
                </form>    
        </nav>
        <div class="listview">
            <ul class="listing">
                
    {
        for $title in $dokumentKeyList
        return
            <a href="./detail.xql?recipe={$title}"><li class="item">{$title}</li></a>
    }
            </ul>
        </div>
        </body>
    </html>
