<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>

                <title>Progetto di Codifica di Testi</title>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


                <script src="visu.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>

                <div id="info1">
                    <h1>
                        <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@xml:lang='fr']" />
                    </h1>




                </div>

                <div>



                    <div id="info2">



                        <xsl:element name="img">
                            <xsl:attribute name="src">fds.jpg</xsl:attribute>

                        </xsl:element>
                        <xsl:element name="img">
                            <xsl:attribute name="src">fds2.jpg</xsl:attribute>
                        </xsl:element>


                    </div>
                    <div id="articolo1">
                        <article>
                            <h2>Caratteristiche principali</h2>
                            <div>
                                <xsl:apply-templates select="//tei:msContents" />
                            </div>
                        </article>

                    </div>
                    <div id="articolo0">
                        <article>


                            <xsl:apply-templates select="//tei:physDesc" />
                        </article>
                    </div>


                    <div id="visualizza">


                        <ul id="items" class="items">
                            <li >
                                <input type="checkbox" id="abbreviazioni">Abbreviazioni</input>
                            </li>
                            <li >
                                <input type="checkbox" id="del">Cancellazioni e GAP
                                </input>
                            </li>
                            <li>
                                <input type="checkbox" id="reg">Parola normalizzata</input>
                            </li>
                            <li>
                                <input type="checkbox" id="term">Terminologia</input>
                            </li>

                            <li>
                                <input type="checkbox" id="el">Esempi linguistici</input>
                            </li>
                            <li>
                                <input type="checkbox" id="add">Aggiunte</input>
                            </li>
                            <li>
                                <input type="checkbox" id="lang">Glottonimi</input>
                            </li>
                            <li>
                                <input type="checkbox" id="nomiluogo">Toponimi</input>
                            </li>
                            <li>
                                <input type="checkbox" id="nomipersona">Antroponimi</input>
                            </li>
                            <li>
                                <input type="checkbox" id="orgName">Istituzioni</input>
                            </li>


                        </ul>







                    </div>
                </div>







                <article id="p16">
                    <h2> Pagina 16 </h2>


                    <div class="img">
                        <xsl:apply-templates select="//tei:surface[@xml:id='P3_16']" />

                    </div>
                    <div class="cont">
                        <div class="testoorig">
                            <h3>Testo originale</h3>
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '16']" />
                        </div>

                        <div id="traduzionepag16">
                            <h3>Traduzione</h3>
                            <xsl:apply-templates select="//tei:div[@type='traduzionepag16']" />
                        </div>
                    </div>
                </article>

                <article id="p17">
                    <h2> Pagina 17 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='P3_17']" />
                        </div>
                        <div class="cont">
                            <div class="testo">
                                <h3>Testo originale</h3>
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '17']" />
                            </div>
                            <div id="traduzionepag17">
                                <h3>Traduzione</h3>
                                <xsl:apply-templates select="//tei:div[@type='traduzionepag17']" />
                            </div>
                        </div>
                    </div>
                </article>



                <div class="bibl">
                    <h2> Bibliografia </h2>
                    <xsl:apply-templates select="//tei:listBibl" />
                </div>


                <div id="footer">
                    <h2 id="about">Riferimenti</h2>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>
            </body>
        </html>
    </xsl:template>




    <!-- edizione -->

    <xsl:template match="tei:editionStmt">
        <b>
            <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        </b>
        <p>
            <b>Progetto a cura di: </b>
            <i>
                <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='mt']"></xsl:value-of>
            </i> e <i>
            <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='is']"></xsl:value-of>
        </i>
    </p>
    <p>
        <b>Coordinato da: </b>
        <i>
            <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='amdg']"></xsl:value-of>
        </i>
    </p>
    <p>
        <b>Traduzione di: </b>
        <i>
            <xsl:value-of select="//tei:name[@ref='ef']"></xsl:value-of>
        </i>
    </p>
</xsl:template>


<!-- Storia -->
<!--<xsl:template match="tei:history">
    <xsl:apply-templates select="current()/tei:origin" />
</xsl:template>-->


<xsl:template match="tei:msContents">
    <b>Titolo:</b>
    <xsl:value-of select="//tei:msItem/tei:title" />
    <br />
    <b>Data:</b>
    <xsl:value-of select="//tei:time" />
    <br />
    <b>Autore: </b>
    <xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author" />
    <br />
    <b>Lingua: </b>
    <xsl:value-of select="//tei:language" />
    <br />
    <b>Acquisito:</b>
    <xsl:apply-templates select="//tei:settingDesc/tei:setting/tei:name" />
    <br />

</xsl:template>



<!-- Cancellature -->
<xsl:template match="tei:del">
    <del>
        <xsl:apply-templates />
    </del>
</xsl:template>


<xsl:template match="tei:add">
    <add>
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </add>
</xsl:template>


<!-- Supplied -->
<xsl:template match="tei:supplied">
    <add>
        <b>*</b>
        <i>(            <xsl:apply-templates />
)</i>
    </add>
</xsl:template>

<!-- Forma originale -->
<xsl:template match="tei:orig">
    <orig>
        <xsl:apply-templates />
    </orig>
</xsl:template>

<!-- Forma normalizzata -->
<xsl:template match="tei:reg">
    <reg>
        <xsl:element name="span">
            <xsl:attribute name="class">re</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </reg>
</xsl:template>

<!-- Glottonimo -->
<xsl:template match="tei:lang">
    <xsl:element name="span">
        <xsl:attribute name="class">lang</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<!-- orgName -->
<xsl:template match="tei:orgName">
    <xsl:element name="span">
        <xsl:attribute name="class">istituzione</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<!--antroponimi-->
<xsl:template match="tei:persName">
    <xsl:element name="span">
        <xsl:attribute name="class">nome</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<!--toponimi-->
<xsl:template match="tei:placeName">
    <xsl:element name="span">
        <xsl:attribute name="class">place</xsl:attribute>
        <xsl:apply-templates />
    </xsl:element>
</xsl:template>


<!-- Esempio linguistico -->
<xsl:template match="tei:mentioned">
    <xsl:choose>
        <xsl:when test="current()[@rend='underline']">
            <mentioned>
                <u>
                    <xsl:apply-templates />
                </u>
            </mentioned>
        </xsl:when>
        <xsl:otherwise>
            <mentioned>
                <xsl:apply-templates />
            </mentioned>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>


<!-- Abbreviazioni -->
<xsl:template match="tei:abbr">

    <xsl:element name="span">
        <xsl:attribute name="class">abbr</xsl:attribute>
        <xsl:value-of select="current()" />


    </xsl:element>

</xsl:template>

<xsl:template match="tei:expan">
    <xsl:element name="span">
        <xsl:attribute name="class">expan</xsl:attribute>

        <xsl:value-of select="current()" />

    </xsl:element>
</xsl:template>

<!-- Elementi mancanti -->
<xsl:template match="tei:gap">
    <xsl:element name="span">
        <xsl:attribute name="class">gap</xsl:attribute>
        <span class="gap">(..?..)</span>
    </xsl:element>
</xsl:template>

<!-- Termini in corsivo -->
<xsl:template match="tei:hi[@rend = 'italic']">
    <i>
        <xsl:apply-templates />
    </i>
</xsl:template>

<!-- Grassetto -->
<xsl:template match="tei:hi[@rend = 'bold']">
    <b>
        <xsl:apply-templates />
    </b>
</xsl:template>

<!-- Sottolineature -->
<xsl:template match="tei:emph[@rend = 'underline']">
    <u>
        <xsl:apply-templates />
    </u>
</xsl:template>

<!-- Page beginning -->
<xsl:template match="tei:pb">
    <xsl:element name="div">
        <xsl:attribute name="id">pag<xsl:value-of select="current()/@n" />
        </xsl:attribute>
    </xsl:element>
</xsl:template>

<!-- Line beginning -->
<xsl:template match="tei:lb">
    <br />
    <xsl:element name="span">
        <xsl:attribute name="class">numero</xsl:attribute>
        <xsl:attribute name="id">
            <xsl:value-of select="current()/@xml:id"/>
        </xsl:attribute>
        <b>
            <xsl:value-of select="@n" />
        </b>
        <xsl:value-of select="text()"/>
    </xsl:element>
</xsl:template>

<!--termini-->
<xsl:template match="tei:term">
    <xsl:element name="span">
        <xsl:choose>
            <xsl:when test="name() = 'term'">
                <xsl:attribute name="class">termini</xsl:attribute>
            </xsl:when>
        </xsl:choose>

        <xsl:apply-templates />


        <!--attributo Tooltip-->
        <xsl:element name="span">
            <xsl:choose>
                <xsl:when test="name() = 'term'">
                    <xsl:attribute name="class">tooltip</xsl:attribute>
                    <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
                </xsl:when>




            </xsl:choose>
        </xsl:element>
    </xsl:element>
</xsl:template>





<!-- Template immagini -->
<xsl:template match="tei:surface">
    <xsl:element name="img">
        <xsl:attribute name="src">
            <xsl:value-of select="concat(@xml:id, '.png')" />
        </xsl:attribute>
    </xsl:element>

</xsl:template>



<!-- Descrizione fisica -->
<xsl:template match="tei:physDesc">
    <xsl:element name="div">
        <h2>Descrizione fisica</h2>
        <xsl:element name="div">
            <b>Supporto: </b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:support" />
            </xsl:element>
            <br />
            <b>Condizioni: </b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:condition" />
            </xsl:element>
            <br />
            <b>Quantità: </b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:extent" />
            </xsl:element>
            <br />
            <b>Layout:</b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:layout" />
            </xsl:element>
            <br />
            <b>Mani: </b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:handDesc" />
            </xsl:element>
            <br />
            <b>Grafia: </b>
            <xsl:element name="a">
                <xsl:apply-templates select="current()//tei:typeDesc" />
            </xsl:element>
        </xsl:element>
    </xsl:element>
</xsl:template>





<!-- Template bibliografia -->

<xsl:template match="tei:listBibl">
    <xsl:for-each select="current()/tei:bibl">
        <xsl:text>&#xA0;</xsl:text>
        <xsl:for-each select="current()//tei:author">
            <xsl:value-of select="normalize-space(current())" />
        </xsl:for-each>
        ,
        <i>
            <xsl:value-of select="current()/tei:title" />
        </i>
        ,
        <xsl:apply-templates select="current()/tei:pubPlace" />
        ,
        <xsl:text>&#xA0;</xsl:text>
        <xsl:value-of select="current()/tei:publisher" />
        ,
        <xsl:text>&#xA0;</xsl:text>
        <xsl:value-of select="current()/tei:date" />
        .
        <xsl:text>&#xA0;</xsl:text>

    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
