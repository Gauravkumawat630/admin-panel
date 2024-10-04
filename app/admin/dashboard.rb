ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { 'Dashboard' }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        small I18n.t('active_admin.call_for_action')
      end
    end
  end 
end  