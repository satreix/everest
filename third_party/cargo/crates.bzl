"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__askama__0_11_1",
        url = "https://crates.io/api/v1/crates/askama/0.11.1/download",
        type = "tar.gz",
        sha256 = "fb98f10f371286b177db5eeb9a6e5396609555686a35e1d4f7b9a9c6d8af0139",
        strip_prefix = "askama-0.11.1",
        build_file = Label("//third_party/cargo/remote:BUILD.askama-0.11.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__askama_derive__0_11_2",
        url = "https://crates.io/api/v1/crates/askama_derive/0.11.2/download",
        type = "tar.gz",
        sha256 = "87bf87e6e8b47264efa9bde63d6225c6276a52e05e91bf37eaa8afd0032d6b71",
        strip_prefix = "askama_derive-0.11.2",
        build_file = Label("//third_party/cargo/remote:BUILD.askama_derive-0.11.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__askama_escape__0_10_3",
        url = "https://crates.io/api/v1/crates/askama_escape/0.10.3/download",
        type = "tar.gz",
        sha256 = "619743e34b5ba4e9703bba34deac3427c72507c7159f5fd030aea8cac0cfe341",
        strip_prefix = "askama_escape-0.10.3",
        build_file = Label("//third_party/cargo/remote:BUILD.askama_escape-0.10.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__askama_shared__0_12_2",
        url = "https://crates.io/api/v1/crates/askama_shared/0.12.2/download",
        type = "tar.gz",
        sha256 = "bf722b94118a07fcbc6640190f247334027685d4e218b794dbfe17c32bf38ed0",
        strip_prefix = "askama_shared-0.12.2",
        build_file = Label("//third_party/cargo/remote:BUILD.askama_shared-0.12.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__atty__0_2_14",
        url = "https://crates.io/api/v1/crates/atty/0.2.14/download",
        type = "tar.gz",
        sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8",
        strip_prefix = "atty-0.2.14",
        build_file = Label("//third_party/cargo/remote:BUILD.atty-0.2.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__0_1_8",
        url = "https://crates.io/api/v1/crates/autocfg/0.1.8/download",
        type = "tar.gz",
        sha256 = "0dde43e75fd43e8a1bf86103336bc699aa8d17ad1be60c76c0bdfd4828e19b78",
        strip_prefix = "autocfg-0.1.8",
        build_file = Label("//third_party/cargo/remote:BUILD.autocfg-0.1.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_1_0",
        url = "https://crates.io/api/v1/crates/autocfg/1.1.0/download",
        type = "tar.gz",
        sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa",
        strip_prefix = "autocfg-1.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.autocfg-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_9_3",
        url = "https://crates.io/api/v1/crates/base64/0.9.3/download",
        type = "tar.gz",
        sha256 = "489d6c0ed21b11d038c31b6ceccca973e65d73ba3bd8ecb9a2babf5546164643",
        strip_prefix = "base64-0.9.3",
        build_file = Label("//third_party/cargo/remote:BUILD.base64-0.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//third_party/cargo/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__byteorder__1_4_3",
        url = "https://crates.io/api/v1/crates/byteorder/1.4.3/download",
        type = "tar.gz",
        sha256 = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610",
        strip_prefix = "byteorder-1.4.3",
        build_file = Label("//third_party/cargo/remote:BUILD.byteorder-1.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//third_party/cargo/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__chrono__0_4_19",
        url = "https://crates.io/api/v1/crates/chrono/0.4.19/download",
        type = "tar.gz",
        sha256 = "670ad68c9088c2a963aaa298cb369688cf3f9465ce5e2d4ca10e6e0098a1ce73",
        strip_prefix = "chrono-0.4.19",
        build_file = Label("//third_party/cargo/remote:BUILD.chrono-0.4.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap__3_1_18",
        url = "https://crates.io/api/v1/crates/clap/3.1.18/download",
        type = "tar.gz",
        sha256 = "d2dbdf4bdacb33466e854ce889eee8dfd5729abf7ccd7664d0a2d60cd384440b",
        strip_prefix = "clap-3.1.18",
        build_file = Label("//third_party/cargo/remote:BUILD.clap-3.1.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap_lex__0_2_0",
        url = "https://crates.io/api/v1/crates/clap_lex/0.2.0/download",
        type = "tar.gz",
        sha256 = "a37c35f1112dad5e6e0b1adaff798507497a18fceeb30cceb3bae7d1427b9213",
        strip_prefix = "clap_lex-0.2.0",
        build_file = Label("//third_party/cargo/remote:BUILD.clap_lex-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cloudabi__0_0_3",
        url = "https://crates.io/api/v1/crates/cloudabi/0.0.3/download",
        type = "tar.gz",
        sha256 = "ddfc5b9aa5d4507acaf872de71051dfd0e309860e88966e1051e462a077aac4f",
        strip_prefix = "cloudabi-0.0.3",
        build_file = Label("//third_party/cargo/remote:BUILD.cloudabi-0.0.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_channel__0_5_4",
        url = "https://crates.io/api/v1/crates/crossbeam-channel/0.5.4/download",
        type = "tar.gz",
        sha256 = "5aaa7bd5fb665c6864b5f963dd9097905c54125909c7aa94c9e18507cdbe6c53",
        strip_prefix = "crossbeam-channel-0.5.4",
        build_file = Label("//third_party/cargo/remote:BUILD.crossbeam-channel-0.5.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_deque__0_8_1",
        url = "https://crates.io/api/v1/crates/crossbeam-deque/0.8.1/download",
        type = "tar.gz",
        sha256 = "6455c0ca19f0d2fbf751b908d5c55c1f5cbc65e03c4225427254b46890bdde1e",
        strip_prefix = "crossbeam-deque-0.8.1",
        build_file = Label("//third_party/cargo/remote:BUILD.crossbeam-deque-0.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_epoch__0_9_8",
        url = "https://crates.io/api/v1/crates/crossbeam-epoch/0.9.8/download",
        type = "tar.gz",
        sha256 = "1145cf131a2c6ba0615079ab6a638f7e1973ac9c2634fcbeaaad6114246efe8c",
        strip_prefix = "crossbeam-epoch-0.9.8",
        build_file = Label("//third_party/cargo/remote:BUILD.crossbeam-epoch-0.9.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__crossbeam_utils__0_8_8",
        url = "https://crates.io/api/v1/crates/crossbeam-utils/0.8.8/download",
        type = "tar.gz",
        sha256 = "0bf124c720b7686e3c2663cf54062ab0f68a88af2fb6a030e87e30bf721fcb38",
        strip_prefix = "crossbeam-utils-0.8.8",
        build_file = Label("//third_party/cargo/remote:BUILD.crossbeam-utils-0.8.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dirs_next__2_0_0",
        url = "https://crates.io/api/v1/crates/dirs-next/2.0.0/download",
        type = "tar.gz",
        sha256 = "b98cf8ebf19c3d1b223e151f99a4f9f0690dca41414773390fc824184ac833e1",
        strip_prefix = "dirs-next-2.0.0",
        build_file = Label("//third_party/cargo/remote:BUILD.dirs-next-2.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dirs_sys_next__0_1_2",
        url = "https://crates.io/api/v1/crates/dirs-sys-next/0.1.2/download",
        type = "tar.gz",
        sha256 = "4ebda144c4fe02d1f7ea1a7d9641b6fc6b580adcfa024ae48797ecdeb6825b4d",
        strip_prefix = "dirs-sys-next-0.1.2",
        build_file = Label("//third_party/cargo/remote:BUILD.dirs-sys-next-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_6_1",
        url = "https://crates.io/api/v1/crates/either/1.6.1/download",
        type = "tar.gz",
        sha256 = "e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457",
        strip_prefix = "either-1.6.1",
        build_file = Label("//third_party/cargo/remote:BUILD.either-1.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fuchsia_cprng__0_1_1",
        url = "https://crates.io/api/v1/crates/fuchsia-cprng/0.1.1/download",
        type = "tar.gz",
        sha256 = "a06f77d526c1a601b7c4cdd98f54b5eaabffc14d5f2f0296febdc7f357c6d3ba",
        strip_prefix = "fuchsia-cprng-0.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.fuchsia-cprng-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_2_6",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.6/download",
        type = "tar.gz",
        sha256 = "9be70c98951c83b8d2f8f60d7065fa6d5146873094452a1008da8c2f1e4205ad",
        strip_prefix = "getrandom-0.2.6",
        build_file = Label("//third_party/cargo/remote:BUILD.getrandom-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hashbrown__0_11_2",
        url = "https://crates.io/api/v1/crates/hashbrown/0.11.2/download",
        type = "tar.gz",
        sha256 = "ab5ef0d4909ef3724cc8cce6ccc8572c5c817592e9285f5464f8e86f8bd3726e",
        strip_prefix = "hashbrown-0.11.2",
        build_file = Label("//third_party/cargo/remote:BUILD.hashbrown-0.11.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_1_19",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.1.19/download",
        type = "tar.gz",
        sha256 = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33",
        strip_prefix = "hermit-abi-0.1.19",
        build_file = Label("//third_party/cargo/remote:BUILD.hermit-abi-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__httparse__1_7_1",
        url = "https://crates.io/api/v1/crates/httparse/1.7.1/download",
        type = "tar.gz",
        sha256 = "496ce29bb5a52785b44e0f7ca2847ae0bb839c9bd28f69acac9b99d461c0c04c",
        strip_prefix = "httparse-1.7.1",
        build_file = Label("//third_party/cargo/remote:BUILD.httparse-1.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humansize__1_1_1",
        url = "https://crates.io/api/v1/crates/humansize/1.1.1/download",
        type = "tar.gz",
        sha256 = "02296996cb8796d7c6e3bc2d9211b7802812d36999a51bb754123ead7d37d026",
        strip_prefix = "humansize-1.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.humansize-1.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hyper__0_10_16",
        url = "https://crates.io/api/v1/crates/hyper/0.10.16/download",
        type = "tar.gz",
        sha256 = "0a0652d9a2609a968c14be1a9ea00bf4b1d64e2e1f53a1b51b6fff3a6e829273",
        strip_prefix = "hyper-0.10.16",
        build_file = Label("//third_party/cargo/remote:BUILD.hyper-0.10.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__idna__0_1_5",
        url = "https://crates.io/api/v1/crates/idna/0.1.5/download",
        type = "tar.gz",
        sha256 = "38f09e0f0b1fb55fdee1f17470ad800da77af5186a1a76c026b679358b7e844e",
        strip_prefix = "idna-0.1.5",
        build_file = Label("//third_party/cargo/remote:BUILD.idna-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_8_2",
        url = "https://crates.io/api/v1/crates/indexmap/1.8.2/download",
        type = "tar.gz",
        sha256 = "e6012d540c5baa3589337a98ce73408de9b5a25ec9fc2c6fd6be8f0d39e0ca5a",
        strip_prefix = "indexmap-1.8.2",
        build_file = Label("//third_party/cargo/remote:BUILD.indexmap-1.8.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indoc__1_0_6",
        url = "https://crates.io/api/v1/crates/indoc/1.0.6/download",
        type = "tar.gz",
        sha256 = "05a0bd019339e5d968b37855180087b7b9d512c5046fbd244cf8c95687927d6e",
        strip_prefix = "indoc-1.0.6",
        build_file = Label("//third_party/cargo/remote:BUILD.indoc-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__iron__0_6_1",
        url = "https://crates.io/api/v1/crates/iron/0.6.1/download",
        type = "tar.gz",
        sha256 = "c6d308ca2d884650a8bf9ed2ff4cb13fbb2207b71f64cda11dc9b892067295e8",
        strip_prefix = "iron-0.6.1",
        build_file = Label("//third_party/cargo/remote:BUILD.iron-0.6.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__iron_slog__0_0_2",
        url = "https://crates.io/api/v1/crates/iron-slog/0.0.2/download",
        type = "tar.gz",
        sha256 = "41941d50d2c936a4c609f457ae8821f9888aa6ed8641f5d6e5d9b22e15041255",
        strip_prefix = "iron-slog-0.0.2",
        build_file = Label("//third_party/cargo/remote:BUILD.iron-slog-0.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__iron_test__0_6_0",
        url = "https://crates.io/api/v1/crates/iron-test/0.6.0/download",
        type = "tar.gz",
        sha256 = "b1944bcf30f8b3f51ebf01e715517dd9755e9480934778d6de70179a41d283c1",
        strip_prefix = "iron-test-0.6.0",
        build_file = Label("//third_party/cargo/remote:BUILD.iron-test-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__1_0_2",
        url = "https://crates.io/api/v1/crates/itoa/1.0.2/download",
        type = "tar.gz",
        sha256 = "112c678d4050afce233f4f2852bb2eb519230b3cf12f33585275537d7e41578d",
        strip_prefix = "itoa-1.0.2",
        build_file = Label("//third_party/cargo/remote:BUILD.itoa-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__language_tags__0_2_2",
        url = "https://crates.io/api/v1/crates/language-tags/0.2.2/download",
        type = "tar.gz",
        sha256 = "a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a",
        strip_prefix = "language-tags-0.2.2",
        build_file = Label("//third_party/cargo/remote:BUILD.language-tags-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//third_party/cargo/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_126",
        url = "https://crates.io/api/v1/crates/libc/0.2.126/download",
        type = "tar.gz",
        sha256 = "349d5a591cd28b49e1d1037471617a32ddcda5731b99419008085f72d5a53836",
        strip_prefix = "libc-0.2.126",
        build_file = Label("//third_party/cargo/remote:BUILD.libc-0.2.126.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lock_api__0_4_7",
        url = "https://crates.io/api/v1/crates/lock_api/0.4.7/download",
        type = "tar.gz",
        sha256 = "327fa5b6a6940e4699ec49a9beae1ea4845c6bab9314e4f84ac68742139d8c53",
        strip_prefix = "lock_api-0.4.7",
        build_file = Label("//third_party/cargo/remote:BUILD.lock_api-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_3_9",
        url = "https://crates.io/api/v1/crates/log/0.3.9/download",
        type = "tar.gz",
        sha256 = "e19e8d5c34a3e0e2223db8e060f9e8264aeeb5c5fc64a4ee9965c062211c024b",
        strip_prefix = "log-0.3.9",
        build_file = Label("//third_party/cargo/remote:BUILD.log-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_17",
        url = "https://crates.io/api/v1/crates/log/0.4.17/download",
        type = "tar.gz",
        sha256 = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e",
        strip_prefix = "log-0.4.17",
        build_file = Label("//third_party/cargo/remote:BUILD.log-0.4.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matches__0_1_9",
        url = "https://crates.io/api/v1/crates/matches/0.1.9/download",
        type = "tar.gz",
        sha256 = "a3e378b66a060d48947b590737b30a1be76706c8dd7b8ba0f2fe3989c68a853f",
        strip_prefix = "matches-0.1.9",
        build_file = Label("//third_party/cargo/remote:BUILD.matches-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_5_0",
        url = "https://crates.io/api/v1/crates/memchr/2.5.0/download",
        type = "tar.gz",
        sha256 = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d",
        strip_prefix = "memchr-2.5.0",
        build_file = Label("//third_party/cargo/remote:BUILD.memchr-2.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memoffset__0_6_5",
        url = "https://crates.io/api/v1/crates/memoffset/0.6.5/download",
        type = "tar.gz",
        sha256 = "5aa361d4faea93603064a027415f07bd8e1d5c88c9fbf68bf56a285428fd79ce",
        strip_prefix = "memoffset-0.6.5",
        build_file = Label("//third_party/cargo/remote:BUILD.memoffset-0.6.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime__0_2_6",
        url = "https://crates.io/api/v1/crates/mime/0.2.6/download",
        type = "tar.gz",
        sha256 = "ba626b8a6de5da682e1caa06bdb42a335aee5a84db8e5046a3e8ab17ba0a3ae0",
        strip_prefix = "mime-0.2.6",
        build_file = Label("//third_party/cargo/remote:BUILD.mime-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime__0_3_16",
        url = "https://crates.io/api/v1/crates/mime/0.3.16/download",
        type = "tar.gz",
        sha256 = "2a60c7ce501c71e03a9c9c0d35b861413ae925bd979cc7a4e30d060069aaac8d",
        strip_prefix = "mime-0.3.16",
        build_file = Label("//third_party/cargo/remote:BUILD.mime-0.3.16.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime_guess__1_8_8",
        url = "https://crates.io/api/v1/crates/mime_guess/1.8.8/download",
        type = "tar.gz",
        sha256 = "216929a5ee4dd316b1702eedf5e74548c123d370f47841ceaac38ca154690ca3",
        strip_prefix = "mime_guess-1.8.8",
        build_file = Label("//third_party/cargo/remote:BUILD.mime_guess-1.8.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime_guess__2_0_4",
        url = "https://crates.io/api/v1/crates/mime_guess/2.0.4/download",
        type = "tar.gz",
        sha256 = "4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef",
        strip_prefix = "mime_guess-2.0.4",
        build_file = Label("//third_party/cargo/remote:BUILD.mime_guess-2.0.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__minimal_lexical__0_2_1",
        url = "https://crates.io/api/v1/crates/minimal-lexical/0.2.1/download",
        type = "tar.gz",
        sha256 = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a",
        strip_prefix = "minimal-lexical-0.2.1",
        build_file = Label("//third_party/cargo/remote:BUILD.minimal-lexical-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__modifier__0_1_0",
        url = "https://crates.io/api/v1/crates/modifier/0.1.0/download",
        type = "tar.gz",
        sha256 = "41f5c9112cb662acd3b204077e0de5bc66305fa8df65c8019d5adb10e9ab6e58",
        strip_prefix = "modifier-0.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.modifier-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__nom__7_1_1",
        url = "https://crates.io/api/v1/crates/nom/7.1.1/download",
        type = "tar.gz",
        sha256 = "a8903e5a29a317527874d0402f867152a3d21c908bb0b933e416c65e301d4c36",
        strip_prefix = "nom-7.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.nom-7.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_integer__0_1_45",
        url = "https://crates.io/api/v1/crates/num-integer/0.1.45/download",
        type = "tar.gz",
        sha256 = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9",
        strip_prefix = "num-integer-0.1.45",
        build_file = Label("//third_party/cargo/remote:BUILD.num-integer-0.1.45.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_2_15",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.15/download",
        type = "tar.gz",
        sha256 = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd",
        strip_prefix = "num-traits-0.2.15",
        build_file = Label("//third_party/cargo/remote:BUILD.num-traits-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_13_1",
        url = "https://crates.io/api/v1/crates/num_cpus/1.13.1/download",
        type = "tar.gz",
        sha256 = "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1",
        strip_prefix = "num_cpus-1.13.1",
        build_file = Label("//third_party/cargo/remote:BUILD.num_cpus-1.13.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_threads__0_1_6",
        url = "https://crates.io/api/v1/crates/num_threads/0.1.6/download",
        type = "tar.gz",
        sha256 = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44",
        strip_prefix = "num_threads-0.1.6",
        build_file = Label("//third_party/cargo/remote:BUILD.num_threads-0.1.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_12_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.12.0/download",
        type = "tar.gz",
        sha256 = "7709cef83f0c1f58f666e746a08b21e0085f7440fa6a29cc194d68aac97a4225",
        strip_prefix = "once_cell-1.12.0",
        build_file = Label("//third_party/cargo/remote:BUILD.once_cell-1.12.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__os_str_bytes__6_1_0",
        url = "https://crates.io/api/v1/crates/os_str_bytes/6.1.0/download",
        type = "tar.gz",
        sha256 = "21326818e99cfe6ce1e524c2a805c189a99b5ae555a35d19f9a284b427d86afa",
        strip_prefix = "os_str_bytes-6.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.os_str_bytes-6.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot__0_12_1",
        url = "https://crates.io/api/v1/crates/parking_lot/0.12.1/download",
        type = "tar.gz",
        sha256 = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f",
        strip_prefix = "parking_lot-0.12.1",
        build_file = Label("//third_party/cargo/remote:BUILD.parking_lot-0.12.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot_core__0_9_3",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.9.3/download",
        type = "tar.gz",
        sha256 = "09a279cbf25cb0757810394fbc1e359949b59e348145c643a939a525692e6929",
        strip_prefix = "parking_lot_core-0.9.3",
        build_file = Label("//third_party/cargo/remote:BUILD.parking_lot_core-0.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__1_0_1",
        url = "https://crates.io/api/v1/crates/percent-encoding/1.0.1/download",
        type = "tar.gz",
        sha256 = "31010dd2e1ac33d5b46a5b413495239882813e0369f8ed8a5e266f173602f831",
        strip_prefix = "percent-encoding-1.0.1",
        build_file = Label("//third_party/cargo/remote:BUILD.percent-encoding-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__2_1_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.1.0/download",
        type = "tar.gz",
        sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e",
        strip_prefix = "percent-encoding-2.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.percent-encoding-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf__0_7_24",
        url = "https://crates.io/api/v1/crates/phf/0.7.24/download",
        type = "tar.gz",
        sha256 = "b3da44b85f8e8dfaec21adae67f95d93244b2ecf6ad2a692320598dcc8e6dd18",
        strip_prefix = "phf-0.7.24",
        build_file = Label("//third_party/cargo/remote:BUILD.phf-0.7.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_codegen__0_7_24",
        url = "https://crates.io/api/v1/crates/phf_codegen/0.7.24/download",
        type = "tar.gz",
        sha256 = "b03e85129e324ad4166b06b2c7491ae27fe3ec353af72e72cd1654c7225d517e",
        strip_prefix = "phf_codegen-0.7.24",
        build_file = Label("//third_party/cargo/remote:BUILD.phf_codegen-0.7.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_generator__0_7_24",
        url = "https://crates.io/api/v1/crates/phf_generator/0.7.24/download",
        type = "tar.gz",
        sha256 = "09364cc93c159b8b06b1f4dd8a4398984503483891b0c26b867cf431fb132662",
        strip_prefix = "phf_generator-0.7.24",
        build_file = Label("//third_party/cargo/remote:BUILD.phf_generator-0.7.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__phf_shared__0_7_24",
        url = "https://crates.io/api/v1/crates/phf_shared/0.7.24/download",
        type = "tar.gz",
        sha256 = "234f71a15de2288bcb7e3b6515828d22af7ec8598ee6d24c3b526fa0a80b67a0",
        strip_prefix = "phf_shared-0.7.24",
        build_file = Label("//third_party/cargo/remote:BUILD.phf_shared-0.7.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__plugin__0_2_6",
        url = "https://crates.io/api/v1/crates/plugin/0.2.6/download",
        type = "tar.gz",
        sha256 = "1a6a0dc3910bc8db877ffed8e457763b317cf880df4ae19109b9f77d277cf6e0",
        strip_prefix = "plugin-0.2.6",
        build_file = Label("//third_party/cargo/remote:BUILD.plugin-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_39",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.39/download",
        type = "tar.gz",
        sha256 = "c54b25569025b7fc9651de43004ae593a75ad88543b17178aa5e1b9c4f15f56f",
        strip_prefix = "proc-macro2-1.0.39",
        build_file = Label("//third_party/cargo/remote:BUILD.proc-macro2-1.0.39.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pyo3__0_16_5",
        url = "https://crates.io/api/v1/crates/pyo3/0.16.5/download",
        type = "tar.gz",
        sha256 = "1e6302e85060011447471887705bb7838f14aba43fcb06957d823739a496b3dc",
        strip_prefix = "pyo3-0.16.5",
        build_file = Label("//third_party/cargo/remote:BUILD.pyo3-0.16.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pyo3_build_config__0_16_5",
        url = "https://crates.io/api/v1/crates/pyo3-build-config/0.16.5/download",
        type = "tar.gz",
        sha256 = "b5b65b546c35d8a3b1b2f0ddbac7c6a569d759f357f2b9df884f5d6b719152c8",
        strip_prefix = "pyo3-build-config-0.16.5",
        build_file = Label("//third_party/cargo/remote:BUILD.pyo3-build-config-0.16.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pyo3_ffi__0_16_5",
        url = "https://crates.io/api/v1/crates/pyo3-ffi/0.16.5/download",
        type = "tar.gz",
        sha256 = "c275a07127c1aca33031a563e384ffdd485aee34ef131116fcd58e3430d1742b",
        strip_prefix = "pyo3-ffi-0.16.5",
        build_file = Label("//third_party/cargo/remote:BUILD.pyo3-ffi-0.16.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pyo3_macros__0_16_5",
        url = "https://crates.io/api/v1/crates/pyo3-macros/0.16.5/download",
        type = "tar.gz",
        sha256 = "284fc4485bfbcc9850a6d661d627783f18d19c2ab55880b021671c4ba83e90f7",
        strip_prefix = "pyo3-macros-0.16.5",
        build_file = Label("//third_party/cargo/remote:BUILD.pyo3-macros-0.16.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pyo3_macros_backend__0_16_5",
        url = "https://crates.io/api/v1/crates/pyo3-macros-backend/0.16.5/download",
        type = "tar.gz",
        sha256 = "53bda0f58f73f5c5429693c96ed57f7abdb38fdfc28ae06da4101a257adb7faf",
        strip_prefix = "pyo3-macros-backend-0.16.5",
        build_file = Label("//third_party/cargo/remote:BUILD.pyo3-macros-backend-0.16.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_18",
        url = "https://crates.io/api/v1/crates/quote/1.0.18/download",
        type = "tar.gz",
        sha256 = "a1feb54ed693b93a84e14094943b84b7c4eae204c512b7ccb95ab0c66d278ad1",
        strip_prefix = "quote-1.0.18",
        build_file = Label("//third_party/cargo/remote:BUILD.quote-1.0.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_3_23",
        url = "https://crates.io/api/v1/crates/rand/0.3.23/download",
        type = "tar.gz",
        sha256 = "64ac302d8f83c0c1974bf758f6b041c6c8ada916fbb44a609158ca8b064cc76c",
        strip_prefix = "rand-0.3.23",
        build_file = Label("//third_party/cargo/remote:BUILD.rand-0.3.23.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_4_6",
        url = "https://crates.io/api/v1/crates/rand/0.4.6/download",
        type = "tar.gz",
        sha256 = "552840b97013b1a26992c11eac34bdd778e464601a4c2054b5f0bff7c6761293",
        strip_prefix = "rand-0.4.6",
        build_file = Label("//third_party/cargo/remote:BUILD.rand-0.4.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_6_5",
        url = "https://crates.io/api/v1/crates/rand/0.6.5/download",
        type = "tar.gz",
        sha256 = "6d71dacdc3c88c1fde3885a3be3fbab9f35724e6ce99467f7d9c5026132184ca",
        strip_prefix = "rand-0.6.5",
        build_file = Label("//third_party/cargo/remote:BUILD.rand-0.6.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_1_1",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.1.1/download",
        type = "tar.gz",
        sha256 = "556d3a1ca6600bfcbab7c7c91ccb085ac7fbbcd70e008a98742e7847f4f7bcef",
        strip_prefix = "rand_chacha-0.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_chacha-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_core/0.3.1/download",
        type = "tar.gz",
        sha256 = "7a6fdeb83b075e8266dcc8762c22776f6877a63111121f5f8c7411e5be7eed4b",
        strip_prefix = "rand_core-0.3.1",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_core-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_4_2",
        url = "https://crates.io/api/v1/crates/rand_core/0.4.2/download",
        type = "tar.gz",
        sha256 = "9c33a3c44ca05fa6f1807d8e6743f3824e8509beca625669633be0acbdf509dc",
        strip_prefix = "rand_core-0.4.2",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_core-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_hc__0_1_0",
        url = "https://crates.io/api/v1/crates/rand_hc/0.1.0/download",
        type = "tar.gz",
        sha256 = "7b40677c7be09ae76218dc623efbf7b18e34bced3f38883af07bb75630a21bc4",
        strip_prefix = "rand_hc-0.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_hc-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_isaac__0_1_1",
        url = "https://crates.io/api/v1/crates/rand_isaac/0.1.1/download",
        type = "tar.gz",
        sha256 = "ded997c9d5f13925be2a6fd7e66bf1872597f759fd9dd93513dd7e92e5a5ee08",
        strip_prefix = "rand_isaac-0.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_isaac-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_jitter__0_1_4",
        url = "https://crates.io/api/v1/crates/rand_jitter/0.1.4/download",
        type = "tar.gz",
        sha256 = "1166d5c91dc97b88d1decc3285bb0a99ed84b05cfd0bc2341bdf2d43fc41e39b",
        strip_prefix = "rand_jitter-0.1.4",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_jitter-0.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_os__0_1_3",
        url = "https://crates.io/api/v1/crates/rand_os/0.1.3/download",
        type = "tar.gz",
        sha256 = "7b75f676a1e053fc562eafbb47838d67c84801e38fc1ba459e8f180deabd5071",
        strip_prefix = "rand_os-0.1.3",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_os-0.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_pcg__0_1_2",
        url = "https://crates.io/api/v1/crates/rand_pcg/0.1.2/download",
        type = "tar.gz",
        sha256 = "abf9b09b01790cfe0364f52bf32995ea3c39f4d2dd011eac241d2914146d0b44",
        strip_prefix = "rand_pcg-0.1.2",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_pcg-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_xorshift__0_1_1",
        url = "https://crates.io/api/v1/crates/rand_xorshift/0.1.1/download",
        type = "tar.gz",
        sha256 = "cbf7e9e623549b0e21f6e97cf8ecf247c1a8fd2e8a992ae265314300b2455d5c",
        strip_prefix = "rand_xorshift-0.1.1",
        build_file = Label("//third_party/cargo/remote:BUILD.rand_xorshift-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon__1_5_3",
        url = "https://crates.io/api/v1/crates/rayon/1.5.3/download",
        type = "tar.gz",
        sha256 = "bd99e5772ead8baa5215278c9b15bf92087709e9c1b2d1f97cdb5a183c933a7d",
        strip_prefix = "rayon-1.5.3",
        build_file = Label("//third_party/cargo/remote:BUILD.rayon-1.5.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rayon_core__1_9_3",
        url = "https://crates.io/api/v1/crates/rayon-core/1.9.3/download",
        type = "tar.gz",
        sha256 = "258bcdb5ac6dad48491bb2992db6b7cf74878b0384908af124823d118c99683f",
        strip_prefix = "rayon-core-1.9.3",
        build_file = Label("//third_party/cargo/remote:BUILD.rayon-core-1.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rdrand__0_4_0",
        url = "https://crates.io/api/v1/crates/rdrand/0.4.0/download",
        type = "tar.gz",
        sha256 = "678054eb77286b51581ba43620cc911abf02758c91f93f479767aed0f90458b2",
        strip_prefix = "rdrand-0.4.0",
        build_file = Label("//third_party/cargo/remote:BUILD.rdrand-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_2_13",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.2.13/download",
        type = "tar.gz",
        sha256 = "62f25bc4c7e55e0b0b7a1d43fb893f4fa1361d0abe38b9ce4f323c2adfe6ef42",
        strip_prefix = "redox_syscall-0.2.13",
        build_file = Label("//third_party/cargo/remote:BUILD.redox_syscall-0.2.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_users__0_4_3",
        url = "https://crates.io/api/v1/crates/redox_users/0.4.3/download",
        type = "tar.gz",
        sha256 = "b033d837a7cf162d7993aded9304e30a83213c648b6e389db233191f891e5c2b",
        strip_prefix = "redox_users-0.4.3",
        build_file = Label("//third_party/cargo/remote:BUILD.redox_users-0.4.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__route_recognizer__0_1_13",
        url = "https://crates.io/api/v1/crates/route-recognizer/0.1.13/download",
        type = "tar.gz",
        sha256 = "ea509065eb0b3c446acdd0102f0d46567dc30902dc0be91d6552035d92b0f4f8",
        strip_prefix = "route-recognizer-0.1.13",
        build_file = Label("//third_party/cargo/remote:BUILD.route-recognizer-0.1.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__router__0_6_0",
        url = "https://crates.io/api/v1/crates/router/0.6.0/download",
        type = "tar.gz",
        sha256 = "dc63b6f3b8895b0d04e816b2b1aa58fdba2d5acca3cbb8f0ab8e017347d57397",
        strip_prefix = "router-0.6.0",
        build_file = Label("//third_party/cargo/remote:BUILD.router-0.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustversion__1_0_6",
        url = "https://crates.io/api/v1/crates/rustversion/1.0.6/download",
        type = "tar.gz",
        sha256 = "f2cc38e8fa666e2de3c4aba7edeb5ffc5246c1c2ed0e3d17e560aeeba736b23f",
        strip_prefix = "rustversion-1.0.6",
        build_file = Label("//third_party/cargo/remote:BUILD.rustversion-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__safemem__0_3_3",
        url = "https://crates.io/api/v1/crates/safemem/0.3.3/download",
        type = "tar.gz",
        sha256 = "ef703b7cb59335eae2eb93ceb664c0eb7ea6bf567079d843e09420219668e072",
        strip_prefix = "safemem-0.3.3",
        build_file = Label("//third_party/cargo/remote:BUILD.safemem-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_137",
        url = "https://crates.io/api/v1/crates/serde/1.0.137/download",
        type = "tar.gz",
        sha256 = "61ea8d54c77f8315140a05f4c7237403bf38b72704d031543aa1d16abbf517d1",
        strip_prefix = "serde-1.0.137",
        build_file = Label("//third_party/cargo/remote:BUILD.serde-1.0.137.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_137",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.137/download",
        type = "tar.gz",
        sha256 = "1f26faba0c3959972377d3b2d306ee9f71faee9714294e41bb777f83f88578be",
        strip_prefix = "serde_derive-1.0.137",
        build_file = Label("//third_party/cargo/remote:BUILD.serde_derive-1.0.137.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__siphasher__0_2_3",
        url = "https://crates.io/api/v1/crates/siphasher/0.2.3/download",
        type = "tar.gz",
        sha256 = "0b8de496cf83d4ed58b6be86c3a275b8602f6ffe98d3024a869e124147a9a3ac",
        strip_prefix = "siphasher-0.2.3",
        build_file = Label("//third_party/cargo/remote:BUILD.siphasher-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slog__2_7_0",
        url = "https://crates.io/api/v1/crates/slog/2.7.0/download",
        type = "tar.gz",
        sha256 = "8347046d4ebd943127157b94d63abb990fcf729dc4e9978927fdf4ac3c998d06",
        strip_prefix = "slog-2.7.0",
        build_file = Label("//third_party/cargo/remote:BUILD.slog-2.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slog_async__2_7_0",
        url = "https://crates.io/api/v1/crates/slog-async/2.7.0/download",
        type = "tar.gz",
        sha256 = "766c59b252e62a34651412870ff55d8c4e6d04df19b43eecb2703e417b097ffe",
        strip_prefix = "slog-async-2.7.0",
        build_file = Label("//third_party/cargo/remote:BUILD.slog-async-2.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slog_term__2_9_0",
        url = "https://crates.io/api/v1/crates/slog-term/2.9.0/download",
        type = "tar.gz",
        sha256 = "87d29185c55b7b258b4f120eab00f48557d4d9bc814f41713f449d35b0f8977c",
        strip_prefix = "slog-term-2.9.0",
        build_file = Label("//third_party/cargo/remote:BUILD.slog-term-2.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_8_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.8.0/download",
        type = "tar.gz",
        sha256 = "f2dd574626839106c320a323308629dcb1acfc96e32a8cba364ddc61ac23ee83",
        strip_prefix = "smallvec-1.8.0",
        build_file = Label("//third_party/cargo/remote:BUILD.smallvec-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__strsim__0_10_0",
        url = "https://crates.io/api/v1/crates/strsim/0.10.0/download",
        type = "tar.gz",
        sha256 = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623",
        strip_prefix = "strsim-0.10.0",
        build_file = Label("//third_party/cargo/remote:BUILD.strsim-0.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_96",
        url = "https://crates.io/api/v1/crates/syn/1.0.96/download",
        type = "tar.gz",
        sha256 = "0748dd251e24453cb8717f0354206b91557e4ec8703673a4b30208f2abaf1ebf",
        strip_prefix = "syn-1.0.96",
        build_file = Label("//third_party/cargo/remote:BUILD.syn-1.0.96.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__take_mut__0_2_2",
        url = "https://crates.io/api/v1/crates/take_mut/0.2.2/download",
        type = "tar.gz",
        sha256 = "f764005d11ee5f36500a149ace24e00e3da98b0158b3e2d53a7495660d3f4d60",
        strip_prefix = "take_mut-0.2.2",
        build_file = Label("//third_party/cargo/remote:BUILD.take_mut-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__target_lexicon__0_12_4",
        url = "https://crates.io/api/v1/crates/target-lexicon/0.12.4/download",
        type = "tar.gz",
        sha256 = "c02424087780c9b71cc96799eaeddff35af2bc513278cda5c99fc1f5d026d3c1",
        strip_prefix = "target-lexicon-0.12.4",
        build_file = Label("//third_party/cargo/remote:BUILD.target-lexicon-0.12.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__term__0_7_0",
        url = "https://crates.io/api/v1/crates/term/0.7.0/download",
        type = "tar.gz",
        sha256 = "c59df8ac95d96ff9bede18eb7300b0fda5e5d8d90960e76f8e14ae765eedbf1f",
        strip_prefix = "term-0.7.0",
        build_file = Label("//third_party/cargo/remote:BUILD.term-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_1_3",
        url = "https://crates.io/api/v1/crates/termcolor/1.1.3/download",
        type = "tar.gz",
        sha256 = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755",
        strip_prefix = "termcolor-1.1.3",
        build_file = Label("//third_party/cargo/remote:BUILD.termcolor-1.1.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__textwrap__0_15_0",
        url = "https://crates.io/api/v1/crates/textwrap/0.15.0/download",
        type = "tar.gz",
        sha256 = "b1141d4d61095b28419e22cb0bbf02755f5e54e0526f97f1e3d1d160e60885fb",
        strip_prefix = "textwrap-0.15.0",
        build_file = Label("//third_party/cargo/remote:BUILD.textwrap-0.15.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_31",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.31/download",
        type = "tar.gz",
        sha256 = "bd829fe32373d27f76265620b5309d0340cb8550f523c1dda251d6298069069a",
        strip_prefix = "thiserror-1.0.31",
        build_file = Label("//third_party/cargo/remote:BUILD.thiserror-1.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_31",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.31/download",
        type = "tar.gz",
        sha256 = "0396bc89e626244658bef819e22d0cc459e795a5ebe878e6ec336d1674a8d79a",
        strip_prefix = "thiserror-impl-1.0.31",
        build_file = Label("//third_party/cargo/remote:BUILD.thiserror-impl-1.0.31.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thread_local__1_1_4",
        url = "https://crates.io/api/v1/crates/thread_local/1.1.4/download",
        type = "tar.gz",
        sha256 = "5516c27b78311c50bf42c071425c560ac799b11c30b31f87e3081965fe5e0180",
        strip_prefix = "thread_local-1.1.4",
        build_file = Label("//third_party/cargo/remote:BUILD.thread_local-1.1.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time__0_1_43",
        url = "https://crates.io/api/v1/crates/time/0.1.43/download",
        type = "tar.gz",
        sha256 = "ca8a50ef2360fbd1eeb0ecd46795a87a19024eb4b53c5dc916ca1fd95fe62438",
        strip_prefix = "time-0.1.43",
        build_file = Label("//third_party/cargo/remote:BUILD.time-0.1.43.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time__0_3_9",
        url = "https://crates.io/api/v1/crates/time/0.3.9/download",
        type = "tar.gz",
        sha256 = "c2702e08a7a860f005826c6815dcac101b19b5eb330c27fe4a5928fec1d20ddd",
        strip_prefix = "time-0.3.9",
        build_file = Label("//third_party/cargo/remote:BUILD.time-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__time_macros__0_2_4",
        url = "https://crates.io/api/v1/crates/time-macros/0.2.4/download",
        type = "tar.gz",
        sha256 = "42657b1a6f4d817cda8e7a0ace261fe0cc946cf3a80314390b22cc61ae080792",
        strip_prefix = "time-macros-0.2.4",
        build_file = Label("//third_party/cargo/remote:BUILD.time-macros-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec__1_6_0",
        url = "https://crates.io/api/v1/crates/tinyvec/1.6.0/download",
        type = "tar.gz",
        sha256 = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50",
        strip_prefix = "tinyvec-1.6.0",
        build_file = Label("//third_party/cargo/remote:BUILD.tinyvec-1.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tinyvec_macros__0_1_0",
        url = "https://crates.io/api/v1/crates/tinyvec_macros/0.1.0/download",
        type = "tar.gz",
        sha256 = "cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c",
        strip_prefix = "tinyvec_macros-0.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.tinyvec_macros-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__toml__0_5_9",
        url = "https://crates.io/api/v1/crates/toml/0.5.9/download",
        type = "tar.gz",
        sha256 = "8d82e1a7758622a465f8cee077614c73484dac5b836c02ff6a40d5d1010324d7",
        strip_prefix = "toml-0.5.9",
        build_file = Label("//third_party/cargo/remote:BUILD.toml-0.5.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__traitobject__0_1_0",
        url = "https://crates.io/api/v1/crates/traitobject/0.1.0/download",
        type = "tar.gz",
        sha256 = "efd1f82c56340fdf16f2a953d7bda4f8fdffba13d93b00844c25572110b26079",
        strip_prefix = "traitobject-0.1.0",
        build_file = Label("//third_party/cargo/remote:BUILD.traitobject-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typeable__0_1_2",
        url = "https://crates.io/api/v1/crates/typeable/0.1.2/download",
        type = "tar.gz",
        sha256 = "1410f6f91f21d1612654e7cc69193b0334f909dcf2c790c4826254fbb86f8887",
        strip_prefix = "typeable-0.1.2",
        build_file = Label("//third_party/cargo/remote:BUILD.typeable-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__typemap__0_3_3",
        url = "https://crates.io/api/v1/crates/typemap/0.3.3/download",
        type = "tar.gz",
        sha256 = "653be63c80a3296da5551e1bfd2cca35227e13cdd08c6668903ae2f4f77aa1f6",
        strip_prefix = "typemap-0.3.3",
        build_file = Label("//third_party/cargo/remote:BUILD.typemap-0.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicase__1_4_2",
        url = "https://crates.io/api/v1/crates/unicase/1.4.2/download",
        type = "tar.gz",
        sha256 = "7f4765f83163b74f957c797ad9253caf97f103fb064d3999aea9568d09fc8a33",
        strip_prefix = "unicase-1.4.2",
        build_file = Label("//third_party/cargo/remote:BUILD.unicase-1.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicase__2_6_0",
        url = "https://crates.io/api/v1/crates/unicase/2.6.0/download",
        type = "tar.gz",
        sha256 = "50f37be617794602aabbeee0be4f259dc1778fabe05e2d67ee8f79326d5cb4f6",
        strip_prefix = "unicase-2.6.0",
        build_file = Label("//third_party/cargo/remote:BUILD.unicase-2.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_bidi__0_3_8",
        url = "https://crates.io/api/v1/crates/unicode-bidi/0.3.8/download",
        type = "tar.gz",
        sha256 = "099b7128301d285f79ddd55b9a83d5e6b9e97c92e0ea0daebee7263e932de992",
        strip_prefix = "unicode-bidi-0.3.8",
        build_file = Label("//third_party/cargo/remote:BUILD.unicode-bidi-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_ident__1_0_0",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.0/download",
        type = "tar.gz",
        sha256 = "d22af068fba1eb5edcb4aea19d382b2a3deb4c8f9d475c589b6ada9e0fd493ee",
        strip_prefix = "unicode-ident-1.0.0",
        build_file = Label("//third_party/cargo/remote:BUILD.unicode-ident-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_normalization__0_1_19",
        url = "https://crates.io/api/v1/crates/unicode-normalization/0.1.19/download",
        type = "tar.gz",
        sha256 = "d54590932941a9e9266f0832deed84ebe1bf2e4c9e4a3554d393d18f5e854bf9",
        strip_prefix = "unicode-normalization-0.1.19",
        build_file = Label("//third_party/cargo/remote:BUILD.unicode-normalization-0.1.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unindent__0_1_9",
        url = "https://crates.io/api/v1/crates/unindent/0.1.9/download",
        type = "tar.gz",
        sha256 = "52fee519a3e570f7df377a06a1a7775cdbfb7aa460be7e08de2b1f0e69973a44",
        strip_prefix = "unindent-0.1.9",
        build_file = Label("//third_party/cargo/remote:BUILD.unindent-0.1.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unsafe_any__0_4_2",
        url = "https://crates.io/api/v1/crates/unsafe-any/0.4.2/download",
        type = "tar.gz",
        sha256 = "f30360d7979f5e9c6e6cea48af192ea8fab4afb3cf72597154b8f08935bc9c7f",
        strip_prefix = "unsafe-any-0.4.2",
        build_file = Label("//third_party/cargo/remote:BUILD.unsafe-any-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__url__1_7_2",
        url = "https://crates.io/api/v1/crates/url/1.7.2/download",
        type = "tar.gz",
        sha256 = "dd4e7c0d531266369519a4aa4f399d748bd37043b00bde1e4ff1f60a120b355a",
        strip_prefix = "url-1.7.2",
        build_file = Label("//third_party/cargo/remote:BUILD.url-1.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__uuid__0_5_1",
        url = "https://crates.io/api/v1/crates/uuid/0.5.1/download",
        type = "tar.gz",
        sha256 = "bcc7e3b898aa6f6c08e5295b6c89258d1331e9ac578cc992fb818759951bdc22",
        strip_prefix = "uuid-0.5.1",
        build_file = Label("//third_party/cargo/remote:BUILD.uuid-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_1_5",
        url = "https://crates.io/api/v1/crates/version_check/0.1.5/download",
        type = "tar.gz",
        sha256 = "914b1a6776c4c929a602fafd8bc742e06365d4bcbe48c30f9cca5824f70dc9dd",
        strip_prefix = "version_check-0.1.5",
        build_file = Label("//third_party/cargo/remote:BUILD.version_check-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__version_check__0_9_4",
        url = "https://crates.io/api/v1/crates/version_check/0.9.4/download",
        type = "tar.gz",
        sha256 = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f",
        strip_prefix = "version_check-0.9.4",
        build_file = Label("//third_party/cargo/remote:BUILD.version_check-0.9.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_10_2_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.10.2+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "fd6fbd9a79829dd1ad0cc20627bf1ed606756a7f77edff7b66b7064f9cb327c6",
        strip_prefix = "wasi-0.10.2+wasi-snapshot-preview1",
        build_file = Label("//third_party/cargo/remote:BUILD.wasi-0.10.2+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//third_party/cargo/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//third_party/cargo/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//third_party/cargo/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//third_party/cargo/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_sys__0_36_1",
        url = "https://crates.io/api/v1/crates/windows-sys/0.36.1/download",
        type = "tar.gz",
        sha256 = "ea04155a16a59f9eab786fe12a4a450e75cdb175f9e0d80da1e17db09f55b8d2",
        strip_prefix = "windows-sys-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows-sys-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_aarch64_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "9bb8c3fd39ade2d67e9874ac4f3db21f0d710bee00fe7cab16949ec184eeaa47",
        strip_prefix = "windows_aarch64_msvc-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows_aarch64_msvc-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_gnu__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.36.1/download",
        type = "tar.gz",
        sha256 = "180e6ccf01daf4c426b846dfc66db1fc518f074baa793aa7d9b9aaeffad6a3b6",
        strip_prefix = "windows_i686_gnu-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows_i686_gnu-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "e2e7917148b2812d1eeafaeb22a97e4813dfa60a3f8f78ebe204bcc88f12f024",
        strip_prefix = "windows_i686_msvc-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows_i686_msvc-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_gnu__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.36.1/download",
        type = "tar.gz",
        sha256 = "4dcd171b8776c41b97521e5da127a2d86ad280114807d0b2ab1e462bc764d9e1",
        strip_prefix = "windows_x86_64_gnu-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows_x86_64_gnu-0.36.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_msvc__0_36_1",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.36.1/download",
        type = "tar.gz",
        sha256 = "c811ca4a8c853ef420abd8592ba53ddbbac90410fab6903b3e79972a631f7680",
        strip_prefix = "windows_x86_64_msvc-0.36.1",
        build_file = Label("//third_party/cargo/remote:BUILD.windows_x86_64_msvc-0.36.1.bazel"),
    )
