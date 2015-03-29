class Company
	
	def initialize(formation_docs=nil)
		if !formation_docs
			raise CompanyErrors::Formation.new("---Need documents and stuff, ----run .need_to_start? method on Company class model")
		end	
	end

	def self.setup_basics
		setup_basics = {
			name: Help::Formation.name,
			directors: Help::Formation.directors, 
			registered_address: Help::Formation.registered_address, 
			memorandum_of_association: Help::Formation.moa, 
			articles_of_association: Help::Formation.aoa,
			statement_of_capital: Help::Formation.stat_of_capital
		}
	end

	def self.need_to_start? 
		puts "Run print_setup_basics as Company class method"
	end

	def self.print_setup_basics
		self.setup_basics.each_pair do |title,information|
			puts "Formation Requirement::#{title}"
			puts "Requirement Info::#{information}" 
		end
		puts "-----see MORE -----"
		puts "See template model basics by running example_formation_basics on the Company class"
	end

	def self.first_steps_to_formation?
		puts "Run how_to_start with true or false for using model articles as an argument"
	end

	def self.how_to_start?(model_articles=true)
		if !model_articles
			Help::Formation.starting_steps_non_model
		else
			Help::Formation.starting_steps
		end
	end

	def self.example_formation_basics
		`open ./files/formation`
	end

	def self.basics_ready?
	  	$stdout << "DO YOU HAVE THE BASICS READY, YES OR NO?"
	  	user_input = gets.chomp
	  	if user_input == "YES"
	  		puts "Excellent"
	  	else
	  		puts "Keeping going, you'll get there"
	  	end
	end
	
end


module CompanyErrors

	class Formation < StandardError
	    def initialize(msg=nil)
	      @message = msg
	    end

	    def message
	      "FormationError: #{@message}"
	    end
	end
	  # class SxtartUp < StartUp
	  #   def message
	  #     super + " We also got a startUp error."
	  #   end
	  # end
end

module Help

	class Formation

		def self.name
			"Rules on what can and can't be included"
		end

		def self.directors
			"At least one, and can be a shareholder,  has responsibilities"
		end

		def self.registered_address
			"Address to have the company registered at for legal, companies house and accounts purposes"
		end

		def self.moa
			"a legal statement signed by all initial shareholders (known as ‘subscribers’) confirming they agree to form the company."
		end

		def self.aoa
			"written rules about running the company that shareholders and ‘officers’ (directors or company secretary) have to agree."
		end

		def self.stat_of_capital
			"must have at least one shareholder, SOC determines type of company and details the company’s shares and the rights attached to them.  Private Limited by shares is normal.  Prescribed particulars are available mechanisms to tweak IN01 embeds SH01 (https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/298455/SH01_return_of_allotment_of_shares.pdf)"
		end

		def self.starting_steps
			"Using your model articles_of_association, you can do it here at https://www.gov.uk/register-a-company-online"
		end

		def self.starting_steps_non_model
			"If not using model articles, download IN01 Application to register a company: https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/288271/IN01_application_to_register_a_company.pdf"
		end

	end

end








