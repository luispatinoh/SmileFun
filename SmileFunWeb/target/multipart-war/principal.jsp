<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Smile Fun</title>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script src="js/modernizr.custom.70736.js"></script>
        <noscript><link rel="stylesheet" type="text/css" href="css/noJS.css"/></noscript>
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
        <div class="container">

        <div class="main">


            <div class="pure-menu pure-menu-horizontal">
                <ul class="pure-menu-list" style="float:right">
                    <li class="pure-menu-item pure-menu-selected">Home</li>
                    <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                        <a href="#" id="menuLink1" class="pure-menu-link">Usermame</a>
                        <ul class="pure-menu-children">
                            <li class="pure-menu-item"><a href="#" class="pure-menu-link">My Profile</a></li>
                            <li class="pure-menu-item"><a href="#" class="pure-menu-link">Logout</a></li>                
                        </ul>
                    </li>
                </ul>
            </div>

            <header class="clearfix">

                <h1>Smile Fun</h1>
                <h2>Bienvenido ${user}</h2>

                <div class="support-note">
                    <span class="note-ie">Lo sentimos, se necesita un navegador m�s reciente..</span>
                </div>

            </header>

            <div class="gamma-container gamma-loading" id="gamma-container">

                <ul class="gamma-gallery">
                    <li>
                        <div data-alt="img03" data-description="<h3>Replace with title</h3>" data-max-width="1800" data-max-height="1350">
                            <div data-src="images/large/balloons.jpg" data-min-width="1300"></div>								
                            <div data-src="images/small/balloons.jpg"></div>
                            <noscript>
                                <img src="images/small/balloons.jpg" alt="img03"/>
                            </noscript>
                        </div>
                    </li>

                </ul>

                <div class="gamma-overlay"></div>

            </div>

        </div><!--/main-->
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script src="js/jquery.masonry.min.js"></script>
    <script src="js/jquery.history.js"></script>
    <script src="js/js-url.min.js"></script>
    <script src="js/jquerypp.custom.js"></script>
    <script src="js/gamma.js"></script>
    <script type="text/javascript">

        $(function () {

            var GammaSettings = {
                // order is important!
                viewport: [{
                        width: 1200,
                        columns: 5
                    }, {
                        width: 900,
                        columns: 4
                    }, {
                        width: 500,
                        columns: 3
                    }, {
                        width: 320,
                        columns: 2
                    }, {
                        width: 0,
                        columns: 2
                    }]
            };

            Gamma.init(GammaSettings, fncallback);


            // Example how to add more items (just a dummy):



            function fncallback() {



            }

        });

    </script>
    </body>
</html>