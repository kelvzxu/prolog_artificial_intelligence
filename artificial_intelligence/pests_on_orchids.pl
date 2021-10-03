start:-
    init,
	data_pengamatan,
    aturan(Number,Reason),
    answer(Reason,Response),
    write(Response),nl,
    write('Aturan yang dipakai adalah '),
    write(Number),nl,nl,
	retractall(observation(_)).
start:-
    write('Maaf, hama tersebut tidak ada dalam database kami.'),nl,nl,retractall(observation(_)).
init:-
    write('Sistem Pakar Identifikasi Jenis Hama Tanaman Anggrek'),nl,
    write('____________________________________________________'),nl,
    write('Author : Kelvin Leonardi Kohsasih'),nl,
    write('NIM    : 2117000015'),nl,
    write('Source : Perancangan Sistem Pakar Identifikasi 
         Penyakit dan Hama Tanaman Anggrek Dengan 
         Metode Certainty Factor'),nl,
    write('____________________________________________________'),nl,
    title(Title),write(Title),nl,nl,
    write_message,nl.
write_message:-
    message(Message),
    write(Message),nl,fail.
write_message:-
    nl.
data_pengamatan:-
    question(Question,Obs),
    write(Question),nl,
    read(Yesno),
    Yesno=y,
    assert(observation(Obs)),
    fail.
data_pengamatan.
title('Process Analyze...').
message('Jawab pertanyaan berikut dengan y atau t').

question('Apakah daun anggrek menjadi keriput?', keriput).
question('Apakah daun atau bunga pada anggrek berguguran?', berguguran).
question('Apakah daun pada anggrek berlubang-lubang?', berlubang).
question('Apakah daun pada anggrek menguning atau berwarna putih keabuan?',keabuan).
question('Apakah daun dan bunga pada anggrek tampak tergerek?', tergerek).
question('Apakah batang pada anggrek menjadi layu atau gundul?',gundul).


aturan(1, ulat):-
    not(observation(keriput)),
    observation(berguguran),
    not(observation(berlubang)),
    not(observation(keabuan)),
    observation(tergerek),
    not(observation(gundul)).
aturan(2, bekicot):-
    not(observation(keriput)),
    not(observation(berguguran)),
    observation(berlubang),
    not(bservation(keabuan)),
    not(observation(tergerek)),
    observation(gundul).
aturan(3, tungau_merah):-
    observation(keriput),
    not(observation(berguguran)),
    not(observation(berlubang)),
    observation(keabuan),
    not(observation(tergerek)),
    not(observation(gundul)).
aturan(4, kutu_putih):-
    not(observation(keriput)),
    not(observation(berguguran)),
    not(observation(berlubang)),
    observation(keabuan),
    not(observation(tergerek)),
    observation(gundul).
aturan(5, kumbang):-
    observation(keriput),
    observation(berguguran),
    not(observation(berlubang)),
    not(observation(keabuan)),
    not(observation(tergerek)),
    observation(gundul).
aturan(6, health):-
    not(observation(keriput)),
    not(observation(berguguran)),
    not(observation(berlubang)),
    not(observation(keabuan)),
    not(observation(tergerek)),
    not(observation(gundul)).

answer(ulat, 'Tanaman Anggrek Anda diserang oleh hama Ulat'). 
answer(bekicot, 'Tanaman Anggrek Anda diserang oleh hama Bekicot'). 
answer(tungau_merah, 'Tanaman Anggrek Anda diserang oleh hama Tungau Merah'). 
answer(kutu_putih, 'Tanaman Anggrek Anda diserang oleh Kutu Putih'). 
answer(kumbang, 'Tanaman Anggrek Anda diserang oleh Kumbang'). 
answer(health, 'Tanaman Anggrek anda tidak diserang hama'). 

