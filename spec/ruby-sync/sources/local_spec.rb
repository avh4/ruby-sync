require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe RubySync::Sources::Local do
  
  it "should return a list of files (example1)" do
    Dir.chdir('test_data/1') do
      @source = RubySync::Sources::Local.new()
      @source.file_list.should == ['file.txt']
    end
  end
  it "should return a list of files (example2)" do
    Dir.chdir('test_data/2') do
      @source = RubySync::Sources::Local.new()
      @source.file_list.should == ['File1.txt', 'File2.txt', 'File3.txt', 'File4.txt',
        'File5.txt', 'File6.txt', 'File7.txt', 'File8.txt']
    end
  end
  it "should return a list of files in subfolders (example3)" do
    Dir.chdir("test_data/3") do
      @source = RubySync::Sources::Local.new()
      @source.file_list.should == ['index.html', 'css/style.css', 'images/bottom.png', 'images/left.png', 'images/right.png', 'images/top.png']
    end
  end
  it "should return a list of directories (example3)" do
    Dir.chdir("test_data/3") do
      @source = RubySync::Sources::Local.new()
      @source.dir_list.should == ['css', 'images']
    end
  end
end