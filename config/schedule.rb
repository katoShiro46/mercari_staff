set :output, "/Users/shiro/Excel/crontab.log"
set :environment, :development

every 1.days do
  rake 'excel:items'
end

# Learn more: http://github.com/javan/whenever
# ログ出力先ファイルを指定
# set :output, 'log/crontab.log'
# ジョブ実行環境を指定
# set :environment, :production

# [例] 1時間に1回
# every 1.hours do
  # bash コマンドの実行例
  # command "echo 'hello, whenever world!'"
# end

# [例] 毎日04:30
# every 1.day, at: '4:30 am' do
  # rake タスクの実行例
  # rake 'redline:send_reminder users=1 days=3 RAILS_ENV=production'
# end

# [例] 毎週日曜18:00
# every :sunday, at: '18:00' do
  # Rails 内のメソッド実行例
  # runner 'MyController.method_hoge'
# end

# [例] 毎週月曜〜金曜06:00（crontab 形式）
# every '0 6 0 0 1-5 ' do
  # script の実行
  # script '/home/hoge/rails_project/lib/assets/piyo.sh'
# end


# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
