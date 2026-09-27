<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Validation Language Lines (HU)
    |--------------------------------------------------------------------------
    */

    'accepted'             => 'A(z) :attribute mezőt el kell fogadni.',
    'active_url'           => 'A(z) :attribute nem érvényes URL.',
    'after'                => 'A(z) :attribute dátumának :date utáni időpontnak kell lennie.',
    'after_or_equal'       => 'A(z) :attribute dátumának :date időponttal megegyezőnek vagy későbbinek kell lennie.',
    'alpha'                => 'A(z) :attribute csak betűket tartalmazhat.',
    'alpha_dash'           => 'A(z) :attribute csak betűket, számokat, kötőjelet és aláhúzást tartalmazhat.',
    'alpha_num'            => 'A(z) :attribute csak betűket és számokat tartalmazhat.',
    'array'                => 'A(z) :attribute mezőnek tömbnek kell lennie.',
    'before'               => 'A(z) :attribute dátumának :date előtti időpontnak kell lennie.',
    'before_or_equal'      => 'A(z) :attribute dátumának :date időponttal megegyezőnek vagy korábbinak kell lennie.',
    'between' => [
        'numeric' => 'A(z) :attribute értékének :min és :max között kell lennie.',
        'file'    => 'A(z) :attribute méretének :min és :max kilobájt között kell lennie.',
        'string'  => 'A(z) :attribute hossza :min és :max karakter között kell legyen.',
        'array'   => 'A(z) :attribute :min és :max elemet kell tartalmazzon.',
    ],
    'boolean'              => 'A(z) :attribute mező értéke igaz vagy hamis lehet.',
    'confirmed'            => 'A(z) :attribute megerősítése nem egyezik.',
    'date'                 => 'A(z) :attribute nem érvényes dátum.',
    'date_equals'          => 'A(z) :attribute dátumának :date időponttal kell megegyeznie.',
    'date_format'          => 'A(z) :attribute nem egyezik a(z) :format formátummal.',
    'different'            => 'A(z) :attribute és a(z) :other mezőknek különbözniük kell.',
    'digits'               => 'A(z) :attribute :digits számjegyből álljon.',
    'digits_between'       => 'A(z) :attribute :min és :max számjegy között legyen.',
    'dimensions'           => 'A(z) :attribute érvénytelen képméretekkel rendelkezik.',
    'distinct'             => 'A(z) :attribute mező értéke duplikált.',
    'email'                => 'A(z) :attribute érvényes e-mail cím legyen.',
    'ends_with'            => 'A(z) :attribute a következők egyikével kell végződjön: :values.',
    'exists'               => 'A kiválasztott :attribute érvénytelen.',
    'file'                 => 'A(z) :attribute fájl kell legyen.',
    'filled'               => 'A(z) :attribute mezőt ki kell tölteni.',
    'gt' => [
        'numeric' => 'A(z) :attribute értéke legyen nagyobb, mint :value.',
        'file'    => 'A(z) :attribute mérete legyen nagyobb, mint :value kilobájt.',
        'string'  => 'A(z) :attribute hossza legyen több, mint :value karakter.',
        'array'   => 'A(z) :attribute több, mint :value elemet kell tartalmazzon.',
    ],
    'gte' => [
        'numeric' => 'A(z) :attribute értéke legyen legalább :value.',
        'file'    => 'A(z) :attribute mérete legyen legalább :value kilobájt.',
        'string'  => 'A(z) :attribute hossza legyen legalább :value karakter.',
        'array'   => 'A(z) :attribute legalább :value elemet kell tartalmazzon.',
    ],
    'image'                => 'A(z) :attribute kép kell legyen.',
    'in'                   => 'A kiválasztott :attribute érvénytelen.',
    'in_array'             => 'A(z) :attribute mező nem található a(z) :other mezőben.',
    'integer'              => 'A(z) :attribute egész szám legyen.',
    'ip'                   => 'A(z) :attribute érvényes IP-cím legyen.',
    'ipv4'                 => 'A(z) :attribute érvényes IPv4-cím legyen.',
    'ipv6'                 => 'A(z) :attribute érvényes IPv6-cím legyen.',
    'json'                 => 'A(z) :attribute érvényes JSON karakterlánc legyen.',
    'lt' => [
        'numeric' => 'A(z) :attribute értéke legyen kisebb, mint :value.',
        'file'    => 'A(z) :attribute mérete legyen kisebb, mint :value kilobájt.',
        'string'  => 'A(z) :attribute hossza legyen kevesebb, mint :value karakter.',
        'array'   => 'A(z) :attribute kevesebb, mint :value elemet tartalmazhat.',
    ],
    'lte' => [
        'numeric' => 'A(z) :attribute értéke legfeljebb :value lehet.',
        'file'    => 'A(z) :attribute mérete legfeljebb :value kilobájt lehet.',
        'string'  => 'A(z) :attribute hossza legfeljebb :value karakter lehet.',
        'array'   => 'A(z) :attribute nem tartalmazhat :value elemnél többet.',
    ],
    'max' => [
        'numeric' => 'A(z) :attribute nem lehet nagyobb, mint :max.',
        'file'    => 'A(z) :attribute nem lehet nagyobb, mint :max kilobájt.',
        'string'  => 'A(z) :attribute nem lehet hosszabb, mint :max karakter.',
        'array'   => 'A(z) :attribute nem tartalmazhat :max elemnél többet.',
    ],
    'mimes'                => 'A(z) :attribute a következő típusú fájl lehet: :values.',
    'mimetypes'            => 'A(z) :attribute a következő típusú fájl lehet: :values.',
    'min' => [
        'numeric' => 'A(z) :attribute értéke legyen legalább :min.',
        'file'    => 'A(z) :attribute mérete legyen legalább :min kilobájt.',
        'string'  => 'A(z) :attribute hossza legyen legalább :min karakter.',
        'array'   => 'A(z) :attribute legalább :min elemet kell tartalmazzon.',
    ],
    'not_in'               => 'A kiválasztott :attribute érvénytelen.',
    'not_regex'            => 'A(z) :attribute formátuma érvénytelen.',
    'numeric'              => 'A(z) :attribute szám legyen.',
    'password'             => 'A jelszó helytelen.',
    'present'              => 'A(z) :attribute mezőnek jelen kell lennie.',
    'regex'                => 'A(z) :attribute formátuma érvénytelen.',
    'required'             => 'A(z) :attribute mező kitöltése kötelező.',
    'required_if'          => 'A(z) :attribute mező kitöltése kötelező, ha a(z) :other értéke :value.',
    'required_unless'      => 'A(z) :attribute mező kitöltése kötelező, kivéve ha a(z) :other benne van a következőkben: :values.',
    'required_with'        => 'A(z) :attribute mező kitöltése kötelező, ha a(z) :values jelen van.',
    'required_with_all'    => 'A(z) :attribute mező kitöltése kötelező, ha a(z) :values mind jelen van.',
    'required_without'     => 'A(z) :attribute mező kitöltése kötelező, ha a(z) :values nincs jelen.',
    'required_without_all' => 'A(z) :attribute mező kitöltése kötelező, ha a következők egyike sincs jelen: :values.',
    'same'                 => 'A(z) :attribute és a(z) :other mezőknek egyezniük kell.',
    'size' => [
        'numeric' => 'A(z) :attribute értékének :size kell lennie.',
        'file'    => 'A(z) :attribute méretének :size kilobájtnak kell lennie.',
        'string'  => 'A(z) :attribute hossza :size karakter legyen.',
        'array'   => 'A(z) :attribute pontosan :size elemet kell tartalmazzon.',
    ],
    'starts_with'          => 'A(z) :attribute a következők egyikével kell kezdődjön: :values.',
    'string'               => 'A(z) :attribute karakterlánc legyen.',
    'timezone'             => 'A(z) :attribute érvényes időzóna legyen.',
    'unique'               => 'A(z) :attribute már foglalt.',
    'uploaded'             => 'A(z) :attribute feltöltése nem sikerült.',
    'url'                  => 'A(z) :attribute formátuma érvénytelen.',
    'uuid'                 => 'A(z) :attribute érvényes UUID legyen.',

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Language Lines
    |--------------------------------------------------------------------------
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'egyedi üzenet',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom Validation Attributes
    |--------------------------------------------------------------------------
    | Itt barátibb neveket adhatsz az attribútumoknak (pl. "email" => "E-mail cím")
    */

    'attributes' => [
        // 'email' => 'e-mail cím',
        // 'password' => 'jelszó',
        // 'name' => 'név',
    ],

];
