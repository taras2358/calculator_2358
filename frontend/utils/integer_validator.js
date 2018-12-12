export default class IntegerValidator {
  static validate(number) {
    return Boolean(number && number.match(/^\d{1,2}$/))
  }
}


