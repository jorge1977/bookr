class Admin::TagsController < Admin::CoreController
  administrate_me do |admin|
    admin.search :name
    admin.order  'name'
  end
end

