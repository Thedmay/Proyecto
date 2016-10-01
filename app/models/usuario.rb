class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nombre, presence: true, length:{in:5..50,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  validates_format_of :nombre, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                      :message => "Invalido"
  validates :email, presence: true, length:{in:5..254,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  validates :email, uniqueness: {case_sensitive: false ,message: "ya existe un email con ese nombre"}

  def pass=(pass)
    @pass=pass
  end

  def self.salvar
    begin
      @connection = ActiveRecord::Base.establish_connection(
            :adapter => "mysql2",
            :host => "localhost",
            :database => "proyect_development",
            :username => "root",
            :password => "1243"
      )

      n = this.nombre
      p = this.permission_level
      e = this.email
      en_pass=User.new(:password => @pass).encrypted_password
      sql = "INSERT INTO usuarios(permission_level, nombre, email, encrypted_password, sign_in_count) values("+p+","+n+","+e+","+en_pass+","+0+")"
      
      @connection.connection.execute(sql);
      return true
    rescue Exception => e
      return false
    end
  end
end
