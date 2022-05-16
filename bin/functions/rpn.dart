class Rpn {
  double solve(List<dynamic> expression) {
    print(expression);
    var solve = [];
    for (var char in expression) {
      if (char.runtimeType == double) {
        solve.add(char);
      } else {
        if (solve.length < 2) {
          throw Error();
        }

        var o2 = solve.removeLast();
        var o1 = solve.removeLast();

        switch (char) {
          case '+':
            solve.add(o1 + o2);
            break;
          case '-':
            solve.add(o1 - o2);
            break;
          case '*':
            solve.add(o1 * o2);
            break;
          case '/':
            solve.add(o1 / o2);
            break;

          default:
            throw Error();
        }
      }
    }

    if (solve.length > 1) {
      throw Error();
    }

    return solve[0];
  }
}
