class CreateExpireVerification < ActiveRecord::Migration
  def change
    execute "DROP PROCEDURE IF EXISTS \`expire_dates\`;"
    execute "
CREATE PROCEDURE \`expire_dates\`()
BEGIN
  DECLARE ad, user INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE ads CURSOR FOR SELECT id, user_id FROM ads where expire_date < CURRENT_TIMESTAMP and (id, user_id) not in (select id_destination, user_id from notifications where notification_type = 2);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN ads;
  loop1: loop
    Fetch ads Into ad, user;
    if done then
      close ads;
      leave loop1;
    end if;
    INSERT INTO notifications(user_id, id_destination, notification_type, created_at, updated_at) VALUES(user, ad, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
  UPDATE ads SET is_active = 0 WHERE id = ad;
  UPDATE users SET counter_ads = counter_ads -1 WHERE id = user;
  END LOOP loop1;
  COMMIT;
END
    "
    execute "DROP EVENT IF EXISTS \`set_expired_ads\`;"
    execute "
CREATE EVENT \`set_expired_ads\`
    ON SCHEDULE EVERY 1 day STARTS (timestamp(current_date) + interval 1 day)
    DO call expire_dates;
    "


  end
end

