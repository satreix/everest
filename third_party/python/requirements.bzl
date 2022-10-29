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
    'autoflake': {
        "version": "==1.7.7",
        "hashes": [
            "sha256:a9b43d08f8e455824e4f7b3f078399f59ba538ba53872f466c09e55c827773ef",
            "sha256:c8e4fc41aa3eae0f5c94b939e3a3d50923d7a9306786a6cbf4866a077b8f6832",
        ],
    },
    'build': {
        "version": "==0.9.0",
        "hashes": [
            "sha256:1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c",
            "sha256:38a7a2b7a0bdc61a42a0a67509d88c71ecfc37b393baba770fae34e20929ff69",
        ],
        "markers": "python_version >= '3.6'",
    },
    'click': {
        "version": "==8.1.3",
        "hashes": [
            "sha256:7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e",
            "sha256:bb4d8133cb15a609f44e8213d9b391b0809795062913b383c62be0ee95b1db48",
        ],
        "markers": "python_version >= '3.7'",
    },
    'isort': {
        "version": "==5.10.1",
        "hashes": [
            "sha256:6f62d78e2f89b4500b080fe3a81690850cd254227f27f75c3a0c491a1f351ba7",
            "sha256:e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951",
        ],
    },
    'jinja2': {
        "version": "==3.1.2",
        "hashes": [
            "sha256:31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852",
            "sha256:6088930bfe239f0e6710546ab9c19c9ef35e29792895fed6e6e31a023a182a61",
        ],
    },
    'markupsafe': {
        "version": "==2.1.1",
        "hashes": [
            "sha256:0212a68688482dc52b2d45013df70d169f542b7394fc744c02a57374a4207003",
            "sha256:089cf3dbf0cd6c100f02945abeb18484bd1ee57a079aefd52cffd17fba910b88",
            "sha256:10c1bfff05d95783da83491be968e8fe789263689c02724e0c691933c52994f5",
            "sha256:33b74d289bd2f5e527beadcaa3f401e0df0a89927c1559c8566c066fa4248ab7",
            "sha256:3799351e2336dc91ea70b034983ee71cf2f9533cdff7c14c90ea126bfd95d65a",
            "sha256:3ce11ee3f23f79dbd06fb3d63e2f6af7b12db1d46932fe7bd8afa259a5996603",
            "sha256:421be9fbf0ffe9ffd7a378aafebbf6f4602d564d34be190fc19a193232fd12b1",
            "sha256:43093fb83d8343aac0b1baa75516da6092f58f41200907ef92448ecab8825135",
            "sha256:46d00d6cfecdde84d40e572d63735ef81423ad31184100411e6e3388d405e247",
            "sha256:4a33dea2b688b3190ee12bd7cfa29d39c9ed176bda40bfa11099a3ce5d3a7ac6",
            "sha256:4b9fe39a2ccc108a4accc2676e77da025ce383c108593d65cc909add5c3bd601",
            "sha256:56442863ed2b06d19c37f94d999035e15ee982988920e12a5b4ba29b62ad1f77",
            "sha256:671cd1187ed5e62818414afe79ed29da836dde67166a9fac6d435873c44fdd02",
            "sha256:694deca8d702d5db21ec83983ce0bb4b26a578e71fbdbd4fdcd387daa90e4d5e",
            "sha256:6a074d34ee7a5ce3effbc526b7083ec9731bb3cbf921bbe1d3005d4d2bdb3a63",
            "sha256:6d0072fea50feec76a4c418096652f2c3238eaa014b2f94aeb1d56a66b41403f",
            "sha256:6fbf47b5d3728c6aea2abb0589b5d30459e369baa772e0f37a0320185e87c980",
            "sha256:7f91197cc9e48f989d12e4e6fbc46495c446636dfc81b9ccf50bb0ec74b91d4b",
            "sha256:86b1f75c4e7c2ac2ccdaec2b9022845dbb81880ca318bb7a0a01fbf7813e3812",
            "sha256:8dc1c72a69aa7e082593c4a203dcf94ddb74bb5c8a731e4e1eb68d031e8498ff",
            "sha256:8e3dcf21f367459434c18e71b2a9532d96547aef8a871872a5bd69a715c15f96",
            "sha256:8e576a51ad59e4bfaac456023a78f6b5e6e7651dcd383bcc3e18d06f9b55d6d1",
            "sha256:96e37a3dc86e80bf81758c152fe66dbf60ed5eca3d26305edf01892257049925",
            "sha256:97a68e6ada378df82bc9f16b800ab77cbf4b2fada0081794318520138c088e4a",
            "sha256:99a2a507ed3ac881b975a2976d59f38c19386d128e7a9a18b7df6fff1fd4c1d6",
            "sha256:a49907dd8420c5685cfa064a1335b6754b74541bbb3706c259c02ed65b644b3e",
            "sha256:b09bf97215625a311f669476f44b8b318b075847b49316d3e28c08e41a7a573f",
            "sha256:b7bd98b796e2b6553da7225aeb61f447f80a1ca64f41d83612e6139ca5213aa4",
            "sha256:b87db4360013327109564f0e591bd2a3b318547bcef31b468a92ee504d07ae4f",
            "sha256:bcb3ed405ed3222f9904899563d6fc492ff75cce56cba05e32eff40e6acbeaa3",
            "sha256:d4306c36ca495956b6d568d276ac11fdd9c30a36f1b6eb928070dc5360b22e1c",
            "sha256:d5ee4f386140395a2c818d149221149c54849dfcfcb9f1debfe07a8b8bd63f9a",
            "sha256:dda30ba7e87fbbb7eab1ec9f58678558fd9a6b8b853530e176eabd064da81417",
            "sha256:e04e26803c9c3851c931eac40c695602c6295b8d432cbe78609649ad9bd2da8a",
            "sha256:e1c0b87e09fa55a220f058d1d49d3fb8df88fbfab58558f1198e08c1e1de842a",
            "sha256:e72591e9ecd94d7feb70c1cbd7be7b3ebea3f548870aa91e2732960fa4d57a37",
            "sha256:e8c843bbcda3a2f1e3c2ab25913c80a3c5376cd00c6e8c4a86a89a28c8dc5452",
            "sha256:efc1913fd2ca4f334418481c7e595c00aad186563bbc1ec76067848c7ca0a933",
            "sha256:f121a1420d4e173a5d96e47e9a0c0dcff965afdf1626d28de1460815f7c4ee7a",
            "sha256:fc7b548b17d238737688817ab67deebb30e8073c95749d55538ed473130ec0c7",
        ],
        "markers": "python_version >= '3.7'",
    },
    'packaging': {
        "version": "==21.3",
        "hashes": [
            "sha256:dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb",
            "sha256:ef103e05f519cdc783ae24ea4e2e0f508a9c99b2d4969652eed6a2e1ea5bd522",
        ],
        "markers": "python_version >= '3.6'",
    },
    'pep517': {
        "version": "==0.13.0",
        "hashes": [
            "sha256:4ba4446d80aed5b5eac6509ade100bff3e7943a8489de249654a5ae9b33ee35b",
            "sha256:ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59",
        ],
        "markers": "python_version >= '3.6'",
    },
    'pip_tools': {
        "version": "==6.9.0",
        "hashes": [
            "sha256:16ea0ced6a1d8a7dfbd5e14d5bf659acffa63f3efd0702233dc685f066c00a6b",
            "sha256:b4762359978fd81a2b4b666e6dca15266bdc65680d06900c4da34243f35e4b5d",
        ],
    },
    'pyflakes': {
        "version": "==2.5.0",
        "hashes": [
            "sha256:4579f67d887f804e67edb544428f264b7b24f435b263c4614f384135cea553d2",
            "sha256:491feb020dca48ccc562a8c0cbe8df07ee13078df59813b83959cbdada312ea3",
        ],
        "markers": "python_version >= '3.6'",
    },
    'pyparsing': {
        "version": "==3.0.9",
        "hashes": [
            "sha256:2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb",
            "sha256:5026bae9a10eeaefb61dab2f09052b9f4307d44aee4eda64b309723d8d206bbc",
        ],
        "markers": "python_full_version >= '3.6.8'",
    },
    'tomli': {
        "version": "==2.0.1",
        "hashes": [
            "sha256:939de3e7a6161af0c887ef91b7d41a53e7c5a1ca976325f429cb46ea9bc30ecc",
            "sha256:de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f",
        ],
        "markers": "python_version < '3.11'",
    },
    'wheel': {
        "version": "==0.37.1",
        "hashes": [
            "sha256:4bdcd7d840138086126cd09254dc6195fb4fc6f01c050a1d7236f2630db1d22a",
            "sha256:e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4",
        ],
        "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
    },
    'yapf': {
        "version": "==0.32.0",
        "hashes": [
            "sha256:8fea849025584e486fd06d6ba2bed717f396080fd3cc236ba10cb97c4c51cf32",
            "sha256:a3f5085d37ef7e3e004c4ba9f9b3e40c54ff1901cd111f05145ae313a7c67d1b",
        ],
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
    whl_config = dict(_config)
    whl_config.update(whl_library_kwargs)
    for name, pkg in _packages.items():
        full_name = "pypi_{}".format(name)
        requirement = "{name}{version}".format(
            name=full_name,
            version=pkg['version'],
            hashes=''.join(['     --hash={}'.format(h) for h in pkg['hashes']])
        )
        if "markers" in pkg:
            requirement += " ; " + pkg["markers"].replace("'", '"')

        whl_library(
            name = full_name,
            requirement = requirement,
            **whl_config
        )
