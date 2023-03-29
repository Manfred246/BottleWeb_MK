<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - My Bottle Application</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/main_content.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body>
    <div class="outer">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a><img src="/static/images/logo_nav.png" class="navbar-brand" width="70px" height="60px"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/home">Home</a></li>
                        <li><a href="/about">Images</a></li>
                    </ul>
                </div>
            </div>
        </div>



        <div class="container body-content">
            {{!base}}    
            <hr />
            <footer>
                <div class="wrapper">        
                <p>&copy; {{ year }} - Matthew | Kate corp</p>
                </div>
            </footer>
        </div>

        <script src="/static/scripts/jquery-1.10.2.js"></script>
        <script src="/static/scripts/bootstrap.js"></script>
        <script src="/static/scripts/respond.js"></script>        
    </div>

</body>
</html>