namespace :test_server do

  task :start do
    sh './apache-ftpserver-1.0.0/bin/ftpd.sh res/conf/ftpd-features.xml'
  end
  
end