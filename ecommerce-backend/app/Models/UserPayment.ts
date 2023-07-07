import { DateTime } from 'luxon'
import { BaseModel, BelongsTo, belongsTo, column } from '@ioc:Adonis/Lucid/Orm'
import Payment from './Payment';
import User from './User';

export default class UserPayment extends BaseModel {
  public static table = 'user_payments';

  @column({ isPrimary: true })
  public id: number

  @column({ serializeAs: 'user_id' })
  public userId: number

  @column({ serializeAs: 'payment_id' })
  public paymentId: number

  @column({ serializeAs: 'payment_type' })
  public paymentType: string

  @column({ serializeAs: 'provider' })
  public provider: string
  
  @column({ serializeAs: 'account_no' })
  public accountNo: number

  @column({ serializeAs: 'expiry' })
  public expiry: DateTime

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @belongsTo(()=>User,{
    foreignKey: 'userId',
  })
  public User: BelongsTo<typeof User>
  
  @belongsTo(()=>Payment,{
    foreignKey: 'paymentId',
  })
  public Payment: BelongsTo<typeof Payment>
}