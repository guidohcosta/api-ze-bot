class CorreiosService
  BASE_URL = 'https://api.linketrack.com/track/json'
  DEFAULT_PARAMS = {
    user: 'teste',
    token: '1abcd00b2731640e886fb41a8a9671ad1434c599dbaa0a0de9a5aa619f29a83f'
  }

  def self.track(code)
    params = DEFAULT_PARAMS.
      merge({ codigo: code })
    response = RestClient.get(BASE_URL, { params: params })
    JSON(response.body)
  end
end
