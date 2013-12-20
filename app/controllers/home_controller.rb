require "find"

class HomeController < ApplicationController
  def index
    path = params[:dir_size]
    if  path.present?
      dir_size(path)
    end

    @hash = {}
    a = params[:a]
    if a.present?
      a.each_char do |i|
        if @hash.has_key?(i) == false
          @hash[i] = 1 
        else
          @hash[i] += 1
        end
      end
    end   
    #dir_size("/home/bob/fuck-rails/count/count/db") #4140
  end


  private

  def dir_size(dir)
    @dirsize =0

    Find.find(dir) do |f| 
      begin
      @dirsize += File.stat(f).size 
      rescue
        next
      end
    end
    @dirsize 
  end
end
