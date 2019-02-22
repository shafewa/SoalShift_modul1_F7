# SoalShift_modul1_F7
Laporan Praktikum Modul 1

Nomor 1

Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

Jawab : 

Pertama kita buat dulu file scriptnya pada folder nature yang sudah di ekstrak terlebih dahulu
Di dalam file tersebut berisi script

#!/bin/bash

for x in *.jpg
do
        base64 -d $x | xxd -r > /home/shafewa/Documents/sisop/soal1/jadi/$x
done


lalu di bash,
Fungsi script tersebut untuk mendecode gambar yang tidak bisa dibuka menjadi bisa dibuka kembali dan di simpan di folder jadi

Setelah scriptnya berhasil, lalu buka crontab -e dan di setting seperti berikut

14 14 14 2 * bash /home/shafewa/Documents/sisop/soal1/nature/soal1.sh



Nomor 2

Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa: *Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012. *Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a. *Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
Jawab : 

a.) Ketikkan perintah awk ini di terminal

awk -F ',' '{if($7=="2012") a[$1]+=$10} END {for(x in a)print a[x] ","x}' WA_Sales_Products_2012-14.csv | sort -n | tail -1 | awk -F, '{print $2}'


b.) Ketikkan perintah awk ini di terminal
awk -F ',' '{if(($7=="2012") && ($1=="United States")) a[$4]+=$10} END {for(x in a)print a[x] "," x}' WA_Sales_Products_2012-14.csv | sort -n | tail -3 | awk -F, '{print $2}'

c.) awk -F, '{if($1=="United States" && $7=="2012" && ($4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection")) a[$6]+=$10;} END {for(x in a)print a[x] "," x}' WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2}'

Nomor 3 

Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, kecil, dan angka. File berekstensi .txt dengan syarat disimpan dalam bentuk password1.txt, file selanjutnya tidak boleh sama dengan file sebelumnya dan urutan yang sudah terhapus harus terbuat lagi jika dijalankan, dan pastinya password tidak boleh sama.

Jawab : 

Pertama membuat file scriptnya yang berisi

#!/bin/bash

for ((i=1;i<1000;i++))
do
        if [ ! -f password$i.txt ]
        then
                head /dev/urandom | tr -dc a-zA-Z0-9 | head -c12 > password$i.txt
                break
        fi
done

Script tersebut berfungsi untuk membuat file.txt yang namanya akan terus berbeda dari file sebelumnya.

Hasilnya akan menjadi







Nomor 4

Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14. b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. c. setelah huruf z akan kembali ke huruf a d. Backup file syslog setiap jam. e. dan buatkan juga bash script untuk dekripsinya.
Jawab : 
Buat scriptnya seperti dibawah ini

Lalu buat crontab -e dan tambahkan perintah dibawah ini

dan hasil enskripsinya

Nomor 5

Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
    • Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
    • Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
    • Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
    • Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.









Jawab :

- Pertama buat scriptnya yang berisi

#!/bin/bash

awk /'cron/ || /CRON/,!/sudo/' /var/log/syslog |awk 'NF <13' > /home/shafewa/modul1/sysget.log

- lalu copy file log ke direktori yang sudah dituju di scriptnya yaitu 

/home/shafewa/modul1/sysget.log

lalu hasil recordnya buka file di  /home/shafewa/modul1/



