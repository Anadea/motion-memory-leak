class AppDelegate
  def applicationDidFinishLaunching(notification)
    splitter('resources/big.mbox') do |mail|
      # do something with mail (NSData)
    end
  end

  def splitter(path)
    File.open(path, 'r:ASCII-8BIT') do |file|
      mail = NSMutableString.alloc.init
      file.each do |line|
        autorelease_pool do
          unless line =~ /^From [^\s]+@[^\s]+ .{24}$/ or file.eof?
            mail.appendString(line)
          else
            yield mail.dataUsingEncoding(NSUTF8StringEncoding) if mail.length > 0
            mail = NSMutableString.alloc.init
          end
        end
      end
    end
  end
end
