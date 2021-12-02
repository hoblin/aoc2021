guard :rubocop, all_on_start: false, cli: '-a' do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end

guard :exec, name: 'Run', command: 'ruby' do
  watch(%r{\d+/(.*)\.rb})
end
