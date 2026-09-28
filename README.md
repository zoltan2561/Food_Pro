# Food Pro

Testreszabható, Laravel 9 alapú éttermi rendelési felület kis éttermek számára. A kezdő adatbázis régi mintatételeit a demófeltöltő kikapcsolja, és 19 aktív ételt, italt hagy hat kategóriában. Korábbi vásárlókat, rendeléseket és fizetési kulcsokat a kezdő SQL nem tartalmaz.

## Helyi telepítés XAMPP alatt

1. Másold a projektet a `C:\xampp\htdocs\Food_Pro` mappába, és indítsd el az Apache és MySQL szolgáltatást.
2. Futtasd a projekt gyökerében: `composer install`.
3. Másold a `.env.example` fájlt `.env` néven, állítsd be a saját MySQL kapcsolatot és az `APP_URL` értékét. A példában az adatbázis neve `food_pro`. Futtasd: `php artisan key:generate`.
4. Hozz létre egy üres `food_pro` adatbázist `utf8mb4_unicode_ci` illesztéssel, majd importáld a [kezdő SQL-t](database/food_pro_starter.sql) phpMyAdminból. A forrásként használt `gyros2` adatbázist ne írd felül.
5. Futtasd: `php artisan migrate --force`, majd `php artisan db:seed --class=FoodProDemoSeeder`. Hozd létre a `storage/installed` üres fájlt; az eredeti alkalmazás ezt a telepítettség jelzőjeként használja.
6. Futtasd a `php artisan foodpro:admin-password` parancsot, és adj meg egy legalább 12 karakteres új jelszót. Az admin címe kezdetben `admin@foodpro.local`; a parancs argumentumával saját címet is adhatsz meg, például `php artisan foodpro:admin-password admin@etterem.hu`.
7. Nyisd meg az oldalt és az `/admin` címet. Gyors helyi ellenőrzéshez használható a `php artisan serve` parancs; ekkor az `APP_URL` is a kiszolgáló címére mutasson.

Éles telepítésnél csak a nyilvános belépési pont és az assetek kerülhetnek a webgyökérbe. A `.env`, a `vendor`, az adatbázis és a mentések nem lehetnek HTTP-n elérhetők.

## Hostinger telepítés: foodpro.shop

A [Hostinger Web/Cloud tárhely webgyökere](https://support.hostinger.com/en/articles/1583494-what-is-the-path-to-your-website-s-root-home-directory-and-how-to-change-it) jellemzően `public_html`, amelyet hPanelben nem lehet átállítani. Ehhez a repóban van [Hostinger belépési pont](deploy/hostinger/index.php) és [nyilvános .htaccess](public/.htaccess). A példa SSH-val, [Hostinger Composer 2](https://www.hostinger.com/support/5792078-how-to-use-composer-at-hostinger/) paranccsal és új, üres webhellyel számol; a tényleges gyökérútvonalat a hPanel **FTP Accounts** lapján ellenőrizd. A jelenlegi kód helyben PHP 8.2 alatt ellenőrzött; Hostingerben válassz támogatott PHP-verziót, és ellenőrizd annak bővítményeit is.

```text
domains/foodpro.shop/
├── foodpro-app/       # teljes Git-repó, .env, vendor, storage; a webgyökéren kívül
└── public_html/       # a foodpro-app/public tartalma, majd a Hostinger index.php
```

1. A hPanelben add hozzá a `foodpro.shop` domaint, irányítsd rá a DNS-t, hozz létre külön MySQL-adatbázist és felhasználót, kapcsold be az SSH-t, és telepíts SSL-t. Az SSL lapon legyen bekapcsolva a [**Force HTTPS**](https://support.hostinger.com/en/articles/1583201-how-to-enable-or-disable-https-for-your-website-at-hostinger). Egyetlen kanonikus domaint használj; az alábbi példa a `www` nélküli címet használja.
2. Új telepítésnél a domain könyvtárában futtasd az alábbi parancsokat. Ha a `public_html` már tartalmaz webhelyet vagy feltöltéseket, előbb készíts mentést, és a másolást ahhoz igazítsd. A `public_html` könyvtárat ne töröld.

   ```sh
   cd ~/domains/foodpro.shop
   git clone https://github.com/zoltan2561/Food_Pro.git foodpro-app
   cd foodpro-app
   cp .env.example .env
   ```

3. A szerveren, kizárólag a `foodpro-app/.env` fájlban állítsd be az `APP_ENV=production`, `APP_DEBUG=false`, `APP_URL=https://foodpro.shop`, `LOG_LEVEL=warning`, `SESSION_SECURE_COOKIE=true` értékeket, az új adatbázis hozzáférését és egy működő SMTP-küldőt. Az `ASSETSPATHURL` maradjon üres vagy hiányozzon. A helyi `.env` és az XAMPP-adatbázis ne kerüljön fel. Az admin e-mail kezdetben `admin@foodpro.local` helyőrző; éles ügyféloldalhoz állíts be valódi címet.
4. A `foodpro-app` könyvtárból telepítsd a függőségeket, majd másold a nyilvános fájlokat. A második másolás szándékosan cseréli a szokásos Laravel `index.php` fájlt a kétmappás elrendezéshez. Későbbi frissítéskor ne használj `--delete` jellegű szinkronizálást, mert az admin által feltöltött képek a `public_html` könyvtárban élnek.

   ```sh
   composer2 install --no-dev --prefer-dist --optimize-autoloader
   composer2 check-platform-reqs --no-dev
   php artisan key:generate
   cp -a public/. ../public_html/
   cp deploy/hostinger/index.php ../public_html/index.php
   ```

   A `public_html/.htaccess` fájl a `public/.htaccess` másolásával kerül a helyére. A telepítési belépési pont a testvér `foodpro-app` mappát keresi; ha a Hostinger fiók ettől eltérő mappaszerkezetet ad, az `$applicationRoot` útvonalát a szerveren ehhez kell igazítani. A `storage` és `bootstrap/cache` könyvtár legyen írható a PHP folyamat számára, de ne kapjon `777` jogosultságot.
5. Az üres MySQL-adatbázisba importáld a [kezdő SQL-t](database/food_pro_starter.sql) phpMyAdminból. Ez csak demóadatot tartalmaz; meglévő ügyféladatbázisba ne importáld. Ezután a `foodpro-app` könyvtárban egyszer futtasd:

   ```sh
   php artisan migrate --force
   php artisan db:seed --class=FoodProDemoSeeder --force
   touch storage/installed
   php artisan foodpro:admin-password admin@foodpro.local
   ```

   A demófeltöltőt későbbi éles frissítéseknél ne futtasd újra. Az `APP_KEY` értéket és az adatbázist rendszeres mentés védje; az alkalmazáskulcs megváltoztatása a meglévő munkameneteket érvényteleníti. A jelenlegi alkalmazás azonnali (`sync`) sort és fájlos munkamenetet használ; az Artisan ütemezőjében nincs aktív feladat, ezért külön cron nem szükséges.
6. Ellenőrizd a főoldalt, a CSS-t/képeket, az `/admin` bejelentkezést, egy tesztrendelést és az adminos képfeltöltést. A `https://foodpro.shop/composer.json` és `https://foodpro.shop/.env` cím nem szolgálhat ki fájlt. Az admin **Fizetések** lapján a Barion maradjon kikapcsolva, amíg a saját sandbox e-mail/POSKey és a HTTPS callback (`https://foodpro.shop/barion/callback`) nincs beállítva és kipróbálva. A tesztfizetés után éles vásárlókat csak valódi éttermi, jogi és levelezési adatokkal fogadj.

Frissítéskor a `foodpro-app` mappában `git pull --ff-only`, majd szükség esetén `composer2 install --no-dev --prefer-dist --optimize-autoloader` és `php artisan migrate --force` után ismételd meg a két `cp` lépést. A frissítés előtt mentsd az adatbázist, a `.env` fájlt és a `public_html` feltöltéseit. A kódban több helyen közvetlen `env()` hívás van, ezért jelenleg ne futtasd a `php artisan config:cache` parancsot; az alkalmazás működését az aktív szerverkörnyezettel ellenőrizd.

## Éttermenkénti beállítás

Az adminban állítsd be az étterem nevét, logóját, színeit, fejlécét, nyitvatartását, átvételi és kiszállítási módját, szállítási zónáit és díjait, étlapját, adóit, kapcsolati adatait, e-mail küldését és jogi tájékoztatóit. A kezdő zóna, a 24 órás nyitvatartás, a „Példa Tulaj” cégadatok és a GYIK/jogi oldalak kizárólag bemutató adatok. A `FoodProDemoSeeder` a meglévő régi termékeket elrejti, nem törli, de ismételt futtatásakor újra beállítja a mintakatalógus aktív állapotait és a demóoldalak szövegét. Ügyféladatbázison ne futtasd.

Az admin **Megjelenés** menüjében és a Beállításokban négy évszakos téma választható: tél, tavasz, nyár, ősz. A választás az admin és a vásárlói oldalak színeit, felületeit és kiemeléseit együtt állítja, és a `settings.admin_skin` mezőbe kerül. A tavaszi témában a külön megadott webes színek érvényesülnek. A **Beállítások → Alsó menü és lábléc linkek** részen a mobil alsó navigáció és a lábléc linkjeinek céloldala, felirata, sorrendje és láthatósága állítható. A céloldalak belső, előre engedélyezett útvonalak; üres feliratnál a nyelvi fordítás jelenik meg.

A telepített funkciók az **Admin → Rendszerbővítmények** lapon kapcsolhatók be vagy ki; az állapotuk a `systemaddons.activated` mezőben van. A fizetési módok külön kapcsolókkal rendelkeznek a Fizetések lapon. A kezdeti konfigurációban az átvételkori fizetés aktív. Az átvételkori bankkártyás fizetést csak akkor ígérd a vásárlónak, ha az étteremnél van terminál. A rendelési felület az átvételkori, a meglévő egyenlegből fizetett pénztárcás és a Barion sandbox fizetést támogatja. A forrásból örökölt további fizetési szolgáltatók ellenőrzött integráció nélkül nem kapcsolhatók be a vásárlóknak; a pénztárca feltöltése is külön integrációt igényel.

## Barion tesztfizetés

A Barion tesztmódra van előkészítve, és vásárlók számára alapból ki van kapcsolva. Az admin **Fizetések** lapján add meg a saját sandbox kereskedői e-mail címet és POSKey-t, majd kapcsold be a módot. A visszatérési és callback cím a lapon látható, a Barion tesztkörnyezetét a rendszer a `secure.test.barion.com` címen használja. A callback teljes kipróbálásához a helyi szerver helyett nyilvánosan elérhető HTTPS cím kell. Az éles Barion fiók és kulcs külön bevezetési feladat.

A pénztár a termékeket, adókat és a kiválasztott kiszállítási díjat a szerveren számolja. A vásárló választhatja a **Most kérem** módot, amelyhez nem kell időpontot megadni, ha az étterem nyitva van, vagy a **Későbbre kérem** módot az adminban tárolt nyitvatartásból képzett szabad idősávval. Az időzítést a szerver ellenőrzi. A vásárlói fiók elérhető, de a pénztár vendégként is használható. A kezdő SQL személyes és rendelési adatok nélkül importálható.

Elvitel választásakor a szállítási cím és terület eltűnik, és a kiszállítási díj nulla. Kiszállításnál a település neve alapján a terület automatikusan kiválasztódik; a „Vásárosnamény, Minta utca 12.” formában megadott címből a település mező is kitöltődik. Ha nincs egyértelmű egyezés, a vásárló kézzel választ. Az adminban a terület neve kezdődjön a település nevével (például „Vásárosnamény” vagy „Vásárosnamény - belváros”). Több azonos településű területnél a vásárló választása szükséges. A demó Vásárosnamény és Vitka mintaterületet tartalmaz, saját árakkal.

## Átadás előtti ellenőrzés

- Add meg az étterem valódi adatait, árait, zónáit, nyitvatartását és jogi dokumentumait.
- Állíts be működő levelezést és egyedi admin jelszót; a kezdő admin jelszava véletlenszerű, bejelentkezésre nem használható a fenti parancs futtatása előtt.
- Próbáld ki a készpénzes rendelést, majd a Barion sandbox folyamatot saját tesztkereskedői adatokkal, nyilvános HTTPS callback címen.
- A forrás alkalmazás nyilvános GitHub-oldalán nem szerepel külön alkalmazáslicenc. A kereskedelmi továbbértékesítéshez a forráskód és az eredeti képek felhasználási jogát külön tisztázni kell. A Laravel keretrendszer licencnyilatkozata önmagában nem rendezi az alkalmazáskód és a katalógus jogait.

Az új Food Pro hero és termékhelyettesítő képek a `public/foodpro-assets` és `public/admin-assets/images` könyvtárakban vannak. A mintatermékek több esetben közös, általános kategóriaképet használnak; értékesítés előtt tölts fel az adott ételekhez saját fotókat, és ellenőrizd a termékneveket, leírásokat, allergéneket és árakat. A csomagolt frontend könyvtárak licencinformációi a `THIRD_PARTY_NOTICES` könyvtárban találhatók.

## Bemutató és tartalomcsere

A demó étlap 19 aktív tételt mutat a pizzák, burgerek, saláták, sültek, desszertek és italok között. A **Margherita pizza** opcionális extra feltéteket, a **Rántott sajt** kötelező köretválasztást mutat be. A speciális kérés mindig opcionális; hiányzó kötelező választásnál a csoport piros keretet és konkrét hibaüzenetet kap. A termékoldalon a teljes ár a mennyiséggel együtt azonnal változik. Vendégkosárból történő vásárlói bejelentkezés után a kosár és a választott feltétek megmaradnak. A `food_pro_starter.sql` továbbra sem tartalmaz mintavásárlót vagy mintarendelést; a helyi böngészős próbákhoz létrehozott adatok csak a jelenlegi XAMPP adatbázisban vannak.

Az admin **Értesítési hang** beállításában legfeljebb 5 MB méretű MP3 tölthető fel, sikeres mentés után lejátszható. A demóhoz rövid mintahang jár. Az eredeti Food Pro pizzafotó az `admin-assets/images/item/foodpro-pizza.webp` fájlban van (prompt: „whole freshly baked Margherita pizza, golden thin crust, tomato, mozzarella, basil, warm neutral tabletop, natural light, square photo, no text or logos”; beépített imagegen eszköz).

Az admin kezdőlapján a **Bemutató tartalom szerkesztése** blokk közvetlenül a megfelelő szerkesztőkhöz vezet. A fő képet és címsort a Sliderek, a kategóriaképeket a Kategóriák, az ételfotókat és leírásokat a Termékek, a feltéteket és áraikat a Feltétcsoportok/Feltétek lapokon lehet módosítani. A logó, színek, lábléc és a sikeres rendelés képe a Beállításokban szerkeszthető. A felület rövid szövegei a Nyelvi beállítások kereshető **Labels** lapján, a pénztár időzítési szövegei a **Pénztár szövegei** lapon módosíthatók. A jogi oldalak és a kiszállítási területek külön admin oldalakkal rendelkeznek.

Az **Allergén táblázat** az aktív termékek allergénmezőiből épül fel. A tartalmát a Termékek szerkesztőjében, a bevezetőjét a Nyelvi beállítások **Labels** lapján lehet frissíteni.

Az új vásárlói regisztráció ellenőrző kódot küld e-mailben, ezért az üzemi használathoz működő levelezés kell. Helyi bemutatónál `APP_ENV=local` és `MAIL_MAILER=log` mellett a kód a megerősítő oldalon is látható; ez a könnyítés éles környezetben nem működik. Az SMS-ellenőrzés csak bekapcsolt OTP modullal és beállított SMS-szolgáltatóval használható.
