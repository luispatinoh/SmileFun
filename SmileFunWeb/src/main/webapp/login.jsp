<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Smile Fun</title>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

        <style>
            .centered {
                position:fixed;
                top: 50%;
                left: 50%;
                height:18em;
                margin-top: -9em; /*set to a negative number 1/2 of your height*/
                margin-left: -8em; /*set to a negative number 1/2 of your width*/

            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="main">
                <div class="pure-menu pure-menu-horizontal">
                    <ul class="pure-menu-list" style="float:right">
                        <li class="pure-menu-item pure-menu-selected">Login</li>
                        <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                            <a href="#" id="menuLink1" class="pure-menu-link">Usermame</a>
                            <ul class="pure-menu-children">
                                <li class="pure-menu-item"><a href="#" class="pure-menu-link">Mi perfil</a></li>
                                <li class="pure-menu-item"><a href="#" class="pure-menu-link">Logout</a></li>                
                            </ul>
                        </li>
                    </ul>
                </div>

                <header class="clearfix">

                    <h1>Smile Fun</h1>

                    <div class="support-note">
                        <span class="note-ie">Lo sentimos, se necesita un navegador más reciente.</span>
                    </div>

                </header>


                <div class="centered" style="width:400px">

                    <form class="pure-form">
                        <fieldset class="pure-group">
                            <label>Ingrese sus datos</label>
                            <br/>
                            <br/>
                            <input type="text" class="pure-input-1-2" placeholder="Username" name="logId">
                            <input type="text" class="pure-input-1-2" placeholder="Password" name="password">
                        </fieldset>

                        <button type="submit" class="pure-button pure-input-1-2 pure-button-primary">Ingresar</button>
                    </form>

                </div>



            </div>
        </div>
    </body>
</html>
