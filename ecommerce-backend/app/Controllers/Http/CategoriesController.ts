import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Category from 'App/Models/Category';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class CategoriesController {

    public async getId(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Category.query().where(id, 'id');
        return result;
    }

    public async getAll(ctx: HttpContextContract){
        var query = Category.all();
        var result = await query;
        return result;
    }

    public async create (ctx : HttpContextContract){
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            icon: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var category = new Category();
        category.name = fields.name;
        category.description = fields.description;
        category.icon = fields.icon;
    
        var result = await category.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            description: schema.string(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var category = await Category.findOrFail(id);
        category.name = fields.name;
        category.description = fields.description;
        var result = await category.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var category = await Category.findOrFail(id);
            await category.delete();
            return { message: "The category has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
