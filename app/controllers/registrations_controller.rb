class RegistrationsController < Devise::RegistrationsController

  def edit
    @claims = current_user.items
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
