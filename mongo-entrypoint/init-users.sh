if [ "$MONGO_USERNAME" ] && [ "$MONGO_PASSWORD" ]; then
  "${mongo[@]}" "$MONGO_DATABASE" <<-EOJS
  db.createUser({
     user: $(_js_escape "$MONGO_USERNAME"),
     pwd: $(_js_escape "$MONGO_PASSWORD"),
     roles: [ "readWrite", "dbAdmin" ]
     })
EOJS
fi

echo ======================================================
echo created $MONGO_USERNAME in database $MONGO_DATABASE
echo ======================================================