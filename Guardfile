guard :standardrb, fix: true, all_on_start: false, progress: true do
  watch(/.+\.rb$/)
  %w[Gemfile Guardfile].each { |filename| watch filename }
end

guard :exec, name: "Run", command: "ruby" do
  watch(%r{\d+/(.*)\.rb})
end
