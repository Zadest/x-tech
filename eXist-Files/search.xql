xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html5";
declare option output:media-type "text/html";

(: Daten in eine Referenz laden :)
let $data := collection("/db/apps/modulpruefung/data")

(: check for search query :)
let $query := request:get-parameter("q",())
let $results := distinct-values($data/recipe[contains(.,$query)]/@key|$data/recipe[contains(@key,$query)]/@key)
return
       <html>
        <head>
            <meta charset="UTF-8"/>
            <link rel="stylesheet" href="./style.css" />
            <title>Suchergebnisse</title>
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
        if(count($results) < 1) then (
              <h1>Kein Ergebnis gefunden</h1>
            )
            else (
                for $result in $results
                return <a href="./detail.xql?recipe={$result}"><li class="item">{$result}</li></a>
                )
    }
        </ul>
                </div>
        </body>
    </html>