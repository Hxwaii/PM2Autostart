# Nichts ändern!
echo "🔄 Starte Prozesse aus processes.json ..."



if ! command -v pm2 &> /dev/null; then
  echo "❌ Fehler: pm2 ist nicht installiert. Installiere es mit 'npm install -g pm2'."
  exit 1
fi
if [ ! -f processes.json ]; then
  echo "❌ Fehler: processes.json nicht gefunden!"
  exit 1
fi

pm2 start processes.json
pm2 save
pm2 startup

echo "✅ Prozesse gestartet und Autostart eingerichtet!"
