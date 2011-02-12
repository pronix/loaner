# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.default_options = {
    :page_size => 'A4',
    :orientation => "Landscape",
    :print_media_type => true,
    :margin_top => '0.02in',                                                                                                                                                                           
    :margin_right => '0.02in',                                                                                                                                                                         
    :margin_bottom => '0.02in',                                                                                                                                                                        
    :margin_left => '0.02in',         
  }
end
