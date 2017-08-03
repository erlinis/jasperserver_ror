class ReportsController < ApplicationController
  def index
  end

  def machines
    file = JasperserverRails::Jasperserver.new.run_report 'machines__' do
      format 'pdf'
      report 'reports/Rentul___People'
      params({ :Value1 => 'Value1' })
    end

    puts "000"*10
    puts file
    puts file.path
    fullpath = File.expand_path(file.path)
    respond_to do |format|
      format.pdf do
        send_file(fullpath, filename: 'machines.pdf', type: 'application/pdf')
      end
    end
  end
end
