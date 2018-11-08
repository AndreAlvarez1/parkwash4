# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


require 'csv'

errors = []
#--------------------------PLACES DATABASE POPULATION--------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'places_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Place.new
  x.name = array[0]
  x.address = array[1]
  x.commune = array[2]
  x.city = array[3]
  x.contact_name = array[4]
  x.contact_cellphone = array[5]
  x.contact_email = array[6]
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Places with Name: #{x.name} has been saved"
end

puts "There are now #{Place.count} rows in the Places table"

#--------------------------USERS DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'users_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = User.new
  x.rut = array[0]
  x.first_name = array[1]
  x.last_name = array[2]
  x.email = array[3]
  x.cellphone = array[4]
  x.city = array[5]
  x.birth_date = array[6].to_date
  x.card_status = array[7].to_s == "true"
  x.transdata_id = array[8]
  x.place_id = array[9].to_i
  x.password = '111111'
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "User #{x.first_name} #{x.last_name} has been saved"
end
puts "There are now #{User.count} rows in the Users table"

#--------------------------WASHERS DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'washers_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Washer.new
  x.rut = array[0]
  x.first_name = array[1]
  x.last_name = array[2]
  x.email = array[3]
  x.cellphone = array[4]
  x.city = array[5]
  x.birth_date = array[6].to_date
  x.role = array[6].to_i
  x.password = '111111'
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Washer #{x.first_name} #{x.last_name} has been saved"
end
puts "There are now #{Washer.count} rows in the Washers table"

#--------------------------WASH_TYPES DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'wash_types_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = WashType.new
  x.code = array[0]
  x.name = array[1]
  x.description = array[2]
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Wash_type #{x.name} has been saved"
end
puts "There are now #{WashType.count} rows in the Wash_types table"

#--------------------------VEHICLE_SIZES DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'vehicle_sizes_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = VehicleSize.new
  x.code = array[0]
  x.name = array[1]
  x.description = array[2]
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Vehicle_size #{x.name} has been saved"
end
puts "There are now #{VehicleSize.count} rows in the Vehicle_sizes table"

#--------------------------PRICES DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'prices_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Price.new
  x.place_id = array[0].to_i
  x.wash_type_id = array[1].to_i
  x.vehicle_size_id = array[2].to_i
  x.gross_amount = array[3].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Price #{x.id} with amount $#{x.gross_amount} has been saved"
end
puts "There are now #{Price.count} rows in the Prices table"

# -------------------------VEHICLES DATABASE POPULATION-------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'vehicles_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Vehicle.new
  x.patent = array[0]
  x.vehicle_type = array[1]
  x.brand = array[2]
  x.model = array[3]
  x.color = array[4]
  x.status = array[5].to_s == "true"
  x.user_id = array[6].to_i
  x.vehicle_size_id = array[7].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Vehicle with Patent:#{x.patent} saved"
end
puts "There are now #{Vehicle.count} rows in the Vehicles table"

# -------------------------RECEIPTS DATABASE POPULATION-------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'receipts_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Receipt.new
  x.creation_date = array[0].to_date
  x.informed_gross_amount = array[1].to_i
  x.total_discount_amount = array[2].to_i
  x.sii_status = array[3]
  x.user_id = array[4].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Receipt w/ ID:#{x.id} and Amount: #{x.informed_gross_amount} has been saved"
end
puts "There are now #{Receipt.count} rows in the Receipts table"

# -------------------------PAYMENTS DATABASE POPULATION-------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'payments_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Payment.new
  x.bank = array[0]
  x.statement_date = array[1].to_date
  x.document_number = array[2]
  x.description = array[3]
  x.received_amount = array[4].to_i
  x.commission = array[5].to_i
  x.commissioner = array[6]
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Payment w/ ID:#{x.id} and Amount: #{x.received_amount} has been saved"
end
puts "There are now #{Payment.count} rows in the Payments table"

# -------------------------CREDIT_NOTES DATABASE POPULATION-------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'credit_notes_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = CreditNote.new
  x.creation_date = array[0].to_date
  x.informed_gross_amount = array[1].to_i
  x.sii_status = array[2]
  x.receipt_id = array[3].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "CreditNote w/ ID:#{x.id} and Amount: #{x.informed_gross_amount} has been saved"
end
puts "There are now #{CreditNote.count} rows in the CreditNotes table"

#--------------------------RECONCILIATIONS DATABASE POPULATION---------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'reconciliations_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Reconciliation.new
  x.payment_id = array[0].to_i
  x.receipt_id = array[1].to_i
  x.amount_assigned_from_payment_to_receipt = array[2].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Reconciliation P#{x.payment_id} & R#{x.receipt_id} for: $#{x.amount_assigned_from_payment_to_receipt} has been saved"
end
puts "There are now #{Reconciliation.count} rows in the Reconciliations table"

# -------------------------WASHES DATABASE POPULATION-------------------------
csv_text = File.read(Rails.root.join('db', 'seeds_databases', 'washes_db.csv'))
csv_file = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv_file.each do |row|
  array = row[0].split(";")
  x = Wash.new
  x.creation_date = array[0].to_date
  x.discount_amount = array[1].to_i
  x.wash_type_id = array[2].to_i
  x.washer_id = array[3].to_i
  x.vehicle_id = array[4].to_i
  x.receipt_id = array[5].to_i
  x.receipt_assigned_amount_to_wash = array[6].to_i
  x.save
  puts "Errors: #{x.errors.messages}"
  errors << x.errors.messages
  puts "Wash with ID:#{x.id} and Receipt: #{x.receipt_id} has been saved saved"
end
puts "There are now #{Wash.count} rows in the Washes table"

# -------------------------SUMMARY-------------------------
puts ""
puts "----------SEED FILE SUMMARY----------"
puts ""
puts "-----ERRORS-----"
puts ""
print errors
puts ""
puts "-----SEED FILE SUMMARY-----"
puts "There are now #{Place.count} rows in the Places table"
puts "There are now #{User.count} rows in the Users table"
puts "There are now #{Washer.count} rows in the Washers table"
puts "There are now #{WashType.count} rows in the Wash_types table"
puts "There are now #{VehicleSize.count} rows in the Vehicle_sizes table"
puts "There are now #{Price.count} rows in the Prices table"
puts "There are now #{Vehicle.count} rows in the Vehicles table"
puts "There are now #{Receipt.count} rows in the Receipts table"
puts "There are now #{Payment.count} rows in the Payments table"
puts "There are now #{CreditNote.count} rows in the CreditNotes table"
puts "There are now #{Reconciliation.count} rows in the Reconciliations table"
puts "There are now #{Wash.count} rows in the Washes table"
