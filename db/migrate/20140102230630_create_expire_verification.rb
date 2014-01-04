class CreateExpireVerification < ActiveRecord::Migration
  def change
    execute "DROP PROCEDURE IF EXISTS \`expire_dates\`;"
    execute "
CREATE PROCEDURE \`expire_dates\`()
BEGIN
  DECLARE ad, user INT;
  DECLARE done INT DEFAULT FALSE;
  DECLARE ads CURSOR FOR SELECT id, user_id FROM ads where expire_date < CURRENT_TIMESTAMP and (id, user_id) not in (select ad_id, user_id from notification_ads);
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN ads;
  loop1: loop
    Fetch ads Into ad, user;
    if done then
      close ads;
      leave loop1;
    end if;
    INSERT INTO notification_ads(user_id, ad_id, created_at, updated_at) VALUES(user, ad, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
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

