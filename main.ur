
open Css
open Tags
structure Bs4 = Bootstrap4
structure FA = Fontawesome
structure Plx = Parallax
structure Flky = Flickity

fun js url = return (Script.insert (blessMime "text/javascript") (bless url))

fun handler r = return <xml><body>
    <table>
    <tr> <th>Full name:</th> <td>{[r.FullName]}</td> </tr>
    <tr> <th>Phone:</th> <td>{[r.Phone]}</td> </tr>
    <tr> <th>Email:</th> <td>{[r.Email]}</td> </tr>
    <tr> <th>People:</th> <td>{[r.People]}</td> </tr>
    <tr> <th>Date:</th> <td>{[r.Date]}</td> </tr>
    <tr> <th>ClientType:</th> <td>{[r.ClientType]}</td> </tr>
  </table>
  </body></xml>

fun main () = 
  gaScript <- js "https://www.googletagmanager.com/gtag/js?id=UA-123401300-1";
  scripts <- js "/scripts.js";
  jquery <- js "https://code.jquery.com/jquery-3.2.1.slim.min.js";
  popper <- js "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js";
  bootstrap <- js "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js";
  parallax <- js "/parallax.min.js";
  flickity <- js "/flickity.pkgd.min.js";
  id <- fresh;
  sectionQuoteId <- fresh;
  quoteFormId <- fresh;
  quoteFormNameId <- fresh;
  quoteFormPhoneId <- fresh;
  quoteFormEmailId <- fresh;
  quoteFormPeopleId <- fresh;
  quoteFormDateId <- fresh;
  quoteFormClientType <- fresh;
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <link rel="stylesheet" href="/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"/>
        <link rel="stylesheet" href="/flickity.min.css"/>
        {jquery}
        {popper}
        {bootstrap}
        {parallax}
        {flickity}
        {scripts}
      </head>
      <body data-spy="scroll" data-offset="71" data-target=".navbar:visible">
        <nav class={classes (classes Bs4.navbar Bs4.navbar_expand_lg) (classes Bs4.fixed_top Bs4.navbar_light)}>
          <div class={Bs4.container}>
            <a class={classes Bs4.navbar_brand Bs4.d_lg_none} href="/">Memboo</a>
            <button class={Bs4.navbar_toggler} data-toggle="collapse" data-target={strcat "#" (show id)} aria-controls={show id} aria-expanded="false" aria-label="Toggle navigation">
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
              <a class={classes (classes Bs4.navbar_brand Bs4.d_none) Bs4.d_lg_flex} href="/">Memboo</a>
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
        <section class={classes Css.css_section Css.sectionIntro} data-parallax="scroll" data-image-src="/main.jpg">
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
                    <a href={bless(strcat "#" (show sectionQuoteId))} class={classes Bs4.btn (classes Bs4.btn_primary Css.textBlack)}>
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
                        <i class={classes FA.fab FA.fa_twitter}></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class={classes FA.fab FA.fa_facebook}></i>
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class={classes FA.fab FA.fa_instagram}></i>
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
        </section>
        <section class={classes Css.css_section (classes Css.sectionHardware Css.sectionNoPaddingBottom)}>
          <div class={Bs4.container}>
            <div class={Bs4.row}>
              <div class={classes Bs4.col_md_2 Css.alignSelfStart}>
                <p class={Css.sectionHardwareDesc}>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                </p>
              </div>
              <div class={classes Bs4.col_md_4 Css.alignSelfStart}>
                <div class={Css.sectionHardwareImg}>
                  <img src="/m1.png" class={Css.imgFluid} alt="..."/>
                </div>
              </div>
              <div class={classes Bs4.col_md_6 Css.alignSelfCenter}>
                <h2><em>Lorem ipsum</em> dolor sit amet</h2>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias veritatis nisi, consequatur, laborum libero a neque ducimus. Porro rem illum quo nostrum quisquam asperiores, blanditiis, consectetur. Possimus facilis velit, voluptatibus!
                </p>
              </div>
            </div>
          </div>
        </section>
        <section class={classes Css.css_section Css.sectionHardware}>
          <div class={Bs4.container}>
            <div class={Bs4.row}>
              <div class={classes Bs4.col_md_2 (classes Css.order2 Css.alignSelfEnd)}>
                <p class={Css.sectionHardwareDesc}>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                </p>
              </div>
              <div class={classes Bs4.col_md_4 (classes Css.order3 Css.alignSelfStart)}>
                <div class={Css.sectionHardwareImg}>
                  <img src="/m2.jpg" class={Css.imgFluid} alt="..."/>
                </div>
              </div>
              <div class={classes Bs4.col_md_6 (classes Css.order1 Css.alignSelfCenter)}>
                <h2><em>Lorem ipsum</em> dolor sit amet</h2>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias veritatis nisi, consequatur, laborum libero a neque ducimus. Porro rem illum quo nostrum quisquam asperiores, blanditiis, consectetur. Possimus facilis velit, voluptatibus!
                </p>
              </div>
            </div>
          </div>
        </section>
        <section class={classes Css.css_section Css.sectionGray} id={sectionQuoteId}>
          <div class={Bs4.container}>
            <div class={Bs4.row}>
              <div class={Css.col}>
                <h2 class={classes Css.sectionTitle Bs4.text_center}>
                Cere o oferta
                </h2>
                <p class={classes Css.sectionDescription Bs4.text_center}>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam illo praesentium sequi in cum, beatae maiores quae qui.
                </p>
              </div>
            </div>
            <div class={classes Bs4.row (classes Bs4.justify_content_lg_center Css.sectionQuoteRow)}>
              <div class={Bs4.col_lg_8}>
                <form id={quoteFormId}>
                  <div class={Bs4.row}>
                    <div class={Bs4.col_md_6}>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormNameId}>Nume si prenume</label>
                        <textbox{#FullName} class={Bs4.form_control} id={quoteFormNameId} placeholder="Nume si prenume"/>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormPhoneId}>Numar de telefon</label>
                        <tel{#Phone} class={Bs4.form_control} id={quoteFormPhoneId} placeholder="Numar de telefon"/>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormEmailId}>Adresa de email</label>
                        <email{#Email} class={Bs4.form_control} id={quoteFormEmailId} placeholder="Adresa de email"/>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                    </div>
                    <div class={Bs4.col_md_6}>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormPeopleId}>Numar persoane aprox.</label>
                        <select{#People} class={Bs4.form_control} id={quoteFormPeopleId}>
                          <option value="1">1-50 persoane</option>
                          <option value="2">50-100 persoane</option>
                          <option value="3">100-150 persoane</option>
                          <option value="4">150-200 persoane</option>
                          <option value="5">200+ persoane</option>
                        </select>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormDateId}>Data</label>
                        <date{#Date} class={Bs4.form_control} id={quoteFormDateId}/>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                      <div class={Bs4.form_group}>
                        <label class={Bs4.sr_only} for={quoteFormClientType}>Persoana fizica sau Companie</label>
                        <select{#ClientType} class={Bs4.form_control} id={quoteFormClientType}>
                          <option value="1">Persoana fizica</option>
                          <option value="2">Companie</option>
                        </select>
                        <div class={Bs4.invalid_feedback}></div>
                      </div>
                    </div>
                    <div class={Css.col}>
                      <div class={Bs4.text_center}>
                        <submit class={classes Bs4.btn (classes Bs4.btn_primary Css.textBlack)} action={handler} value="Trimite"></submit>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
        <section class={classes Css.css_section Css.borderBottom}>
          <div class={Bs4.container}>
            <div class={Bs4.row}>
              <div class={Css.col}>
                <h2 class={classes  Css.sectionTitle Bs4.text_center}>
                  Parerea clientilor nostri conteaza
                </h2>
                <p class={classes Css.sectionDescription Bs4.text_center}>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                </p>
        
              </div>
            </div>
            <div class={Bs4.row}>
              <div class={Css.col}>
                <div class={classes Css.sectionFeedback (classes Flky.flickity_enabled Flky.is_draggable)}>
                  <div class={Flky.flickity_viewport}>
                    <div class={Flky.flickity_slider}>
                      <div class={classes Css.sectionFeedbackItem (classes Bs4.text_center Bs4.text_md_left)} style="position: absolute; left: 0%;">
                        <div class={classes Bs4.row Css.alignCenter}>
                          <div class={classes Bs4.col_md_3 Bs4.order_md_3}>
                            <div class={Css.sectionFeedbackPhoto}>
                              <img src="/bebe1.png" class={Flky.img_fluid} alt="..."/>
                            </div>
                          </div>
                          <div class={classes Bs4.col_md_7 Bs4.order_md_2}>
                            <blockquote class={classes Css.sectionFeedbackQuote Bs4.mx_auto}>
                              <p>
                                Taticul meu e un om de incredere si cu suflet bun. Face poze de neuitat dar nu pe gratis, ca are si el nevoie de bani sa-mi cumpere jucarii.
                              </p>
                              <footer class={Bs4.text_muted}>
                                Matei Popovici
                              </footer>
                            </blockquote>
                          </div>
                          <div class={classes Bs4.col_md_1 Bs4.order_md_1}></div>
                        </div>
                      </div>
                      <div class={classes Css.sectionFeedbackItem (classes Bs4.text_center (classes Bs4.text_md_left Flky.is_selected))} style="position: absolute; left: 100%;">
                        <div class={classes Bs4.row Css.alignCenter}>
                          <div class={classes Bs4.col_md_3 Bs4.order_md_3}>
                            <div class={Css.sectionFeedbackPhoto}>
                              <img src="/bebe2.png" class={Flky.img_fluid} alt="..."/>
                            </div>
                          </div>
                          <div class={classes Bs4.col_md_7 Bs4.order_md_2}>
                            <blockquote class={classes Css.sectionFeedbackQuote Bs4.mx_auto}>
                              <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos at veritatis vitae modi ex quis quibusdam error repudiandae adipisci dolore perspiciatis iste, vel fuga a, libero architecto ratione deleniti sequi.
                              </p>
                              <footer class={Bs4.text_muted}>
                                Matei Popovici
                              </footer>
                            </blockquote>
                          </div>
                          <div class={classes Bs4.col_md_1 Bs4.order_md_1}></div>
                        </div>
                      </div>
                      <div class={classes Css.sectionFeedbackItem (classes Bs4.text_center Bs4.text_md_left)} style="position: absolute; left: 200%;">
                        <div class={classes Bs4.row Css.alignCenter}>
                          <div class={classes Bs4.col_md_3 Bs4.order_md_3}>
                            <div class={Css.sectionFeedbackPhoto}>
                              <img src="/bebe3.png" class={Flky.img_fluid} alt="..."/>
                            </div>
                          </div>
                          <div class={classes Bs4.col_md_7 Bs4.order_md_2}>
                            <blockquote class={classes Css.sectionFeedbackQuote Bs4.mx_auto}>
                              <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos at veritatis vitae modi ex quis quibusdam error repudiandae adipisci dolore perspiciatis iste, vel fuga a, libero architecto ratione deleniti sequi.
                              </p>
                              <footer class={Bs4.text_muted}>
                                Matei Popovici
                              </footer>
                            </blockquote>
                          </div>
                          <div class={classes Bs4.col_md_1 Bs4.order_md_1}></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <button class={classes Flky.flickity_prev_next_button Flky.previous} aria-label="previous">
                    <svg viewBox="0 0 100 100">
                      <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class={Bs4.arrow}>
                      </path>
                    </svg>
                  </button>
                  <button class={classes Flky.flickity_prev_next_button Flky.next} aria-label="next">
                    <svg viewBox="0 0 100 100">
                      <path d="M 10,50 L 60,100 L 70,90 L 30,50  L 70,10 L 60,0 Z" class={Bs4.arrow} transform="translate(100, 100) rotate(180) ">
                      </path>
                    </svg>
                  </button>
                  <ol class={Flky.flickity_page_dots}>
                    <li class={Flky.dot}></li>
                    <li class={classes Flky.dot Flky.is_selected}></li>
                    <li class={Flky.dot}></li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
        </section>
      </body>
    </xml>