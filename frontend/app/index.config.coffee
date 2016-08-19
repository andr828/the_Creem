@TheCreem.config (AuthProvider, AuthInterceptProvider)->
  # TODO: add comments here documenting these configurations.
  # Customize login
  AuthProvider.loginMethod('POST')
  AuthProvider.loginPath('/auth/users/sign_in.json')

  # Customize logout
  AuthProvider.logoutMethod('DELETE')
  AuthProvider.logoutPath('/auth/users/sign_out.json')

  # Customize register
  AuthProvider.registerMethod('POST')
  AuthProvider.registerPath('/auth/users')


@TheCreem.config ($mdThemingProvider)->
  creemOrangeMap = $mdThemingProvider.extendPalette('deep-orange', {
    '500': 'f26c4f'
  })

  $mdThemingProvider
  .definePalette('creemOrange', creemOrangeMap)
  # Use that theme for the primary intentions
  $mdThemingProvider
    .theme('default')
    .primaryPalette('creemOrange')
    .accentPalette('grey',{
      'default': '900',
      'hue-1': '200',
      'hue-2': '700',
      'hue-3': '800'
    })

  $mdThemingProvider.alwaysWatchTheme(true)
