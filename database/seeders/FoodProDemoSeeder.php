<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class FoodProDemoSeeder extends Seeder
{
    public function run(): void
    {
        if (!is_file(public_path('admin-assets/images/item/foodpro-pizza.webp'))
            || !is_file(public_path('admin-assets/notification/demo-notification.mp3'))) {
            throw new \RuntimeException('A Food Pro demo asset is missing.');
        }

        DB::transaction(function (): void {
            $now = now();
            $activeCategories = [1, 5, 8, 9, 10, 15];
            $activeItems = [60, 64, 92, 93, 95, 157, 158, 161, 170, 173, 174, 175, 177, 178, 179, 180];

            // Starter catalog rows are hidden, not deleted. Existing orders retain their snapshots.
            DB::table('item')->where('id', '<=', 274)->update(['item_status' => 2, 'is_featured' => 2]);
            DB::table('item')->whereIn('id', $activeItems)->update(['item_status' => 1]);
            DB::table('item')->whereIn('id', [60, 92, 157])->update(['is_featured' => 1]);
            DB::table('item')->whereIn('id', [60, 64])->update(['cat_id' => 1]);
            DB::table('categories')->whereIn('id', [1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17])
                ->update(['is_available' => 2]);
            DB::table('categories')->whereIn('id', $activeCategories)->update(['is_available' => 1]);
            DB::table('categories')->where('id', 8)->update([
                'category_name' => 'Pizzák', 'slug' => 'pizzak', 'image' => 'foodpro-pizza.webp', 'updated_at' => $now,
            ]);
            DB::table('item')->where('id', 60)->update(['item_name' => 'Házi burger', 'item_description' => 'Szaftos burger friss zöldségekkel és házi szósszal. Kérheted egyéni összeállításban.', 'updated_at' => $now]);
            DB::table('item')->where('id', 64)->update(['item_name' => 'Csirkeburger', 'item_description' => 'Csirkés burger friss salátával és krémes szósszal.', 'updated_at' => $now]);
            DB::table('item')->where('slug', 'margarita-pizza')->update(['slug' => 'margherita-pizza']);

            DB::table('addons_group')->updateOrInsert(['name' => 'Extra pizzafeltétek'], [
                'reorder_id' => 12, 'selection_type' => 2, 'selection_count' => 2,
                'min_count' => 0, 'max_count' => 3, 'is_available' => 1,
                'is_deleted' => 2, 'is_removal' => 0, 'updated_at' => $now,
            ]);
            $pizzaAddonGroup = DB::table('addons_group')->where('name', 'Extra pizzafeltétek')->value('id');
            foreach ([['Extra mozzarella', '490'], ['Gomba', '390'], ['Olívabogyó', '390']] as $order => [$name, $price]) {
                DB::table('addons')->updateOrInsert(['addongroup_id' => $pizzaAddonGroup, 'name' => $name], [
                    'reorder_id' => $order + 1, 'price' => $price,
                    'is_available' => 1, 'is_deleted' => 2, 'updated_at' => $now,
                ]);
            }

            $pizzas = [
                ['Margherita pizza', 'Paradicsomszósz, mozzarella és friss bazsalikom.', '2490', '1,7'],
                ['Sonkás pizza', 'Paradicsomszósz, mozzarella és sonka.', '2890', '1,7'],
                ['Zöldséges pizza', 'Paradicsomszósz, mozzarella és szezonális zöldségek.', '2790', '1,7'],
            ];
            foreach ($pizzas as $index => [$name, $description, $price, $allergens]) {
                $slug = Str::slug($name);
                $id = DB::table('item')->where('slug', $slug)->value('id');
                $fields = [
                    'reorder_id' => $index + 1, 'cat_id' => 8, 'subcat_id' => 0,
                    'item_name' => $name, 'slug' => $slug, 'item_type' => 1,
                    'has_extras' => 2, 'price' => $price, 'original_price' => $price,
                    'addons_id' => (string) $pizzaAddonGroup, 'item_description' => $description,
                    'item_allergens' => $allergens, 'preparation_time' => '25', 'tax' => '1',
                    'avg_ratting' => 0, 'discount_percentage' => 0, 'item_status' => 1,
                    'is_featured' => $index === 0 ? 1 : 2, 'is_top_deals' => 2,
                    'updated_at' => $now,
                ];
                if ($id) {
                    DB::table('item')->where('id', $id)->update($fields);
                } else {
                    $id = DB::table('item')->insertGetId($fields + ['created_at' => $now]);
                }
                DB::table('item_images')->updateOrInsert(
                    ['item_id' => $id, 'image' => 'foodpro-pizza.webp'],
                    ['created_at' => $now, 'updated_at' => $now]
                );
            }

            DB::table('settings')->where('id', 1)->update([
                'name' => 'Food Pro Demo', 'title' => 'Food Pro Demo – rendelj könnyedén',
                'short_title' => 'Food Pro Demo', 'footer_title' => 'Food Pro Demo',
                'footer_description' => 'Pizzák, burgerek és friss fogások egy helyen. Bemutató étterem.',
                'copyright' => '© Food Pro Demo – bemutató oldal',
                'email' => 'demo@foodpro.local', 'mobile' => '+36 30 000 0000',
                'address' => 'Vásárosnamény, Minta utca 12. (bemutató cím)',
                'notification_tune' => 'demo-notification.mp3',
                'updated_at' => $now,
            ]);

            DB::table('shipping_area')->updateOrInsert(['id' => 41], [
                'name' => 'Vásárosnamény', 'delivery_charge' => '490',
                'min_order' => 0, 'reorder_id' => 1, 'updated_at' => $now,
            ]);
            DB::table('shipping_area')->updateOrInsert(['name' => 'Vitka'], [
                'delivery_charge' => '790', 'min_order' => 0,
                'reorder_id' => 2, 'updated_at' => $now,
            ]);

            $faqs = [
                ['Hogyan adhatok le rendelést?', 'Válassz ételt, jelöld meg a kötelező opciókat, majd a kosárban add meg az átvétel vagy kiszállítás adatait. A speciális kérés mező kitöltése opcionális.'],
                ['Kötelező regisztrálni?', 'A bemutató pénztár vendégként is használható. Fiókkal később könnyebb újrarendelni és megtekinteni a korábbi rendeléseket.'],
                ['Kérhetem az ételt azonnal?', 'Igen. A pénztárban a „Most kérem” választásnál nem kell külön időpontot választani. Későbbi rendelésnél a szabad idősávok közül választhatsz.'],
                ['Hogyan számolódik a kiszállítás díja?', 'A díj a megadott cím és az étterem beállításai alapján jelenik meg a pénztárban, még a véglegesítés előtt.'],
                ['Módosíthatom a feltéteket?', 'A terméknél a kötelező választásokat meg kell adni; az opcionális extrák és a speciális kérés elhagyhatók.'],
                ['Milyen fizetési módok vannak?', 'A bekapcsolt fizetési módok a pénztárban láthatók. A Barion a bemutatóban csak saját tesztkulccsal, sandbox módban használható.'],
            ];
            foreach ($faqs as $index => [$title, $description]) {
                DB::table('faqs')->updateOrInsert(['title' => $title], [
                    'reorder_id' => $index + 1, 'description' => $description,
                    'created_at' => $now, 'updated_at' => $now,
                ]);
            }

            $notice = '<p><strong>Bemutató mintaszöveg.</strong> Éles használat előtt az üzemeltető adataival és jogilag ellenőrzött dokumentummal kell felváltani.</p>';
            $operator = '<p>Üzemeltető: Példa Tulaj (mintaadat)<br>Éttermének neve: Food Pro Demo<br>Cím: 4800 Vásárosnamény, Minta utca 12. (mintaadat)<br>E-mail: demo@foodpro.local<br>Telefon: +36 30 000 0000 (mintaadat)<br>Adószám, cégjegyzékszám, nyilvántartási szám: megadandó az éles üzemeltető által.</p>';
            $pages = [
                ['about', 'about_content', $notice . '<h2>Üdv a Food Pro Demo étteremben!</h2><p>Ez a bemutató oldal egy testreszabható éttermi rendelési rendszer működését mutatja meg. A pizza, burger, saláta és desszert csak mintakínálat. A szövegek, képek, kategóriák és árak az adminban szerkeszthetők.</p>' . $operator],
                ['terms', 'termscondition_content', $notice . '<h2>Általános szerződési feltételek – minta</h2>' . $operator . '<h3>Rendelés</h3><p>A vásárló a kosárban ellenőrzi a tételeket, feltéteket, díjakat és elérhetőségeit. A rendelés véglegesítése után az étterem visszaigazolása és a tényleges teljesítés feltételei az üzemeltető saját szabályzata szerint érvényesek.</p><h3>Árak és teljesítés</h3><p>A pénztár a termékek árát, az alkalmazandó díjakat és a végösszeget a leadás előtt mutatja. Az átvétel és kiszállítás elérhetősége, időpontja, fizetési módja és területe az admin beállításaitól függ.</p><h3>Kapcsolat és panasz</h3><p>A rendelés módosításával, lemondásával vagy panasszal az étterem megadott elérhetőségein lehet jelentkezni. Élesítés előtt az ügyfélszolgálati és jogszabályi tájékoztatást ki kell egészíteni.</p>'],
                ['privacypolicy', 'privacypolicy_content', $notice . '<h2>Adatkezelési tájékoztató – minta</h2>' . $operator . '<p>A rendeléshez megadott név, telefonszám, e-mail cím, cím és rendelési adatok a rendelés teljesítéséhez szükségesek. A regisztrált fiók további profiladatokat és rendelési előzményeket tárolhat. A fizetési szolgáltató saját adatkezelési tájékoztatója külön alkalmazandó.</p><p>Az éles üzemeltetőnek meg kell adnia az adatkezelés jogalapját, megőrzési idejét, címzettjeit, sütikezelését, érintetti jogokat és a kapcsolatfelvétel módját.</p>'],
                ['refundpolicy', 'refundpolicy_content', $notice . '<h2>Rendelésmódosítás és visszatérítés – minta</h2><p>Ha módosítanád vagy lemondanád rendelésedet, mielőbb vedd fel a kapcsolatot az étteremmel a +36 30 000 0000 mintaszámon vagy a demo@foodpro.local címen. Az elkészítés megkezdése és a fizetési mód befolyásolhatja a lehetőségeket. A tényleges feltételeket az éles üzemeltetőnek kell rögzítenie.</p>'],
            ];
            foreach ($pages as [$table, $column, $content]) {
                DB::table($table)->updateOrInsert(['id' => 1], [$column => $content, 'updated_at' => $now]);
            }
        });
    }
}
