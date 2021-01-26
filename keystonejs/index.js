const { Keystone } = require("@keystonejs/keystone")
const { GraphQLApp } = require("@keystonejs/app-graphql")
const { AdminUIApp } = require("@keystonejs/app-admin-ui")
const { MongooseAdapter: Adapter } = require("@keystonejs/adapter-mongoose")

// Import models
const PageSchema = require("./models/Page.js")
const ProjectSchema = require("./models/Project.js")

const PROJECT_NAME = "Fragil"
const adapterConfig = {
  mongoUri:
    process.env.MONGO_URI || process.env.MONGOLAB_URI || "mongodb://mongodb",
}

// console.log(adapterConfig)
/**
 * You've got a new KeystoneJS Project! Things you might want to do next:
 * - Add adapter config options (See: https://keystonejs.com/keystonejs/adapter-mongoose/)
 * - Select configure access control and authentication (See: https://keystonejs.com/api/access-control)
 */

const keystone = new Keystone({
  name: PROJECT_NAME,
  adapter: new Adapter(adapterConfig),
  session: true,
  auth: true,
  autoUpdate: true,
  userModel: "User",
  cookieSecret: process.env.COOKIE_SECRET || "demo",
})
keystone.createList("Pagina", PageSchema)
keystone.createList("Proyecto", ProjectSchema)

module.exports = {
  keystone,
  apps: [new GraphQLApp(), new AdminUIApp({ enableDefaultRoute: true })],
}
