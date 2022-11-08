function factorial(n) {
    let res = new Array(500);

    // Initialize result
    res[0] = 1;
    let res_size = 1;
    var result = "";

    // Apply simple factorial formula n! = 1 * 2 * 3 * 4...*n
    for (let x = 2; x <= n; x++)
        res_size = multiply(x, res, res_size);

    res.forEach(e => {
        result += e;
    })
    result = result.split("").reverse().join("")
    return result;
}

function multiply(x, res, res_size) {
    let carry = 0; // Initialize carry

    // One by one multiply n with individual digits of res[]
    for (let i = 0; i < res_size; i++) {
        let prod = res[i] * x + carry;

        // Store last digit of 'prod' in res[]
        res[i] = prod % 10;

        // Put rest in carry
        carry = Math.floor(prod / 10);
    }

    // Put carry in res and increase result size
    while (carry) {
        res[res_size] = carry % 10;
        carry = Math.floor(carry / 10);
        res_size++;
    }
    return res_size;
}

// 
function factorial(n) {
    var res = [1];
    for (var i = 2; i <= n; ++i) {
        var c = 0;
        for (var j = 0; j < res.length || c !== 0; ++j) {
            c += (res[j] || 0) * i;
            res[j] = c % 10;
            c = Math.floor(c / 10);
        }
    }
    return res.reverse().join("");
}

// Supper Fast
function factorial(n) {
    console.log(n);
    let fs = ["1", "1", "2", "6", "24", "120", "720", "5040", "40320", "362880", "3628800", "39916800", "479001600",
        "6227020800", "87178291200", "1307674368000", "20922789888000", "355687428096000", "6402373705728000",
        "121645100408832000", "2432902008176640000", "51090942171709440000", "1124000727777607680000",
        "25852016738884976640000", "620448401733239439360000", "15511210043330985984000000", "403291461126605635584000000",
        "10888869450418352160768000000", "304888344611713860501504000000", "8841761993739701954543616000000",
        "265252859812191058636308480000000", "8222838654177922817725562880000000", "263130836933693530167218012160000000",
        "8683317618811886495518194401280000000", "295232799039604140847618609643520000000",
        "10333147966386144929666651337523200000000",
        "371993326789901217467999448150835200000000",
        "13763753091226345046315979581580902400000000",
        "523022617466601111760007224100074291200000000",
        "20397882081197443358640281739902897356800000000",
        "815915283247897734345611269596115894272000000000",
        "33452526613163807108170062053440751665152000000000",
        "1405006117752879898543142606244511569936384000000000",
        "60415263063373835637355132068513997507264512000000000",
        "2658271574788448768043625811014615890319638528000000000",
        "119622220865480194561963161495657715064383733760000000000",
        "5502622159812088949850305428800254892961651752960000000000",
        "258623241511168180642964355153611979969197632389120000000000",
        "12413915592536072670862289047373375038521486354677760000000000",
        "608281864034267560872252163321295376887552831379210240000000000",
        "30414093201713378043612608166064768844377641568960512000000000000",
        "1551118753287382280224243016469303211063259720016986112000000000000",
        "80658175170943878571660636856403766975289505440883277824000000000000",
        "4274883284060025564298013753389399649690343788366813724672000000000000",
        "230843697339241380472092742683027581083278564571807941132288000000000000",
        "12696403353658275925965100847566516959580321051449436762275840000000000000",
        "710998587804863451854045647463724949736497978881168458687447040000000000000",
        "40526919504877216755680601905432322134980384796226602145184481280000000000000",
        "2350561331282878571829474910515074683828862318181142924420699914240000000000000",
        "138683118545689835737939019720389406345902876772687432540821294940160000000000000",
        "8320987112741390144276341183223364380754172606361245952449277696409600000000000000",
        "507580213877224798800856812176625227226004528988036003099405939480985600000000000000",
        "31469973260387937525653122354950764088012280797258232192163168247821107200000000000000",
        "1982608315404440064116146708361898137544773690227268628106279599612729753600000000000000",
        "126886932185884164103433389335161480802865516174545192198801894375214704230400000000000000",
        "8247650592082470666723170306785496252186258551345437492922123134388955774976000000000000000",
        "544344939077443064003729240247842752644293064388798874532860126869671081148416000000000000000",
        "36471110918188685288249859096605464427167635314049524593701628500267962436943872000000000000000",
        "2480035542436830599600990418569171581047399201355367672371710738018221445712183296000000000000000",
        "171122452428141311372468338881272839092270544893520369393648040923257279754140647424000000000000000",
        "11978571669969891796072783721689098736458938142546425857555362864628009582789845319680000000000000000",
        "850478588567862317521167644239926010288584608120796235886430763388588680378079017697280000000000000000",
        "61234458376886086861524070385274672740778091784697328983823014963978384987221689274204160000000000000000",
        "4470115461512684340891257138125051110076800700282905015819080092370422104067183317016903680000000000000000",
        "330788544151938641225953028221253782145683251820934971170611926835411235700971565459250872320000000000000000",
        "24809140811395398091946477116594033660926243886570122837795894512655842677572867409443815424000000000000000000",
        "1885494701666050254987932260861146558230394535379329335672487982961844043495537923117729972224000000000000000000",
        "145183092028285869634070784086308284983740379224208358846781574688061991349156420080065207861248000000000000000000",
        "11324281178206297831457521158732046228731749579488251990048962825668835325234200766245086213177344000000000000000000",
        "894618213078297528685144171539831652069808216779571907213868063227837990693501860533361810841010176000000000000000000",
        "71569457046263802294811533723186532165584657342365752577109445058227039255480148842668944867280814080000000000000000000",
        "5797126020747367985879734231578109105412357244731625958745865049716390179693892056256184534249745940480000000000000000000",
        "475364333701284174842138206989404946643813294067993328617160934076743994734899148613007131808479167119360000000000000000000",
        "39455239697206586511897471180120610571436503407643446275224357528369751562996629334879591940103770870906880000000000000000000",
        "3314240134565353266999387579130131288000666286242049487118846032383059131291716864129885722968716753156177920000000000000000000",
        "281710411438055027694947944226061159480056634330574206405101912752560026159795933451040286452340924018275123200000000000000000000",
        "24227095383672732381765523203441259715284870552429381750838764496720162249742450276789464634901319465571660595200000000000000000000",
        "2107757298379527717213600518699389595229783738061356212322972511214654115727593174080683423236414793504734471782400000000000000000000",
        "185482642257398439114796845645546284380220968949399346684421580986889562184028199319100141244804501828416633516851200000000000000000000",
        "16507955160908461081216919262453619309839666236496541854913520707833171034378509739399912570787600662729080382999756800000000000000000000",
        "1485715964481761497309522733620825737885569961284688766942216863704985393094065876545992131370884059645617234469978112000000000000000000000",
        "135200152767840296255166568759495142147586866476906677791741734597153670771559994765685283954750449427751168336768008192000000000000000000000",
        "12438414054641307255475324325873553077577991715875414356840239582938137710983519518443046123837041347353107486982656753664000000000000000000000",
        "1156772507081641574759205162306240436214753229576413535186142281213246807121467315215203289516844845303838996289387078090752000000000000000000000",
        "108736615665674308027365285256786601004186803580182872307497374434045199869417927630229109214583415458560865651202385340530688000000000000000000000",
        "10329978488239059262599702099394727095397746340117372869212250571234293987594703124871765375385424468563282236864226607350415360000000000000000000000",
        "991677934870949689209571401541893801158183648651267795444376054838492222809091499987689476037000748982075094738965754305639874560000000000000000000000",
        "96192759682482119853328425949563698712343813919172976158104477319333745612481875498805879175589072651261284189679678167647067832320000000000000000000000",
        "9426890448883247745626185743057242473809693764078951663494238777294707070023223798882976159207729119823605850588608460429412647567360000000000000000000000",
        "933262154439441526816992388562667004907159682643816214685929638952175999932299156089414639761565182862536979208272237582511852109168640000000000000000000000",
        "93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000",
        "9425947759838359420851623124482936749562312794702543768327889353416977599316221476503087861591808346911623490003549599583369706302603264000000000000000000000000",
        "961446671503512660926865558697259548455355905059659464369444714048531715130254590603314961882364451384985595980362059157503710042865532928000000000000000000000000",
        "99029007164861804075467152545817733490901658221144924830052805546998766658416222832141441073883538492653516385977292093222882134415149891584000000000000000000000000",
        "10299016745145627623848583864765044283053772454999072182325491776887871732475287174542709871683888003235965704141638377695179741979175588724736000000000000000000000000",
        "1081396758240290900504101305800329649720646107774902579144176636573226531909905153326984536526808240339776398934872029657993872907813436816097280000000000000000000000000",
        "114628056373470835453434738414834942870388487424139673389282723476762012382449946252660360871841673476016298287096435143747350528228224302506311680000000000000000000000000",
        "12265202031961379393517517010387338887131568154382945052653251412013535324922144249034658613287059061933743916719318560380966506520420000368175349760000000000000000000000000",
        "1324641819451828974499891837121832599810209360673358065686551152497461815091591578895743130235002378688844343005686404521144382704205360039762937774080000000000000000000000000",
        "144385958320249358220488210246279753379312820313396029159834075622223337844983482099636001195615259277084033387619818092804737714758384244334160217374720000000000000000000000000",
        "15882455415227429404253703127090772871724410234473563207581748318444567162948183030959960131517678520479243672638179990208521148623422266876757623911219200000000000000000000000000",
        "1762952551090244663872161047107075788761409536026565516041574063347346955087248316436555574598462315773196047662837978913145847497199871623320096254145331200000000000000000000000000",
        "197450685722107402353682037275992488341277868034975337796656295094902858969771811440894224355027779366597957338237853638272334919686385621811850780464277094400000000000000000000000000",
        "22311927486598136465966070212187151182564399087952213171022161345724023063584214692821047352118139068425569179220877461124773845924561575264739138192463311667200000000000000000000000000",
        "2543559733472187557120132004189335234812341496026552301496526393412538629248600474981599398141467853800514886431180030568224218435400019580180261753940817530060800000000000000000000000000",
        "292509369349301569068815180481773552003419272043053514672100535242441942363589054622883930786268803187059211939585703515345785120071002251720730101703194015956992000000000000000000000000000",
        "33931086844518982011982560935885732032396635556994207701963662088123265314176330336254535971207181169698868584991941607780111073928236261199604691797570505851011072000000000000000000000000000",
        "3969937160808720895401959629498630647790406360168322301129748464310422041758630649341780708631240196854767624444057168110272995649603642560353748940315749184568295424000000000000000000000000000",
        "468452584975429065657431236280838416439267950499862031533310318788629800927518416622330123618486343228862579684398745837012213486653229822121742374957258403779058860032000000000000000000000000000",
        "55745857612076058813234317117419771556272886109483581752463927935846946310374691578057284710599874844234646982443450754604453404911734348832487342619913750049708004343808000000000000000000000000000",
        "6689502913449127057588118054090372586752746333138029810295671352301633557244962989366874165271984981308157637893214090552534408589408121859898481114389650005964960521256960000000000000000000000000000",
        "809429852527344373968162284544935082997082306309701607045776233628497660426640521713391773997910182738287074185078904956856663439318382745047716214841147650721760223072092160000000000000000000000000000",
        "98750442008336013624115798714482080125644041369783596059584700502676714572050143649033796427745042294071023050579626404736512939596842694895821378210620013388054747214795243520000000000000000000000000000",
        "12146304367025329675766243241881295855454217088483382315328918161829235892362167668831156960612640202170735835221294047782591091570411651472186029519906261646730733907419814952960000000000000000000000000000",
        "1506141741511140879795014161993280686076322918971939407100785852066825250652908790935063463115967385069171243567440461925041295354731044782551067660468376444194611004520057054167040000000000000000000000000000",
        "188267717688892609974376770249160085759540364871492425887598231508353156331613598866882932889495923133646405445930057740630161919341380597818883457558547055524326375565007131770880000000000000000000000000000000",
        "23721732428800468856771473051394170805702085973808045661837377170052497697783313457227249544076486314839447086187187275319400401837013955325179315652376928996065123321190898603130880000000000000000000000000000000",
        "3012660018457659544809977077527059692324164918673621799053346900596667207618480809067860692097713761984609779945772783965563851033300772326297773087851869982500270661791244122597621760000000000000000000000000000000",
        "385620482362580421735677065923463640617493109590223590278828403276373402575165543560686168588507361534030051833058916347592172932262498857766114955245039357760034644709279247692495585280000000000000000000000000000000",
        "49745042224772874403902341504126809639656611137138843145968864022652168932196355119328515747917449637889876686464600208839390308261862352651828829226610077151044469167497022952331930501120000000000000000000000000000000",
        "6466855489220473672507304395536485253155359447828049608975952322944781961185526165512707047229268452925683969240398027149120740074042105844737747799459310029635780991774612983803150965145600000000000000000000000000000000",
        "847158069087882051098456875815279568163352087665474498775849754305766436915303927682164623187034167333264599970492141556534816949699515865660644961729169613882287309922474300878212776434073600000000000000000000000000000000",
        "111824865119600430744996307607616902997562475571842633838412167568361169672820118454045730260688510087990927196104962685462595837360336094267205134948250389032461924909766607715924086489297715200000000000000000000000000000000",
        "14872707060906857289084508911813048098675809251055070300508818286592035566485075754388082124671571841702793317081960037166525246368924700537538282948117301741317436012998958826217903503076596121600000000000000000000000000000000",
        "1992942746161518876737324194182948445222558439641379420268181650403332765909000151088003004705990626788174304488982644980314383013435909872030129915047718433336536425741860482713199069412263880294400000000000000000000000000000000",
        "269047270731805048359538766214698040105045389351586221736204522804449923397715020396880405635308734616403531106012657072342441706813847832724067538531441988500432417475151165166281874370655623839744000000000000000000000000000000000",
        "36590428819525486576897272205198933454286172951815726156123815101405189582089242773975735166401987907830880230417721361838572072126683305250473185240276110436058808776620558462614334914409164842205184000000000000000000000000000000000",
        "5012888748274991661034926292112253883237205694398754483388962668892510972746226260034675717797072343372830591567227826571884373881355612819314826377917827129740056802397016509378163883274055583382110208000000000000000000000000000000000",
        "691778647261948849222819828311491035886734385827028118707676848307166514238979223884785249055995983385450621636277440066920043595627074569065446040152660143904127838730788278294186615891819670506731208704000000000000000000000000000000000",
        "96157231969410890041971956135297253988256079629956908500367081914696145479218112119985149618783441690577636407442564169301886059792163365100096999581219760002673769583579570682891939608962934200435638009856000000000000000000000000000000000",
        "13462012475717524605876073858941615558355851148193967190051391468057460367090535696797920946629681836680869097041958983702264048370902871114013579941370766400374327741701139895604871545254810788060989321379840000000000000000000000000000000000",
        "1898143759076170969428526414110767793728175011895349373797246196996101911759765533248506853474785138972002542682916216702019230820297304827075914771733278062452780211579860725280286887880928321116599494314557440000000000000000000000000000000000",
        "269536413788816277658850750803729026709400851689139611079208959973446471469886705721287973193419489734024361060974102771686730776482217285444779897586125484868294790044340222989800738079091821598557128192667156480000000000000000000000000000000000",
        "38543707171800727705215657364933250819444321791546964384326881276202845420193798918144180166658987031965483631719296696351202501036957071818603525354815944336166154976340651887541505545310130488593669331551403376640000000000000000000000000000000000",
        "5550293832739304789551054660550388117999982337982762871343070903773209740507907044212761943998894132603029642967578724274573160149321818341878907651093495984407926316593053871805976798524658790357488383743402086236160000000000000000000000000000000000",
        "804792605747199194484902925779806277109997439007500616344745281047115412373646521410850481879839649227439298230298915019813108221651663659572441609408556917739149315905992811411866635786075524601835815642793302504243200000000000000000000000000000000000",
        "117499720439091082394795827163851716458059626095095089986332811032878850206552392125984170354456588787206137541623641592892713800361142894297576474973649309989915800122274950466132528824767026591868029083847822165619507200000000000000000000000000000000000",
        "17272458904546389112034986593086202319334765035978978227990923221833190980363201642519673042105118551719302218618675314155228928653088005461743741821126448568517622617974417718521481737240752909004600275325629858346067558400000000000000000000000000000000000",
        "2556323917872865588581178015776757943261545225324888777742656636831312265093753843092911610231557545654456728355563946494973881440657024808338073789526714388140608147460213822341179297111631430532680840748193219035217998643200000000000000000000000000000000000",
        "380892263763056972698595524350736933545970238573408427883655838887865527498969322620843829924502074302514052524979028027751108334657896696442372994639480443832950613971571859528835715269633083149369445271480789636247481797836800000000000000000000000000000000000",
        "57133839564458545904789328652610540031895535786011264182548375833179829124845398393126574488675311145377107878746854204162666250198684504466355949195922066574942592095735778929325357290444962472405416790722118445437122269675520000000000000000000000000000000000000",
        "8627209774233240431623188626544191544816225903687700891564804750810154197851655157362112747789971982951943289690774984828562603780001360174419748328584232052816331406456102618328128950857189333333217935399039885261005462721003520000000000000000000000000000000000000",
        "1311335885683452545606724671234717114812066337360530535517850322123143438073451583919041137664075741408695380032997797693941515774560206746511801745944803272028082373781327597985875600530292778666649126180654062559672830333592535040000000000000000000000000000000000000",
        "200634390509568239477828874698911718566246149616161171934231099284840946025238092339613294062603588435530393145048663047173051913507711632216305667129554900620296603188543122491838966881134795135997316305640071571629943041039657861120000000000000000000000000000000000000",
        "30897696138473508879585646703632404659201907040888820477871589289865505687886666220300447285640952619071680544337494109264649994680187591361311072737951454695525676891035640863743200899694758450943586711068571022031011228320107310612480000000000000000000000000000000000000",
        "4789142901463393876335775239063022722176295591337767174070096339929153381622433264146569329274347655956110484372311586936020749175429076661003216274382475477806479918110524333880196139452687559896255940215628508414806740389616633144934400000000000000000000000000000000000000",
        "747106292628289444708380937293831544659502112248691679154935029028947927533099589206864815366798234329153235562080607562019236871366935959116501738803666174537810867225241796085310597754619259343815926673638047312709851500780194770609766400000000000000000000000000000000000000",
        "117295687942641442819215807155131552511541831623044593627324799557544824622696635505477776012587322789677057983246655387237020188804608945581290772992175589402436306154362961985393763847475223716979100487761173428095446685622490578985733324800000000000000000000000000000000000000",
        "18532718694937347965436097530510785296823609396441045793117318330092082290386068409865488609988797000768975161352971551183449189831128213401843942132763743125584936372389347993692214687901085347282697877066265401639080576328353511479745865318400000000000000000000000000000000000000",
        "2946702272495038326504339507351214862194953894034126281105653614484641084171384877168612688988218723122267050655122476638168421183149385930893186799109435156968004883209906330997062135376272570217948962453536198860613811636208208325279592585625600000000000000000000000000000000000000",
        "471472363599206132240694321176194377951192623045460204976904578317542573467421580346978030238114995699562728104819596262106947389303901748942909887857509625114880781313585012959529941660203611234871833992565791817698209861793313332044734813700096000000000000000000000000000000000000000",
        "75907050539472187290751785709367294850142012310319093001281637109124354328254874435863462868336514307629599224875954998199218529677928181579808491945059049643495805791487187086484320607292781408814365272803092482649411787748723446459202305005715456000000000000000000000000000000000000000",
        "12296942187394494341101789284917501765723005994271693066207625211678145401177289658609880984670515317835995074429904709708273401807824365415928975695099566042246320538220924308010459938381430588227927174194100982189204709615293198326390773410925903872000000000000000000000000000000000000000",
        "2004401576545302577599591653441552787812849977066285969791842909503537700391898214353410600501293996807267197132074467682448564494675371562796423038301229264886150247730010662205704969956173185881152129393638460096840367667292791327201696065980922331136000000000000000000000000000000000000000",
        "328721858553429622726333031164414657201307396238870899045862237158580182864271307153959338482212215476391820329660212699921564577126760936298613378281401599441328640627721748601735615072812402484508949220556707455881820297436017777661078154820871262306304000000000000000000000000000000000000000",
        "54239106661315887749844950142128418438215720379413698342567269131165730172604765680403290849565015553604650354393935095487058155225915554489271207416431263907819225703574088519286376487014046409943976621391856730220500349076942933314077895545443758280540160000000000000000000000000000000000000000",
        "9003691705778437366474261723593317460743809582982673924866166675773511208652391102946946281027792581898371958829393225850851653767501982045219020431127589808697991466793298694201538496844331704050700119151048217216603057946772526930136930660543663874569666560000000000000000000000000000000000000000",
        "1503616514864999040201201707840084015944216200358106545452649834854176371844949314192140028931641361177028117124508668717092226179172831001551576411998307498052564574954480881931656928973003394576466919898225052275172710677111011997332867420310791867053134315520000000000000000000000000000000000000000",
        "252607574497319838753801886917134114678628321660161899636045172255501630469951484784279524860515748677740723676917456344471493998101035608260664837215715659672830848592352788164518364067464570288846442542901808782229015393754650015551921726612213033664926565007360000000000000000000000000000000000000000",
        "42690680090047052749392518888995665380688186360567361038491634111179775549421800928543239701427161526538182301399050122215682485679075017796052357489455946484708413412107621199803603527401512378815048789750405684196703601544535852628274771797464002689372589486243840000000000000000000000000000000000000000",
        "7257415615307998967396728211129263114716991681296451376543577798900561843401706157852350749242617459511490991237838520776666022565442753025328900773207510902400430280058295603966612599658257104398558294257568966313439612262571094946806711205568880457193340212661452800000000000000000000000000000000000000000",
        '1241018070217667823424840524103103992616605577501693185388951803611996075221691752992751978120487585576464959501670387052809889858690710767331242032218484364310473577889968548278290754541561964852153468318044293239598173696899657235903947616152278558180061176365108428800000000000000000000000000000000000000000',
        "213455108077438865629072570145733886730056159330291227886899710221263324938130981514753340236723864719151973034287306573083301055694802251980973629541579310661401455397074590303866009781148657954570396550703618437210885875866741044575478989978191912006970522334798649753600000000000000000000000000000000000000000",
        "36927733697396923753829554635211962404299715564140382424433649868278555214296659802052327860953228596413291334931704037143411082635200789592708437910693220744422451783693904122568819692138717826140678603271725989637483256524946200711557865266227200777205900363920166407372800000000000000000000000000000000000000000",
        "6425425663347064733166342506526881458348150508160426541851455077080468607287618805557105047805861775775912692278116502462953528378524937389131268196460620409529506610362739317326974626432136901748478076969280322196922086635340638923811068556323532935233826663322108954882867200000000000000000000000000000000000000000",
        "1124449491085736328304109938642204255210926338928074644824004638489082006275333290972493383366025810760784721148670387931016867466241864043097971934380608571667663656813479380532220559625623957805983663469624056384461365161184611811666936997356618263665919666081369067104501760000000000000000000000000000000000000000000",
        "197903110431089593781523349201027948917123035651341137489024816374078433104458659211158835472420542693898110922165988275858968674058568071585243060450987108613508803599172370973670818494109816573853124770653833923665200268368491678853380911534764814405201861230320955810392309760000000000000000000000000000000000000000000",
        "35028850546302858099329632808581946958330777310287381335557392498211882659489182680375113878618436056819965633223379924827037455308366548670588021699824718224591058237053509662339734873457437533572003084405728604488740447501223027157048421341653372149720729437766809178439438827520000000000000000000000000000000000000000000",
        "6235135397241908741680674639927586558582878361231153877729215864681715113389074517106770270394081618113953882713761626619212667044889245663364667862568799843977208366195524719896472807475423880975816549024219691598995799655217698833954618998814300242650289839922492033762220111298560000000000000000000000000000000000000000000",
        "1116089236106301664760840760547037993986335226660376544113529639778027005296644338562111878400540609642397745005763331164839067401035174973742275547399815172071920297548998924861468632538100874694671162275335324796220248138283968091277876800787759743434401881346126074043437399922442240000000000000000000000000000000000000000000"]
    fs[200] = "788657867364790503552363213932185062295135977687173263294742533244359449963403342920304284011984623904177212138919638830257642790242637105061926624952829931113462857270763317237396988943922445621451664240254033291864131227428294853277524242407573903240321257405579568660226031904170324062351700858796178922222789623703897374720000000000000000000000000000000000000000000000000";
    fs[250] = "3232856260909107732320814552024368470994843717673780666747942427112823747555111209488817915371028199450928507353189432926730931712808990822791030279071281921676527240189264733218041186261006832925365133678939089569935713530175040513178760077247933065402339006164825552248819436572586057399222641254832982204849137721776650641276858807153128978777672951913990844377478702589172973255150283241787320658188482062478582659808848825548800000000000000000000000000000000000000000000000000000000000000";

    return n < 0 ? null : fs[n]
}