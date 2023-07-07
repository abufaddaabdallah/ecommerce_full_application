import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User';
import { schema, rules } from '@ioc:Adonis/Core/Validator'

export default class UsersController {

    public async getById(ctx: HttpContextContract) {
        var authObject = await ctx.auth.authenticate();
        // var id = ctx.params.id;
        var user = await User.findOrFail(authObject.id);
        // var result = await User.query().where('id', id);
        return user;
    }
    public async getAll(ctx: HttpContextContract) {
        var userStatusId = ctx.request.input('userStatus_id');
        var query = User.query().preload("UserStatus");
        if (userStatusId) {
            query.where('userStatus_id', userStatusId);
        }
        var result = await User.query().preload("UserStatus");
        return result;
    }
    public async login(ctx: HttpContextContract) {
        var object = ctx.request.all();
        var email = object.email;
        var password = object.password;
        // var username = object.username;
        try {
            const token = await ctx.auth.use('api').attempt(email, password);
            // return { message: "error username from login in token brakets" };
            return token;
        } catch {
            return ctx.response.unauthorized('Invalid credentials');
        }
    }
    /**.then(() => {
                var result = User.query().where('username', username);
                return result;
            }) */
    public async logout(ctx: HttpContextContract) {
        var object = await ctx.auth.authenticate();
        await ctx.auth.logout();
        return { message: "Logout" }
    }
    public async create({ auth, request, response }: HttpContextContract) {
        try {

            const createSchema = schema.create({
                email: schema.string([
                    rules.email(),
                    rules.unique({ table: 'users', column: 'email' })

                ]),
                password: schema.string([
                    rules.minLength(8)
                ]),
                username: schema.string([
                    rules.minLength(2),
                    rules.unique({ table: 'users', column: 'username' })
                ]),
                phone: schema.string([
                    rules.minLength(10),
                    rules.unique({ table: 'users', column: 'phone' })
                ]),

                // first_name: schema.string([
                //     rules.minLength(2)
                // ]),
                // last_name: schema.string([
                //     rules.minLength(2)
                // ]),
            });

            const payload = await request.validate({ schema: createSchema });

            const user = new User();
            try {
                user.username = payload.username;
            } catch (error) {
                return { message: response.badRequest({ message: "username already exits" }) }

            } user.password = payload.password;
            try {
                user.email = payload.email;
            } catch (error) {
                return { message: response.badRequest({ message: "email already exits" }) }

            }
            try {
                user.phone = payload.phone;
            } catch (error) {
                return {
                    message: response.badRequest({ message: "phone already exits" })
                }


            }            // user.firstName = payload.first_name;
            // user.lastName = payload.last_name;
            var newUser = await user.save();
            const token = await auth.use('api').attempt(payload.email, payload.password);
            return token;
        } catch (error) {
            return {
                // message:response.badRequest({error})
                message: response.badRequest({ message: error.toString() })
            };
        }
    }
    async update2({ auth, request, response }: HttpContextContract) {

        try {
            var authObject = await auth.authenticate();

            const createSchema = schema.create({
                email: schema.string([
                    rules.email(),
                ]),
                username: schema.string([
                    rules.minLength(2)
                ]),
                phone: schema.string([
                    rules.minLength(10)
                ])
            });

            const payload = await request.validate({ schema: createSchema });
            const user = await User.findOrFail(authObject.id);
            user.username = payload.username;
            user.email = payload.email;
            if (request.input("password") && request.input("password").toString().length > 0) {
                user.password = request.input("password");
            }
            await user.save();
            return user;
        } catch (ex) {
            console.log(ex);
            return response.badRequest({ message: ex.toString() });
        }
    }
    public async update(ctx: HttpContextContract) {
        try {
            var authObject = await ctx.auth.authenticate();

            const createSchema = schema.create({
                id: schema.number(),
                email: schema.string([
                    rules.email(),
                ]),
                username: schema.string([
                    rules.minLength(2)
                ]),
                phone: schema.string([
                    rules.minLength(10)
                ])
            });
            const fields = await ctx.request.validate({
                schema: createSchema,
            })
            try {
                var id = fields.id;
                var user = await User.findOrFail(id);
                let errorMessage = '';
                try {
                    await User.query()
                        .where('email', fields.email)
                        .whereNot('id', fields.id)
                        .firstOrFail()
                    errorMessage += 'Email address is already in use. '
                } catch (error) { }
                try {
                    await User.query()
                        .where('phone', fields.phone)
                        .whereNot('id', fields.id)
                        .firstOrFail()
                    errorMessage += 'Phone number is already in use.'
                } catch (error) { }
                try {
                    await User.query()
                        .where('username', fields.username)
                        .whereNot('id', fields.id)
                        .firstOrFail()
                    errorMessage += 'User Name is already in use. '
                } catch (error) { }
                if (errorMessage !== '') {
                    return { error: errorMessage }
                }
                user.phone = fields.phone;
                user.email = fields.email;
                user.username = fields.username;
                //user.password = fields.password; 
                // user.address = fields.address; 
                // user.genderId = fields.gender_id; 
                // user.typeId = fields.type_id; 
                //  user.countryId = fields.country_id; 
                // user.cityId = fields.city_id; 
                await user.save();
                return { message: "The user has been updated!" };
            }
            catch (error) {
                return { error: 'User not found' }
            }
        } catch (error) {
            return { error };
        }
    }

    public async destroy(ctx: HttpContextContract) {
        try {
            var id = ctx.params.id;
            var user = await User.findOrFail(id);
            await user.delete();
            return { message: "The user has been deleted!" };
        } catch (error) {
            return error;
        }
    }
    // public async update(ctx: HttpContextContract) {
    //     const newSchema = schema.create({
    //         first_name: schema.string(),
    //         last_name: schema.string(),
    //         username: schema.string(),
    //         email: schema.string(),
    //         password: schema.string(),
    //         user_status_id: schema.number(),
    //         phone: schema.string(),
    //         location: schema.string(),
    //         id: schema.number(),
    //     });
    //     const fields = await ctx.request.validate({ schema: newSchema });
    //     var id = fields.id;
    //     var user = await User.findOrFail(id);
    //     user.firstName = fields.first_name;
    //     user.lastName = fields.last_name;
    //     user.username = fields.username;
    //     user.email = fields.email;
    //     user.password = fields.password;
    //     user.userStatusId = fields.user_status_id;
    //     user.phone = fields.phone;
    //     user.location = fields.location;
    //     var result = await user.save();
    //     return result;
    // }


}
