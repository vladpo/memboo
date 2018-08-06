
open Css
structure Bs4 = Bootstrap4

fun js url = return (Script.insert (blessMime "text/javascript") (bless url))

fun main () = 
  gaScript <- js "https://www.googletagmanager.com/gtag/js?id=UA-123401300-1";
  initGaScript <- js "scripts.js";
  jquery <- js "https://code.jquery.com/jquery-3.2.1.slim.min.js";
  popper <- js "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js";
  bootstrap <- js "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js";
  id <- fresh;
  return 
    <xml>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <title>Memboo photo booth</title>
        <link rel="profile" href="http://gmpg.org/xfn/11"/>
        <link rel="manifest" href="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/manifest.json"/>
        <link rel="shortcut icon" href="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/favicon.ico"/>
        <meta name="msapplication-config" content="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/browserconfig.xml"/>
        <link rel="dns-prefetch" href="//fonts.googleapis.com" />
        <link rel="dns-prefetch" href="//s.w.org" />
        {gaScript}
        {initGaScript}
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        {jquery}
        {popper}
        {bootstrap}
      </head>
      <body data-spy="scroll" data-offset="71" data-target=".navbar:visible">
        <nav class={classes (classes Bs4.navbar Bs4.navbar_expand_lg) (classes Bs4.fixed_top Bs4.navbar_light)}>
          <div class={Bs4.container}>
            <a class={classes Bs4.navbar_brand Bs4.d_lg_none} href="/">Memboo</a>
            <button class={Bs4.navbar_toggler} data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class={Bs4.navbar_toggler_icon}></span>
            </button>
            <div class={classes Bs4.collapse Bs4.navbar_collapse} id={id}>
              <ul class={classes Bs4.navbar_nav Bs4.mr_auto}>
                <li class={Bs4.nav_item}>
                  <a class={Bs4.nav_link} href="about-us.html">About Us</a>
                </li>
                <li class={Bs4.nav_item}>
                  <a class={Bs4.nav_link} href="reservation.html">Reservation</a>
                </li>
              </ul>
              <a class={classes (classes Bs4.navbar_brand Bs4.d_none) Bs4.d_lg_flex} href="/"></a>
              <ul class={classes Bs4.navbar_nav Bs4.ml_auto}>
                <li class={Bs4.nav_item}>
                  <a class={Bs4.nav_link} href="news-and-events.html">"News &amp; Events"</a>
                </li>
                <li class={Bs4.nav_item}>
                  <a class={Bs4.nav_link} href="gallery.html">Gallery</a>
                </li>
                <li class={Bs4.nav_item}>
                  <a class={Bs4.nav_link} href="contact-us.html">Contact</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </body>
    </xml>