import { DateTime } from 'luxon'
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Discount extends BaseModel {

  public static table = 'discounts';

  @column({ isPrimary: true })
  public id: number

  @column({serializeAs:"name"})
  public name:string

  @column({serializeAs:"description"})
  public description:string
  
  @column({serializeAs:"percent"})
  public percent:number
  
  @column({serializeAs:"active"})
  public active:boolean

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}

