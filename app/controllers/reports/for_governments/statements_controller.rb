require 'fileutils'

class Reports::ForGovernments::StatementsController < Reports::BaseController
  def show
    @reports_params = Reports::Params.new(params[:reports_params] || {}, current_user)
    @reports_params.to_quarter!

    @template = "#{Rails.root}/data/reports/Moneylender_Statement_Template.xls"
    FileUtils.mkdir_p "#{Rails.root}/tmp/xls"
    @xls_result = "#{Rails.root}/tmp/xls/statement_#{current_user.id}-#{Time.now.strftime '%Y%m%d%H%M%S'}.xls"

    @result = Ooo::StatementsXba.new.generate(:user => current_user,
                                    :date => @reports_params.date_start,
                                    :quarter => @reports_params.quarter,
                                    :save_to => @xls_result
                                    )
    if params[:script]
      @result
    else
      #FileUtils.copy_file @template, @xls_result
      if system %{ soffice "#{@template}" "#{Ooo::StatementsXba::SCRIPT_URL}" }
        sleep 5
        10.times do
          sleep 1
          break if File.exists? @xls_result
          logger.debug "file #{@xls_result} still does not exists..."
        end
        sleep 5

        send_file(@xls_result)
      else
        render :text => "fail"
      end
    end
  end
end
