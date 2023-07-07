import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, beforeSave, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import UserStatus from './UserStatus';
import Hash from '@ioc:Adonis/Core/Hash'

export default class User extends BaseModel {
  public static table = 'users';
  
  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'first_name'})
  public firstName:string

  @column({serializeAs:'last_name'})
  public lastName:string

  @column({serializeAs:'username'})
  public username:string

  @column({serializeAs:'email'})
  public email:string

  @column({serializeAs:'password'})
  public password:string

  @column()
  public rememberMeToken: string | null

  @column({serializeAs:'user_status_id'})
  public userStatusId:number

  @column({serializeAs:'phone'})
  public phone:string
  
  @column({serializeAs:'location'})
  public location:string

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>UserStatus,{
    foreignKey:'userStatusId',
  })
  public UserStatus: BelongsTo<typeof UserStatus>

  @beforeSave()
  public static async hashPassword (user: User) {
    if (user.$dirty.password) {
      user.password = await Hash.make(user.password)
    }
  }
}