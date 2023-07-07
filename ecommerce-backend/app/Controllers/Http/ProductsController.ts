import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Product from 'App/Models/Product';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class ProductsController {

    public async getByCategory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var  categoryId = ctx.request.input('category_id');
        var result = await Product.query().preload("Category").where('id', id);
        if (categoryId) {
            var query2 = Product.query().preload("Category");
            query2.where("categoryId", ctx.request.input("categoryId"));
        }return result;
    }

    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Product.query().preload("Category").preload("Inventory").preload("Discount").where('id', id);
        return result;
    }
    async getAll({ request, auth }: HttpContextContract) {
        var authObject = await auth.authenticate();

        var discountId = request.input('discount_id');
        var inventoryId = request.input('inventory_id');
        var categoryId = request.input('category_id');
        var query2 = Product.query().preload("Category").preload("Inventory").preload("Discount");
        // var query = Product.query().where("active", true).preload("Category", (subQry) => {
        //     subQry.where("active", true);
        // });
        if (request.input("categoryId")) {
            query2.where("categoryId", request.input("categoryId"));
        }
        if (inventoryId) {
            query2.where('inventory_id', inventoryId);
        }
        if (discountId) {
            query2.where('discount_id', discountId);
        }

        var result = await query2;
        var products: Product[] = [];
        result.map((product) => {
            if (product.Category) {
                products.push(product);
            }
        });
        return products;
    }

    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            category_id: schema.number(),
            inventory_id: schema.number(),
            price: schema.number(),
            image: schema.string(),
            discount_id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var product = new Product();
        product.name = fields.name;
        product.description = fields.description;
        product.categoryId = fields.category_id;
        product.discountId = fields.discount_id;
        product.inventoryId = fields.inventory_id;
        product.price = fields.price;
        product.image = fields.image;
        var result = await product.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            category_id: schema.number(),
            inventory_id: schema.number(),
            price: schema.number(),
            discount_id: schema.number(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var product = await Product.findOrFail(id);
        product.name = fields.name;
        product.description = fields.description;
        product.categoryId = fields.category_id;
        product.discountId = fields.discount_id;
        product.inventoryId = fields.inventory_id;
        product.price = fields.price;
        var result = await product.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var product = await Product.findOrFail(id);
            await product.delete();
            return { message: "The product has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
