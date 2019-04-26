Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915F4C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 09:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57407206BA
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 09:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrWnpOOw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfDZJu0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:50:26 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43299 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfDZJu0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 05:50:26 -0400
Received: by mail-io1-f66.google.com with SMTP id v9so2417009iol.10
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IdyajxHaAv2wMjQ4z5BGiDcCFa3VNkptmEqFue2wKoo=;
        b=XrWnpOOwJwto5p1rcDluDVk1u2u1/4W7Pi2iUTNxiI/SokkYW9fPck4WdQyTPgO14B
         G/bKgTnVUHFFrjgTB57VjzJtmRmxDNVn+Wki9p0idvD1HEbdQO9kfN8PAOveCOM0UvLS
         qAyYd/BPStdeMInVeejjVZ6kmTeF0aojo9Nx2C/UQR/QGzyMDzYZr09+dmvF2er0AUTP
         9QajgAqTHc6nLSLPkib8XAvQR8zOGy9FIBa0f0gAx/C91GwhyG9cThi9T5Xv5gOz7+UB
         GZMXnCwUKZ3s8Dee9HQ7LAIkRdTbNu1w4oiI1iWKliOYK6ic19ZeDBJ9bF1+h17CdlL3
         TNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IdyajxHaAv2wMjQ4z5BGiDcCFa3VNkptmEqFue2wKoo=;
        b=BXlk2viSBVEwxy2O5TV7SN2J4BXndBBFC4RxS1fWAGf4Cv3YBQp/zWH/3hhmvNEd21
         hrKcY0ACaB4TXIhm6edNRHfy5NKSeFLkdxH/hvazKXDWsY/WDg9wIhqDPnLbNL9abyC9
         YVO9aUwco2SgWZydpjwVTEh9gEcdSATxkKeAVWIM7plmQYdl4o0fwZ7ZOBsjhVyY3cuS
         9G79fIEFdSJwd0zxWtE0IdFb5CKDa1ymmqQMnQzJ1DfcvzZTAHQKIlf2xnN+wuGil1qm
         4+u6lNVcW5qgayDoBdo4E1DQvti7Cy3sikPhAIp5NV2yCter49Nx2/KNVJyg98DKtd8R
         tcpg==
X-Gm-Message-State: APjAAAVCP+WbHKwPKE8py5ZXXgMb85Y+CYYd0p7M+0HwiSYMOnfv/5fL
        cMF/Q+AUIaPw9ukroHZBTehtFyTPGThQtNNUAgWhs/s/KXU=
X-Google-Smtp-Source: APXvYqxR8MFbk8fjohTvtgFgq1/6dxcTFCvmDLh+qyEz0c5Psm/XTVdPjAnhdKmo3CvRQmKoo0JWm59wryY6zip2Tvc=
X-Received: by 2002:a6b:f008:: with SMTP id w8mr17627715ioc.251.1556272225349;
 Fri, 26 Apr 2019 02:50:25 -0700 (PDT)
MIME-Version: 1.0
From:   Christo Gouws <gouws.christo@gmail.com>
Date:   Fri, 26 Apr 2019 11:50:14 +0200
Message-ID: <CAPHvrskWo2yhtNRthWFMST-S_=afo06fZo7SmbBOKY7VXHWA-g@mail.gmail.com>
Subject: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
the following crash in dmesg on Ubuntu 18.04
Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
seems to happen (using liveCD).


The output on the card seems to work, but none of the inputs work.

I've also now tested with latest kernel available on Arch Linux
Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
2019 x86_64 GNU/Linux

After some further testing, I found that this issue cropped in beween
v4.8.17 and v4.9-rc1.

v4.8.17   - Works fine.
v4.9-rc1+  - Produces crash

[    5.114276] ------------[ cut here ]------------
[    5.114277] transfer buffer not dma capable
[    5.114293] WARNING: CPU: 1 PID: 429 at drivers/usb/core/hcd.c:1586
usb_hcd_map_urb_for_dma+0x3eb/0x5a0
[    5.114294] Modules linked in: snd_seq_oss(+) snd_usb_toneport(+)
snd_usb_line6 videobuf2_common btusb snd_seq_midi btrtl irqbypass
videodev btbcm snd_hda_codec_conexant drm_kms_helper xpad
snd_seq_midi_event snd_hda_codec_generic media btintel cmdlinepart drm
ff_memless bluetooth snd_hda_intel i2c_algo_bit
drm_panel_orientation_quirks snd_rawmidi intel_spi_platform joydev
ipmi_devintf ipmi_msghandler input_leds snd_hda_codec ecdh_generic
cfg80211 cfbfillrect snd_hda_core cfbimgblt cfbcopyarea thinkpad_acpi
snd_hwdep rtsx_pci_ms fb_sys_fops syscopyarea snd_seq sysfillrect
sysimgblt intel_spi memstick mei_me spi_nor nvram fb snd_pcm mtd mei
fbdev snd_seq_device snd_timer ie31200_edac snd soundcore mac_hid
sch_fq_codel parport_pc ppdev lp sunrpc parport ip_tables x_tables
autofs4 hid_generic usbhid hid rtsx_pci_sdmmc psmouse ahci i2c_core
r8169 rtsx_pci libahci lpc_ich realtek wmi video
[    5.114332] CPU: 1 PID: 429 Comm: systemd-udevd Not tainted
4.20.8-042008-generic #201902121544
[    5.114333] Hardware name: LENOVO 20C600HHZA/20C600HHZA, BIOS
J9ET99WW (2.19 ) 05/05/2015
[    5.114336] RIP: 0010:usb_hcd_map_urb_for_dma+0x3eb/0x5a0
[    5.114337] Code: 48 01 f9 48 39 ce 73 7f 80 3d c6 03 eb 00 00 41
bd f5 ff ff ff 75 a3 48 c7 c7 00 e1 d5 8d c6 05 b0 03 eb 00 01 e8 07
32 95 ff <0f> 0b 8b 53 64 eb 89 81 4b 64 00 00 02 00 e9 40 fd ff ff 4c
8b 05
[    5.114339] RSP: 0018:ffffacc582077788 EFLAGS: 00010282
[    5.114340] RAX: 0000000000000000 RBX: ffff9eb0282b7c00 RCX: 0000000000000006
[    5.114341] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff9eb02e056440
[    5.114343] RBP: ffffacc5820777a8 R08: 0000000000000001 R09: 0000000000000361
[    5.114344] R10: 0000000000000004 R11: 0000000000000000 R12: ffff9eb02bcde000
[    5.114345] R13: 00000000fffffff5 R14: 0000000000600000 R15: 0000000000000200
[    5.114347] FS:  00007fbbc4c6e8c0(0000) GS:ffff9eb02e040000(0000)
knlGS:0000000000000000
[    5.114348] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.114349] CR2: 000055d1c2aa6008 CR3: 000000042abf2006 CR4: 00000000001606e0
[    5.114350] Call Trace:
[    5.114355]  usb_hcd_submit_urb+0x497/0xc70
[    5.114358]  ? __switch_to_asm+0x40/0x70
[    5.114360]  ? __switch_to_asm+0x34/0x70
[    5.114362]  ? __switch_to_asm+0x40/0x70
[    5.114364]  ? __switch_to_asm+0x34/0x70
[    5.114367]  ? __switch_to+0x471/0x4e0
[    5.114369]  ? __switch_to_asm+0x34/0x70
[    5.114371]  ? usb_alloc_urb+0x1a/0x30
[    5.114373]  usb_submit_urb+0x2f2/0x5a0
[    5.114376]  usb_start_wait_urb+0x6e/0x180
[    5.114378]  usb_control_msg+0xdc/0x140
[    5.114383]  line6_read_data+0xec/0x200 [snd_usb_line6]
[    5.114386]  line6_read_serial_number+0x1b/0x20 [snd_usb_line6]
[    5.114389]  toneport_init+0x9a/0x220 [snd_usb_toneport]
[    5.114393]  line6_probe+0x2f1/0x460 [snd_usb_line6]
[    5.114395]  ? line6_toneport_disconnect+0x70/0x70 [snd_usb_toneport]
[    5.114398]  toneport_probe+0x35/0x40 [snd_usb_toneport]
[    5.114401]  usb_probe_interface+0xf1/0x300
[    5.114405]  really_probe+0xfe/0x3b0
[    5.114407]  driver_probe_device+0xba/0x100
[    5.114409]  __driver_attach+0xe4/0x110
[    5.114411]  ? driver_probe_device+0x100/0x100
[    5.114413]  bus_for_each_dev+0x79/0xc0
[    5.114417]  ? kmem_cache_alloc_trace+0x15e/0x1e0
[    5.114419]  driver_attach+0x1e/0x20
[    5.114422]  bus_add_driver+0x159/0x230
[    5.114424]  driver_register+0x70/0xc0
[    5.114426]  usb_register_driver+0x7f/0x140
[    5.114428]  ? 0xffffffffc02f1000
[    5.114431]  toneport_driver_init+0x23/0x1000 [snd_usb_toneport]
[    5.114434]  do_one_initcall+0x4a/0x1c4
[    5.114436]  ? _cond_resched+0x19/0x30
[    5.114438]  ? kmem_cache_alloc_trace+0x15e/0x1e0
[    5.114441]  do_init_module+0x60/0x220
[    5.114444]  load_module+0x16bb/0x1920
[    5.114447]  __do_sys_finit_module+0xbd/0x120
[    5.114449]  ? __do_sys_finit_module+0xbd/0x120
[    5.114452]  __x64_sys_finit_module+0x1a/0x20
[    5.114454]  do_syscall_64+0x5a/0x110
[    5.114456]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    5.114458] RIP: 0033:0x7fbbc56f3219
[    5.114460] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 47 fc 0c 00 f7 d8 64 89
01 48
[    5.114461] RSP: 002b:00007ffcd2692b38 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    5.114463] RAX: ffffffffffffffda RBX: 000055b7b7649160 RCX: 00007fbbc56f3219
[    5.114464] RDX: 0000000000000000 RSI: 00007fbbc55d7cad RDI: 000000000000000f
[    5.114465] RBP: 00007fbbc55d7cad R08: 0000000000000000 R09: 0000000000000000
[    5.114466] R10: 000000000000000f R11: 0000000000000246 R12: 0000000000000000
[    5.114467] R13: 000055b7b7625220 R14: 0000000000020000 R15: 000055b7b7649160
[    5.114470] ---[ end trace 4f385244c87aeb99 ]---
[    5.114474] snd_usb_toneport 1-6:1.0: receive length failed (error -11)
[    5.114779] snd_usb_toneport 1-6:1.0: read request failed (error -32)
[    5.114783] snd_usb_toneport 1-6:1.0: write request failed (error -11)
[    5.115836] snd_usb_toneport 1-6:1.0: Line 6 POD Studio UX1 now attached
[    5.115876] usbcore: registered new interface driver snd_usb_toneport

Kind Regards,
Christo Gouws
