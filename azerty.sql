-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 15 août 2022 à 10:24
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `azerty`
--

-- --------------------------------------------------------

--
-- Structure de la table `charon`
--

CREATE TABLE `charon` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `charon`
--

INSERT INTO `charon` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Charon', 'Pluton', 'charon-62769a08421ad-jpg', 'James W. Christy', '22 juin 1978', 'Charon, officiellement (134340) Pluton I Charon (désignation internationale : (134340) Pluto I (Charon)5, prononcé : /ka.ʁɔ̃/) est le plus grand satellite naturel de Pluton et un objet massif de la ceinture de Kuiper. \r\n\r\nCharon est également dénommé suivant la désignation systématique Pluton I. Son nom complet officiel est donc (134340) Pluton I Charon.');

-- --------------------------------------------------------

--
-- Structure de la table `gazeuse`
--

CREATE TABLE `gazeuse` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superficie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gazeuse`
--

INSERT INTO `gazeuse` (`id`, `nom`, `superficie`, `photo`, `description`) VALUES
(1, 'Jupiter', '61,42 milliards km²', 'Jupiter-62764b2fbe77e-jpg', 'Jupiter est la cinquième planète du Système solaire par ordre d\'éloignement au Soleil, et la plus grande par la taille et la masse devant Saturne, qui est comme elle une planète géante gazeuse. Elle est même plus volumineuse que toutes les autres planètes réunies avec son rayon moyen de 69 911 km, qui vaut environ onze fois celui de la Terre, et sa masse de 1,898 2 × 1027 kg, qui est 318 fois plus grande. Orbitant en moyenne à environ 779 millions de kilomètres du Soleil (5,2 unités astronomiques), sa période de révolution vaut un peu moins de 12 ans. La masse jovienne est par ailleurs une unité utilisée pour exprimer la masse d\'objets substellaires tels que les naines brunes.\r\n\r\nElle a une composition similaire au Soleil, constituée principalement d\'hydrogène mais aussi d\'hélium pour un quart de sa masse et un dixième de son volume. Elle possède probablement un noyau rocheux composé d\'éléments plus lourds mais, comme les autres planètes géantes, Jupiter n\'a pas de surface solide bien définie mais plutôt un vaste manteau d\'hydrogène métallique ; de petites quantités de composés tels que l\'ammoniac, le méthane et l\'eau sont aussi détectables. Elle connaît toujours une contraction continue de son intérieur qui génère une chaleur supérieure à celle reçue du Soleil grâce au mécanisme de Kelvin-Helmholtz. Sa rapide période de rotation estimée à 9 h 55 min implique que la planète prend la forme d\'un ellipsoïde de révolution avec un renflement léger autour de l\'équateur et permet de générer un important champ magnétique donnant naissance à la magnétosphère de Jupiter, la plus puissante du Système solaire. Son atmosphère extérieure est visiblement séparée en plusieurs bandes de couleurs allant du crème au brun à différentes latitudes, avec des turbulences et des tempêtes dont les vents violents atteignent 600 km/h le long de leurs frontières interactives. La Grande Tache rouge, un anticyclone géant de taille comparable à la Terre observé depuis au moins le XVIIe siècle, en est un exemple.'),
(2, 'Saturne', '42,7 milliards km²', 'saturne-62764ca4b7486-jpg', 'Saturne est la sixième planète du Système solaire par ordre d\'éloignement au Soleil, et la deuxième plus grande par la taille et la masse après Jupiter, qui est comme elle une planète géante gazeuse. Son rayon moyen de 58 232 km est environ neuf fois et demi celui de la Terre et sa masse de 568,46 × 1024 kg est 95 fois plus grande. Orbitant en moyenne à environ 1,4 milliard de kilomètres du Soleil (9,5 unités astronomiques), sa période de révolution vaut un peu moins de 30 années tandis que sa période de rotation est estimée à 10 h 33 min.\r\n\r\nLa caractéristique la plus célèbre de la planète est son système d\'anneaux proéminent. Composés principalement de particules de glace et de poussières, ils sont observés pour la première fois en 1610 par Galilée et se seraient formés il y a moins de 100 millions d\'années. Saturne est la planète possédant le plus grand nombre de satellites naturels avec 82 confirmés et des centaines de satellites mineurs dans son cortège. Sa plus grande lune, Titan, est la deuxième plus grande du Système solaire (derrière Ganymède, lune de Jupiter, toutes deux avec un diamètre plus grand que celui de Mercure) et c\'est la seule lune connue à posséder une atmosphère substantielle. Une autre lune remarquable, Encelade, émet de puissants geysers de glace et serait un habitat potentiel pour la vie microbienne.'),
(3, 'Uranus', '8,083 milliards km²', 'uranus-62764e13e09c3-webp', 'Uranus est la septième planète du Système solaire par ordre d\'éloignement au Soleil. Elle orbite autour de celui-ci à une distance d\'environ 19,2 unités astronomiques (2,87 milliards de kilomètres), avec une période de révolution de 84,05 années terrestres. Il s\'agit de la quatrième planète la plus massive du Système solaire et de la troisième plus grande par la taille.\r\n\r\nElle est la première planète découverte à l’époque moderne avec un télescope et non connue depuis l\'Antiquité. Bien qu\'elle soit visible à l’œil nu, son caractère planétaire n\'est alors pas identifié en raison de son très faible éclat et de son déplacement apparent dans le ciel très lent. William Herschel l\'observe pour la première fois le 13 mars 1781 et la confirmation qu\'il s\'agit d\'une planète et non d\'une comète est faite pendant les mois qui suivent.\r\n\r\nComme Jupiter et Saturne, l\'atmosphère d\'Uranus est composée principalement d\'hydrogène et d\'hélium avec des traces d\'hydrocarbures. Cependant, comme Neptune, elle contient une proportion plus élevée de « glaces » au sens physique, c\'est-à-dire de substances volatiles telles que l\'eau, l\'ammoniac et le méthane, tandis que l\'intérieur de la planète est principalement composé de glaces et de roches, d\'où leur nom de « géantes de glaces ». Par ailleurs, le méthane est le principal responsable de la teinte aigue-marine de la planète. Son atmosphère planétaire est la plus froide du Système solaire, avec une température minimale de 49 K (−224 °C) à la tropopause, et présente une structure nuageuse en couches.'),
(4, 'Neptune', '7,618 milliards km²', 'neptune-62764e64ce860-jpg', 'Neptune est la huitième planète par ordre d\'éloignement au Soleil et la plus éloignée connue du Système solaireN 2. Elle orbite autour du Soleil à une distance d\'environ 30,1 au (4,5 milliards de kilomètres), avec une excentricité orbitale moitié moindre que celle de la Terre et une période de révolution de 164,79 ans. Il s\'agit de la troisième planète la plus massive du Système solaire et de la quatrième plus grande par la taille — un peu plus massive mais un peu plus petite qu\'Uranus. Par ailleurs, elle est la planète géante la plus dense.\r\n\r\nN\'étant pas visible à l\'œil nu, Neptune est le premier objet céleste et la seule des huit planètes du Système solaire à avoir été découverte par déduction plutôt que par observation empirique. En effet, l\'astronome français Alexis Bouvard avait noté des perturbations gravitationnelles inexpliquées sur l\'orbite d\'Uranus et conjecturé au début du XIXe siècle qu\'une huitième planète, plus lointaine, pouvait en être la cause. Les astronomes britannique John Couch Adams en 1843 et français Urbain Le Verrier en 1846 calculèrent indépendamment la position prévue de cette hypothétique planète. Grâce aux calculs de ce dernier, elle fut finalement observée pour la première fois le 23 septembre 1846 par l\'astronome prussien Johann Gottfried Galle, à un degré de la position prédite. Bien que Galle ait utilisé les calculs de Le Verrier pour découvrir la planète, la paternité de la découverte entre Adams et Le Verrier fut longtemps disputée. Sa plus grande lune, Triton, est découverte 17 jours plus tard par William Lassell. Depuis 2013, on connaît 14 satellites naturels de Neptune. La planète possède également un système d\'anneaux faible et fragmenté et une magnétosphère.');

-- --------------------------------------------------------

--
-- Structure de la table `jupiter`
--

CREATE TABLE `jupiter` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jupiter`
--

INSERT INTO `jupiter` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Io', 'Jupiter', 'io-62767c028a45e-jpg', 'Galilée', '8 janvier 1610', 'Io, ou Jupiter I, est un satellite naturel de Jupiter. Plus spécifiquement, il s\'agit de la troisième plus grande lune galiléenne et celle ayant l\'orbite la plus proche de la planète Jupiter, possédant un demi-grand axe de 421 800 kilomètres et une période de révolution d\'environ 42 heures. Par ailleurs, elle est la quatrième plus grande lune du Système solaire, la plus dense d\'entre elles et l\'objet astronomique connu contenant la plus faible quantité d\'eau.\r\n\r\nAvec plus de 400 volcans actifs, Io est l\'objet le plus géologiquement actif du Système solaire. Cette activité géologique extrême est le résultat d\'un réchauffement par effet de marée dû au frottement engendré à l\'intérieur de la lune par ses interactions gravitationnelles avec Jupiter et les autres satellites galiléens — notamment Europe et Ganymède avec lesquelles elle est en résonance orbitale. Ces volcans produisent des panaches de soufre et de dioxyde de soufre qui s\'élèvent à plusieurs centaines de kilomètres au-dessus de la surface puis recouvrent les vastes plaines de la lune d\'une couche givrée de matériaux. Les panaches, associés aux coulées de lave pouvant s\'étendre sur plus de 500 km de longueur, produisent de grands changements de surface et la peignent dans diverses nuances de jaune, rouge, blanc, noir et vert. Les matériaux produits par ce volcanisme constituent d\'une part l\'atmosphère mince et inégale de Io, et produisent d\'autre part un grand tore de plasma autour de Jupiter du fait de leur interaction avec la magnétosphère de la planète.'),
(2, 'Europe', 'Jupiter', 'europe-62767c6923b2c-jpg', 'Galilée', '8 janvier 1610', 'Europe, ou Jupiter II, est un satellite naturel de Jupiter. Plus spécifiquement, il s\'agit de la plus petite lune galiléenne et la sixième lune la plus proche de la planète parmi les 79 connues de Jupiter, possédant un demi-grand axe de 671 100 kilomètres et une période de révolution d\'environ 85 heures. Par ailleurs, elle est la sixième plus grande lune du Système solaire avec un diamètre de 3 122 km.\r\n\r\nLégèrement plus petite que la Lune, Europe est principalement constituée de roche silicatée et d\'une croûte de glace d\'eau ainsi que probablement d\'un noyau de fer et de nickel. Elle possède une très mince atmosphère, composée principalement d\'oxygène. Sa surface présente notamment des stries glaciaires et des fissures appelées lineae, mais peu de cratères d\'impact.\r\n\r\nEurope possède la surface la plus lisse de tous les objets célestes connus du Système solaire. Cette surface jeune — d\'un âge estimé à 100 millions d\'années — et sans relief associée à la présence d\'un champ magnétique induit conduit à l\'hypothèse que, malgré une température de surface moyenne de 90 K (−183 °C), elle posséderait un océan d\'eau souterrain d\'une profondeur de l\'ordre de 100 km qui pourrait éventuellement abriter une vie extraterrestre. Le modèle prédominant suggère que le réchauffement par effet de marée dû à son orbite légèrement excentrique — maintenue par sa résonance orbitale avec Io et Ganymède — permet à l\'océan de rester liquide et entraînerait un mouvement de glace similaire à la tectonique des plaques, la première activité de ce type constatée sur un autre objet que la Terre. Du sel observé sur certaines caractéristiques géologiques suggère que l\'océan interagit avec la croûte, fournissant également une source d\'indices pour déterminer si Europe pourrait être habitable. En outre, le télescope spatial Hubble détecte l\'émission de panaches de vapeur d\'eau similaires à ceux observés sur Encelade, une lune de Saturne, qui seraient causés par des geysers en éruption et qui permettraient éventuellement de détecter des traces de vie sans avoir à utiliser d\'atterrisseur — aucune sonde n\'ayant jamais atterri sur la lune.'),
(3, 'Ganymède', 'Jupiter', 'ganymede-62767ce92bd12-png', 'Galilée', '7 janvier 1610', 'Ganymède, de nom international Jupiter III Ganymede8, est un satellite naturel de Jupiter. Sur l\'échelle des distances au centre de Jupiter, il s\'agit du septième satellite naturel connu de la planète et du troisième satellite galiléen. Terminant une orbite en approximativement sept jours terrestres, il participe à une résonance orbitale dite de Laplace, de type 1:2:4, avec Europe et Io. Avec son diamètre de 5 268 kilomètres, dépassant de 8 % celui de la planète Mercure et de 2 % celui de Titan, la plus grande lune de Saturne, Ganymède est le plus gros satellite naturel de Jupiter mais également le plus gros de tout le Système solaire. Étant constitué en quantités à peu près égales de roches silicatées et de glace d\'eau, sa masse n\'est que 45 % de celle de Mercure (constituée de roches et de métaux), mais reste la plus importante de tous les satellites planétaires du Système solaire, atteignant 2,02 fois celle de la Lune.\r\n\r\nGanymède est un corps totalement différencié avec un noyau liquide riche en fer et un océan sous la glace de surface qui pourrait contenir plus d\'eau que tous les océans de la Terre réunis. Les deux grands types de terrains de sa surface couvrent pour environ un tiers des régions sombres, criblées de cratères d\'impacts et âgées de quatre milliards d\'années et, pour les deux tiers restants, des régions plus claires, recoupées par des rainures larges et à peine plus jeunes. La cause de cette perturbation géologique n\'est pas bien connue, mais est probablement le résultat d\'une activité tectonique provoquée par un réchauffement par effet de marée.'),
(4, 'Callisto', 'Jupiter', 'callisto-62767d54623b4-jpg', 'Galilée', '7 janvier 1610', 'Callisto, ou Jupiter IV, est un satellite naturel de la planète Jupiter, découvert en 1610 par Galilée. Callisto est la troisième plus grande lune dans le Système solaire et la deuxième du système jovien, après Ganymède. C\'est également la lune galiléenne la plus éloignée de Jupiter et la seule à ne pas être en résonance orbitale. Callisto se serait formée par accrétion du disque de gaz qui entourait Jupiter après sa formation.\r\n\r\nElle est composée approximativement à parts égales de roche et de glaces. En raison de l\'absence d\'échauffement dû aux forces de marées, la lune ne serait que partiellement différenciée. Des recherches menées à l\'aide de la sonde Galileo révèlent que Callisto pourrait posséder un petit noyau composé de silicates, ainsi qu\'un océan d\'eau liquide à plus de 100 kilomètres sous la surface de la lune. Ce dernier serait susceptible d\'accueillir une vie extraterrestre.');

-- --------------------------------------------------------

--
-- Structure de la table `lune`
--

CREATE TABLE `lune` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lune`
--

INSERT INTO `lune` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Lune', 'Terre', 'moon-627670fd14e5b-jpg', '/', '/', 'La Lunea, dite aussi Terre Ib, est l\'unique satellite naturel permanent de la planète Terre. Il s\'agit du cinquième plus grand satellite naturel du Système solaire, et du plus grand des satellites planétaires par rapport à la taille de la planète autour de laquelle il orbite. Elle est le deuxième satellite le plus dense du Système solaire après Io, un satellite de Jupiterc.\r\n\r\nLa Lune est en rotation synchrone avec la Terre, lui montrant donc constamment la même face. Celle-ci, appelée face visible, est marquée par des mers lunaires volcaniques sombres qui remplissent les espaces entre les hautes terres claires et ses cratères d\'impact proéminents. Réciproquement, elle possède une face cachée, qui présente moins de mers mais beaucoup plus de cratères, dont le bassin Pôle Sud-Aitken, le plus grand du satellite et l\'un des plus grands du Système solaire par son diamètre de 2 500 km. Elle est dépourvue d\'atmosphère dense et de champ magnétique. Son influence gravitationnelle sur la Terre produit les marées océaniques, les marées terrestres, un léger allongement de la durée du jour et la stabilisation de l\'inclinaison de l\'axe terrestre.');

-- --------------------------------------------------------

--
-- Structure de la table `mars`
--

CREATE TABLE `mars` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mars`
--

INSERT INTO `mars` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Phobos', 'Mars', 'phobos-627678589fab8-png', 'Asaph Hall', '18 août 1877', 'Phobos, ou Mars I (en dénomination systématique), est le plus grand des deux satellites naturels de Mars (l\'autre étant Déimos). Des deux, il est le plus proche de la planète.'),
(2, 'Déimos', 'Mars', 'deimos-627678ef2a63f-jpg', 'Asaph Hall', '12 août 1877', 'Déimos, en désignation systématique Mars II, est le plus petit et le plus éloigné des deux satellites naturels de Mars (l\'autre étant Phobos).');

-- --------------------------------------------------------

--
-- Structure de la table `neptune`
--

CREATE TABLE `neptune` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `neptune`
--

INSERT INTO `neptune` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Triton', 'Neptune', 'triton-62769754d91c7-jpg', 'William Lassell', '10 octobre 1846', 'Triton est le plus gros des quatorze satellites naturels de Neptune et le septième par distance croissante à cette dernière. Il a été découvert le 10 octobre 1846 par l\'astronome britannique William Lassell, 17 jours après la découverte de Neptune. Il a un diamètre d\'un peu plus de 2 700 kilomètres, ce qui en fait le septième satellite naturel du Système solaire par taille décroissante — et un astre plus gros que les planètes naines dont Pluton et Éris. C\'est le seul gros satellite connu du Système solaire orbitant dans le sens rétrograde, c\'est-à-dire inverse au sens de rotation de sa planète ; tous les autres satellites dans ce cas sont de petits corps irréguliers de quelques centaines de kilomètres dans leur plus grande longueur. Cette caractéristique orbitale exclut que Triton ait pu se former initialement autour de Neptune et sa composition similaire à celle de Pluton suggère qu\'il s\'agit en réalité d\'un objet issu de la ceinture de Kuiper capturé par Neptune3. Triton est, avec Phobos4, la seule lune connue du Système solaire à se rapprocher de la planète autour de laquelle elle orbite5 : la Lune, par exemple, s\'éloigne de la Terre d\'environ 3,8 centimètres par an5.\r\n\r\nTriton orbite autour de Neptune en 5 jours et 21 heures sur une trajectoire quasi circulaire ayant un demi-grand axe de 354 759 kilomètres6, une inclinaison de 156,865° (-23,135°) sur le plan de Laplace6 du système, et jusqu\'à 129,6° (-50,4°) sur le plan orbital de sa planète7. Ceci lui confère des saisons très marquées tout au long de l\'année neptunienne, longue de 164,79 années terrestres ; l\'hémisphère sud a ainsi passé son solstice d\'été en 20008 avec une inclinaison proche du maximum possible par rapport au Soleil, ce qui est à l\'origine d\'un réchauffement général de l\'hémisphère sud depuis le passage de Voyager 2 le 25 août 1989.\r\n\r\nTriton est un corps de masse volumique moyenne légèrement supérieure à 2 grammes par centimètre cube, constitué vraisemblablement d\'un important noyau métallique et rocheux entouré d\'un manteau de glace d\'eau et d\'une croûte d\'azote gelé à environ 38 kelvins (−235 °C) en surface9. Une atmosphère ténue apparentée à celle des comètes enveloppe le satellite à une pression d\'environ 4 à 6,5 pascals10 selon des mesures récentes réalisées depuis la Terre, composée presque uniquement d\'azote N2, avec des traces de monoxyde de carbone CO et de méthane CH4 ; du néon et de l\'argon y sont certainement présents sans avoir pu y être quantifiés, n\'excédant donc sans doute pas quelques pourcents du total. De l\'hydrogène moléculaire H2 et atomique H• sont également présents dans la haute atmosphère en quantités significatives, résultant de la photolyse du méthane par les ultraviolets du rayonnement solaire.\r\n\r\nCette atmosphère est probablement issue de geysers dont les traces ont été observées sur la calotte polaire australe de Triton, l\'un des rares satellites naturels connus pour avoir une activité géologique significative et assez récente, notamment sous la forme de cryovolcanisme. Ceci expliquerait l\'âge très récent des terrains observés par la sonde Voyager 2 en été 1989, qui couvrent environ 40 % de la surface du satellite, où très peu de cratères d\'impact ont été relevés, donnant à l\'ensemble un âge n\'excédant pas la centaine de millions d\'années — soit une valeur très brève à l\'échelle des temps géologiques.'),
(2, 'Néréide', 'Neptune', 'nereide-627697ca8aa35-jpg', 'Gerard Kuiper', '1er mai 1949', 'Néréide est le troisième plus grand satellite naturel de Neptune. \r\n\r\nL\'orbite de Néréide a un demi-grand axe de 5 513 400 km et est extrêmement excentrique, la distance à Neptune variant de 1 353 600 km à son périposéide à 9 623 700 km à son apoposéide. Ce fut pendant longtemps l\'orbite la plus excentrique des planètes ou des satellites naturels de tout le système solaire, record détenu depuis 2004 par Bestla, un satellite de Saturne. Cette orbite inhabituelle laisse penser que Néréide est un astéroïde capturé ou un ancien objet de la ceinture de Kuiper, ou qu\'il a été perturbé lors de la capture de Triton, le plus grand satellite de Neptune.');

-- --------------------------------------------------------

--
-- Structure de la table `pluton`
--

CREATE TABLE `pluton` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superficie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pluton`
--

INSERT INTO `pluton` (`id`, `nom`, `superficie`, `photo`, `description`) VALUES
(1, 'Pluton', '17,646 millions km²', 'pluton-627654e247b83-jpg', 'Pluton, officiellement désignée par (134340) Pluton (désignation internationale : (134340) Pluto), est une planète naine, la plus volumineuse connue dans le Système solaire (2 372 km de diamètre, contre 2 326 km pour Éris), et la deuxième en ce qui concerne sa masse (après Éris). Pluton est ainsi le neuvième plus gros objet connu orbitant directement autour du Soleil et le dixième par la masse. Premier objet transneptunien identifié, Pluton orbite autour du Soleil à une distance variant entre 30 et 49 unités astronomiques et appartient à la ceinture de Kuiper, ceinture dont il est (tant par la taille que par la masse) le plus grand membre connu.\r\n\r\nAprès sa découverte par l\'astronome américain Clyde Tombaugh en 1930, Pluton était considérée comme la neuvième planète du Système solaire. À la fin du XXe siècle et au début du XXIe siècle, de plus en plus d\'objets similaires furent découverts dans le Système solaire externe, en particulier Éris, alors estimé légèrement plus grand et plus massif que Pluton. Cette évolution amena l\'Union astronomique internationale (UAI) à redéfinir la notion de planète, Cérès, Pluton et Éris étant depuis le 24 août 2006 classées comme des planètes naines. L\'UAI a également décidé de faire de Pluton le prototype d\'une nouvelle catégorie d\'objet transneptunien. À la suite de cette modification de la nomenclature, Pluton a été ajoutée à la liste des objets mineurs du Système solaire et s\'est vu attribuer le numéro 134340 dans le catalogue des objets mineurs.');

-- --------------------------------------------------------

--
-- Structure de la table `rocheuse`
--

CREATE TABLE `rocheuse` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superficie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rocheuse`
--

INSERT INTO `rocheuse` (`id`, `nom`, `superficie`, `photo`, `description`) VALUES
(1, 'Mercure', '74,8 millions km²', 'mercure-627641436d9aa-jpg', 'Mercure est la planète la plus proche du Soleil et la moins massive du Système solaire. Son éloignement au Soleil est compris entre 0,31 et 0,47 unité astronomique (soit 46 et 70 millions de kilomètres), ce qui correspond à une excentricité orbitale de 0,2 — plus de douze fois supérieure à celle de la Terre, et de loin la plus élevée pour une planète du Système solaire. Elle est visible à l\'œil nu depuis la Terre avec un diamètre apparent de 4,5 à 13 secondes d\'arc, et une magnitude apparente de 5,7 à −2,3 ; son observation est toutefois rendue difficile par son élongation toujours inférieure à 28,3° qui la noie le plus souvent dans l\'éclat du soleil. En pratique, cette proximité avec le soleil implique qu\'elle ne peut être vue que près de l\'horizon occidental après le coucher du soleil ou près de l\'horizon oriental avant le lever du soleil, en général au crépuscule. Mercure a la particularité d\'être en résonance spin-orbite 3:2, sa période de révolution (~88 jours) valant exactement 1,5 fois sa période de rotation (~59 jours), et donc la moitié d\'un jour solaire (~176 jours). Ainsi, relativement aux étoiles fixes, elle tourne sur son axe exactement trois fois toutes les deux révolutions autour du Soleil.'),
(2, 'Vénus', '460,2 millions km²', 'Venus-62764500e4021-jpg', 'Vénus est la deuxième planète du Système solaire par ordre d\'éloignement au Soleil, et la sixième plus grosse aussi bien par la masse que le diamètre. Elle doit son nom à la déesse romaine de l\'amour.\r\n\r\nVénus orbite autour du Soleil tous les 224,7 jours terrestres. Avec une période de rotation de 243 jours terrestres, il lui faut plus de temps pour tourner autour de son axe que toute autre planète du Système solaire. Comme Uranus, elle possède une rotation rétrograde et tourne dans le sens opposé à celui des autres planètes : le soleil s\'y lève à l\'ouest et se couche à l\'est. Vénus possède l\'orbite la plus circulaire des planètes du Système solaire avec une excentricité orbitale presque nulle et, du fait de sa lente rotation, est quasiment sphérique (aplatissement considéré comme nul). Elle ne possède pas de satellite naturel.'),
(3, 'Terre', '510,1 millions km²', 'earth-6277d589aa992-jpg', 'La Terre est la troisième planète par ordre d\'éloignement au Soleil et la cinquième plus grande du Système solaire aussi bien par la masse que le diamètre. Par ailleurs, elle est le seul objet céleste connu pour abriter la vie. Elle orbite autour du Soleil en 365,256 jours solaires — une année sidérale — et réalise une rotation sur elle-même relativement au Soleil en 23 h 56 min 4 s — un jour sidéral — soit un peu moins que son jour solaire de 24 h du fait de ce déplacement autour du Soleila. L\'axe de rotation de la Terre possède une inclinaison de 23°, ce qui cause l\'apparition des saisons.'),
(4, 'Mars', '144,8 millions km²', 'mars-6276461824e6a-jpg', 'Mars est la quatrième planète du Système solaire par ordre croissant de la distance au Soleil et la deuxième par ordre croissant de la taille et de la masse. Son éloignement au Soleil est compris entre 1,381 et 1,666 UA (206,6 à 249,2 millions de kilomètres), avec une période orbitale de 669,58 jours martiens (686,71 jours ou 1,88 année terrestre).\r\n\r\nC’est une planète tellurique, comme le sont Mercure, Vénus et la Terre, environ dix fois moins massive que la Terre mais dix fois plus massive que la Lune. Sa topographie présente des analogies aussi bien avec la Lune, à travers ses cratères et ses bassins d\'impact, qu\'avec la Terre, avec des formations d\'origine tectonique et climatique telles que des volcans, des rifts, des vallées, des mesas, des champs de dunes et des calottes polaires. Le plus haut volcan du Système solaire, Olympus Mons (qui est un volcan bouclier), et le plus grand canyon, Valles Marineris, se trouvent sur Mars.');

-- --------------------------------------------------------

--
-- Structure de la table `saturne`
--

CREATE TABLE `saturne` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `saturne`
--

INSERT INTO `saturne` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Mimas', 'Saturne', 'mimas-627684890ff32-jpg', 'William Herschel', '17 septembre 1789', 'Mimas (S I Mimas) est un satellite naturel de Saturne découvert en 1789 par William Herschel. Il tire son nom de Mimas, un Géant de la mythologie grecque.\r\n\r\nMimas est le satellite sphéroïde, parmi six autres, le plus près de Saturne mais aussi le plus petit. Son diamètre varie de 382 à 418 kilomètres. Les sept autres petits satellites connus situés entre son orbite et la surface de la planète géante ont tous un diamètre inférieur à 200 kilomètres, autrement dit d\'une masse trop faible pour assurer une forme sphérique de cohésion. La faible densité de Mimas (1,17) laisse à penser qu\'il est principalement constitué de glace d\'eau avec une petite proportion de roches.'),
(2, 'Encelade', 'Saturne', 'encelade-6276851cc12ae-jpg', 'William Herschel', '28 août 1789', 'Encelade (S II Enceladus) est un satellite naturel de Saturne, découvert par William Herschel en 1789. Il s\'agit du sixième satellite de Saturne par la taille et du quatorzième par son éloignement.\r\n\r\nDepuis la mission Voyager 2, et surtout la mission Cassini-Huygens, arrivée en orbite saturnienne en 2004, Encelade est réputé pour posséder plusieurs caractéristiques étonnantes, dont une géologie très complexe jusque-là insoupçonnée, et une activité qui reste toujours actuellement difficile à expliquer, pour un corps de si petite taille (500 km de diamètre en moyenne). La sonde Cassini a d\'ailleurs observé à sa surface des jets de matière qui pourraient être semblables à des geysers composés « d\'une sorte d\'eau carbonique mélangée à une essence de gaz naturel », et qui semblent indiquer la présence d\'eau liquide sous la surface. De récentes observations ont permis de confirmer cette hypothèse, en démontrant la présence d\'un océan d\'eau liquide sous sa surface. Les trois ingrédients de la vie (chaleur, eau, molécules organiques) seraient donc potentiellement présents sur Encelade.'),
(3, 'Téthys', 'Saturne', 'thetys-62768592592a7-jpg', 'Jean-Dominique Cassini', '21 mars 1684', 'Téthys est un corps glacé, similaire en nature à Dioné et Rhéa. Sa densité, égale à celle de l\'eau, indique qu\'elle est principalement composée de glace. La surface de Téthys est couverte de cratères et compte de nombreuses fissures causées par des failles dans la glace. Il existe deux types de terrain sur Téthys : l\'un est composé de régions fortement cratérisées ; l\'autre consiste en une ceinture de couleur sombre et peu cratérisée qui traverse la lune de part en part. Le faible nombre de cratères sur cette région indique que Téthys a certainement eu autrefois une activité interne, causant une remontée partielle du terrain plus ancien.\r\n\r\nLa raison exacte de la couleur sombre de la ceinture est inconnue, mais une interprétation possible provient des récentes images réalisées par la sonde Galileo des lunes joviennes Ganymède et Callisto, qui exhibent toutes deux des calottes polaires faites de dépôts de glace lumineux sur les pentes des cratères faisant face aux pôles. À distance, les calottes polaires semblent donc plus lumineuses à cause de ces milliers de morceaux de glace situés dans les petits cratères s\'y trouvant. La surface de Téthys peut avoir une origine similaire, consistant en calottes polaires couvertes de morceaux de glace brillants indiscernables, séparés par une zone plus sombre.'),
(4, 'Dioné', 'Saturne', 'dione-62768607de536-jpg', 'Jean-Dominique Cassini', '21 mars 1684', 'Dioné est principalement composée d\'eau sous forme de glace ; mais sa densité plus élevée que celle des autres lunes de Saturne (en dehors de Titan, dont la densité est accrue par la compression gravitationnelle) laisse à penser qu\'elle contient probablement une quantité assez importante de matière plus dense, telle que des roches de silicates.\r\n\r\nDioné est similaire à Rhéa, une autre lune de Saturne, bien qu\'étant légèrement plus petite. Les deux lunes ont une composition et un albédo semblables et présentent les mêmes variations de terrain ; elles ont toutes deux des hémisphères avant et arrière différenciés. Sur l\'hémisphère arrière de Dioné se trouve un réseau de stries claires sur un fond sombre, qui recouvrent un faible nombre de cratères d\'impact visibles plus anciens. L\'hémisphère avant est très cratérisé et uniformément clair.'),
(5, 'Rhéa', 'Saturne', 'rhea-6276868852a2e-jpg', 'Jean-Dominique Cassini', '23 décembre 1672', 'Rhéa est un satellite naturel de Saturne, le deuxième plus grand satellite de la planète par la taille après Titan. Il fut découvert en 1672 par l\'Italien, naturalisé français, Jean-Dominique Cassini.\r\n\r\nRhéa est un corps glacé d\'une masse volumique d\'environ 1 233 kg m−3. Cette faible valeur suggère qu\'il est composé d\'environ 25 % de roches (masse volumique : 3 250 kg m−3) et 75 % de glace d\'eau (masse volumique : 1 000 kg m−3). Initialement, il était supposé que Rhéa possédait un noyau rocheux en son centre6. Cependant, des mesures du moment d\'inertie axial effectuées lors d\'un survol de la sonde Cassini ont mis en évidence une valeur plus compatible avec un intérieur homogène (et une éventuelle compression de la glace au centre)7,8, l\'existence d\'un noyau rocheux impliquant une valeur de ce moment d\'inertie axial6. La forme générale de Rhéa concorde avec l\'idée d\'un corps homogène en équilibre hydrostatique.'),
(6, 'Titan', 'Saturne', 'titan-627687300ae94-jpg', 'Christian Huygens', '25 mars 1655', 'Titan, aussi appelé Saturne VI, est le plus grand satellite naturel de Saturne. D\'un diamètre 6 % plus grand que celui de Mercure, Titan est par la taille au deuxième rang des satellites du Système solaire, après Ganymède, le plus gros satellite de Jupiter. Il s’agit du seul satellite connu à posséder une atmosphère dense. Découvert par l’astronome néerlandais Christian Huygens en 1655, Titan est la première lune observée autour de Saturne.\r\n\r\nTitan est principalement composé de roche et d’eau gelée. Son épaisse atmosphère a longtemps empêché l’observation de sa surface, jusqu’à l’arrivée de la mission Cassini-Huygens en 2004. Cette dernière a permis la découverte de lacs d’hydrocarbures liquides dans les régions polaires du satellite. Du point de vue géologique, la surface de Titan est jeune ; quelques montagnes ainsi que des cryovolcans éventuels y sont répertoriés, mais cette surface demeure relativement plate et lisse, présentant peu de cratères d’impact.\r\n\r\nL’atmosphère de Titan est composée à 98,4 % de diazote et à 1,6 % de méthane et d’éthane. Le climat — qui comprend des vents et de la pluie de méthane — crée sur la surface des caractéristiques similaires à celles rencontrées sur Terre, telles que des dunes et des côtes. Comme la Terre, Titan présente des saisons. Par ses liquides (à la fois à la surface et sous la surface) et son épaisse atmosphère de diazote, Titan est perçu comme un analogue de la Terre primitive, mais à une température beaucoup plus basse. Le satellite est cité comme pouvant peut-être héberger de la vie extraterrestre microbienne ou, au moins, comme un milieu naturel prébiotique riche en chimie organique complexe. Certains chercheurs suggèrent ainsi qu’un océan souterrain pourrait probablement servir d’environnement favorable à la vie.'),
(7, 'Hypérion', 'Saturne', 'hyperion-627687b285039-jpg', 'William Cranch Bond & George Phillips Bond', '16 septembre 1848', 'Hypérion (S VII Hyperion) est un satellite de Saturne découvert le 16 septembre 1848 par William Cranch Bond et son fils George Phillips Bond. Deux jours plus tard, William Lassell le découvrit indépendamment. C\'est ce dernier qui le baptisa, en l\'honneur d\'Hypérion, Titan de la lumière (un dieu solaire archaïque), fils de Gaïa et d\'Uranus, père d\'Hélios (le Soleil), Séléné (la Lune) et Éos (l\'Aurore).\r\n\r\nC\'est le plus grand corps céleste du système solaire dont la forme soit fortement irrégulière (Protée est certes plus grand, mais est quasiment sphérique). Il semble probable qu\'Hypérion soit un fragment d\'un objet plus grand ayant subi un impact dans un passé lointain. Le plus grand cratère mesure approximativement 120 km de diamètre, pour une profondeur de 10 km.\r\n\r\nComme la plupart des lunes de Saturne, la faible densité d\'Hypérion indique qu\'il est principalement composé de glace avec une faible quantité de roche. Cependant, à la différence des autres lunes, Hypérion a un faible albédo (0,2 à 0,3), indiquant qu\'il est couvert par une fine couche de matière sombre. Il se peut que ce soit de la matière provenant de Phœbé (bien plus sombre) qui passa au-delà de Japet. Hypérion est plus rouge que Phœbé, et sa couleur coïncide avec celle de la matière sombre de Japet.'),
(8, 'Japet', 'Saturne', 'japet-62768855df1dd-jpg', 'Jean-Dominique Cassini', '25 octobre 1671', 'Japet (S VIII Japet ; désignation internationale Iapetus) est un satellite naturel de Saturne, le troisième plus grand satellite de la planète par la taille. Il fut découvert en 1671 par Jean-Dominique Cassini.\r\n\r\nJapet est principalement connu pour sa coloration, l\'un de ses hémisphères étant particulièrement brillant tandis que l\'autre est très sombre. La sonde Cassini a dévoilé d\'autres caractéristiques rares, comme une crête équatoriale courant le long de la moitié du satellite. Il s\'agit également du plus grand corps du Système solaire à ne pas être en équilibre hydrostatique, surpassant par son diamètre la quasi-totalité des candidats au statut de planète naine.'),
(9, 'Phœbé', 'Saturne', 'phoebe-627688d7164aa-jpg', 'William Henry Pickering', '17 mars 1899', 'Phœbé (S IX Phoebe) est une lune de Saturne, découverte en 1899 par William Henry Pickering.\r\n\r\nLe nom « Phœbé » a été proposé par William Pickering peu après sa découverte de ce satellite. En effet, cinq des neuf satellites de Saturne précédemment découverts avaient été nommés d\'après les frères et les sœurs du Cronos de la mythologie grecque (que les Romains appelaient Saturne), et Phœbé est elle aussi une sœur de Cronos. Phœbé est une Titanide, fille d\'Ouranos (le Ciel) et de Gaïa (la Terre), elle est mariée à son frère Céos de qui elle a pour enfants Léto et Astéria. On l\'appelle aussi (moins correctement) Phébé.');

-- --------------------------------------------------------

--
-- Structure de la table `uranus`
--

CREATE TABLE `uranus` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `planete` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decouvreur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `uranus`
--

INSERT INTO `uranus` (`id`, `nom`, `planete`, `photo`, `decouvreur`, `date`, `description`) VALUES
(1, 'Puck', 'Uranus', 'puck-627692757b26a-webp', 'Stephen P. Synnott', '30 décembre 1985', 'Puck (U XV Puck) est un satellite naturel d\'Uranus.\r\n\r\nPuck fut découverte en 1985 par la sonde Voyager 2 d\'où sa désignation temporaire S/1985 U 1. Excepté ses caractéristiques orbitales on ne connaît que peu de choses à son sujet. On estime cependant ses dimensions à 162 km de diamètre. Sa surface est parsemé de cratères foncés qui sont des traces de glace.\r\n\r\nOn a rapidement remarqué qu\'il s\'agit d\'un objet très sombre d\'un albédo inférieur à 0,1 comme beaucoup d\'autres petites lunes d\'Uranus (pour des raisons qui ne sont pas actuellement connues) et que son orbite est presque parfaitement alignée avec le plan des anneaux d\'Uranus.\r\n\r\nLe nom « Puck » vient d\'un lutin malicieux de la mythologie celtique, mieux connu comme personnage de la pièce Le Songe d\'une nuit d\'été de William Shakespeare.'),
(2, 'Miranda', 'Uranus', 'miranda-627692eac64a6-jpg', 'Gerard Kuiper', '16 février 1948', 'iranda, également connue sous le nom d\'Uranus V, est un satellite naturel d\'Uranus. Cette lune fut découverte en 1948 par Gerard Kuiper. Elle porte le nom de Miranda, la fille du magicien Prospero qui apparaît dans la tragi-comédie La Tempête de William Shakespeare. Miranda n\'a été approchée qu\'une seule fois, par la sonde Voyager 2 en janvier 1986. De tous les satellites naturels d\'Uranus, Miranda est celui dont la sonde a fait les meilleures images. Néanmoins, durant le survol de la sonde, l\'hémisphère nord était plongé dans la nuit ; les observations se sont donc limitées à l\'hémisphère sud.\r\n\r\nMiranda est la plus petite des cinq principales lunesnote 1 en orbite autour d\'Uranus. Elle est aussi la plus proche de cette planète, à seulement 129 900 km et la moins dense. Sa surface semble composée de glace d\'eau mêlée à des composés de silicates et de carbonates ainsi qu\'à de l\'ammoniac. À l\'instar des autres lunes d\'Uranus, son orbite est inscrite dans un plan perpendiculaire à l\'orbite de la planète autour du Soleil, ce qui provoque des variations saisonnières extrêmes en surface. En cela, elle suit la rotation atypique de la planète qui tourne selon un axe quasiment parallèle au plan de son orbite autour du Soleil. Comme les autres lunes d\'Uranus, Miranda s\'est très probablement formée à partir d\'un disque d\'accrétion, appelé sous-nébuleuse, qui entourait la planète peu après sa formation, ou après l’événement catastrophique qui lui a donné son inclinaison. Cependant, Miranda présente une inclinaison de 4,338° par rapport au plan de l’équateur uranien, inclinaison qui est la plus marquée parmi celles des lunes majeures. Cette petite lune, qui aurait pu n\'être qu\'un corps glacé et inerte couvert de cratères d\'impacts, est en fait un surprenant, et unique, patchwork de zones très variées. La surface de Miranda comprend de vastes plaines vallonnées piquées de cratères et traversées par un réseau de failles escarpées et de rupes. Cette surface présente surtout trois impressionnantes couronnes, aussi appelées « coronae », dont les diamètres dépassent les 200 km. Ces formations géologiques ainsi que l’inclinaison anormale de l\'orbite signent une activité géologique et une histoire complexe. Miranda aurait été marquée par des forces de marée, des mécanismes de résonances orbitales, un processus de différenciation planétaire partielle ainsi que par des mouvements de convection, d’expansion de son manteau et des épisodes de cryovolcanisme.'),
(3, 'Ariel', 'Uranus', 'ariel-6276935101823-png', 'William Lassell', '24 octobre 1851', 'Ariel, également connu sous le nom d\'Uranus I, est un satellite naturel d\'Uranus. Découvert le 24 octobre 1851 par William Lassell, il est nommé d\'après un esprit de l\'air apparaissant dans le poème La Boucle de cheveux enlevée d\'Alexander Pope et la pièce de théâtre La Tempête de William Shakespeare. Il n\'a été survolé que par une seule sonde spatiale, Voyager 2, en 1986, et seulement 35 % de la surface de l\'astre a pu être photographiée à cette occasion.\r\n\r\nAriel est la plus brillante des lunes en orbite autour d\'Uranus, ainsi que la troisième plus massive et la quatrième plus grande. Elle est principalement composée, à parts égales, de glaces et de roches. À l\'instar des autres lunes d\'Uranus, son orbite est inscrite dans un plan perpendiculaire à l\'orbite de la planète autour du Soleil, ce qui provoque des variations saisonnières extrêmes en surface. En cela, elle suit la rotation atypique de la planète qui tourne selon un axe quasiment parallèle au plan de son orbite autour du Soleil. Pour cette raison, Ariel, comme les autres lunes d\'Uranus, s\'est très probablement formée à partir d\'un disque d\'accrétion qui entourait la planète peu de temps après sa formation. Sa structure interne s\'est différenciée pour former un noyau de roche et un manteau de glace. Ariel a une surface complexe comprenant de vastes terrains marqués par des cratères d\'impact et traversés par un réseau de failles escarpées, de canyons et de crêtes. Cette surface montre des signes d\'une activité géologique plus récente que les autres lunes d\'Uranus, résultant des importantes forces de marées exercées par la planète. L\'énergie ainsi accumulée a été dissipée sous forme de chaleur dans le manteau de l\'astre.'),
(4, 'Umbriel', 'Uranus', 'umbriel-627693cc14415-webp', 'William Lassell', '24 octobre 1851', 'Umbriel, également appelé Uranus II, est le troisième satellite naturel d\'Uranus par la taille. Découvert en 1851 par William Lassell, en même temps qu\'Ariel, il reçoit alors le nom d\'un personnage du poème La Boucle de cheveux enlevée d\'Alexander Pope.\r\n\r\nUmbriel est principalement constitué de glace, et d\'une fraction substantielle de roche. Sa structure interne pourrait être différenciée entre un noyau rocheux et un manteau de glace. Sa surface est la plus sombre parmi celles des lunes d\'Uranus, et aurait été principalement façonnée par des impacts météoritiques. Cependant, la présence de canyons suggère l\'existence de processus endogènes dus à l\'expansion de son intérieur au début de son évolution. Le satellite pourrait avoir subi un resurfaçage endogène qui aurait recouvert une partie des surfaces les plus anciennes.\r\n\r\nParmi les satellites d\'Uranus, Umbriel a la surface la plus marquée par des cratères d\'impact après Obéron, certains mesurant jusqu\'à 210 km de diamètre. La principale caractéristique géologique à la surface d\'Umbriel est un anneau de matériaux clairs au fond du cratère Wunda.'),
(5, 'Titania', 'Uranus', 'titaniajpg-6276943c8df43-jpg', 'William Herschel', '11 janvier 1787', 'Titania, également appelé Uranus III, est le plus grand satellite naturel d\'Uranus et le huitième par sa masse du Système solaire. Découvert par William Herschel en 1787, il doit son nom à Titania, la reine des fées de la pièce de Shakespeare, Le Songe d\'une nuit d\'été. Son orbite autour d\'Uranus est entièrement située au sein de la magnétosphère de la planète.\r\n\r\nTitania est constitué de glace et de roche en quantités approximativement égales. Le satellite est probablement différencié en un noyau rocheux et un manteau glacé. Une couche d\'eau liquide pourrait être présente à l\'interface entre le noyau et le manteau. La surface de Titania, sombre et légèrement rouge, a été modelée à la fois par les impacts d\'astéroïdes et de comètes, et par les processus endogènes. Elle est couverte de nombreux cratères d\'impacts, certains atteignant jusqu\'à 326 km de diamètre, mais est moins cratérisée que la surface d\'Obéron, le grand satellite le plus externe du système uranien. Titania a probablement connu un épisode de resurfaçage endogène qui a recouvert les surfaces les plus anciennes très cratérisées. Par la suite, l\'expansion de son intérieur a engendré sur la surface de Titania un réseau de canyons et d\'escarpements de faille. À l\'instar de toutes les lunes majeures d\'Uranus, elle s\'est probablement formée à partir du disque d\'accrétion qui entourait Uranus juste après la formation de la planète.'),
(6, 'Obéron', 'Uranus', 'oberon-627694830e54e-jpg', 'William Herschel', '11 janvier 1787', 'Obéron, également appelé Uranus IV, est le plus éloigné des grands satellites naturels d\'Uranus. C\'est le deuxième satellite de cette planète tant par sa taille que sa masse et le neuvième du Système solaire en masse. Découvert par William Herschel en 1787, Obéron doit son nom à un personnage de la pièce de Shakespeare Le Songe d\'une nuit d\'été. Son orbite autour d\'Uranus est partiellement située en dehors de la magnétosphère d\'Uranus.\r\n\r\nObéron est constitué de glace et de roche en quantités approximativement égales. Le satellite est probablement différencié en un noyau rocheux et un manteau glacé. Une couche d\'eau liquide pourrait être présente à l\'interface entre le noyau et le manteau. La surface d\'Obéron, qui est sombre et légèrement rouge, semble avoir été principalement modelée par les impacts d\'astéroïdes et de comètes. Il est couvert par de nombreux cratères d\'impacts, certains atteignant jusqu\'à 210 km de diamètre. Obéron a probablement connu un épisode de resurfaçage endogène qui a recouvert les surfaces les plus anciennes très cratérisées. Par la suite, l\'expansion de son intérieur a engendré sur la surface d\'Obéron un réseau de canyons et d\'escarpements de faille. À l\'instar de toutes les lunes majeures d\'Uranus, Obéron s\'est probablement formé à partir du disque d\'accrétion qui entourait Uranus juste après la formation de la planète.');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'jyakou@gmx.fr', '[\"ROLE_ADMIN\"]', '$2y$13$.8SypYOp99wR4CZeYWXQcOnMYzFCVhVzZyu/MrlIC2yk0RTOL9VaW');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `charon`
--
ALTER TABLE `charon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gazeuse`
--
ALTER TABLE `gazeuse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jupiter`
--
ALTER TABLE `jupiter`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lune`
--
ALTER TABLE `lune`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mars`
--
ALTER TABLE `mars`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `neptune`
--
ALTER TABLE `neptune`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pluton`
--
ALTER TABLE `pluton`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rocheuse`
--
ALTER TABLE `rocheuse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `saturne`
--
ALTER TABLE `saturne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `uranus`
--
ALTER TABLE `uranus`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `charon`
--
ALTER TABLE `charon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `gazeuse`
--
ALTER TABLE `gazeuse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `jupiter`
--
ALTER TABLE `jupiter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `lune`
--
ALTER TABLE `lune`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mars`
--
ALTER TABLE `mars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `neptune`
--
ALTER TABLE `neptune`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `pluton`
--
ALTER TABLE `pluton`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `rocheuse`
--
ALTER TABLE `rocheuse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `saturne`
--
ALTER TABLE `saturne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `uranus`
--
ALTER TABLE `uranus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
