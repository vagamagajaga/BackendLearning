import Vapor
import Fluent
import FluentPostgresDriver

let app = try Application(.detect())

defer {
    app.shutdown()
}

app.databases.use(
    .postgres(
        configuration: .init(
            hostname: "localhost",
            port: 5432,
            username: "vagan",
            password: "",
            database: "books_db",
            tls: .disable
        )
    ),
    as: .psql
)

app.migrations.add(CreateAuthor())
app.migrations.add(SeedAuthors())

UserRoutes().registerUserRoutes(app)

try app.run()
