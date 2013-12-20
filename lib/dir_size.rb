require "find"

def dir_size(dir)
  dirsize =0

  Find.find(dir) do 
    |f| dirsize += File.stat(f).size 
  end
  puts dirsize 
end

dir_size("/home/bob/fuck-rails/count/count/laobo") #4140
