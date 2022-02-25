xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html5";
declare option output:media-type "text/html";

let $detail := request:get-parameter("recipe",())

(: Daten in eine Referenz laden :)
let $data := collection("/db/apps/modulpruefung/data")


(: get recipe with key :)
let $title := $detail
let $document := $data//recipe[@key=$detail]

return
    <html>
        <head>
            <meta charset="UTF-8"/>
            <link rel="stylesheet" href="./style.css" />
            <title>{$title}</title>
        </head>
        <body>
            <nav>
                <a href="./index.xql" class="homelink">Home</a>
                <form action="./search.xql" method="GET">
                    <input type="text" class="q" placeholder="Suchen ..." name="q"/>
                </form>    
            </nav>
            <h1>
                {$title}
            </h1>
            <div class="container">
                <div class="ingredients">
                    <h2>Zutaten:</h2>
                        <ul>
                            {
                                for $ingredient in $document//ingredient
                                return
                                    <li>{$ingredient}</li>   
                            }
                        </ul>
                </div>
                <div class="instructions">
                    <h2>Anweisungen:</h2>
                    {$document//instructions}
                </div>
            </div>
        </body>
    </html>
