class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.info
  	correos = Array.new
  	nombres = Array.new
  	fechas = Array.new

  	@connection = ActiveRecord::Base.establish_connection(
            :adapter => "mysql2",
            :host => "localhost",
            :database => "proyect_development",
            :username => "root",
            :password => "1243"
	)

	sql = "SELECT * from usuarios"
	result = @connection.connection.execute(sql);
	result.each(:as => :hash) do |row| 
	   correos.push(row["email"] )
	   nombres.push(row["nombre"])
	   fechas.push(row["last_sign_in_at"])
	end
    return correos,nombres,fechas
  end
end
