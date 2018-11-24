ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Últimos Usuarios agregados" do
          ul do
            User.last(5).map do |user|
              li link_to("#{user.first_name} #{user.last_name}", admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Usuarios y Admins" do
          ul do
            li "Usuarios registrados: #{User.count}"
            li "Administradores registrados: #{AdminUser.count}"
          end
        end
      end

      column do
        panel "Vehículos y Lavados" do
          ul do
            li "Lavados creados: #{Wash.count}"
            li "Vehiculos creados: #{Vehicle.count}"
          end
        end
      end

    end

    panel "Gráfico" do
      render 'shared/chart'
    end

  end
end
