import { DateTime } from 'luxon'
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Inventory extends BaseModel {

  public static table = 'inventories';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:"quantity"})
  public quantity:string
  
  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}

