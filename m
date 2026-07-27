Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C52E40682D;
	Mon, 27 Jul 2026 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159378; cv=none; b=YdCoeMM7KPHAmyxoTdhcM3cvKtVVFpiIWBY8brABL7Kc9iz6uF5VJNcgVRK6LRSDxmvGUZrNfnyU8LEP76zRONn1lu9ijHf0qZ3hlKNGlue/JFs7j+okZaBWXxCZTyXLXL0cmhrcRkZ0Iym0+Fkx66oUdhL8dxdywrfOe9pPmIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159378; c=relaxed/simple;
	bh=pp5GguRgL7SZn5qis63cFfdNsjIZVMBWu3lwntdgkrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gk7KhYN8dZIp0kxtzeo/QH6zQKGbBPM+BAfcehulT3gFIci3Oi8isqkKasEcNmkc7Na7EBIZEifh+dN7AFwH8rNCurcF3KmKGY2FufNFtU6N5oNosGMd3yBiWnU2+51xWxuUJJB36WyMuvhhGa+QFDb5ZaqbpLL+S71LZtvdFoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=GZTsP6+a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R8h/T+vE; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="GZTsP6+a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R8h/T+vE"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9EFA37A0381;
	Mon, 27 Jul 2026 09:36:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 27 Jul 2026 09:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1785159375; x=1785245775; bh=kr
	1i5BeDgZGyO1U1nXBNfGOw3llZyYRGoEj74GrZCsY=; b=GZTsP6+a3qm+Cl5dIM
	McgiKZhisaFBTbBIpIwyjjPtlycS3hYfJjfY1b9k8EMBc+zIY9nD4KDZNTe28pr2
	Ov6oXGPaZs9V2ASHy1pzp5lPtlLsxWyuqtuyXlUhz2yma5xuX3m0KGjtL7COI7Rz
	4PM9KLhXtffIl88n0z+f/+zxOvdaDgZvAsb/ZvQ8YYyDFsMYGLCvtvyLuc8Y3jDS
	XL5ClIR2QWes5bXTlBVx5UQs+LwJLc3pRTpyCnS74Pq1HwVszZgLEPyvHZtlLVhU
	yI3LwDMFvqjyZ2usiFi7veeMMBSNllw91v1eITIisKjEf0qFWClnRa60lamjS8mB
	v6QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785159375; x=
	1785245775; bh=kr1i5BeDgZGyO1U1nXBNfGOw3llZyYRGoEj74GrZCsY=; b=R
	8h/T+vEuC1yKyi8AaJxsqcO4ouK/IgEbdbiNIOtlDbrk8ZF61OBRS0Gyf66Mlshg
	y1dr7toAdCdUqAltKXB8uii+vOs8U75Xs4BKCUytKU+V0BPvbOHX94X88194hGNY
	BFF44ZOZm34B/WBI8ci5gVwgKwTxZ/lj25G83UDRP9hKFNqDQc1qmcQEfLdch68b
	BwB4SEIn7XHJ5s8g4a/6bjEbmoeJpd1fkgd8kyKlXMHORysTXpPaLPp18E9JqHKU
	8SCZ1A7M2B/j3IfXLUWCLLSdFwtT9NzJ7hw8NvjrbLbaAoL2S5Ny+beTcWa+iCgq
	IwOeEBSticCDAWgGlnVQg==
X-ME-Sender: <xms:z15nap5Qxt4_WwlyV2Kb0afKchjswv7Bi2iaI_E45MPHjyET2gKCyg>
    <xme:z15naoZxJ-I-e2a_B5ZJU79-6TNBAmItAZQTw8k2vD3jmZSy-JuZdXVmth26j5vPj
    o_dTVc7cZqSbaQ27sAhVT6v6M7la_PZS86jyAGPoxA_n0Ji5A>
X-ME-Received: <xmr:z15nagh3Z8vcMU0p9tZM73qFpqYq5Rl6Ea_l0ucIYn47Gr75IOacr883n1dqrNEd6vvNxY4H16SiibfIu0iEEwbildIzjtfKdXo>
X-ME-Proxy-Cause: dmFkZTGjvzUKSAmjeKzFC9uceEFQusy4xvn8EVL6L1NahuwNPELmHVFKTDHwK2oM4ZpSM1
    QIMNvszT63qMPjgTgzJBmW4ufJDDIY0dY40pBZgmX9KizGibgQkrmGivRTRVS1+h7G8dg9
    +2+q2ux29UwKBVyM/qcX0tBOEgpDylgvHWuUc5drtZNuMgp79BPnDIUvywbbswnn9Uzyim
    0kvOhf+3A2fIHP7j1Vp71J0S24wBG64zwYMmE7mMC/zFa12IohzV7IfPKo2JrsfvbotVn5
    xKdc3MrIoRXylcxPf8COZIVgjfeRchEZnRVuzSNsnbi1BVm3qaOd4hiCT/6+QGm4urHcIZ
    z8Bu2oZCL3txApXZkyue8fB9INrM6TEeaShrDGb3+0t4q/crs31niRcxmZk7iFEWwTcYFc
    9zEMJeoGCtStOt/WCa73S7VzPsfQEcQwi2Fowowm7T6Ncoc4FqfYT6YG934Q4f2NUdrYPM
    ebOxetiGduE6uIs06CN6JNoGQgbWP9/iAHLjf4SYT1ZBHLzoO6p311qjzPATT0fDE9tzLL
    oUw7RXuMdMgBPmxfs5BHs3gnwjyJw/rGXIUa8KCVTzC3ZNe3rI+t3kDv3i81I31QHCrpe9
    9PjXh2AQQ43NwrT1YMqfswtnOc2iRRlOmyRIEDz7kWyPzWSnvArU60ZjHbvQ
X-ME-Proxy: <xmx:z15nah84Wz8EisHkPcOzmGmueN8fn4DS3I_0YwDVgahyBuKi4B_B6w>
    <xmx:z15najoHEOPuSK-KYv3Sb5816q5YE4u9nMnv8NakUkASsx4bdzwEZQ>
    <xmx:z15nahVxOgGoBmtC2WHPt-fEw9gAx0aJaZm3mXL0nn_xK2vRG96dwA>
    <xmx:z15naqBemsW4n74QPCQn9pZnIjm5-DpsZgLAwlfJ54wK5I8L3uDpzA>
    <xmx:z15navXyeHjWripExY_2xVS2LTEiS5XJr-Ft6di3MqbfWPPzHAS0qNMe>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 09:36:14 -0400 (EDT)
Date: Mon, 27 Jul 2026 15:36:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Kernel panic in nhi_probe()->icm_probe() - Linux 7.2-rc
Message-ID: <amdezCBiW4fd_DuB@mail-itl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8YV6wmP3999Jtnjp"
Content-Disposition: inline

--8YV6wmP3999Jtnjp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 15:36:12 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Kernel panic in nhi_probe()->icm_probe() - Linux 7.2-rc

Hi,

While testing Linux 7.2-rc5 (but it happens also with -rc1), I get the foll=
owing panic:

    [    4.614392] xhci_hcd 0000:00:06.0: xHCI Host Controller
    [    4.615892] BUG: unable to handle page fault for address: ffffffffff=
fffff8
    [    4.615913] #PF: supervisor read access in kernel mode
    [    4.615929] #PF: error_code(0x0000) - not-present page
    [    4.615936] PGD de2f067 P4D de2f067 PUD de31067 PMD 0=20
    [    4.615945] Oops: Oops: 0000 [#1] SMP NOPTI
    [    4.615954] CPU: 1 UID: 0 PID: 321 Comm: (udev-worker) Not tainted 7=
=2E2.0-0.rc5.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
    [    4.615971] Hardware name: Xen HVM domU, BIOS 4.19.5 06/19/2026
    [    4.615983] RIP: 0010:complete+0x43/0x80
    [    4.616002] Code: a9 1e 01 48 89 c5 8b 03 83 f8 ff 74 05 83 c0 01 89=
 03 48 8b 53 10 48 8d 43 10 48 39 c2 74 35 48 8b 5b 10 31 d2 be 03 00 00 00=
 <48> 8b 7b f8 e8 34 a0 fc ff 48 89 df e8 5c 2f 8d 00 84 c0 74 0e 48
    [    4.616024] RSP: 0018:ffffd573c07fb5e8 EFLAGS: 00010046
    [    4.616032] RAX: ffff8f28c7f140b0 RBX: 0000000000000000 RCX: ffff8f2=
8c2841e00
    [    4.616041] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff8f2=
8c7f140a8
    [    4.616050] RBP: 0000000000000286 R08: ffff8f28c38e3000 R09: ffff8f2=
8c38e3000
    [    4.616062] R10: 0000000000000000 R11: 0000000000000001 R12: ffff8f2=
8c7f140a8
    [    4.616072] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8f2=
8c87e0a20
    [    4.616082] FS:  000077634a9b2c40(0000) GS:ffff8f293f34f000(0000) kn=
lGS:0000000000000000
    [    4.616092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    4.616103] CR2: fffffffffffffff8 CR3: 000000000fe89003 CR4: 0000000=
000770ef0
    [    4.616115] PKRU: 55555554
    [    4.616120] Call Trace:
    [    4.616124]  <TASK>
    [    4.616127]  device_release+0x43/0x90
    [    4.616135]  kobject_cleanup+0x3c/0x180
    [    4.616142]  icm_probe+0x19c/0x550 [thunderbolt]
    [    4.616172]  nhi_probe+0x1a4/0x370 [thunderbolt]
    [    4.616193]  local_pci_probe+0x41/0x90
    [    4.616201]  pci_call_probe+0x5b/0x1a0
    [    4.616207]  ? kernfs_activate+0x4c/0x60
    [    4.616213]  ? kernfs_add_one+0x15a/0x160
    [    4.616219]  ? _raw_spin_unlock+0xe/0x30
    [    4.616225]  ? pci_match_device+0x155/0x170
    [    4.616231]  pci_device_probe+0x9b/0x170
    [    4.616237]  ? sysfs_do_create_link_sd+0x6e/0xe0
    [    4.616245]  call_driver_probe+0x27/0x110
    [    4.616250]  really_probe+0xcc/0x2c0
    [    4.616256]  ? _raw_spin_unlock_irq+0xe/0x50
    [    4.616263]  ? __pfx___driver_attach+0x10/0x10
    [    4.616270]  __driver_probe_device+0x85/0x150
    [    4.616277]  driver_probe_device+0x1f/0x90
    [    4.616283]  __driver_attach+0xba/0x1f0
    [    4.616288]  bus_for_each_dev+0x8e/0xe0
    [    4.616295]  bus_add_driver+0xfb/0x2b0
    [    4.616302]  driver_register+0x72/0xd0
    [    4.616307]  nhi_init+0x60/0xff0 [thunderbolt]
    [    4.616327]  ? __pfx_init_module+0x10/0x10 [thunderbolt]
    [    4.616344]  do_one_initcall+0x5c/0x300
    [    4.616352]  do_init_module+0x99/0x2f0
    [    4.616358]  init_module_from_file+0xd6/0x130
    [    4.616367]  idempotent_init_module+0x114/0x310
    [    4.616377]  __x64_sys_finit_module+0x71/0xe0
    [    4.616385]  do_syscall_64+0xe8/0x530
    [    4.616392]  ? do_iter_readv_writev+0x1f5/0x250
    [    4.616401]  ? vfs_iter_read+0xe0/0x140
    [    4.616407]  ? ovl_file_accessed+0x2a/0xa0 [overlay]
    [    4.616424]  ? backing_file_read_iter+0x16f/0x230
    [    4.616433]  ? ovl_read_iter+0x92/0xa0 [overlay]
    [    4.616445]  ? __pfx_ovl_file_accessed+0x10/0x10 [overlay]
    [    4.616457]  ? vfs_read+0x25d/0x370
    [    4.616464]  ? switch_fpu_return+0x50/0xd0
    [    4.616470]  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
    [    4.616480]  ? do_syscall_64+0x124/0x530
    [    4.616486]  ? seccomp_run_filters+0x14b/0x240
    [    4.616495]  ? __seccomp_filter+0x50/0x360
    [    4.616501]  ? do_syscall_64+0x9d/0x530
    [    4.616507]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
    [    4.616515] RIP: 0033:0x77634b30030d
    [    4.616522] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa=
 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 5a 0f 00 f7 d8 64 89 01 48
    [    4.616544] RSP: 002b:00007ffc6dc679d8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000139
    [    4.616554] RAX: ffffffffffffffda RBX: 00006240351b2a60 RCX: 0000776=
34b30030d
    [    4.616570] RDX: 0000000000000000 RSI: 000077634a9325e1 RDI: 0000000=
00000001c
    [    4.616579] RBP: 00007ffc6dc67a70 R08: 0000000000000000 R09: 0000000=
000000000
    [    4.616590] R10: 0000000000000000 R11: 0000000000000246 R12: 0000776=
34a9325e1
    [    4.616599] R13: 0000000000020000 R14: 00006240351b1830 R15: 0000000=
000000000
    [    4.616610]  </TASK>
    [    4.616614] Modules linked in: xhci_pci(+) intel_uncore(-) xhci_hcd =
pcspkr thunderbolt(+) floppy ehci_pci i2c_piix4 ehci_hcd ata_generic pata_a=
cpi i2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcm=
d xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop zram lz4=
hc_compress lz4_compress overlay xen_blkfront
    [    4.616662] CR2: fffffffffffffff8
    [    4.616668] ---[ end trace 0000000000000000 ]---

It's in a VM (on Xen) with USB controllers (PCI devices with 0c03* class)
connected. From the VM point of view, those are:

    [    0.282416] pci 0000:00:06.0: [8086:7ec0] type 00 class 0x0c0330 con=
ventional PCI endpoint
    [    0.282416] pci 0000:00:06.0: BAR 0 [mem 0xf2050000-0xf205ffff 64bit]
    [    0.282416] pci 0000:00:07.0: [8086:7ec2] type 00 class 0x0c0340 con=
ventional PCI endpoint
    [    0.282416] pci 0000:00:07.0: BAR 0 [mem 0xf2000000-0xf203ffff 64bit]
    [    0.282416] pci 0000:00:07.0: BAR 2 [mem 0xf2074000-0xf2074fff 64bit]
    [    0.282416] pci 0000:00:07.0: supports D1 D2
    [    0.282416] pci 0000:00:08.0: [8086:7e7d] type 00 class 0x0c0330 con=
ventional PCI endpoint
    [    0.282416] pci 0000:00:08.0: BAR 0 [mem 0xf2060000-0xf206ffff 64bit]

Besides those PCI devices, the VM doesn't see the host's ACPI tables,
which may be relevant to the failure (I'm not really expecting
Thunderbolt to work in this setup). But still, it shouldn't panic...=20

Complete console log can be found in
https://openqa.qubes-os.org/tests/190050/file/startup-var_log.tar.gz -
var/log/xen/console/guest-sys-usb.log file.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8YV6wmP3999Jtnjp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpnXswACgkQ24/THMrX
1ywh1gf/QR+kdKrQ5X1BN3EERLqoSIVr8K+7dLF36QbxYJwlq5jja6oXYAx0Ymgj
SQXcOVWDsXKNMTtE25cpT55vTiOHcpqknZHav/E8Xe5U35mZSMKPxONfyEskPZSp
iIJR037EE2US4EjJqDbnAsxIJNKyW3+geNIozmyKNK++N6FA/FsvoRHWvFe6YCtA
ITz3Mt+/xg6rKXZA0kRPadWhgH3kLFK02i6xvG7cWCsXv+VS5GnMUv5ElEzV9125
lp0VbPzjFaCVYAJYpb4nLV8N7x0YGAV+LnSsUwc+xTnoYrsgbRkIqB4LhdSc46s6
gMlC0LVtcwT5VpAaFrVdVnLOMSw53A==
=eXAD
-----END PGP SIGNATURE-----

--8YV6wmP3999Jtnjp--
