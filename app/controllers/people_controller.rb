class PeopleController < InheritedResources::Base
  respond_to :html, :xml, :json

  def destroy
    destroy! do |success, failure|
      failure.html { flash[:error] = "Person have related loans" }
    end
    redirect_to people_path
  end
end
