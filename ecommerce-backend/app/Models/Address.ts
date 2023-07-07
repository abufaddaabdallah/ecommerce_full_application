import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import City from './City'

export default class Address extends BaseModel {

  public static table = 'addresses';

  @column({ isPrimary: true })
  public id: number

  @column({ serializeAs: "order_id" })
    public orderId: number

    @column({ serializeAs: "longitude" })
    public longitude: number

    @column({ serializeAs: "latitude" })
    public latitude: number

    @column({ serializeAs: "city" })
    public city: String

    @column({ serializeAs: "country" })
    public country: String

    @column({ serializeAs: "area" })
    public area: String

    @column({ serializeAs: "street" })
    public street: String

    @column({ serializeAs: "building_no" })
    public buildingNo: String
    
  @column({ serializeAs: 'addresses' })
  public addresses: string

  @column({ serializeAs: 'city_id' })
  public cityId: number
  
  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(() => City,{
    foreignKey: 'cityId',
  })
  public City:BelongsTo<typeof City>
}


