fun handler r = return <xml><body>
  <table>
    <tr> <th>A:</th> <td>{[r.A]}</td> </tr>
    <tr> <th>B:</th> <td>{[r.B]}</td> </tr>
    <tr> <th>C:</th> <td>{[r.C]}</td> </tr>
  </table>
</body></xml>

fun main () = return <xml>
  <head onload={Js.addGA}>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>Memboo photo booth</title>
    <link rel="profile" href="http://gmpg.org/xfn/11"/>
    <link rel="manifest" href="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/manifest.json"/>
    <link rel="shortcut icon" href="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/favicon.ico"/>
    <meta name="msapplication-config" content="http://themes.getbootstrap.com/wp-content/themes/bootstrap-marketplace/assets/images/fav/browserconfig.xml"/>
    <link rel="dns-prefetch" href="//fonts.googleapis.com" />
    <link rel="dns-prefetch" href="//s.w.org" />
  </head>
  <body>
    <form>
      <table>
        <tr> <th>A:</th> <td><textbox{#A}/></td> </tr>
        <tr> <th>B:</th> <td><textbox{#B}/></td> </tr>
        <tr> <th>C:</th> <td><checkbox{#C}/></td> </tr>
        <tr> <th/> <td><submit action={handler}/></td> </tr>
      </table>
    </form>
  </body></xml>