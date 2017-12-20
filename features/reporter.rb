require 'json'
require_relative 'support/api_helper.rb'

build_nr = ARGV[0]
job_url = ARGV[1]

thumbnail = { 'url' => 'https://cdn.dribbble.com/users/21009/screenshots/3439629/pink_elephant-2.jpg'}
fields = []
fields.push({'name' => 'Jenkins job', 'value' => job_url})
fields.push({'name' => 'Build number', 'value' => build_nr.to_s})

embed = []
embed.push({'title' => 'Rich content',
           'color' => 14238452,
           'fields' => fields,
           'thumbnail' => thumbnail})

payload = { 'content' => 'Automatic message', 'embeds' => embed}.to_json

post('https://discordapp.com/api/webhooks/393067525451022336/uz2WgUi_8-6oS9zy2Pu_3l_-CtQvabdSlgflF_ojyxTxWgxO_8Vdj0qBDMNixDj6wlT1',
                      headers: { 'Content-Type' => 'application/json' },
                      cookies: {},
                      payload: payload)
