### Session object containing user attributes ###
@TheCreem.service 'CreemSession', ($q, $log, Auth) ->

  _self = this

  @create = (attributes) ->
    @user = attributes
    # @role = attributes.entity.role
    return

  @isAuthenticated = ->
    !!@user

  @destroy = ->
    Auth.reset() if @user
    @user = null
    # @role = null
    return

  @getCurrentUser = ->
    Auth.currentUser().then(
      (user) ->
        _self.create(user)
        user
      (error) ->
        $log.error('Could not authenticate current user: ', error)
        error
    )

  return this
