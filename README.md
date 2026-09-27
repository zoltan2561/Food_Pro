# Food Pro

Testreszabható, Laravel 9 alapú éttermi rendelési felület kis éttermek számára. A kezdő adatbázis 133 mintaterméket tartalmaz; korábbi vásárlókat, rendeléseket, fizetési kulcsokat és éttermi elérhetőségeket nem tartalmaz.

## Helyi telepítés XAMPP alatt

1. Másold a projektet a `C:\xampp\htdocs\Food_Pro` mappába, és indítsd el az Apache és MySQL szolgáltatást.
2. Futtasd a projekt gyökerében: `composer install`.
3. Másold a `.env.example` fájlt `.env` néven, állítsd be a saját MySQL kapcsolatot és az `APP_URL` értékét. A példában az adatbázis neve `food_pro`. Futtasd: `php artisan key:generate`.
4. Hozz létre egy üres `food_pro` adatbázist `utf8mb4_unicode_ci` illesztéssel, majd importáld a [kezdő SQL-t](database/food_pro_starter.sql) phpMyAdminból. A forrásként használt `gyros2` adatbázist ne írd felül.
5. Futtasd: `php artisan migrate --force`. Hozd létre a `storage/installed` üres fájlt; az eredeti alkalmazás ezt a telepítettség jelzőjeként használja.
6. Futtasd a `php artisan foodpro:admin-password` parancsot, és adj meg egy legalább 12 karakteres új jelszót. Az admin címe kezdetben `admin@foodpro.local`; a parancs argumentumával saját címet is adhatsz meg, például `php artisan foodpro:admin-password admin@etterem.hu`.
7. Nyisd meg az oldalt és az `/admin` címet. Gyors helyi ellenőrzéshez használható a `php artisan serve` parancs; ekkor az `APP_URL` is a kiszolgáló címére mutasson.

Éles telepítésnél a webkiszolgáló gyökere a `public` könyvtár legyen, `APP_DEBUG=false` értékkel és HTTPS címmel. A `vendor`, `.env`, valamint a helyi mentések nem részei az átadható forrásnak.

## Éttermenkénti beállítás

Az adminban állítsd be az étterem nevét, logóját, színeit, fejlécét, nyitvatartását, átvételi és kiszállítási módját, szállítási zónáit és díjait, étlapját, adóit, kapcsolati adatait, e-mail küldését és jogi tájékoztatóit. A kezdő zóna és a 24 órás nyitvatartás kizárólag bemutató adat. A mintatermékek megtarthatók, módosíthatók vagy törölhetők.

Az admin **Megjelenés** menüjében és a Beállításokban négy teljes admin téma választható: tél, tavasz, nyár, ősz. A választás az adatbázis `settings.admin_skin` mezőjébe kerül. A telepített funkciók az **Admin → Rendszerbővítmények** lapon kapcsolhatók be vagy ki; az állapotuk a `systemaddons.activated` mezőben van. A fizetési módok külön kapcsolókkal rendelkeznek a Fizetések lapon. A kezdeti konfigurációban az átvételkori fizetés aktív. Az átvételkori bankkártyás fizetést csak akkor ígérd a vásárlónak, ha az étteremnél van terminál. A rendelési felület az átvételkori, a meglévő egyenlegből fizetett pénztárcás és a Barion sandbox fizetést támogatja. A forrásból örökölt további fizetési szolgáltatók ellenőrzött integráció nélkül nem kapcsolhatók be a vásárlóknak; a pénztárca feltöltése is külön integrációt igényel.

## Barion tesztfizetés

A Barion tesztmódra van előkészítve, és vásárlók számára alapból ki van kapcsolva. Az admin **Fizetések** lapján add meg a saját sandbox kereskedői e-mail címet és POSKey-t, majd kapcsold be a módot. A visszatérési és callback cím a lapon látható, a Barion tesztkörnyezetét a rendszer a `secure.test.barion.com` címen használja. A callback teljes kipróbálásához a helyi szerver helyett nyilvánosan elérhető HTTPS cím kell. Az éles Barion fiók és kulcs külön bevezetési feladat.

A pénztár a termékeket, adókat és a kiválasztott kiszállítási díjat a szerveren számolja. A vásárló választhatja a **Most kérem** módot, amelyhez nem kell időpontot megadni, ha az étterem nyitva van, vagy a **Későbbre kérem** módot az adminban tárolt nyitvatartásból képzett szabad idősávval. Az időzítést a szerver ellenőrzi. A vásárlói fiók elérhető, de a pénztár vendégként is használható. A kezdő SQL személyes és rendelési adatok nélkül importálható.

## Átadás előtti ellenőrzés

- Add meg az étterem valódi adatait, árait, zónáit, nyitvatartását és jogi dokumentumait.
- Állíts be működő levelezést és egyedi admin jelszót; a kezdő admin jelszava véletlenszerű, bejelentkezésre nem használható a fenti parancs futtatása előtt.
- Próbáld ki a készpénzes rendelést, majd a Barion sandbox folyamatot saját tesztkereskedői adatokkal, nyilvános HTTPS callback címen.
- A forrás alkalmazás nyilvános GitHub-oldalán nem szerepel külön alkalmazáslicenc. A kereskedelmi továbbértékesítéshez a forráskód és az eredeti képek felhasználási jogát külön tisztázni kell. A Laravel keretrendszer licencnyilatkozata önmagában nem rendezi az alkalmazáskód és a katalógus jogait.

Az új Food Pro hero és termékhelyettesítő képek a `public/foodpro-assets` és `public/admin-assets/images` könyvtárakban vannak. A mintatermékek több esetben közös, általános kategóriaképet használnak; értékesítés előtt tölts fel az adott ételekhez saját fotókat, és ellenőrizd a termékneveket, leírásokat, allergéneket és árakat. A csomagolt frontend könyvtárak licencinformációi a `THIRD_PARTY_NOTICES` könyvtárban találhatók.

## Bemutató és tartalomcsere

A kezdőlapon a **Házi Burger** példán látható a feltétcsoport, az opcionális szósz („Nem kérek feltétet” választással) és a két fizetős extra. A termékoldalon a teljes ár a mennyiséggel együtt azonnal változik. Vendégkosárból történő vásárlói bejelentkezés után a kosár és a választott feltétek megmaradnak. A `food_pro_starter.sql` továbbra sem tartalmaz mintavásárlót vagy mintarendelést; a helyi böngészős próbákhoz létrehozott adatok csak a jelenlegi XAMPP adatbázisban vannak.

Az admin kezdőlapján a **Bemutató tartalom szerkesztése** blokk közvetlenül a megfelelő szerkesztőkhöz vezet. A fő képet és címsort a Sliderek, a kategóriaképeket a Kategóriák, az ételfotókat és leírásokat a Termékek, a feltéteket és áraikat a Feltétcsoportok/Feltétek lapokon lehet módosítani. A logó, színek, lábléc és a sikeres rendelés képe a Beállításokban szerkeszthető. A felület rövid szövegei a Nyelvi beállítások kereshető **Labels** lapján, a pénztár időzítési szövegei a **Pénztár szövegei** lapon módosíthatók. A jogi oldalak és a kiszállítási területek külön admin oldalakkal rendelkeznek.

Az **Allergén táblázat** az aktív termékek allergénmezőiből épül fel. A tartalmát a Termékek szerkesztőjében, a bevezetőjét a Nyelvi beállítások **Labels** lapján lehet frissíteni.
