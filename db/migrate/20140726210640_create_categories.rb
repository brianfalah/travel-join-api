# encoding: utf-8
class CreateCategories < ActiveRecord::Migration
  def up
  	create_table :categories do |t|
  		t.integer :category_id
      t.string :name

      t.timestamps
    end                 
        
    Category.create(category_id: 88, name: "Aire Libre")
    Category.create(category_id: 91, name: "Artes Visuales")    
    Category.create(category_id: 56, name: "Chicos")
    Category.create(category_id: 80, name: "Cine")
    Category.create(category_id: 84, name: "Cultos y Colectividades")
    Category.create(category_id: 85, name: "Circo")
    Category.create(category_id: 148, name: "Concursos")
    Category.create(category_id: 146, name: "Cursos y Talleres")
    Category.create(category_id: 78, name: "Danza")
    Category.create(category_id: 91, name: "Deportes")    
    Category.create(category_id: 90, name: "Diseño")
    Category.create(category_id: 79, name: "Festivales")    
    
    Category.create(category_id: 999, name: "Gastronomía")
    Category.create(category_id: 82, name: "Literatura")
    Category.create(category_id: 144, name: "Museos")
    Category.create(category_id: 76, name: "Musica")
    Category.create(category_id: 77, name: "Teatro")
    Category.create(category_id: 89, name: "Visitas Guiadas")

    add_index :categories, :category_id
    add_index :categories, :name
  end

  def down
  	drop_table :categories
  end
end
