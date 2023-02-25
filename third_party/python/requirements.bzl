"""Starlark representation of locked requirements.

Generated by tools/python/pipefile_lock_to_bzl.py from Pipfile.lock."""

load("@rules_python//python/pip_install:pip_repository.bzl", "whl_library")
load("@rules_python//python/pip_install:repositories.bzl", "pip_install_dependencies")

_config = {
    "enable_implicit_namespace_pkgs": False,
    "environment": {},
    "extra_pip_args": [],
    "isolated": True,
    "pip_data_exclude": [],
    "python_interpreter": "python3",
    "quiet": True,
    "repo": "pypi",
    "repo_prefix": "pypi_",
    "timeout": 600,
}

_packages = {
    "autoflake": {
        "hashes": [
            "sha256:143b0843667734af53532c443e950c787316b9b1155b2273558260b44836e8e4",
            "sha256:1ce520131b7f396915242fe91e57221f4d42408529bbe3ae93adafed286591e0",
        ],
        "version": "==2.0.1",
    },
    "babel": {
        "hashes": [
            "sha256:1ad3eca1c885218f6dce2ab67291178944f810a10a9b5f3cb8382a5a232b64fe",
            "sha256:5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6",
        ],
        "markers": "python_version >= '3.6'",
        "version": "==2.11.0",
    },
    "build": {
        "hashes": [
            "sha256:af266720050a66c893a6096a2f410989eeac74ff9a68ba194b3f6473e8e26171",
            "sha256:d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==0.10.0",
    },
    "cel_python": {
        "hashes": [
            "sha256:ac81fab8ba08b633700a45d84905be2863529c6a32935c9da7ef53fc06844f1a",
            "sha256:d3911bb046bc3ed12792bd88ab453f72d98c66923b72a2fa016bcdffd96e2f98",
        ],
        "version": "==0.1.5",
    },
    "certifi": {
        "hashes": [
            "sha256:35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3",
            "sha256:4ad3232f5e926d6718ec31cfc1fcadfde020920e278684144551c91769c7bc18",
        ],
        "markers": "python_version >= '3.6'",
        "version": "==2022.12.7",
    },
    "charset_normalizer": {
        "hashes": [
            "sha256:00d3ffdaafe92a5dc603cb9bd5111aaa36dfa187c8285c543be562e61b755f6b",
            "sha256:024e606be3ed92216e2b6952ed859d86b4cfa52cd5bc5f050e7dc28f9b43ec42",
            "sha256:0298eafff88c99982a4cf66ba2efa1128e4ddaca0b05eec4c456bbc7db691d8d",
            "sha256:02a51034802cbf38db3f89c66fb5d2ec57e6fe7ef2f4a44d070a593c3688667b",
            "sha256:083c8d17153ecb403e5e1eb76a7ef4babfc2c48d58899c98fcaa04833e7a2f9a",
            "sha256:0a11e971ed097d24c534c037d298ad32c6ce81a45736d31e0ff0ad37ab437d59",
            "sha256:0bf2dae5291758b6f84cf923bfaa285632816007db0330002fa1de38bfcb7154",
            "sha256:0c0a590235ccd933d9892c627dec5bc7511ce6ad6c1011fdf5b11363022746c1",
            "sha256:0f438ae3532723fb6ead77e7c604be7c8374094ef4ee2c5e03a3a17f1fca256c",
            "sha256:109487860ef6a328f3eec66f2bf78b0b72400280d8f8ea05f69c51644ba6521a",
            "sha256:11b53acf2411c3b09e6af37e4b9005cba376c872503c8f28218c7243582df45d",
            "sha256:12db3b2c533c23ab812c2b25934f60383361f8a376ae272665f8e48b88e8e1c6",
            "sha256:14e76c0f23218b8f46c4d87018ca2e441535aed3632ca134b10239dfb6dadd6b",
            "sha256:16a8663d6e281208d78806dbe14ee9903715361cf81f6d4309944e4d1e59ac5b",
            "sha256:292d5e8ba896bbfd6334b096e34bffb56161c81408d6d036a7dfa6929cff8783",
            "sha256:2c03cc56021a4bd59be889c2b9257dae13bf55041a3372d3295416f86b295fb5",
            "sha256:2e396d70bc4ef5325b72b593a72c8979999aa52fb8bcf03f701c1b03e1166918",
            "sha256:2edb64ee7bf1ed524a1da60cdcd2e1f6e2b4f66ef7c077680739f1641f62f555",
            "sha256:31a9ddf4718d10ae04d9b18801bd776693487cbb57d74cc3458a7673f6f34639",
            "sha256:356541bf4381fa35856dafa6a965916e54bed415ad8a24ee6de6e37deccf2786",
            "sha256:358a7c4cb8ba9b46c453b1dd8d9e431452d5249072e4f56cfda3149f6ab1405e",
            "sha256:37f8febc8ec50c14f3ec9637505f28e58d4f66752207ea177c1d67df25da5aed",
            "sha256:39049da0ffb96c8cbb65cbf5c5f3ca3168990adf3551bd1dee10c48fce8ae820",
            "sha256:39cf9ed17fe3b1bc81f33c9ceb6ce67683ee7526e65fde1447c772afc54a1bb8",
            "sha256:3ae1de54a77dc0d6d5fcf623290af4266412a7c4be0b1ff7444394f03f5c54e3",
            "sha256:3b590df687e3c5ee0deef9fc8c547d81986d9a1b56073d82de008744452d6541",
            "sha256:3e45867f1f2ab0711d60c6c71746ac53537f1684baa699f4f668d4c6f6ce8e14",
            "sha256:3fc1c4a2ffd64890aebdb3f97e1278b0cc72579a08ca4de8cd2c04799a3a22be",
            "sha256:4457ea6774b5611f4bed5eaa5df55f70abde42364d498c5134b7ef4c6958e20e",
            "sha256:44ba614de5361b3e5278e1241fda3dc1838deed864b50a10d7ce92983797fa76",
            "sha256:4a8fcf28c05c1f6d7e177a9a46a1c52798bfe2ad80681d275b10dcf317deaf0b",
            "sha256:4b0d02d7102dd0f997580b51edc4cebcf2ab6397a7edf89f1c73b586c614272c",
            "sha256:502218f52498a36d6bf5ea77081844017bf7982cdbe521ad85e64cabee1b608b",
            "sha256:503e65837c71b875ecdd733877d852adbc465bd82c768a067badd953bf1bc5a3",
            "sha256:5995f0164fa7df59db4746112fec3f49c461dd6b31b841873443bdb077c13cfc",
            "sha256:59e5686dd847347e55dffcc191a96622f016bc0ad89105e24c14e0d6305acbc6",
            "sha256:601f36512f9e28f029d9481bdaf8e89e5148ac5d89cffd3b05cd533eeb423b59",
            "sha256:608862a7bf6957f2333fc54ab4399e405baad0163dc9f8d99cb236816db169d4",
            "sha256:62595ab75873d50d57323a91dd03e6966eb79c41fa834b7a1661ed043b2d404d",
            "sha256:70990b9c51340e4044cfc394a81f614f3f90d41397104d226f21e66de668730d",
            "sha256:71140351489970dfe5e60fc621ada3e0f41104a5eddaca47a7acb3c1b851d6d3",
            "sha256:72966d1b297c741541ca8cf1223ff262a6febe52481af742036a0b296e35fa5a",
            "sha256:74292fc76c905c0ef095fe11e188a32ebd03bc38f3f3e9bcb85e4e6db177b7ea",
            "sha256:761e8904c07ad053d285670f36dd94e1b6ab7f16ce62b9805c475b7aa1cffde6",
            "sha256:772b87914ff1152b92a197ef4ea40efe27a378606c39446ded52c8f80f79702e",
            "sha256:79909e27e8e4fcc9db4addea88aa63f6423ebb171db091fb4373e3312cb6d603",
            "sha256:7e189e2e1d3ed2f4aebabd2d5b0f931e883676e51c7624826e0a4e5fe8a0bf24",
            "sha256:7eb33a30d75562222b64f569c642ff3dc6689e09adda43a082208397f016c39a",
            "sha256:81d6741ab457d14fdedc215516665050f3822d3e56508921cc7239f8c8e66a58",
            "sha256:8499ca8f4502af841f68135133d8258f7b32a53a1d594aa98cc52013fff55678",
            "sha256:84c3990934bae40ea69a82034912ffe5a62c60bbf6ec5bc9691419641d7d5c9a",
            "sha256:87701167f2a5c930b403e9756fab1d31d4d4da52856143b609e30a1ce7160f3c",
            "sha256:88600c72ef7587fe1708fd242b385b6ed4b8904976d5da0893e31df8b3480cb6",
            "sha256:8ac7b6a045b814cf0c47f3623d21ebd88b3e8cf216a14790b455ea7ff0135d18",
            "sha256:8b8af03d2e37866d023ad0ddea594edefc31e827fee64f8de5611a1dbc373174",
            "sha256:8c7fe7afa480e3e82eed58e0ca89f751cd14d767638e2550c77a92a9e749c317",
            "sha256:8eade758719add78ec36dc13201483f8e9b5d940329285edcd5f70c0a9edbd7f",
            "sha256:911d8a40b2bef5b8bbae2e36a0b103f142ac53557ab421dc16ac4aafee6f53dc",
            "sha256:93ad6d87ac18e2a90b0fe89df7c65263b9a99a0eb98f0a3d2e079f12a0735837",
            "sha256:95dea361dd73757c6f1c0a1480ac499952c16ac83f7f5f4f84f0658a01b8ef41",
            "sha256:9ab77acb98eba3fd2a85cd160851816bfce6871d944d885febf012713f06659c",
            "sha256:9cb3032517f1627cc012dbc80a8ec976ae76d93ea2b5feaa9d2a5b8882597579",
            "sha256:9cf4e8ad252f7c38dd1f676b46514f92dc0ebeb0db5552f5f403509705e24753",
            "sha256:9d9153257a3f70d5f69edf2325357251ed20f772b12e593f3b3377b5f78e7ef8",
            "sha256:a152f5f33d64a6be73f1d30c9cc82dfc73cec6477ec268e7c6e4c7d23c2d2291",
            "sha256:a16418ecf1329f71df119e8a65f3aa68004a3f9383821edcb20f0702934d8087",
            "sha256:a60332922359f920193b1d4826953c507a877b523b2395ad7bc716ddd386d866",
            "sha256:a8d0fc946c784ff7f7c3742310cc8a57c5c6dc31631269876a88b809dbeff3d3",
            "sha256:ab5de034a886f616a5668aa5d098af2b5385ed70142090e2a31bcbd0af0fdb3d",
            "sha256:c22d3fe05ce11d3671297dc8973267daa0f938b93ec716e12e0f6dee81591dc1",
            "sha256:c2ac1b08635a8cd4e0cbeaf6f5e922085908d48eb05d44c5ae9eabab148512ca",
            "sha256:c512accbd6ff0270939b9ac214b84fb5ada5f0409c44298361b2f5e13f9aed9e",
            "sha256:c75ffc45f25324e68ab238cb4b5c0a38cd1c3d7f1fb1f72b5541de469e2247db",
            "sha256:c95a03c79bbe30eec3ec2b7f076074f4281526724c8685a42872974ef4d36b72",
            "sha256:cadaeaba78750d58d3cc6ac4d1fd867da6fc73c88156b7a3212a3cd4819d679d",
            "sha256:cd6056167405314a4dc3c173943f11249fa0f1b204f8b51ed4bde1a9cd1834dc",
            "sha256:db72b07027db150f468fbada4d85b3b2729a3db39178abf5c543b784c1254539",
            "sha256:df2c707231459e8a4028eabcd3cfc827befd635b3ef72eada84ab13b52e1574d",
            "sha256:e62164b50f84e20601c1ff8eb55620d2ad25fb81b59e3cd776a1902527a788af",
            "sha256:e696f0dd336161fca9adbb846875d40752e6eba585843c768935ba5c9960722b",
            "sha256:eaa379fcd227ca235d04152ca6704c7cb55564116f8bc52545ff357628e10602",
            "sha256:ebea339af930f8ca5d7a699b921106c6e29c617fe9606fa7baa043c1cdae326f",
            "sha256:f4c39b0e3eac288fedc2b43055cfc2ca7a60362d0e5e87a637beac5d801ef478",
            "sha256:f5057856d21e7586765171eac8b9fc3f7d44ef39425f85dbcccb13b3ebea806c",
            "sha256:f6f45710b4459401609ebebdbcfb34515da4fc2aa886f95107f556ac69a9147e",
            "sha256:f97e83fa6c25693c7a35de154681fcc257c1c41b38beb0304b9c4d2d9e164479",
            "sha256:f9d0c5c045a3ca9bedfc35dca8526798eb91a07aa7a2c0fee134c6c6f321cbd7",
            "sha256:ff6f3db31555657f3163b15a6b7c6938d08df7adbfc9dd13d9d19edad678f1e8",
        ],
        "version": "==3.0.1",
    },
    "click": {
        "hashes": [
            "sha256:7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e",
            "sha256:bb4d8133cb15a609f44e8213d9b391b0809795062913b383c62be0ee95b1db48",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==8.1.3",
    },
    "idna": {
        "hashes": [
            "sha256:814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4",
            "sha256:90b77e79eaa3eba6de819a0c442c0b4ceefc341a7a2ab77d7562bf49f425c5c2",
        ],
        "markers": "python_version >= '3.5'",
        "version": "==3.4",
    },
    "isort": {
        "hashes": [
            "sha256:8bef7dde241278824a6d83f44a544709b065191b95b6e50894bdc722fcba0504",
            "sha256:f84c2818376e66cf843d497486ea8fed8700b340f308f076c6fb1229dff318b6",
        ],
        "version": "==5.12.0",
    },
    "jinja2": {
        "hashes": [
            "sha256:31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852",
            "sha256:6088930bfe239f0e6710546ab9c19c9ef35e29792895fed6e6e31a023a182a61",
        ],
        "version": "==3.1.2",
    },
    "jmespath": {
        "hashes": [
            "sha256:02e2e4cc71b5bcab88332eebf907519190dd9e6e82107fa7f83b1003a6252980",
            "sha256:90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==1.0.1",
    },
    "lark_parser": {
        "hashes": [
            "sha256:0eaf30cb5ba787fe404d73a7d6e61df97b21d5a63ac26c5008c78a494373c675",
            "sha256:15967db1f1214013dca65b1180745047b9be457d73da224fcda3d9dd4e96a138",
        ],
        "version": "==0.12.0",
    },
    "markupsafe": {
        "hashes": [
            "sha256:0576fe974b40a400449768941d5d0858cc624e3249dfd1e0c33674e5c7ca7aed",
            "sha256:085fd3201e7b12809f9e6e9bc1e5c96a368c8523fad5afb02afe3c051ae4afcc",
            "sha256:090376d812fb6ac5f171e5938e82e7f2d7adc2b629101cec0db8b267815c85e2",
            "sha256:0b462104ba25f1ac006fdab8b6a01ebbfbce9ed37fd37fd4acd70c67c973e460",
            "sha256:137678c63c977754abe9086a3ec011e8fd985ab90631145dfb9294ad09c102a7",
            "sha256:1bea30e9bf331f3fef67e0a3877b2288593c98a21ccb2cf29b74c581a4eb3af0",
            "sha256:22152d00bf4a9c7c83960521fc558f55a1adbc0631fbb00a9471e097b19d72e1",
            "sha256:22731d79ed2eb25059ae3df1dfc9cb1546691cc41f4e3130fe6bfbc3ecbbecfa",
            "sha256:2298c859cfc5463f1b64bd55cb3e602528db6fa0f3cfd568d3605c50678f8f03",
            "sha256:28057e985dace2f478e042eaa15606c7efccb700797660629da387eb289b9323",
            "sha256:2e7821bffe00aa6bd07a23913b7f4e01328c3d5cc0b40b36c0bd81d362faeb65",
            "sha256:2ec4f2d48ae59bbb9d1f9d7efb9236ab81429a764dedca114f5fdabbc3788013",
            "sha256:340bea174e9761308703ae988e982005aedf427de816d1afe98147668cc03036",
            "sha256:40627dcf047dadb22cd25ea7ecfe9cbf3bbbad0482ee5920b582f3809c97654f",
            "sha256:40dfd3fefbef579ee058f139733ac336312663c6706d1163b82b3003fb1925c4",
            "sha256:4cf06cdc1dda95223e9d2d3c58d3b178aa5dacb35ee7e3bbac10e4e1faacb419",
            "sha256:50c42830a633fa0cf9e7d27664637532791bfc31c731a87b202d2d8ac40c3ea2",
            "sha256:55f44b440d491028addb3b88f72207d71eeebfb7b5dbf0643f7c023ae1fba619",
            "sha256:608e7073dfa9e38a85d38474c082d4281f4ce276ac0010224eaba11e929dd53a",
            "sha256:63ba06c9941e46fa389d389644e2d8225e0e3e5ebcc4ff1ea8506dce646f8c8a",
            "sha256:65608c35bfb8a76763f37036547f7adfd09270fbdbf96608be2bead319728fcd",
            "sha256:665a36ae6f8f20a4676b53224e33d456a6f5a72657d9c83c2aa00765072f31f7",
            "sha256:6d6607f98fcf17e534162f0709aaad3ab7a96032723d8ac8750ffe17ae5a0666",
            "sha256:7313ce6a199651c4ed9d7e4cfb4aa56fe923b1adf9af3b420ee14e6d9a73df65",
            "sha256:7668b52e102d0ed87cb082380a7e2e1e78737ddecdde129acadb0eccc5423859",
            "sha256:7df70907e00c970c60b9ef2938d894a9381f38e6b9db73c5be35e59d92e06625",
            "sha256:7e007132af78ea9df29495dbf7b5824cb71648d7133cf7848a2a5dd00d36f9ff",
            "sha256:835fb5e38fd89328e9c81067fd642b3593c33e1e17e2fdbf77f5676abb14a156",
            "sha256:8bca7e26c1dd751236cfb0c6c72d4ad61d986e9a41bbf76cb445f69488b2a2bd",
            "sha256:8db032bf0ce9022a8e41a22598eefc802314e81b879ae093f36ce9ddf39ab1ba",
            "sha256:99625a92da8229df6d44335e6fcc558a5037dd0a760e11d84be2260e6f37002f",
            "sha256:9cad97ab29dfc3f0249b483412c85c8ef4766d96cdf9dcf5a1e3caa3f3661cf1",
            "sha256:a4abaec6ca3ad8660690236d11bfe28dfd707778e2442b45addd2f086d6ef094",
            "sha256:a6e40afa7f45939ca356f348c8e23048e02cb109ced1eb8420961b2f40fb373a",
            "sha256:a6f2fcca746e8d5910e18782f976489939d54a91f9411c32051b4aab2bd7c513",
            "sha256:a806db027852538d2ad7555b203300173dd1b77ba116de92da9afbc3a3be3eed",
            "sha256:abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad678306986b09450d",
            "sha256:b8526c6d437855442cdd3d87eede9c425c4445ea011ca38d937db299382e6fa3",
            "sha256:bb06feb762bade6bf3c8b844462274db0c76acc95c52abe8dbed28ae3d44a147",
            "sha256:c0a33bc9f02c2b17c3ea382f91b4db0e6cde90b63b296422a939886a7a80de1c",
            "sha256:c4a549890a45f57f1ebf99c067a4ad0cb423a05544accaf2b065246827ed9603",
            "sha256:ca244fa73f50a800cf8c3ebf7fd93149ec37f5cb9596aa8873ae2c1d23498601",
            "sha256:cf877ab4ed6e302ec1d04952ca358b381a882fbd9d1b07cccbfd61783561f98a",
            "sha256:d9d971ec1e79906046aa3ca266de79eac42f1dbf3612a05dc9368125952bd1a1",
            "sha256:da25303d91526aac3672ee6d49a2f3db2d9502a4a60b55519feb1a4c7714e07d",
            "sha256:e55e40ff0cc8cc5c07996915ad367fa47da6b3fc091fdadca7f5403239c5fec3",
            "sha256:f03a532d7dee1bed20bc4884194a16160a2de9ffc6354b3878ec9682bb623c54",
            "sha256:f1cd098434e83e656abf198f103a8207a8187c0fc110306691a2e94a78d0abb2",
            "sha256:f2bfb563d0211ce16b63c7cb9395d2c682a23187f54c3d79bfec33e6705473c6",
            "sha256:f8ffb705ffcf5ddd0e80b65ddf7bed7ee4f5a441ea7d3419e861a12eaf41af58",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==2.1.2",
    },
    "packaging": {
        "hashes": [
            "sha256:714ac14496c3e68c99c29b00845f7a2b85f3bb6f1078fd9f72fd20f0570002b2",
            "sha256:b6ad297f8907de0fa2fe1ccbd26fdaf387f5f47c7275fedf8cce89f99446cf97",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==23.0",
    },
    "pip_tools": {
        "hashes": [
            "sha256:6a51f4fd67140d5e83703ebfa9610fb61398727151f56a1be02a972d062e4679",
            "sha256:8b903696df4598b10d469026ef9995c5f9a874b416e88e7a214884ebe4a70245",
        ],
        "version": "==6.12.2",
    },
    "pyflakes": {
        "hashes": [
            "sha256:ec55bf7fe21fff7f1ad2f7da62363d749e2a470500eab1b555334b67aa1ef8cf",
            "sha256:ec8b276a6b60bd80defed25add7e439881c19e64850afd9b346283d4165fd0fd",
        ],
        "markers": "python_version >= '3.6'",
        "version": "==3.0.1",
    },
    "pyproject_hooks": {
        "hashes": [
            "sha256:283c11acd6b928d2f6a7c73fa0d01cb2bdc5f07c57a2eeb6e83d5e56b97976f8",
            "sha256:f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==1.0.0",
    },
    "python_dateutil": {
        "hashes": [
            "sha256:0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86",
            "sha256:961d03dc3453ebbc59dbdea9e4e11c5651520a876d0f4db161e8674aae935da9",
        ],
        "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
        "version": "==2.8.2",
    },
    "pytz": {
        "hashes": [
            "sha256:01a0681c4b9684a28304615eba55d1ab31ae00bf68ec157ec3708a8182dbbcd0",
            "sha256:78f4f37d8198e0627c5f1143240bb0206b8691d8d7ac6d78fee88b78733f8c4a",
        ],
        "version": "==2022.7.1",
    },
    "pyyaml": {
        "hashes": [
            "sha256:01b45c0191e6d66c470b6cf1b9531a771a83c1c4208272ead47a3ae4f2f603bf",
            "sha256:0283c35a6a9fbf047493e3a0ce8d79ef5030852c51e9d911a27badfde0605293",
            "sha256:055d937d65826939cb044fc8c9b08889e8c743fdc6a32b33e2390f66013e449b",
            "sha256:07751360502caac1c067a8132d150cf3d61339af5691fe9e87803040dbc5db57",
            "sha256:0b4624f379dab24d3725ffde76559cff63d9ec94e1736b556dacdfebe5ab6d4b",
            "sha256:0ce82d761c532fe4ec3f87fc45688bdd3a4c1dc5e0b4a19814b9009a29baefd4",
            "sha256:1e4747bc279b4f613a09eb64bba2ba602d8a6664c6ce6396a4d0cd413a50ce07",
            "sha256:213c60cd50106436cc818accf5baa1aba61c0189ff610f64f4a3e8c6726218ba",
            "sha256:231710d57adfd809ef5d34183b8ed1eeae3f76459c18fb4a0b373ad56bedcdd9",
            "sha256:277a0ef2981ca40581a47093e9e2d13b3f1fbbeffae064c1d21bfceba2030287",
            "sha256:2cd5df3de48857ed0544b34e2d40e9fac445930039f3cfe4bcc592a1f836d513",
            "sha256:40527857252b61eacd1d9af500c3337ba8deb8fc298940291486c465c8b46ec0",
            "sha256:432557aa2c09802be39460360ddffd48156e30721f5e8d917f01d31694216782",
            "sha256:473f9edb243cb1935ab5a084eb238d842fb8f404ed2193a915d1784b5a6b5fc0",
            "sha256:48c346915c114f5fdb3ead70312bd042a953a8ce5c7106d5bfb1a5254e47da92",
            "sha256:50602afada6d6cbfad699b0c7bb50d5ccffa7e46a3d738092afddc1f9758427f",
            "sha256:68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2",
            "sha256:77f396e6ef4c73fdc33a9157446466f1cff553d979bd00ecb64385760c6babdc",
            "sha256:81957921f441d50af23654aa6c5e5eaf9b06aba7f0a19c18a538dc7ef291c5a1",
            "sha256:819b3830a1543db06c4d4b865e70ded25be52a2e0631ccd2f6a47a2822f2fd7c",
            "sha256:897b80890765f037df3403d22bab41627ca8811ae55e9a722fd0392850ec4d86",
            "sha256:98c4d36e99714e55cfbaaee6dd5badbc9a1ec339ebfc3b1f52e293aee6bb71a4",
            "sha256:9df7ed3b3d2e0ecfe09e14741b857df43adb5a3ddadc919a2d94fbdf78fea53c",
            "sha256:9fa600030013c4de8165339db93d182b9431076eb98eb40ee068700c9c813e34",
            "sha256:a80a78046a72361de73f8f395f1f1e49f956c6be882eed58505a15f3e430962b",
            "sha256:afa17f5bc4d1b10afd4466fd3a44dc0e245382deca5b3c353d8b757f9e3ecb8d",
            "sha256:b3d267842bf12586ba6c734f89d1f5b871df0273157918b0ccefa29deb05c21c",
            "sha256:b5b9eccad747aabaaffbc6064800670f0c297e52c12754eb1d976c57e4f74dcb",
            "sha256:bfaef573a63ba8923503d27530362590ff4f576c626d86a9fed95822a8255fd7",
            "sha256:c5687b8d43cf58545ade1fe3e055f70eac7a5a1a0bf42824308d868289a95737",
            "sha256:cba8c411ef271aa037d7357a2bc8f9ee8b58b9965831d9e51baf703280dc73d3",
            "sha256:d15a181d1ecd0d4270dc32edb46f7cb7733c7c508857278d3d378d14d606db2d",
            "sha256:d4b0ba9512519522b118090257be113b9468d804b19d63c71dbcf4a48fa32358",
            "sha256:d4db7c7aef085872ef65a8fd7d6d09a14ae91f691dec3e87ee5ee0539d516f53",
            "sha256:d4eccecf9adf6fbcc6861a38015c2a64f38b9d94838ac1810a9023a0609e1b78",
            "sha256:d67d839ede4ed1b28a4e8909735fc992a923cdb84e618544973d7dfc71540803",
            "sha256:daf496c58a8c52083df09b80c860005194014c3698698d1a57cbcfa182142a3a",
            "sha256:dbad0e9d368bb989f4515da330b88a057617d16b6a8245084f1b05400f24609f",
            "sha256:e61ceaab6f49fb8bdfaa0f92c4b57bcfbea54c09277b1b4f7ac376bfb7a7c174",
            "sha256:f84fbc98b019fef2ee9a1cb3ce93e3187a6df0b2538a651bfb890254ba9f90b5",
        ],
        "markers": "python_version >= '3.6'",
        "version": "==6.0",
    },
    "requests": {
        "hashes": [
            "sha256:64299f4909223da747622c030b781c0d7811e359c37124b4bd368fb8c6518baa",
            "sha256:98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf",
        ],
        "markers": "python_version >= '3.7' and python_version < '4'",
        "version": "==2.28.2",
    },
    "six": {
        "hashes": [
            "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926",
            "sha256:8abb2f1d86890a2dfb989f9a77cfcfd3e47c2a354b01111771326f8aa26e0254",
        ],
        "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
        "version": "==1.16.0",
    },
    "tomli": {
        "hashes": [
            "sha256:939de3e7a6161af0c887ef91b7d41a53e7c5a1ca976325f429cb46ea9bc30ecc",
            "sha256:de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f",
        ],
        "markers": "python_version < '3.11'",
        "version": "==2.0.1",
    },
    "urllib3": {
        "hashes": [
            "sha256:076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72",
            "sha256:75edcdc2f7d85b137124a6c3c9fc3933cdeaa12ecb9a6a959f22797a0feca7e1",
        ],
        "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4, 3.5'",
        "version": "==1.26.14",
    },
    "wheel": {
        "hashes": [
            "sha256:965f5259b566725405b05e7cf774052044b1ed30119b5d586b2703aafe8719ac",
            "sha256:b60533f3f5d530e971d6737ca6d58681ee434818fab630c83a734bb10c083ce8",
        ],
        "markers": "python_version >= '3.7'",
        "version": "==0.38.4",
    },
    "yapf": {
        "hashes": [
            "sha256:8fea849025584e486fd06d6ba2bed717f396080fd3cc236ba10cb97c4c51cf32",
            "sha256:a3f5085d37ef7e3e004c4ba9f9b3e40c54ff1901cd111f05145ae313a7c67d1b",
        ],
        "version": "==0.32.0",
    },
}

all_requirements = ["@pypi_{}//:pkg".format(name) for name in _packages.keys()]

all_whl_requirements = ["@pypi_{}//:whl".format(name) for name in _packages.keys()]

def _clean_name(name):
    return name.replace("-", "_").replace(".", "_").lower()

def requirement(name):
    return "@pypi_" + _clean_name(name) + "//:pkg"

def whl_requirement(name):
    return "@pypi_" + _clean_name(name) + "//:whl"

def data_requirement(name):
    return "@pypi_" + _clean_name(name) + "//:data"

def dist_info_requirement(name):
    return "@pypi_" + _clean_name(name) + "//:dist_info"

def entry_point(pkg, script = None):
    if not script:
        script = pkg
    return "@pypi_" + _clean_name(pkg) + "//:rules_python_wheel_entry_point_" + script

def install_deps(**whl_library_kwargs):
    pip_install_dependencies()
    whl_config = dict(_config)
    whl_config.update(whl_library_kwargs)
    for name, pkg in _packages.items():
        requirement = "{name}{version}{hashes}".format(
            name = name,
            version = pkg["version"],
            hashes = "".join(["     --hash={}".format(h) for h in pkg["hashes"]]),
        )
        if "markers" in pkg:
            requirement += " ; " + pkg["markers"].replace("'", '"')
        whl_library(
            name = "pypi_{}".format(name),
            requirement = requirement,
            **whl_config
        )
