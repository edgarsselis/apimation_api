require 'json'
require_relative 'support/api_helper.rb'

thumbnail = { 'url' => 'https://cdn.dribbble.com/users/21009/screenshots/3439629/pink_elephant-2.jpg'}
fields = []
fields.push({'name' => 'Author', 'value' => 'ES'})
fields.push({'name' => 'Position', 'value' => 'QA Engineer'})

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
