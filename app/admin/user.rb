ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :entity_id

  index do
    selectable_column
    id_column
    column :email
    column :entity_id
    column :sign_in_count
    column :last_sign_in_at
    column :created_at
    column :last_sign_in_ip
    actions
  end

  filter :email
  filter :entity
  filter :sign_in_count
  filter :last_sign_in_at
  filter :created_at
  filter :last_sign_in_ip

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :entity_id, :label => 'Entity', :as => :select, :collection => Entity.all.map do |u|
        ["#{u.title}", u.id]
      end
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end