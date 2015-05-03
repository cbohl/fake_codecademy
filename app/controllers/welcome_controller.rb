class WelcomeController < ApplicationController

  def index
    require 'Open3'
    sent_code = params[:code]


    p sent_code

    if sent_code
      puts "INPUT"
      p sent_code

      # alterred_code = sent_code.gsub(/\r\n/, "; ")

      # puts "ALTERED INPUT"
      # p alterred_code

      puts "OUTPUT"
      # @output = IO.popen("ruby -e '#{alterred_code}'").readlines

      # @output = IO.popen("ruby -e '#{sent_code}'").readlines
      @stdin, @stdout, @stderr = Open3.popen3("ruby -e '#{sent_code}'")

      @output = @stdout.readlines

      if @output
        # p @output[0]
        puts
        p @output.to_s
        @output.map! do |line|
          line.gsub(/\n/, "")
        end
        puts "OUTPUT"
        p @output
        puts "OTHER"
        p @output[0]
        p "#{@output[0]}".to_s

        puts "ERROR MESSAGE"
        @errors = @stderr.readlines
      end
      # if @output != nil
      #   @output = @output[0].gsub(/\//, "")
      # end
    end


  end
end
      # @output = eval(sent_code)
  # puts output.readlines
    # puts "SENT CODE"
    # p sent_code
    # puts "OUTPUT"
    # p @output
    # puts "DONE"
    # STDOUT
    # @output.map! do |line|
    #   line = line.gsub(/\//, "")
    # end