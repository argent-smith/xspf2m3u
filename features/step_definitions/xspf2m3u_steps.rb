Then /^the version display should be correct$/ do
  all_output.should match(/#{Xspf2m3u::VERSION}/)
end

