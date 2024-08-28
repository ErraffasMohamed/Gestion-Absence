<?php

use Illuminate\Database\Seeder;

class FiliereSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        App\Filiere::create([
            'id' => 1,
            'nom_filiere' => 'EEIN',
            'id_dep' => 1,
        
     ]);
     App\Filiere::create([
        'id' => 2,
        'nom_filiere' => 'INDIA',
        'id_dep' => 1,
    
 ]);
 App\Filiere::create([
    'id' => 3,
    'nom_filiere' => 'GM',
    'id_dep' => 2,

]);
    }
}
