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

ActiveRecord::Schema.define(version: 20161003044141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistances", force: :cascade do |t|
    t.integer  "fecha_id"
    t.integer  "employee_id"
    t.boolean  "asiste"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assistances", ["employee_id"], name: "index_assistances_on_employee_id", using: :btree
  add_index "assistances", ["fecha_id"], name: "index_assistances_on_fecha_id", using: :btree

  create_table "bill_products", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "product_id"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bill_products", ["bill_id"], name: "index_bill_products_on_bill_id", using: :btree
  add_index "bill_products", ["product_id"], name: "index_bill_products_on_product_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.string   "razon_social"
    t.string   "giro_comercial"
    t.integer  "customer_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "monto_neto"
    t.integer  "iva"
    t.integer  "total"
    t.boolean  "anulado",        default: true
  end

  add_index "bills", ["customer_id"], name: "index_bills_on_customer_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_matters", force: :cascade do |t|
    t.integer  "matter_id"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "customer_matters", ["matter_id"], name: "index_customer_matters_on_matter_id", using: :btree
  add_index "customer_matters", ["order_id"], name: "index_customer_matters_on_order_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nombre",                 default: "", null: false
    t.string   "rut",                    default: "", null: false
    t.integer  "telefono",               default: 0,  null: false
    t.string   "direccion",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "razon_social"
    t.integer  "giro_comercial_id"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["giro_comercial_id"], name: "index_customers_on_giro_comercial_id", using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "nombre"
    t.string   "rut"
    t.string   "email"
    t.date     "fecha_ingreso"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "sueldo"
  end

  create_table "fechas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "fecha"
  end

  create_table "giro_comercials", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lincenses", force: :cascade do |t|
    t.integer  "employee_id"
    t.date     "fechaInicio"
    t.integer  "duracion"
    t.text     "detalle"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lincenses", ["employee_id"], name: "index_lincenses_on_employee_id", using: :btree

  create_table "matter_products", force: :cascade do |t|
    t.integer  "matter_id"
    t.integer  "product_id"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matter_products", ["matter_id"], name: "index_matter_products_on_matter_id", using: :btree
  add_index "matter_products", ["product_id"], name: "index_matter_products_on_product_id", using: :btree

  create_table "matters", force: :cascade do |t|
    t.string   "nombre"
    t.string   "medida"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "saldo"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id", using: :btree
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "numero"
    t.date     "fecha"
    t.string   "detalle"
    t.string   "medida"
    t.integer  "customer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.date     "fecha_final"
    t.integer  "cantidad"
    t.integer  "estado",      default: 0
    t.boolean  "anulado",     default: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "nombre"
    t.float    "unidades"
    t.string   "medida"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "precio"
    t.integer  "codigo"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.integer  "permission_level",       default: 0,  null: false
    t.string   "nombre",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "assistances", "employees"
  add_foreign_key "assistances", "fechas"
  add_foreign_key "bill_products", "bills"
  add_foreign_key "bill_products", "products"
  add_foreign_key "bills", "customers"
  add_foreign_key "customer_matters", "matters"
  add_foreign_key "lincenses", "employees"
  add_foreign_key "matter_products", "matters"
  add_foreign_key "matter_products", "products"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "categories"
end
