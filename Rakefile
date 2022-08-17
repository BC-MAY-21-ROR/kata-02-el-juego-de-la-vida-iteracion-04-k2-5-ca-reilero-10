require 'rubycritic_small_badge'
require 'rubycritic/rake_task'
RubyCriticSmallBadge.configure do |config|
  config.minimum_score = ENV.fetch('RUBYCRITICLIMIT', 95.0)
end
RubyCritic::RakeTask.new do |task|
  task.options = %(--custom-format RubyCriticSmallBadge::Report
--minimum-score #{RubyCriticSmallBadge.config.minimum_score}
--format html --format console)
  task.paths = FileList['/home/ghiguera/Desktop/Brightcoders/kata-02-el-juego-de-la-vida-iteracion-04-k2-5-ca-reilero-10/*.rb']
end

task default: :rubycritic