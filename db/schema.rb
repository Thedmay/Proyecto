# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160421202346) do

  create_table "assistances", force: :cascade do |t|
    t.boolean  "asiste"
    t.boolean  "licencia"
    t.date     "fecha"
    t.integer  "employee_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "assistances", ["employee_id"], name: "index_assistances_on_employee_id", using: :btree

  create_table "bill_products", force: :cascade do |t|
    t.integer  "bill_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "bill_products", ["bill_id"], name: "index_bill_products_on_bill_id", using: :btree
  add_index "bill_products", ["product_id"], name: "index_bill_products_on_product_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "numero",         limit: 4
    t.date     "fecha"
    t.string   "razon_social",   limit: 255
    t.string   "giro_comercial", limit: 255
    t.float    "monto_neto",     limit: 24
    t.float    "iva",            limit: 24
    t.float    "total",          limit: 24
    t.integer  "customer_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "bills", ["customer_id"], name: "index_bills_on_customer_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customer_matters", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "matter_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "customer_matters", ["customer_id"], name: "index_customer_matters_on_customer_id", using: :btree
  add_index "customer_matters", ["matter_id"], name: "index_customer_matters_on_matter_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "rut",        limit: 255
    t.integer  "telefono",   limit: 4
    t.string   "email",      limit: 255
    t.string   "direccion",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "nombre",        limit: 255
    t.string   "rut",           limit: 255
    t.string   "clave",         limit: 255
    t.string   "email",         limit: 255
    t.float    "sueldo",        limit: 24
    t.date     "fecha_ingreso"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "matters", force: :cascade do |t|
    t.string   "nombre",        limit: 255
    t.float    "cantidad",      limit: 24
    t.string   "medida",        limit: 255
    t.float    "saldo",         limit: 24
    t.date     "fecha_ingreso"
    t.date     "fecha_utiliza"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "numero",      limit: 4
    t.date     "fecha"
    t.string   "detalle",     limit: 255
    t.float    "cantidad",    limit: 24
    t.string   "medida",      limit: 255
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "nombre",        limit: 255
    t.string   "codigo",        limit: 255
    t.float    "unidades",      limit: 24
    t.float    "cantidad",      limit: 24
    t.string   "medida",        limit: 255
    t.date     "fecha_produce"
    t.integer  "category_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "nombre",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assistances", "employees"
  add_foreign_key "bill_products", "bills"
  add_foreign_key "bill_products", "products"
  add_foreign_key "bills", "customers"
  add_foreign_key "customer_matters", "customers"
  add_foreign_key "customer_matters", "matters"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "categories"
end
