-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3300
-- Generation Time: Jun 09, 2024 at 09:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projektbaza`
--
CREATE DATABASE IF NOT EXISTS `projektbaza` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci;
USE `projektbaza`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ime` varchar(32) NOT NULL,
  `prezime` varchar(32) CHARACTER SET ucs2 COLLATE ucs2_croatian_ci NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `prava` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ime`, `prezime`, `username`, `password`, `prava`) VALUES
(1, 'Nikola', 'Vickov', 'nvickov', '$2y$10$H.bh6teaUaQsB9T5MAzwROaApg2/tJ8N5hFdqQmf5cAfcQlE0719W', 1),
(2, 'Pero', 'Perić', 'pperic', '$2y$10$xyA3q5Y2Iazbp8vNu8/JO.o55Vk7h55q8K2KrBIhGaTGd7M0vQl2y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_croatian_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `date`, `title`, `about`, `content`, `picture`, `category`) VALUES
(1, '2024-06-08', 'Makhachev obranio titulu!', 'Na UFC 302 priredbi Islam Makhachev pobjedom protiv Dustina Poriera je obranio titulu prvaka u lakoj kategoriji!', 'Islam Makhachev impresivno je nadmašio Dustina Poriera u njihovom nedavnom susretu, dokazavši svoju dominaciju u Octagonu. Njegov uspjeh nije samo rezultat fizičke snage, već i inteligentne strategije i nepokolebljive odlučnosti. Ovaj talentirani borac iz Dagestana demonstrirao je svoju vrhunsku tehniku i izvanrednu kondiciju tijekom cijele borbe. Njegova pobjeda nad Porierom ne samo što potvrđuje njegovu poziciju kao buduću zvijezdu UFC-a, već i otvara vrata novim prilikama i izazovima u svjetskoj lakoj kategoriji. Islam Makhachev sada stoji kao ozbiljan konkurent u diviziji, spremno čekajući sljedeći izazov koji će mu biti postavljen.', 'islam302.jpg', 'sport'),
(2, '2024-06-08', 'Slovenski parlament odobrio priznanje Palestine', 'Slovenski parlament odobrio je danas priznanje nezavisne palestinske države, odbacivši zahtjev glavne opozicijske stranke da se o tome održi referendum.', 'Do izglasavanja je došlo nakon što je slovenska vlada prošli tjedan odlučila slijediti Španjolsku, Irsku i Norvešku i priznati Palestinu kao nezavisnu, suverenu državu, u sklopu nastojanja da se zaustavi izraelska ofenziva u Pojasu Gaze.\r\n\r\nPredstavljajući odluku Ljubljane kao \"poruku mira\", premijer Robert Golob rekao je da je to važan korak i preduvjet za pregovore o rješenju o dvije države.\r\n\r\nVladajća koalicija ima većinu u parlamentu od 90 mjesta. Dokument o priznanju palestinske države odobrila su 52 zastupnika, s jednim suzdržanim i bez glasova protiv, a predstavnici opozicije napustili su sjednicu.\r\n\r\nViše od 140 zemalja članica Ujedinjenih naroda priznaje Palestinu\r\n\r\nIrska, Norveška i Španjolska su prošli tjedan službeno priznale neovisnu Palestinu.\r\n\r\nŠvedska je taj potez napravila prije deset godina.\r\n\r\nSvi ti potezi ojačali su palestinsko pitanje u svijetu, no razgnjevili su Izrael.', 'palestine.jpg', 'politika'),
(3, '2024-06-08', 'Oproštaj nakon 12 godina', 'Reus odigrao posljednju domaću utakmicu za Borussiju, pa počastio pivom cijeli stadion', 'Marco Reus, omiljeni nogometaš Borussije Dortmund, u subotu  je pivom častio sve gledatelje svoje oproštajne utakmice u Bundesligi.\r\n\r\n“Sve sam unaprijed isplanirao i sve je ispalo savršeno, neizmjerno sam zahvalan za svu ljubav koju su mi navijači ukazali”, rekao je Reus nakon što je zabavio i počastio više od 80.000 ljudi na Borussijinom stadionu.\r\n\r\nDa sve bude kao u priči, na terenu se pobrinuo i sam Reus, koji je u 4-0 pobjedi Dortmunda nad Darmstadtom zabio gol i imao jednu asistenciju. Nakon utakmice klub je na Instagramu objavio fotografiju Reusove poruke navijačima koja je glasila: “Hvala vam na svemu, oproštajno pivo na moj račun.” Nije objavljeno koliki je račun za tu čast.\r\n\r\nReus (34) ovo ljeto napušta Borussiju Dortmund nakon 12 godina provedenih u klubu, ali neće odmah objesiti kopačke o klin jer će karijeru nastaviti u klubu čije ime još nije objavljeno. Za Borussiju je odigrao 428 utakmica i postigao 170 golova.', 'reus.jpg', 'sport'),
(4, '2024-06-08', 'Mbappe službeno u Realu: Sretan sam što sam dio kluba svojih snova', 'Europski i španjolski nogometni prvak Real Madrid doveo je u ponedjeljak francuskog napadača Kyliana Mbappéa (25) i potpisao s njim ugovor na pet godina.', '- Real Madrid i Mbappe postigli su sporazum prema kojem će idućih pet sezona biti naš igrač, kratko je priopćio Kraljevski klub.\r\n\r\n Jako sam sretan i ponosan što sam dio kluba svojih snova, objavio je igrač na društvenim mrežama.\r\n\r\nMbappe je dosad igrao za francuski PSG, a ugovor mu je istjecao 30. lipnja. Osvojio je sedam naslova prvaka Francuske, četiri francuska Kupa, tri Superkupa i dva Liga kupa. No tijekom sedam sezona provedenih u Ligi prvaka nije uspio doći do pehara tog natjecanja.\r\n\r\nReal Madrid je u nedjelju proslavio osvajanje Lige prvaka do koje je došao pobjedom od 2-0 nad Borussijom.\r\n\r\nMbappe, koji je s Francuskom osvojio Svjetsko prvenstvo 2018., prvo je pojačanje španjolskog prvaka uoči nadolazeće sezone.\r\n\r\nKapetan francuske reprezentacije je ove sezone zabio 44 gola za PSG u 48 utakmica, a upisao je i deset asistencija.', 'mbappe.jpg', 'sport'),
(5, '2024-06-08', 'Đoković odustao od Roland Garrosa, Sinner novi broj jedan', 'Srbin Novak Đoković povukao se s Roland Garrosa, objavili su danas organizatori na društvenim mrežama.', 'Povlačenje je slijedilo nakon dva maratonska meča, najprije protiv Lorenza Musettija, kojeg je dobio nakon 3 sati u noći i pet setova, a onda nakon preokreta protiv argentinskog tenisača Cerundola, kojeg je također dobio u pet setova.\r\n\r\nTijekom drugog seta meča protiv Cerundola ozlijedio se srpski tenisač, osvajač rekordna 24 Grand Slam naslova u karijeri. \r\n\r\nDan poslije Đoković je obavio magnetsku rezonanciju koja je pokazala ozbiljniju ozljedu desnog koljena, a određeni mediji navode da je došlo i do oštećenja meniskusa.\r\n\r\nĐoković je tako odlučio napustiti Pariz, a još nije poznato koliku će stanku imati zbog ove ozljede i jesu li sada ugroženi njegovi dolasci u Wimbledon te na Olimpijske igre u Pariz.\r\n\r\nOvakvim raspletom, Talijan Jannik Sinner je siguran broj 1 od sljedećeg tjedna s obzirom na to da Đoković neće obraniti titulu od prošle godine, a Casper Ruud, s kojim je Đoković trebao igrati u četvrtfinalu, time je postao prvi polufinalist ovogodišnjeg izdanja Roland Garrosa.\r\n\r\nTakođer, ovo će biti prvi Roland Garros od 2015. koji nisu osvojili ni Đoković ni Rafael Nadal (tada je slavio Wawrinka), a finale u Parizu prvi put neće imati nekog od velike trojke svjetskog tenisa (Federer, Đoković, Nadal) od 2004., kada je Gaston Gaudio slavio nad Guillermom Coriom.', 'djokovic.jpg', 'sport'),
(6, '2024-06-08', 'Izbori za EU parlament u Hrvatskoj: Za 12 mjesta se natječe 25 lista', 'Za dvanaest mjesta u Europskom parlamentu u Hrvatskoj se natječe 25 lista, 23 stranačke i dvije nezavisne liste, s ukupno 300 kandidata', 'Počeli su izbori za Europski parlament (EP). Europski izbori održavaju se od 6. do 9. ovog mjeseca. Po broju glasača, to je druga najveća vježba demokracije u svijetu, nakon izbora u Indiji. U 27 članica Europske unije oko 370 milijuna Europljana može birati 720 zastupnika za 10. saziv Europskog parlamenta, koji će u sljedećih pet godina zajedno s vladama država članica oblikovati politiku EU. Posljednja svoja birališta u nedjelju u 23 sata zatvara Italija, prva ih je danas u 7.30 otvorila Nizozemska.\r\n\r\nDanas glasuju u Irskoj i Češkoj, sutra na Malti, u Latviji, Slovačkoj, a počinje i dvodnevno glasovanje u Italiji. Ostalih 20 država EU članica, među kojima je i Hrvatska, izbore provodi u nedjelju.\r\n\r\nPRVO POLUVRIJEME\r\nZa 12 mjesta u Europskom parlamentu u Hrvatskoj se natječe 25 lista, 23 stranačke i dvije nezavisne liste, s ukupno 300 kandidata. Prema svim anketama, najviše mandata osvaja lista HDZ-a.\r\n\r\n\r\nPredsjednik Vlade i HDZ-a Andrej Plenković pozvao je građane s predizbornog skupa u Rijeci da u nedjelju podrže na europskim izborima listu HDZ-a koja je, naglasio je, najsnažnija i najbolja, stoga očekuje i novu pobjedu jer bi, kazao je, “svaki drugi rezultat osim naše pobjede bio nepravda”.\r\n\r\nNaglasio je da su parlamentarni izbori bili prvo poluvrijeme, a da su EU izbori drugo. Vladajuća stranka ide na europske izbore pod sloganom “Snažna i važna”, a kandidacijsku listu predvodi sam predsjednik stranke i premijer Plenković.\r\n\r\n“Nakon 11 godina članstva u EU i osam godina upravljanja Hrvatskom, jedino HDZ ima naslov i argument da kaže: Hrvatska - snažna i važna”, istaknuo je Plenković te nabrojao postignuća Vlade koju vodi i u trećem mandatu (rast plaća, mirovina, infrastrukturni projekti, nošenje s krizama i dr).\r\n\r\nPrema velikom istraživanju STARTmetar Demoskop, bitka za zastupnička mjesta Hrvatske u EP-u vodi se između sedam lista, dok ostalih 18 nema gotovo nikakvih šansi. Radi se o nezavisnoj anketi koja je jedina točno prognozirala svih pet izbornih lista koje su na prošlim europskim izborima u Hrvatskoj 2019. ušle u Europski parlament.\r\n\r\nOva neovisna projekcija temelji se na istraživanju javnog mnijenja kombiniranom s uglavnom egzaktnim kretanjima na brojnim društvenim mrežama.\r\n\r\nPo STARTmetar projekciji u EP ući će šest stranaka/koalicija, to su HDZ (najmanje pet mandata), SDP (tri mandata) i po jedan mandat Možemo, Domovinski pokret, Pravo i pravda Mislava Kolakušića i IDS/Liberali.\r\n\r\nMeđutim, s obzirom na to da su mnogi na rubu izbornog praga od pet posto, s malim razlikama jednih u odnosu na druge, moguće je i da će proći samo četiri opcije, netko će biti luzer, ističu iz STARTmetra.\r\n\r\nDevet mandata je sigurno, za ostala tri bore se Ivan Penava (DP), Kolakušić (Pravo i pravda), Valter Flego (IDS/Liberali) i Božo Petrov (Most). Birači su podijeljeni u tri velika bloka - HDZ, lijevi blok te suverenistički, navode u priopćenju.\r\n\r\nAko se pita zagrebačke političke analitičare, izbori članova za EP iz Hrvatske, kako tvrde, kao nikad ranije postaju “anketom popularnosti nove vladajuće koalicije i oporbe”.\r\n\r\nPolitičari u lovu na birače već danima kruže po državi. Uvjeravaju građane zbog čega baš njima trebaju iskazati povjerenje, tvrde da će ih najbolje zastupati.\r\n\r\nNajjača oporbena stranka SDP s koalicijskim partnerima svoju kampanju za europske izbore vodi pod sloganom “Radimo za hrvatske ljude”.\r\n\r\nStranka Možemo! promovira svoj program od 10 točaka. Iz DP-a naglašavaju ključne točke: zaštita nacionalnih interesa, obuzdavanje migrantskih politika. Most vodi kampanju pod sloganom “Osloni se na naše”, a pokrenuli su i peticiju “Vratimo EU kršćanskim korijenima” itd.', 'eu_parlament.jpg', 'politika'),
(7, '2024-06-08', 'Nayib Bukele ponovno izabran za predsjednika Salvadora', 'Do sada objavljeni rezultati izbora pokazuju da je sadašnji predsjednik Salvadora Nayib Bukele zabilježio uvjerljivu pobjedu, što ukazuje da bi mogao biti ponovno izabran za drugi mandat.', 'Bukeleova administracija suzbila je nasilje bandi u Salvadoru i ušla u povijest usvajanjem bitcoina kao zakonskog sredstva plaćanja u zemlji.\r\n\r\nU objavi na X-u, Bukele se proglasio pobjednikom predsjedničkih izbora koji su održani 4. veljače 2024. Prema objavi, Bukeleova politička stranka, Nuevas Ideas (Nove ideje), pobijedila je s više od 85 posto glasova.\r\n\r\nNaknadna su izvješća ponovno potvrdila njegovu najavu, s malim odstupanjima u postocima. Prema Guardianu, Bukele je osvojio 83 posto glasova.\r\n\r\nU međuvremenu, preliminarni rezultati od 31,49 posto glasova koje je posljednji put ažurirao Tribunal Supremo Electoral (TSE), najviše izborno tijelo Salvadora, pokazuju da je Nuevas Ideas vodio u glasovima s gotovo 1,3 milijuna. Dvije glavne oporbene stranke, Nacionalni oslobodilački front Farabundo Martí (FMLN) i Nacionalistički republikanski savez (ARENA), imale su 110.244 odnosno 96.700 glasova.\r\n\r\nBukele je prvi put otkrio planove da se kandidira za reizbor 2022., čak i kada je ustav Salvadora zabranjivao predsjednicima da imaju dva uzastopna mandata. Međutim, presuda Vrhovnog suda iz 2021. dopustila je sadašnjem predsjedniku da se natječe za drugi mandat.\r\n\r\nOtkako je postao predsjednik Salvadora 2019., Bukele je uživao visoko odobravanje javnosti. Jedno od njegovih glavnih postignuća je slamanje nasilja bandi u zemlji, pri čemu vlasti provode masovna uhićenja, posljedično smanjujući stopu kriminala i nasilja.\r\n\r\nBukele je također poznat kao jedan od najglasnijih pristaša bitcoina. 2021. godine Salvador je postao prva zemlja u svijetu koja je usvojila bitcoin kao zakonsko sredstvo plaćanja, što su kritizirala međunarodna tijela poput Međunarodnog monetarnog fonda (MMF).\r\n\r\nOd tada, predsjednik Salvadora akumulira bitcoin u ime zemlje. Prema web stranici pod nazivom Nayib Tracker, zaliha zemlje od 2825 bitcoina trenutno se procjenjuje na preko 121 milijuna dolara.\r\n\r\nOsim kupnje bitcoina, Bukele je također uveo neke inicijative kao što su vulkanske obveznice, zajedno s planovima za uspostavu Bitcoin Cityja.\r\n\r\nAko se Bukele službeno potvrdi kao pobjednik trenutnih predsjedničkih izbora, njegova će administracija nastaviti napredovati sa svojim bitcoin planovima, prema Felixu Ulloi, potpredsjedniku Salvadora, koji uključuje planirano pokretanje obveznica podržanih bitcoinom u prvom tromjesečju 2024.', 'bukele.jpg', 'politika'),
(8, '2024-06-08', 'Ma kakve su vam to teme?', 'Plenković sazvao novinare pa se malo durio jer su postavljali pitanja', 'Šef HDZ-a i Vlade Andrej Plenković održao je završnu konferenciju za novinare uoči izbora za Europski parlament. Na presici su osim njega bili i kandidati s izborne liste HDZ-a. Plenković je pozvao građane da izađu na izbore u nedjelju i daju glas onima za koje smatraju da će ih najbolje predstavljati. Dodao je kako smatra da je HDZ-ova lista upravo ona s najboljim kandidatkinjama i kandidatima.\r\n\r\n“Vlada je, kada je riječ o EU postignućima, ostvarila najveće strateške interese za RH. Godine 2016. smo rekli da želimo dublju integraciju Hrvatske u EU. Ušli smo u šengenski prostor, europodručje, europski stabilizacijski mehanizam, izborili se za 25 milijardi eura za razvoj Hrvatske”, kazao je pa počeo nabrajati sve uspjehe Vlade.\r\n\r\nNa temelju njih, kazao je, HDZ je formirao program za EU izbore. “Imali smo sastanak s predsjednicom Matice umirovljenika Hrvatske, gledali podatke o nezaposlenosti i zaposlenosti. Danas smo u poziciji da nikada više u Hrvatskoj zaposlenih nije bilo, a da je nezaposlenih oko 88 tisuća ljudi, najmanje ikad”, kazao je te govorio o tome koliko su plaće i mirovine rasle za vrijeme njegovih mandata te koji su daljnji planovi za njihov rast.\r\n\r\n‘Očekujem pobjednički rezultat’\r\nPlenković je kazao kako su svi izbori važni te ustvrdio kako želi da na ovim EU izborima sudjeluje što više građana. “Da bi ljudi mogli biti učinkoviti gore, moraju biti u tijesnoj suradnji s našom Vladom, resorima, znati što Hrvatska želi. Zato je razlika između ove liste i svih drugih lista ogromna u smislu kvalitete ljudi, jasnoće programa i velikih europskih postignuća. Zato smo rekli ‘Hrvatska snažna i važna’ jer ta poruka utjelovljuje utjecaj Hrvatske na međunarodnoj razini koji nikad nije bio ovako snažan”, kazao je, pritom spomenuvši kako Vlada ulaže i napore po pitanju situacije u BiH.\r\n\r\nTvrdi i da se HDZ jako potrudio oko kampanje te da je obišao brojne krajeve Hrvatske, pohvalivši se i dolaskom Ursule von der Leyen na nekakav miting u Splitu. Istaknuo je da je stranka zadovoljna kampanjom i ozračjem na terenu te da bi volio da izlaznost bude veća nego zadnji put.\r\n\r\nPlenković nije htio spekulirati o tome kolika će biti izlaznost, već je samo kazao kako se nada da će biti veća nego posljednji kada je iznosila oko 30 posto. “Teško da će biti tako velika kao na parlamentarnim izborima, međutim to nije do nas, učinili smo sve što smo mogli. Koliko su naši sugrađani svjesni da se ovi izbori održavaju nije isključivo do nas. Naš je napor da učinimo izbore vidljivima bio maksimalan. Očekujem pobjednički rezultat, ne bih spekulirao o broju mandata”, kazao je.\r\n\r\nO odnosu Dabre i Dekanića\r\nNa pitanje o izboru novih sudaca Ustavnog suda, šef HDZ-a je kazao kako je to za njega zasad ne-tema. “Došao sam na press o kampanji za EU parlament, imamo još šest mjeseci za to pa budemo o tome. Te teme mi nisu prioritet. Fokusiram se na ono što je sada bitno, ustavne suce možemo birati do sredine prosinca. To u hijerarhizaciji mojih prioriteta apsolutno je nebitna tema u petak popodne u kampanji koja završava u ponoć. Ovo je javnosti vjerojatno puno zanimljivije nego nešto što će biti u prosincu”, kazao je.\r\n\r\nPlenković je ustvrdio i kako mu nije dosadilo biti u kampanjama, s obzirom na to da su nakon parlamentarnih uslijedili izbori za EU parlament. “Ovo je posao koji podrazumijeva ritam da se često rano dižete, ranije nego vaši politički protivnici, idete kasno leći jer ste imali puno posla taj dan koji drugi nisu odradili. Bio mi je gušt nastaviti ovu kampanju koja za mene traje punih šest mjeseci, ali smo stalno na terenu”, dodao je.\r\n\r\nNovinari su ga pitali i je li normalno da ministar poljoprivrede Josip Dabro nije obavijestio HDZ-ovog župana Damira Dekanića da će doći na teren u Vukovarsko-srijemskoj županiji nakon nevremena i znači li to da su odnosi poljuljani. “Bio sam u kontaktu s ministrom i županom. Dobro je da je ministar bio tamo, da je župan proglasio elementarnu nepogodu, Vlada će pomoći. Odnosi su dobri, a i taj ministar je bio u HDZ-u”, kazao je. Inače, Dabro je na posljednjim lokalnim izborima bio protukandidat Dekaniću za vukovarsko-srijemskog župana.\r\n\r\n‘Milanović je kršitelj Ustava’\r\nPlenković se ponovno osvrnuo na izdavanje trezorskih zapisa ustvrdivši kako se preko te teme lakonski prešlo. “Odaziv je bio ogroman. Ministarstvo financija je od građana pribavilo 825 milijuna eura, skoro u potpunosti iznos koji se planirao, a pritom smo u kratkom prozorčiću za upis trezorskih zapisa za institucionalne investitore u sekundi pribavili još 180-190 milijuna eura, tako da smo ukupno izdali milijardu i dvadeset i pet milijuna eura. Institucionalni investitori su ponudili više od milijardu i četrdeset milijuna eura da ulažu u vrijednosne papire države. To mi je bolja poruka nego ona od agencija za kreditni rejting”, kazao je.\r\n\r\nNovinari su Plenkovića pitali koji je njegov stav oko kampanje Domovinskog pokreta za EU parlament s obzirom na to da su ga prije nazivali “briselskim ćatom”. “Te bezobrazne sve izjave vam je izmislio Milanović, najveći neradnik na hrvatskoj političkoj sceni, najveći kršitelj Ustava, čovjek koji je anihilirao kredibilitet institucije predsjednika, a još gori su njegovi jataci iz SDP-a.\r\n\r\nTa teza o briselskim pisarima najbolje utjelovljuje realnost. Kada pitate dugogodišnje europarlamentarce iz SDP-a bi li se vratili u Hrvatsku i vodili SDP, jesu se odazvali? Je li se itko od tih ljudi vratio i došao u Hrvatsku raditi za manju plaću? Nikad. Kad su ih zvali da budu predsjednici SDP-a, možda bi i ne bi, ali iz Bruxellesa. To su stupidne teze oporbe predvođene kršiteljem Ustava i mogu biti zabavne onima koji ništa ne znaju ili mrze, a takvih ima dosta. Onda valjda nitko od njih ne želi biti gore”, kazao je zaboravivši se prisjetiti činjenice da je upravo HDZ davnih dana baš Milanovića prozvao briselskim ćatom.\r\n\r\n‘Kakve su vam to teme?’\r\nPremijer nije htio reći tko će biti HDZ-ov kandidat za predsjedničke izbore, ali je odgovorio novinarima priča li uopće sa šefom DP-a Ivanom Penavom i njegovim zamjenikom Marijom Radićem. “Kakve su vam to teme? Imate Cro Demoskop? Što pita Cro Demoskop? Ne mogu gledati, bit ću u Makarskoj na ragbiju i WTA turniru. Sinoć smo se čuli. Je li neki problem? Djeluje kao da ne razgovaramo? Naravno da se sastajemo, imamo uži kabinet, Vladu, trojicu ministara DP-a koji su s nama.\r\n\r\nAko mislite na formalni koalicijski sastanak, tradicionalni utorak, toga nije bilo jer su svi u kampanji. To ne znači da ne razgovaramo s nekima telefonima. Čujem se i s drugima telefonski. Ne moramo se fizički sastati. Nisam primijetio da je bio toliki interes za te sastanke. Ponedjeljkom smo u HDZ-u, utorak koalicija, srijeda uži kabinet, četvrtak Vlada, i moj najmanji sin zna kad mi je koji dan što”, kazao je Plenković te još jednom pozvao ljude da u nedjelju izađu na izbore.', 'AP.jpg', 'politika'),
(26, '2024-06-09', '‘Nestvarno mi je da je Jurić odabrao Hajduk, znam kakve je ponude imao', '\"On može odvesti klub u drugu dimenziju\"\r\nTomislav Erceg godinama je pomno u Italiji pratio rad trenera koji će vrlo vjerojatno predvoditi Bijele', 'Prije nekoliko godina pričali smo sa Stjepanom Tomasom, koji je u to vrijeme obilazio talijanske nogometne klubove s idejom da od iskusnijih i priznatijih trenera nešto nauči. Tako ga je put odveo do Torina, gdje je pogledao nekoliko treninga koje je predvodio Ivan Jurić.\r\n\r\n- Bio sam oduševljen sa svime što sam vidio. Pričamo o treninzima koji su svi trajali više od dva sata, što je kad sezona traje jako puno. Bili su to vrlo intenzivni treninzi, “dimilo” se na sve strane, ali bili su i jako sadržajni, dinamični, s pregršt specifičnih nogometnih stvari. Na prvom sam se treningu zapitao je li to možda previše naporno za igrače, ali na kraju treninga morao sam sam sebe demantirati. Igrači su nakon dva sata i dalje jurili punom snagom, jasno ostavljajući dojam kako ne žele da trening završi. Ostao sam fasciniran - ispričao je Stjepan Tomas, koji je nedavno i u talijanskim medijima prokomentirao Jurićevu trenersku klasu.\r\n\r\n- Uvjeren sam da je Ivan Jurić kalibar za najveće europske klubove.\r\n\r\nNogometni menadžer Tomislav Erceg poznaje Ivana Jurića još od njegovih igračkih početaka u Hajduku. Kako je Erceg menadžer koji već godinama puno boravi i radi u Italiji, naravno da o Jurićevom trenerskom radu zna gotovo sve.\r\n\r\nZa klub će se i potući\r\nIstaknuo je sljedeće...\r\n\r\n- Jurić je bio istinski učenik Gian Piera Gasperinija, koji već osam godina sjajno vodi Atalantu. Prvi pravi posao bila mu je Verona, još 2019. Tamo je doveden s idejom da pokuša izboriti ostanak u ligi, a momčad je na kraju sezone završila na 9. mjestu. Jurić je u toj sezoni promovirao niz mladih igrača na kojima je Verona kasnije i sjajno zaradila. U drugoj je sezoni s Veronom završio 10., što je ponovno bio sjajan rezultat i signal mnogim klubovima da ga pokušaju dovesti.\r\n\r\nIzabrao je Torino?\r\n\r\n- Torino je sezonu uoči Jurićevog dolaska jedva ostao u ligi. S Jurićem je dva puta bio 10., a jednom 9. I u Torinu je Jurić lansirao nekoliko mladih igrača na kojima je klub sjajno zaradio. Torino je napustio zato što više nije imao volje raditi u klubu čija ambicija nije bila na razini njegove. Borba za sredinu ljestvice nije ga zanimala.\r\n\r\nZnamo da je imao nekoliko ponuda na stolu čim je obznanio da će napustiti Torino?\r\n\r\n- Zvalo ga je nekoliko klubova iz Italije i Francuske, te iz još nekih liga, ali sve je to odbio. Jurić je veliki emotivac, trener koji kad radi kompletnog sebe daje na terenu i daje za klub. Vidjeli smo jedan video kako se svađao i skoro potukao s Torinovim direktorom Davideom Vagnatijem, ali oni su i danas odlični prijatelji. Jurić će u svakom trenutku napraviti sve što je potrebno za dobrobit kluba, pa i potući se. Međutim, Vagnati je kao i svi ljudi u Torinu uvijek bio svjestan te energije i odgovornosti koju Jurić ima,te ga je toliko cijenio.\r\n\r\nJurić je poznat kao trener čelične discipline i iznimno zahtjevnih treninga?\r\n\r\n- Jurić priznaje samo 100-postotnu disciplinu u svlačionici. Ne zanima ga kako se tko zove i kakve ima navike jer on je trener i sve što se događa na terenu i u svlačionici bit će po njegovom. Jedno ipak ne treba brkati - Jurić nije nikakav tiranin. Dapače, Jurića igrači jako vole i cijene, te poštuju njegove stavove jer znaju da je iznimno pošten trener koji svakome u lice kaže ono što misli. Igrač je s njim uvijek na čistu, ne treba se bojati zakulisnih igara ili toga da će mu nešto obećati pa ga prevariti ili da će forsirati nekoga tko to ne zaslužuje.\r\n\r\nSpecifičan sustav\r\nZnamo da stalno igra u sustavu 3-5-2 ili 3-4-3?\r\n\r\n- Tako to možda ispada, ali Jurićev je sustav specifičan. On je trener koji od svojih igrača svih 90 minuta traži presing po cijelom terenu, odnosno individualno pokrivanje igrača za kojeg je već tko zadužen. To je vrlo zahtjevan način igre u kojem nema prostora za bilo čiju nedisciplinu ili neizvršavanje onoga što mu je Jurić rekao. Takav način igre provode Gasperini, Conte... Nema ih puno.\r\n\r\nMogu li Hajdukovi igrači igrati na takav način? Pun njih ima vrlo upitne tjelesne kapacitete za takve izvedbe?\r\n\r\n- Jurić nije ni tiranin ni isključiv čovjek. U Veroni je radio dvije godine, u Torinu tri, a u oba je kluba imao ponude da potpiše novi ugovor. Jurić ima svoju viziju, svoje principe, ali dobro zna koliko će i na koji način opteretiti momčad. Ne dvojim da mu je jasno da Hajdukovi igrači ne mogu odmah trčati kao Torinovi. No, Hajdukovi igrači moraju biti spremni na pripreme koje će za njih biti paklene, na kojima će biti i povraćanja od napornih treninga. Oni koji to neće htjeti pratiti, teško se mogu ičemu nadati. Oni koji će htjeti, a neće moći, također će imati problema, ali s napornim radom će se nametnuti.\r\n\r\nNestvarna opcija\r\nJurić je trenirao Nikolu Kalinića u Veroni. Kako je to izgledalo?\r\n\r\n- Kalinić je tada već ušao u laganije veteranske godine i nije mu bilo lako izdržati nametnuti ritam. To što je bio Hajdukov igrač nije mu donijelo baš nikakav popust jer kod Jurića popusti ne postoje. Imao je Nikola dosta problema s ozljedama, pa je propustio veliki dio sezone. No, u toj je sezoni dobro upoznao Jurića, iznimno ga cijeni i zato ga je doveo u Hajduk.\r\n\r\nJeste li vjerovali da bi Jurić mogao završiti u Hajduku?\r\n\r\n- Ne vjerujem ni da je Nikola Kalinić mislio da je to moguće. Meni njegov pristanak da dođe na Poljud još uvijek zvuči nestvarno jer dobro znam kakve je ponude imao. Hajduk je u njemu - ako ga NO potvrdi - dobio nevjerojatno puno, nisu još u klubu ni svjesni koliko. Jurić postavlja standarde koje moraju slijediti svi u klubu, ne samo igrači. Jurić je taj koji svojim radom, odnosom i znanjem može odvesti Hajduk na potpuno novu dimenziju.', 'juric.jpg', 'sport'),
(27, '2024-06-09', 'Modrić treći najstariji igrač na Euru, listu veterana predvode dva poznata lica', 'Neuništivi Vatreni će 9. rujna obilježiti već 39. godišnjicu svojeg rođenja', 'Craig Gordon mogao je biti najstariji putnik na Euro, no 41-godišnjeg vratara Heartsa, rođenog 31. prosinca 1982. godine, njegov je izbornik Steve Clarke ipak izbacio s popisa Škotske. Tako će dvojicu najstarijih nogometaša na Europskom prvenstvu imati subotnji hrvatski suparnik Portugal. Najstariji je stoper Pepe, on je 26. veljače proslavio 41. rođendan, a na drugom mjestu je Cristiano Ronaldo. On je rođen 5. veljače 1985. godine.\r\n\r\nJoš su dvojica putnika na Euro rođeni te 1985., a jedan od njih je hrvatski kapetan Luka Modrić. Neuništivi Vatreni će 9. rujna obilježiti već 39. godišnjicu svojeg rođenja. Nakon Modrića, četvrti najstariji je Jesus Navas, s čijom će Španjolskom Modrić i suigrači zaigrati sljedeće subote u 1. kolu u skupini Eura.\r\n\r\nNajstariji igrači na Euru u Njemačkoj\r\n1. Pepe 26. veljače 1983.\r\n\r\n2. Cristiano Ronaldo 5. veljače 1985.\r\n\r\n3. Luka Modrić 9. rujna 1985.\r\n\r\n4. Jesus Navas 21. studenoga 1985.\r\n\r\n5. Giorgi Lorija 27. siječnja 1986.\r\n\r\n6. Manuel Neuer 27. ožujka 1986.\r\n\r\n7. Olivier Giroud 30. rujna 1986.\r\n\r\n8. Peter Pekarik 30. listopada 1986.\r\n\r\n9. Kasper Schmeichel 5. studenoga 1986.\r\n\r\n10. Juraj Kucka 26. veljače 1987.', 'modric.jpg', 'sport'),
(28, '2024-06-09', 'Bez mjesta i goleme plaće u EU parlamentu ostaju Kolakušić, Sinčić, Petrov i Ilčić?', 'Evo cijele liste gubitnika...', 'Kako smo već objavili, stigli su rezultati izlaznih anketa koje je objavila Nova TV. Ovo je trenutačni poredak.\r\n\r\nHDZ 33,74% (6 mandata)\r\n\r\nSDP 27,81% (4 mandata)\r\n\r\nDP 8,67% (1 mandat)\r\n\r\nMožemo 5,84% (1 mandat)\r\n\r\n► ISPOD CRTE: U narednim satima moguće su promjene, da netko od gore navedenih stranaka izgubi mandat, a da ga dobije:\r\n\r\nIDS, SDSS i drugi 4,70%\r\n\r\nNina 4,57%\r\n\r\nMost 3,57%\r\n\r\nPodsjećamo, prve službene rezultate DIP objavljuje u 23 sata.\r\n\r\nAko se obistine izlazne ankete onda u EU parlament ne ulaze Kolakušić, Petrov, Sinčić, Ilčić i još desetak jako poznatih Hrvata...\r\n\r\nNa izborima 2019. godine, HDZ i SDP imali su po četiri mandata, a Hrvatski suverenisti, Mislav Kolakušić, Živi zid i Amsterdamska koalicija po jedan. Izabrani zastupnici iz Hrvatske u mandatu od 2019. do 2024. bili su Biljana Borzan (SDP), Romana Jerković (SDP), Predrag Fred Matić (SDP), Tonino Picula (SDP), Sunčana Glavak (HDZ), Karlo Ressler (HDZ), Tomislav Sokol (HDZ), Željana Zovko (HDZ), Valter Flego (IDS), Ladislav Ilčić (HRAST), Mislav Kolakušić (Nezavisni) i Ivan Vilibor Sinčić (Živi zid). ', 'zz.jpg', 'politika'),
(29, '2024-06-09', 'Objavljene izlazne ankete za Njemačku i Austriju: Na pomolu veliki trijumf desnice!?', 'Anketa je pokazala da je FPO na prvome mjestu s 27 posto glasova, slijedi je OVP s 23,5 posto te SPO s 23 posto glasova', 'Krajnje desno orijentirana Slobodarska stranka vjerojatni je pobjednik izbora za Europski parlament u Austriji, pokazala su predviđanja utemeljena na anketi provedenoj za austrijske tv kuće i novinsku agenciju APA-u, a objavljeno je u nedjelju nakon zatvaranja birališta u Austriji.\r\n\r\nAnaliza u Austriji\r\nAnaliza, utemeljena na anketi provedenoj prošli tjedan na 3600 ljudi za nacionalnu radioteleviziju ORF, za Puls 24 TV i agenciju APA-u, pokazala je da je Slobodarska stranka (FPO) na prvome mjestu s 27,0 posto glasova, slijedi je konzervativna Narodna stranka (OVP) s 23,5 posto te Socijaldemokrati (SPO) s 23,0 posto glasova.\r\n\r\nSlijede Zeleni s 10,5 posto te austrijska liberalna stranka NEOS s isto toliko - 10,5 posto.\r\n\r\nMargina pogreške iznosila je 2,5 postotnih bodova.\r\n\r\nScholzova koalicija pala, krajnji desničari napredovali na europskim izborima\r\nU Njemačkoj su sve tri stranke koje čine vladajuću koaliciju kancelara Olafa Scholza pretrpjele gubitke na današnjim europskim izborima, a krajnje desna Alternativa za Njemačku ostvarila je solidan rast, pokazuju izlazne ankete javne televizije ARD.\r\n\r\nMeđu koalicijskim partnerima, najviše su pali Zeleni na 12 posto s 20.5 posto na izborima 2019.\r\n\r\nScholzovi socijaldemokrati su dobili 14 posto glasova u odnosu na 15.8 posto, a Slobodni demokrati su pali s 5.4 posto na 5 posto.\r\n\r\nKonzervativci su kao što se očekivalo najjača stranka s osvojenih 29.5 posto glasova u odnosu na 28.9 posto 2019., a AfD je drugi s osvojenih 16.5 posto prema 11 posto na prethodnim izborima.', 'sholz.jpg', 'politika');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
