import { DateTime } from 'luxon'
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class UserStatus extends BaseModel {
  public static table = 'user_statuses';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:'status'})
  public status:string
  
  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
