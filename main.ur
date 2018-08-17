
open Css
open Tags
open Mail
structure Bs4 = Bootstrap4
structure FA = Fontawesome
structure Plx = Parallax
structure Flky = Flickity

fun headScript url = return (Script.head (blessMime "text/javascript") (bless url))

fun bodyScript url = return (Script.body (blessMime "text/javascript") (bless url))

fun getPeople i = 
  case i of
      "1" => "1-50"
    | "2" => "50-100"
    | "3" => "100-150"
    | "4" => "150-200"
    | "5" => "200+"
    | _   => "Invalid people option"

fun sendOfferEmail r =
  Mail.send(Mail.from r.Email (Mail.to "clients@memboo.ro" (Mail.subject (strcat "Cerere oferta: " r.Email) Mail.empty)))
            ("Nume si prenume: " ^ r.FullName ^ "</br>Telefon: " ^ r. Phone ^ "</br>Email: " ^ r.Email ^ "</br>Numar persoane: " ^ (getPeople r.People) ^ "</br>Data: " ^ r.Date ^ "</br>Tipul clientului: " ^ r.ClientType) None;
  return <xml>Sent</xml>

fun sendMessageEmail r =
  Mail.send(Mail.from r.Email (Mail.to "clients@memboo.ro" (Mail.subject (strcat "Mesaj de la " r.Email) Mail.empty)))
            ("Nume si prenume: " ^ r.FullName ^ "</br>Email: " ^ r.Email) None;
  return <xml>Sent</xml>

val headContent = 
  gaScript <- headScript "https://www.googletagmanager.com/gtag/js?id=UA-123401300-1";
  initGaScript <- headScript "/initGa.js";
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"/>
        <link rel="stylesheet" href="/flickity.min.css"/>
        <link rel="stylesheet" href="/style.css"/>
      </head>
    </xml>

val introFooterContent =
  return 
    <xml>
      <div class={Css.sectionIntroFooter}>
          <div class={Bs4.container}>
            <div class={classes Bs4.row Css.alignCenter}>
              <div class={Css.colMd}>
                <ul>
                  <li>
                    <i class={classes FA.fa FA.fa_phone}></i> +40741169887
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
    </xml>

val footerContent =
  copyrightId <- fresh;
  return 
    <xml>
      <footer class={classes Css.css_section Css.sectionFooter}>
        <div class={Bs4.container}>
          <div class={Bs4.row}>
            <div class={Bs4.col_sm_4}>
              <h5 class={Css.sectionFooterTitle}>
                Despre noi
              </h5>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti dolorum, sint corporis nostrum, possimus unde eos vitae eius quasi saepe.
              </p>
            </div>
            <div class={Bs4.col_sm_4}>
              <h5 class={Css.sectionFooterTitle}>
                Informatii de contact
              </h5>
              <ul class={Css.sectionFooterDesc}>
                <li>
                  <i class={classes FA.fa FA.fa_map_marker}></i> Romania, Cluj, Cluj-Napoca, Dorobantilor 105, 54001
                </li>
                <li>
                  <i class={classes FA.fa FA.fa_phone}></i> +40741169887
                </li>
                <li>
                  <i class={classes FA.fa FA.fa_envelope_o}></i> <a href="mailto:client@memboo.ro">client@memboo.ro</a>
                </li>
              </ul>
            </div>
            <div class={Bs4.col_sm_4}>
              <h5 class={Css.sectionFooterTitle}>
                Interval orar
              </h5>
              <div class={Css.sectionFooterOpen}>
                <div class={Css.sectionFooterOpenDays}>Luni - Vineri</div>
                <div class={Css.sectionFooterOpenTime}>09:00 AM - 18:00 PM</div>
              </div>
              <div class={Css.sectionFooterOpen}>
                <div class={Css.sectionFooterOpenDays}>Sambata - Duminica</div>
                <div class={Css.sectionFooterOpenTime}>09:00 AM - 13:00 PM</div>
              </div>
            </div>
          </div>
          <div class={Bs4.row}>
            <div class={Bs4.col_12}>
              <div class={Css.sectionFooterCopyright}>
                <i class={classes FA.fa FA.fa_copyright}></i> <span id={copyrightId}>2018</span> Memboo. All rights reserved.
              </div>
            </div>
          </div>
        </div>
      </footer>
    </xml>

val scriptsContent = 
  jquery <- bodyScript "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js";
  bootstrap <- bodyScript "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js";
  parallax <- bodyScript "/parallax.min.js";
  flickity <- bodyScript "/flickity.pkgd.min.js";
  scripts <- bodyScript "/scripts.js";
  return 
    <xml>
      {jquery}
      {bootstrap}
      {parallax}
      {flickity}
      {scripts}
    </xml>

val indexContent = 
  sectionQuoteId <- fresh;
  quoteFormId <- fresh;
  quoteFormNameId <- fresh;
  quoteFormPhoneId <- fresh;
  quoteFormEmailId <- fresh;
  quoteFormPeopleId <- fresh;
  quoteFormDateId <- fresh;
  quoteFormClientType <- fresh;
  ifc <- introFooterContent;
  return 
    <xml>
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
        {ifc}
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
                      <submit class={classes Bs4.btn (classes Bs4.btn_primary Css.textBlack)} action={sendOfferEmail} value="Trimite"></submit>
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
              <div class={classes Css.sectionFeedback__carousel (classes Flky.flickity_enabled Flky.is_draggable)}>
                <div class={classes Css.sectionFeedback__carousel__item (classes Bs4.text_center Bs4.text_md_left)}>
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
                <div class={classes Css.sectionFeedback__carousel__item (classes Bs4.text_center (classes Bs4.text_md_left Flky.is_selected))}>
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
                <div class={classes Css.sectionFeedback__carousel__item (classes Bs4.text_center Bs4.text_md_left)}>
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
          </div>
        </div>
      </section>
    </xml>

val galleryContent = 
  return <xml>Galerie</xml>

val contactContent = 
  contactFormId <- fresh;
  contactFormNameId <- fresh;
  contactFormEmailId <- fresh;
  contactFormMessageId <- fresh;
  return 
    <xml>
      <section class={classes Css.css_section Css.sectionHeader} data-parallax="scroll" data-image-src="/contact.jpg">
        <div class={Bs4.container}>
          <div class={Bs4.row}>
            <div class={Css.col}>
              <h1 class={classes Css.sectionTitle (classes Css.sectionHeaderTitle Bs4.text_center)}>
                Contactati-ne
              </h1>
            </div>
          </div>
        </div>
      </section>
      <section class={classes Css.css_section Css.sectionContact}>
        <div class={Bs4.container}>
          <div class={Bs4.row}>
            <div class={Css.col}>
              <h2 class={classes Css.sectionTitle Bs4.text_center}>
                Scrie-ne un mesaj
              </h2>
              <p class={classes Css.sectionDescription Bs4.text_center}>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam illo praesentium sequi in cum, beatae maiores quae qui.
              </p>
            </div>
          </div>
          <div class={Bs4.row}>
            <div class={classes Bs4.col_md_3 Bs4.order_md_2}>
              <div class={Css.sectionContactInfo}>
                <div class={Css.sectionContactInfoItem}>
                  <h4 class={Css.sectionContactInfoItemHeading}>
                    Scrie-ne
                  </h4>
                  <p class={Css.sectionContactInfoItemContent}>
                    <a href="mailto:clients@memboo.ro">clients@memboo.ro</a>
                  </p>
                </div>
                <div class={Css.sectionContactInfoItem}>
                  <h4 class={Css.sectionContactInfoItemHeading}>
                    Suna
                  </h4>
                  <p class={Css.sectionContactInfoItemContent}>
                    <a href="tel:+19876543210">+1 987 654 3210</a>
                  </p>
                </div>
                <div class={Css.sectionContactInfoItem}>
                  <h4 class={Css.sectionContactInfoItemHeading}>
                    Visiteaza-ne
                  </h4>
                  <p class={Css.sectionContactInfoItemContent}>
                    Cluj-Napoca, Dorobantilor Nr. , 540001
                  </p>
                </div>
                <div class={Css.sectionContactInfoItem}>
                  <h4 class={Css.sectionContactInfoItemHeading}>
                    Linkuri sociale
                  </h4>
                  <ul class={Css.sectionContactInfoItemContent}>
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
              </div>
            </div>
            <div class={classes Bs4.col_md_9 Bs4.order_md_1}>
              <form class={Css.sectionContactForm} id={contactFormId}>
                <div class={Bs4.form_group}>
                  <label class={Bs4.sr_only} for={contactFormNameId}/>
                  <textbox{#FullName} class={Bs4.form_control} id={contactFormNameId} placeholder="Nume si prenume"/>
                  <div class={Bs4.invalid_feedback}></div>
                </div>
                <div class={Bs4.form_group}>
                  <label class={Bs4.sr_only} for={contactFormEmailId}/>
                  <email{#Email} class={Bs4.form_control} id={contactFormEmailId} placeholder="Adresa de email"/>
                  <div class={Bs4.invalid_feedback}></div>
                </div>
                <div class={Bs4.form_group}>
                  <label class={Bs4.sr_only} for={contactFormMessageId}/>
                  <textarea{#Message} class={Bs4.form_control} id={contactFormMessageId} rows=9 placeholder="Mesaj"></textarea>
                  <div class={Bs4.invalid_feedback}></div>
                </div>
                <submit value="Trimite mesajul" class={classes Bs4.btn (classes Bs4.btn_primary Css.textBlack)} action={sendMessageEmail}/>
              </form>
            </div>
          </div>
        </div>
      </section>
    </xml>

fun main () = 
  pi <- (membooPage indexContent);
  return <xml>{pi}</xml>

and aboutUsPage () =
  return <xml>About Us</xml>

and galleryPage () =
  pg <- (membooPage galleryContent);
  return <xml>{pg}</xml>

and contactPage () =
  cc <- (membooPage contactContent);
  return <xml>{cc}</xml>

and membooPage pageContent = 
  hc <- headContent;
  fc <- footerContent;
  sc <- scriptsContent;
  nbc <- (navbarContent ());
  pc <- pageContent;
  return 
    <xml>
      {hc}
      <body data-spy="scroll" data-offset="71" data-target=".navbar:visible">{nbc}{pc}{fc}{sc}</body>
    </xml>

and navbarContent () = 
  navbarId <- fresh;
  niAboutUs <- navItem aboutUsPage <xml>Despre noi</xml>;
  niGallery <- navItem galleryPage <xml>Galerie</xml>;
  niContact <- navItem contactPage <xml>Contact</xml>;
  return 
    <xml>
      <nav class={classes (classes Bs4.navbar Bs4.navbar_expand_lg) Bs4.fixed_top}>
          <div class={Bs4.container}>
            <a class={classes Bs4.navbar_brand Bs4.d_lg_none} href="/">Memboo</a>
            <button class={Bs4.navbar_toggler} data-toggle="collapse" data-target={strcat "#" (show navbarId)} aria-controls={show navbarId} aria-expanded="false" aria-label="Toggle navigation">
              <span class={Bs4.navbar_toggler_icon}></span>
            </button>
            <div class={classes Bs4.collapse Bs4.navbar_collapse} id={navbarId}>
              <ul class={classes Bs4.navbar_nav Bs4.mr_auto}>
                {niAboutUs}
                {niGallery}
              </ul>
              <a class={classes (classes Bs4.navbar_brand Bs4.d_none) Bs4.d_lg_flex} href="/">Memboo</a>
              <ul class={classes Bs4.navbar_nav Bs4.ml_auto}>
                {niContact}
                <li class={Bs4.nav_item}>
                  <ul class={classes Css.sectionIntroFooterSocial (classes Bs4.text_center Css.textLgLeft)}>
                    <li>
                      <a class={Bs4.nav_link} href="#">
                        <i class={classes FA.fab FA.fa_twitter}></i>
                      </a>
                    </li>
                    <li>
                      <a class={Bs4.nav_link} href="#">
                        <i class={classes FA.fab FA.fa_facebook}></i>
                      </a>
                    </li>
                    <li>
                      <a class={Bs4.nav_link} href="#">
                        <i class={classes FA.fab FA.fa_instagram}></i>
                      </a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
    </xml>

and navItem h t = 
  return 
    <xml>
      <li class={Bs4.nav_item}>
        <a class={Bs4.nav_link} href={url (h ())}>{t}</a>
      </li>
    </xml>