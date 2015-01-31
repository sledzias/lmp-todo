(function (){
  angular.module('lmp', []).controller('TaskController', function($scope, $http){

    var loaddata = function(){
      $http.get('/tasks.json').success(function(data){
        $scope.tasks = data;
      });
    };
    loaddata();

    $scope.addTask = function(description, id){
      $http.post('/tasks.json', {task: {description: description, user_id: id}}).success(function(data){
        $scope.tasks = loaddata();
        $scope.newTaskdescription = '';
      });
    };

    $scope.update = function(task){
      $http.put('/tasks/' + task.id + '.json', {task: {description: task.description}} ).success(function(data){
      });
    };

    $scope.destroy = function(task){
      $http.delete('/tasks/' + task.id + '.json').success(function(data){
        $scope.tasks = loaddata();
      });
    };

    $scope.markAll = function(){
      this.tasks.forEach(function(task){
        $http.put('/tasks/' + task.id + '.json', {task: {done: true}});
      });
      this.tasks = loaddata();
    };

    $scope.setFilter = function(filter){
      this.taskfilter = filter;
    };

    $scope.filterTasks = function(filter){
      switch(filter){
        case true:
          return {done: true}
          break;
        case false:
          return {done: false}
          break;
        default:
          return ''
      };
    };
  });
})();