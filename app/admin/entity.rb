ActiveAdmin.register Entity do
  permit_params :title, :website_url, :primary_phone, :secondary_phone

  index do
    selectable_column
    id_column
    column :title
    column :website_url
    column :primary_phone
    column :secondary_phone
    column :users, sortable: :users do |entity|
      entity.users.count
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :website_url
      row :primary_phone
    end
    panel "Users" do
      table_for entity.users do
        column "email" do |user|
          user.email
        end
        column "Sign In Count" do |user|
          user.sign_in_count
        end
        column "Created At" do |user|
          Time.parse(user.created_at.to_s).localtime.strftime(Settings.datetime_format.default)
        end
      end
    end
    active_admin_comments
  end

  filter :email
  filter :website_url
  filter :primary_phone

  form do |f|
    f.inputs "Entity Details" do
      f.input :title
      f.input :website_url
      f.input :primary_phone
      f.input :secondary_phone
    end
    f.actions
  end

end
