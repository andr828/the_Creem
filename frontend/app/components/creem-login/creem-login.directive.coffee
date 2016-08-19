@TheCreem.directive 'creemLogin', ($log, Auth)->
  directive =
    restrict: 'EA'
    templateUrl: 'app/components/creem-login/creem-login.html'
    scope: {
      afterLogin: '='
      afterRegister: '='
      afterReset: '='
      selectedForm: '=?'
    }
    controllerAs: 'vm'
    bindToController: true
    link: (scope, element, attrs, ctrl) ->
      return
    controller: () ->
      vm = this

      # Load
      # ----------------
      vm.creds = { email: '', password: '' }
      vm.user = { entity_attributes: { type: 'candidate' } }

      # Linked methods
      # ----------------
      vm.selectEmployee = ->
        vm.user.entity_attributes.type = 'candidate'

      vm.selectEmployer = ->
        vm.user.entity_attributes.type = 'employer'

      vm.backToLoginForm = ->
        vm.selectedForm = 'default'

      vm.selectedType = (type)->
        vm.user.entity_attributes.type == type

      vm.login = ->
        Auth.login(vm.creds).then(
          (user) ->
            vm.afterLogin(user)
          (err) ->
            $log.error 'Unable to login: ', err
            validateLoginAsFailed()
        )

      vm.register =  ->
        angular.extend(vm.user, vm.creds)
        Auth.register(vm.user).then(
          (registeredUser) ->
            vm.afterRegister(registeredUser)
            console.log('CREATED!!!!', registeredUser)
          (err) ->
            $log.error 'Unable to register: ', err
        )

      # Private methods
      # -----------------
      validateLoginAsFailed = ->
        vm.form.login.email.$setValidity('failed', false)
        vm.form.login.password.$setValidity('failed', false)

      return
