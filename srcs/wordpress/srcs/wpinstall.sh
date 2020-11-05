#!/bin/sh

cd /www/wordpress



wp core install --url=wordpress/ --title="BENVENUTO MADONNA MAIALA" --admin_user="mumyer" --admin_password="kraken" --admin_email="mumyer@mum.nl"

:> /tmp/postid
wp term create category Zingarate
wp post create --post_author=Me --post_category="Zingarate" --post-title="Salutano da sinistra a destra il Necchi, Melandri e il conte Mascetti" --post-content="fmlorem ipsum" --post_excerpt=tag --post_status=publish | awk '{gsub(/[.]/, ""); print $4}' > /tmp/postid
wp media import amicimiei.jpeg --title=Amicimiei --post_id=$(cat /tmp/postid) --featured_image


wp user create Perozzi perozzi@example.com --role=editor --user_pass=editor
wp user create Necchi necchi@example.com --role=author --user_pass=author
wp user create Melandri melandri@example.com --role=contributor --user_pass=contributor
wp user create Mascetti mascetti@example.com --role=subscriber --user_pass=subscriber

wp theme install vilva
wp theme activate vilva