import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import City from 'App/Models/City';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class CitiesController {

    public async getById (ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await City.query().preload('Country').where('id',id);
        return result;
    }

    public async getAll(ctx: HttpContextContract){
        var countryId = ctx.request.input('countryId');
        var query = City.query().preload("Country");
        if(countryId){
            query.where("country_id",countryId);
        }
        var result = await query;
        return result;
    }
    public async create (ctx : HttpContextContract){
        const newSchema = schema.create({
            name: schema.string(),
            country_id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var city = new City();
        city.name = fields.name;
        city.countryId = fields.country_id;
        var result = await city.save();
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            name: schema.string(),
            country_id: schema.number(),
            id: schema.number(),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var city = await City.findOrFail(id);
        city.name = fields.name;
        city.countryId = fields.country_id;
        var result = await city.save();
    }
    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var city = await City.findOrFail(id);
            await city.delete();
            return { message: "The city has been deleted!" };
        } catch (error) {
            return error;
        }
    }
}
