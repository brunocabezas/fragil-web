const { Text } = require("@keystonejs/fields")

module.exports = {
  fields: {
    name: {
      type: Text,
      isRequired: true,
    },
    text: {
      type: Text,
      default: "",
      isRequired: false,
    },
    place: {
      type: Text,
      default: "",
      isRequired: false,
    },
    date: {
      type: Text,
      default: "",
      isRequired: false,
    },
  },
}
