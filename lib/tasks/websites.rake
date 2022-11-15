namespace :websites do
  desc "Delete closed enquiries"
  task delete_closed_enquiries: :environment do
    Website.find_each do |website|
      website.enquiries.ready_for_deletion.destroy_all
      Rails.logger.info "Deleted closed enquiries for website #{website.id} - #{website.name}"
    end
  end
end
