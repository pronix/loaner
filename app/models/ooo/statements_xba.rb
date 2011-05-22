require 'erubis'

module Ooo
  SCRIPTS_PATH = "/home/vlad/.openoffice.org/3/user/basic/LoanerLib"
  
  class StatementsXba

    SCRIPT_NAME = "Statements"
    SCRIPT_URL = "macro:///LoanerLib.#{SCRIPT_NAME}.Main()"

    def context params
      result = Erubis::Context.new()
      result["month_names"]     = %w( January	February	March	April	May	June	July	August	September	October	November December)
      result["quarter_names"]   = ["1ST QUARTER", "2ND QUARTER", "3RD QUARTER", "14TH QUARTER"]
      result["date"]            = params[:date]
      result["user"]            = params[:user]
      result["loans"]           = params[:user].loans
      result["company"]         = params[:user].company_profile
      result["quarter"]         = params[:quarter]
      result["books"]           = params[:user].books
      result["save_to"]         = params[:save_to]
      result
    end

    def generate params
      input = File.read("#{Rails.root}/app/views/ooo/statement_xba.xba.erb")
      eruby = Erubis::Eruby.new(input)
      result = eruby.evaluate(context(params))
      File.open("#{Ooo::SCRIPTS_PATH}/#{SCRIPT_NAME}.xba", "w+") do |file|
        puts result
        file.write(result)
      end
      result
    end
  end
end
