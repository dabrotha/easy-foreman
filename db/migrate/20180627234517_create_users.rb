class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :address_street
      t.string :address_street_number
      t.string :address_unit_number
      t.string :address_city
      t.string :address_postal_code
      t.integer :activity_status
      #0 - inactive, 1 - active, 2 - vacation
      t.integer :seniority_status
      #0 - supervisor, 1 - foreman, 2 - worker, 3 - person-who-registered-company
      t.integer :employment_status
      #0 part-time, 1 full-time, 2 - contract 
      t.float :wage
      t.string :job_title
      t.text :skill_description

      t.timestamps
    end
  end
end
