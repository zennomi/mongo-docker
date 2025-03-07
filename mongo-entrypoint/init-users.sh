if [ "$MONGO_USERNAME" ] && [ "$MONGO_PASSWORD" ]; then
  "${mongo[@]}" "admin" <<-EOJS
  db.createUser({
     user: $(_js_escape "$MONGO_USERNAME"),
     pwd: $(_js_escape "$MONGO_PASSWORD"),
     roles: [ "root" ]
     })
EOJS
fi

echo ======================================================
echo Created $MONGO_USERNAME in the admin database with root privileges
echo ======================================================