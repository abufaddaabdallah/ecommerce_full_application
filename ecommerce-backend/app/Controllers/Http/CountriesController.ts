import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Country from 'App/Models/Country';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class CountriesController {

    public async getById(ctx:HttpContextContract){
        var id = ctx.params.id;
        var result = await Country.query().where('id',id);
        return result;
    }
    public async getAll(ctx:HttpContextContract){
        var query = Country.all();
        var result = await query;
        return result;      
    }
    public async create (ctx : HttpContextContract){
        const newSchema = schema.create({
            name: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var country = new Country();
        country.name = fields.name;
        var result = await country.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var country = await Country.findOrFail(id);
        country.name = fields.name;
        var result = await country.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var country = await Country.findOrFail(id);
            await country.delete();
            return { message: "The country has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
