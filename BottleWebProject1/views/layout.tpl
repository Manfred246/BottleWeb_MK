<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - QuokkaLand</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/main_content.css">
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body>
    <div class="container main-nav">
        <div class="navbar-header">
            <a><img href="/" src="/static/images/logo_nav.png" class="navbar-brand" width="80px" height="70px"></a>
        </div>
        <div class="navbar-collapse collapse" id="navbarNavAltMarkup">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="/gallery" class="nav-link">Gallery</a></li>                
                <li class="nav-item"><a href="/writes" class="nav-link">Articles</a></li>
                <li class="nav-item"><a href="/reviews" class="nav-link">Reviews</a></li>
            </ul>
        </div>
    </div>

    <div class="outer">
        <div class="container body-content">
            {{!base}}
            <hr />
            <footer>
                <div class="wrapper site-header"> 
                    <p class="footer-text">&copy; {{ year }} - Matthew | Kate corp</p>
                </div>
            </footer>
        </div>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>
