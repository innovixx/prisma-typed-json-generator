# prisma-typed-json-generator

A Prisma generator that automatically creates TypeScript types for your `Json` fields with `@type()` annotations, and patches the generated Prisma Client types to use your custom types.

## Features
- Extracts custom types from commented blocks in your Prisma schema.
- Generates a `prisma-json.types.ts` file in your Prisma Client output directory.
- Patches the generated `index.d.ts` to use your custom types for annotated `Json` fields, using a namespace import to avoid type name clashes.
- Context-aware: only patches the correct field in the correct model, even if multiple models use the same field name.

## Usage

1. Add the generator to your `schema.prisma`:

```
generator client {
  provider = "prisma-client-js"
  output   = "./client"
}

generator prisma_types_json_generator {
  provider = "prisma-typed-json-generator"
  output   = "../types"
}
```

2. Annotate your `Json` fields with `@type()` and define your types in comments:

```
// type Address {
//   street string
//   city string
//   country string
// }

model User {
  id      Int     @id @default(autoincrement())
  email   String  @unique
  name    String?
  address Json // @type(Address)
}
```

3. Run `prisma generate`:

```
npx prisma generate
```

4. The generator will:
   - Create `prisma-json.types.ts` in your client output directory.
   - Patch `index.d.ts` to use `PrismaJsonTypes.Address` for the `address` field in the `User` model.

## Why?
Prisma's `Json` fields are typed as `Prisma.JsonValue` by default, which is not type-safe. This generator lets you use your own types for better safety and DX.

## License
MIT
