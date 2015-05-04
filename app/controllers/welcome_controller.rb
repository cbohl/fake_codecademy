class WelcomeController < ApplicationController

  def index
    require 'Open3'
    @input = params[:code]
    stdin, stdout, stderr = Open3.popen3("ruby -e '#{@input}'")

    @output = stdout.readlines
    @errors = stderr.readlines

    @output.map! do |line|
      line.gsub(/\n/, "")
    end
  end

end