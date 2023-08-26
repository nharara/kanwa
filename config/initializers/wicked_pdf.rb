WickedPdf.config ||= { exe_path: Gem.bin_path('wkhtmltopdf-heroku', 'wkhtmltopdf-linux-amd64') }
WickedPdf.config.merge!({
                          layout: 'pdf',
                          orientation: 'Portrait',
                          page_size: 'A4',
                        })


                        # :exe_path => "#{Rails.root}/bin/wkhtmltopdf"
