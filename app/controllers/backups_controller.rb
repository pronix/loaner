require "#{Rails.root.to_s}/vendor/plugins/yaml_db/lib/yaml_db.rb"

class BackupsController < ApplicationController
  def index
  end

  def backup
    file = "/tmp/loaner-#{Time.now.strftime('%Y%m%d%H%M%S')}.yml"
    Rails.logger.debug "dump to: #{file}"
    YamlDb::dump file
    send_file file
  end

  def restore
    if params[:file]
      logger.debug "file: #{params[:file].path}"
      YamlDb.load params[:file].path
      flash[:notice] = "Database restored"
    else
      flash[:error] = "fail"
    end
    render :index
  end
end
