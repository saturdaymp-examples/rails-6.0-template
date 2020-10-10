class MaxLinesFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.lines.count < filter_argument
  end
end

SimpleCov.start do
  load_profile "rails"
  coverage_dir "tmp/coverage"

  # Use multiple 'command_names' to differentiate reports being merged in together
  command_name "rails_app_#{$$}" # $$ is the processid

  merge_timeout 3600 # 1 hour

  add_group "Long files" do |src_file|
    src_file.lines.count > 100
  end

  add_group "Short files", MaxLinesFilter.new(5)

  # Exclude these paths from analysis
  add_filter "lib/plugins"
  add_filter "vendor"
  add_filter "bundle"
end
