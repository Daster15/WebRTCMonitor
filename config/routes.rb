Rails.application.routes.draw do
  
  root :to => 'books#index'

  dir = File.expand_path(__dir__)
  files = Dir.glob("#{dir}/routes/*.rb")
  files.each do |file|
    if Rails.configuration.cache_classes
      require_dependency file
    else
      load file
    end
  end

end
