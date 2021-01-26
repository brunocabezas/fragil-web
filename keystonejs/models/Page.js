const { Text, Integer } = require("@keystonejs/fields")

module.exports = {
  fields: {
    name: {
      type: Text,
      isRequired: true,
    },
    order: {
      type: Integer,
      defaultValue: 0,
      isRequired: false,
    },
    text: {
      type: Text,
      default: "",
      isRequired: false,
    },
  },
}
