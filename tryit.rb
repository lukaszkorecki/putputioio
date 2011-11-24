require './lib/putputioio'
set = YAML::load_file(File.expand_path '~/.putiorc')

load './lib/putputioio/api.rb' if defined? IRB
putio = PutPutIoIo::Api.new set['key'], set['secret']

obj, resp =  putio.get 'user', 'info'

obj

dirs = putio.get 'files', 'list'

f = dirs['response']['results'].first

dir_id = f['id']

puts putio.get 'files', 'list', { id: f['id']}

