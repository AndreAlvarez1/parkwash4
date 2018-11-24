ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

index do
  column :id
  column :email
  column :created_at
  column :email_provider do |user|
    user.email.split('@').last.capitalize
  end
  column :member_since do |user|
    time_ago_in_words(user.created_at)
  end
  actions
end


permit_params :email, :password

controller do
  def update
    if (params[:user][:password].blank? && params[:user]
      [:password_confirmation].blank?)
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
  end
end

filter :email, as: :select



end
