xquery version "3.0";

(:module namespace app="http://projects.cceh.uni-koeln.de:8080/apps/pessoa/templates";:)
module namespace app="http://localhost:8080/exist/apps/pessoa/templates";
import module namespace templates="http://exist-db.org/xquery/templates" at "templates.xql";
(:
import module namespace config="http://projects.cceh.uni-koeln.de:8080/apps/pessoa/config" at "config.xqm";
import module namespace lists="http://projects.cceh.uni-koeln.de:8080/apps/pessoa/lists" at "lists.xqm";
import module namespace doc="http://projects.cceh.uni-koeln.de:8080/apps/pessoa/doc" at "doc.xqm";
import module namespace helpers="http://projects.uni-koeln.de:8080/apps/pessoa/helpers" at "helpers.xqm";

:)
import module namespace config="http://localhost:8080/exist/apps/pessoa/config" at "config.xqm";
import module namespace lists="http://localhost:8080/exist/apps/pessoa/lists" at "lists.xqm";
import module namespace doc="http://localhost:8080/exist/apps/pessoa/doc" at "doc.xqm";
import module namespace pub="http://localhost:8080/exist/apps/pessoa/pub" at "pub.xqm";
import module namespace helpers="http://localhost:8080/exist/apps/pessoa/helpers" at "helpers.xqm";
import module namespace search="http://localhost:8080/exist/apps/pessoa/search" at "search.xqm";
import module namespace author="http://localhost:8080/exist/apps/pessoa/author" at "author.xqm";
import module namespace page="http://localhost:8080/exist/apps/pessoa/page" at "page.xqm";
import module namespace charts="http://localhost:8080/exist/apps/pessoa/charts" at "charts.xqm";

import module namespace kwic="http://exist-db.org/xquery/kwic";
declare namespace util="http://exist-db.org/xquery/util";
declare namespace text="http://exist-db.org/xquery/text";

declare namespace request="http://exist-db.org/xquery/request";

declare namespace tei="http://www.tei-c.org/ns/1.0";
(:declare namespace range="http://exist-db.org/xquery/range";:)

(:~
 : This is a sample templating function. It will be called by the templating module if
 : it encounters an HTML element with a class attribute: class="app:test". The function
 : has to take exactly 3 parameters.
 : 
 : @param $node the HTML node with the class attribute which triggered this call
 : @param $model a map containing arbitrary data - used to pass information between template calls
 :)
declare function app:test($node as node(), $model as map(*)) {
    <p>Dummy template output generated by function app:test at {current-dateTime()}. The templating
        function was triggered by the class attribute <code>class="app:test"</code>.</p>
};



declare function app:get-bibl($node as node(), $model as map(*), $type as xs:string)as item()* {
    let $xml := doc("/db/apps/pessoa/data/bibl.xml")
    let $stylesheet := doc("/db/apps/pessoa/xslt/bibl.xsl")
    let $typ := substring-after($type,"bib")
    return  transform:transform($xml, $stylesheet,(<parameters><param name="listNo_string" value="{$typ}"/></parameters>))

};







