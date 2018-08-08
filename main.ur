
open Css
structure Bs4 = Bootstrap4
structure FA = Fontawesome

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
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"/>
        {jquery}
        {popper}
        {bootstrap}
      </head>
      <body data-spy="scroll" data-offset="71" data-target=".navbar:visible">
        <div class={Css.mirror}>
          <img class={Css.slider} width=1920 height=1080 src={bless "/main.jpg"}/>
        </div>
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
                  <a class={Bs4.nav_link} href="news-and-events.html">News &amp; Events</a>
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
        <div class={classes Css.section Css.sectionIntro} data-parallax="scroll" data-image-src="/main.jpg">
          <div class={Css.sectionIntroMid}>
            <div class={Bs4.container}>
              <div class={classes Bs4.row Css.alignCenter}>
                <div class={Css.col}>
                  <h1 class={classes Css.sectionTitle (classes Css.sectionIntroTitle Bs4.text_center)}>
                    Memboo
                  </h1>
                  <p class={classes Css.sectionIntroDescription (classes Bs4.text_center Bs4.text_muted)}>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non illo, alias animi iusto neque, sint corrupti? Laudantium, dignissimos id excepturi facilis, facere saepe quasi placeat praesentium ipsa sapiente illo molestiae?
                  </p>
                  <div class={Bs4.text_center}>
                    <a href="#oferta" class={classes Bs4.btn (classes Bs4.btn_primary Css.textWhite)}>
                      Aplica pentru o oferta
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class={Css.sectionIntroFooter}>
            <div class={Bs4.container}>
              <div class={classes Bs4.row Css.alignCenter}>
                <div class={Css.colMd}>
                  <ul class={classes Css.sectionIntroFooterSocial (classes Bs4.text_center Css.textLgLeft)}>
                    <li>
                      <a href="#">
                        <i class={classes FA.fa FA.fa_twitter}></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class={classes FA.fa FA.fa_facebook}></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class={classes FA.fa FA.fa_instagram}></i>
                      </a>
                    </li>
                  </ul>
                </div>
                <div class={Css.colMd}>
                  <div class={classes Css.sectionIntroFooterAddr (classes Bs4.text_center Css.textLgRight)}>
                    <i class={classes FA.fa FA.fa_map_marker}></i> Cluj-Napoca, Dorobantilor 105, 54005
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>
    </xml>