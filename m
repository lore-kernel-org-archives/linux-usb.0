Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792516;
	b=IwW6sDIAVJk6KdNtB76IXe0n9Z8L0AIgE9mTKHQq1diG72SLekyWrwjU5YEYR15iK6Hn
	 U7tqgNjyMxZIJgm5C8/cI7jTF2kTshTbSSOYn/tiAzPLXKzI2UEOCjaayvwGiSENE44XD
	 hPYsLZAD3AQRiwFFt83rDVlZf/jSMCM+D6pMjCk1WPnLnvhMHfEAxmTvUEcBLqDGMvMrf
	 /fH3GqvcTlbE43JbhqYYKCaHQSbhnhV1hbIB8fcNdA+dd4AQjiJmzKcjg/OacTbK12NLu
	 zkbA2HgC6frA0BoyB9evyEEFmhtcUR4SH4z9eyVLcPGpTXVqZu0hdS64+GSx4JrQmdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5jY1o/VYUSMr6FHdTY6WEKyWAnPSq0c7+MXbHjYZIKE=;
	b=OhjnOOrL1ypeF+EKzfnR0fKg8Ikg1/w3T/qQKahInfWHlYdgD/iJubKbRYPuSB28uAEC
	 GL3Z+tVhvM9M59dbClM8sT+sp3JjOBionXpi8Vw+2bEu85NvHt/bnWA9PqKF2+CW6h2cc
	 5hoZfPuZAmDdjW2W5aztToC61073V2zIcVDss3m6eKlpIiIhPUoxvqLPbyrJOS+1czEKv
	 buYymA7mWwU8rTiG6mi3eq9+071OF/yj7GMUxhvepTXOj8HlWtp4AUkitxB5073yU2e9L
	 u19lI6oQGn4CsfOBjrRuG1h8At1WwBdHiUDsv01PS1RSjKRY2OICQS79+v4hMiZOtmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pqshield.com;
	spf=pass smtp.mailfrom=pqshield.com;
	dkim=pass header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=TNACa034;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0A606A334
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 15:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E0A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pqshield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqshield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=TNACa034
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so105274505e9.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 07:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqshield.com; s=google; t=1795792515; x=1796397315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jY1o/VYUSMr6FHdTY6WEKyWAnPSq0c7+MXbHjYZIKE=;
        b=TNACa034zoFimi7jJf/MEL0LgHha6SgemzOw1RJATR3FBbaoIQmc/PVAe4Me4LT6ej
         ahXTMrVqWpZpRyPcfI7KxpbHIZ7MJ35sIywpmd8sIs7ARm5wvb9z7Y1AMasMWGCMzz4t
         yRfLk4CWNB5Ps1JI7+tXLe6r6tM0NwcBENt6aCazOfqGpsucsh7LPHa2cMF9yu4tPs6s
         w9ntK/UJaf08sqxztoAzZH1TGkTfJKsZ1z9SRbOtTq5FZ55dRhXdXN0SNGUSXRBkfxFc
         plK37CTPdk5xYv9M76LoVTpEK5JIOX+hqxtOGabIXgxTQpmIzj/ZETf4++QTXaumTM21
         aqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792515; x=1796397315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jY1o/VYUSMr6FHdTY6WEKyWAnPSq0c7+MXbHjYZIKE=;
        b=Ofipakl+pJDHMvv3msjLp8lgKSH61Q039oOXwfKAcpD50ezpYCOkcLT2U03bTRXhQQ
         MBThyTxQ8NhCHhaUyITOPO4i9/y1cKSzi9P1VF326NGCvjyB2uIuzIyTKy5Q4QLe6wxU
         dSltbmy9Z+o4DYnYfWjLGyj5FtdALOo10UVpsQnSikjeNNNE+f3JbhgKLKKj+QZAEeHg
         oxq2LNzvQU+x02j2EJqASqK9a79S7XD/tO9Z5g7f7Iljcevr8Rk74Rn/mmYS5EGTJboj
         4KVv5YuhQvX8QEk04Hb9HzSPgEZVpFA4zkM8igTgpgV9/SKnTnD8rbuytftNzhDBP9f7
         zZeg==
X-Forwarded-Encrypted: i=1; AL+hErFckkAZBxWKdXcWjxHGvIvovZ93nh7CvmFn07SarD1xFm0OOiErDbtAE1VrQceT+dEd514e7a/1IlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UfUIZr/6+etenTxNefx6Wn9L5A413fV18EyqAoNEZ4u8w1zM2
	Gyad+qGjXg96jaPDHRE8xI1PILS6/phLLgdXnsckcozkXbf/vIZK70VPyUtqL7N+RJo=
X-Gm-Gg: AZFdTZeDyCWw/g8MqlUCorCZP1Dg2m654djTywGvyKJgEqpJR8GcEAwApWs1F8WktuU
	716GC26xw/6WKxI6dMiFowwcswprqvoAwuD0GPA4D+u8OxPw9IU3V22VrVKZI+DeY1d+NJyhn0H
	pQWuualJ+7WJ9iufIaJgmr113/qWpjhxtUz5smrMCvTVMLGT3kWjBDWCHahq8NcHSRUkxsnRyHe
	rEKZK/SRdIYnZ/gf0B4tSHCP2EN67H59KRvy4f/m3RIHLN9MUBf8eRHleAPPCdvjIwdZgzAG9T+
	ke+R/KeXQTvldKy9Z1UpGFgoo7EAoOphbbYjmif8IYheO4XQTpGZYM3iUt7o7jOtsQ8QU/PYP4u
	RijBJEkN+n62g5lUJlUSIqEP7fZpwrk41ckJTTT9f+WhImpxOmFmQVFXxUSSdAN/sL2Rl1MOTnj
	0IBanutfo3N2AezDH96uIT6FoIJorRSL3v+osv0/Shsi/TV4xJUqpqw+vXQXx7Z2QHAoF8rMhH+
	QhfiDWy9wTaLKCj+5CdYmcOl2OVYOPgqKPNviWiNP1uQUw2zdljAceqobHEA3YlV8iCPWGIFHH1
	eOZ4F2ta0zrMzMqFJRLzfaPPWmvEgJefDYBQpUkCeGMLoiefo3rkt1vnn+RAYJyah8RZ5Le2RUP
	pC7OPcOqei5/e1A6SSbUWEJYt6DU=
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr514728325e9.17.1795792514819;
        Fri, 27 Nov 2026 07:15:14 -0800 (PST)
Received: from lucas-pascal-pqshield.wework.com (host.178.94.68.195.rev.coltfrance.com. [195.68.94.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm758478725e9.12.2026.11.27.07.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:15:14 -0800 (PST)
From: Lucas Pascal <lucas.pascal@pqshield.com>
To: skhan@linuxfoundation.org
Cc: jeffinphilip14@gmail.com,
	gregkh@linuxfoundation.org,
	i@zenithal.me,
	shuah@kernel.org,
	valentina.manea.m@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in favor of drivers_probe
Date: Fri, 27 Nov 2026 16:15:13 +0100
Message-ID: <20261127151513.356045-1-lucas.pascal@pqshield.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <eeb557fb-7ae5-42f6-8167-83c3828169ef@linuxfoundation.org>
References: <eeb557fb-7ae5-42f6-8167-83c3828169ef@linuxfoundation.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/26/26 13:49, Shuah Khan wrote:
> I want to know your test setup. Can you reproduce this with usbip host and
> running bind command from the tool?
>
> Also send me the error messages.

Hi Shuah, Jeffin,

We hit a crash in do_rebind() on production servers, with the usbip
tool and no fuzzing involved. In our case the pointer is not NULL but
dangling: stub_probe() saves the usb_device in busid_priv->udev without
a reference, and nothing clears it when the device is disconnected.

Our servers export USB debug probes with usbip, each probe connected
through external powered USB hubs. When a probe stops responding while
exported, closing its usbip connection makes usbip-host reset it; the
reset fails and the hub driver disconnects it. The "usbip unbind" that
follows writes the busid to "rebind", and do_rebind() passes the freed
usb_device to device_attach().

Kernel log, trimmed ("usbip detach", then "usbip unbind -b 1-3.3.4"
started at 08:24:36.9; 3-2 is the vhci_hcd side, on the same host):

  08:24:36 usbip-host 1-3.3.4: recv a header, 0
  08:24:36 vhci_hcd: connection closed
  08:24:36 usb 3-2: USB disconnect, device number 36
  08:24:37 usbip-host 1-3.3.4: reset full-speed USB device number 127 using xhci_hcd
  08:24:37 usbip-host 1-3.3.4: Device not responding to setup address.
  08:24:37 usbip-host 1-3.3.4: device descriptor read/all, error -32
  [... three more resets, same errors]
  08:24:38 usbip-host 1-3.3.4: device reset
  08:24:38 usb 1-3.3.4: USB disconnect, device number 127
  08:24:38 usb 1-3.3.4: new full-speed USB device number 25 using xhci_hcd
  08:24:38 usb 1-3.3.4: Device not responding to setup address.
  [... devices 26 to 28 and a port power cycle, same errors]
  08:24:41 usb 1-3.3-port4: unable to enumerate USB device
  08:24:41 BUG: kernel NULL pointer dereference, address: 00000000000000e0
  08:24:41 #PF: supervisor read access in kernel mode
  08:24:41 #PF: error_code(0x0000) - not-present page
  08:24:41 Oops: Oops: 0000 [#1] SMP NOPTI
  08:24:41 CPU: 1 UID: 0 PID: 3667297 Comm: usbip Not tainted 7.0.0-42-generic #42~24.04.1-Ubuntu PREEMPT(lazy)
  08:24:41 RIP: 0010:__device_attach+0x3b/0x1e0
  08:24:41 Call Trace:
  08:24:41  device_attach+0x10/0x20
  08:24:41  do_rebind.isra.0+0x3b/0xa0 [usbip_host]
  08:24:41  rebind_store+0x99/0x140 [usbip_host]
  08:24:41  drv_attr_store+0x24/0x50
  08:24:41  sysfs_kf_write+0x72/0x90
  08:24:41  kernfs_fop_write_iter+0x161/0x1f0
  08:24:41  vfs_write+0x29e/0x480
  08:24:41  ksys_write+0x71/0xf0

The usb_device is freed at the "USB disconnect" of 08:24:38. The rebind
seems to wait for the hub's device lock, held by the hub driver while
it retries the enumeration, and crashes as soon as the hub driver gives
up, at 08:24:41.

This happened twice so far, on v7.0 distribution kernels. The task dies
holding the parent hub's device lock, so everything that touches that
hub blocks afterwards, including the other probes behind it, and only a
SysRq reboot recovers. The same use after free happens at module
removal: stub_device_rebind() calls do_rebind() for every device bound
since the module was loaded, which v3 doesn't change.

Test setup: a QEMU VM with KASAN, v7.4-rc4, a g_zero gadget on
dummy_hcd as the device, unplugged by unloading g_zero:
- bind, unbind, unplug, "match_busid del", rebind (the writes of
  "usbip unbind", with the device unplugged in between):
  slab-use-after-free in do_rebind();
- bind, unplug, rmmod usbip_host: the same;
- "match_busid add" then rebind, never bound: the syzbot report,
  null-ptr-deref in range [0xf0-0xf7] in do_rebind().

The first case, trimmed: the usb_device was freed by hub_event() when
the device was unplugged, and do_rebind() reads its dev.parent (240 =
0xf0, the offset in the syzbot report):

  BUG: KASAN: slab-use-after-free in do_rebind.isra.0+0x14d/0x180 [usbip_host]
  Read of size 8 at addr ffff888004d0e0f0 by task sh/129
  CPU: 1 UID: 0 PID: 129 Comm: sh Not tainted 7.4.0-rc4 #1 PREEMPT(lazy)
  Call Trace:
   <TASK>
   dump_stack_lvl+0x53/0x70
   print_report+0xd0/0x630
   kasan_report+0xce/0x100
   do_rebind.isra.0+0x14d/0x180 [usbip_host]
   rebind_store+0xae/0x110 [usbip_host]
   kernfs_fop_write_iter+0x329/0x4c0
   vfs_write+0x5d2/0xcd0
   ksys_write+0xf7/0x1c0
   do_syscall_64+0xdf/0x4c0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

  Allocated by task 59:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x40
   __kasan_kmalloc+0x8f/0xa0
   __kmalloc_cache_noprof+0x148/0x360
   usb_alloc_dev+0x50/0xef0
   hub_event+0x1d46/0x41d0
   process_one_work+0x6bb/0x1090
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0

  Freed by task 10:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x40
   kasan_save_free_info+0x3b/0x60
   __kasan_slab_free+0x57/0x80
   kfree+0x1a5/0x370
   device_release+0xc8/0x240
   kobject_put+0x14d/0x280
   hub_event+0x2519/0x41d0
   process_one_work+0x6bb/0x1090
   worker_thread+0x45b/0xd10
   kthread+0x2c8/0x3b0

  The buggy address belongs to the object at ffff888004d0e000
   which belongs to the cache kmalloc-2k of size 2048
  The buggy address is located 240 bytes inside of
   freed 2048-byte region [ffff888004d0e000, ffff888004d0e800)

The second case, at module removal:

  BUG: KASAN: slab-use-after-free in do_rebind.isra.0+0x14d/0x180 [usbip_host]
  Read of size 8 at addr ffff888004ecb0f0 by task rmmod/123
  Call Trace:
   <TASK>
   dump_stack_lvl+0x53/0x70
   print_report+0xd0/0x630
   kasan_report+0xce/0x100
   do_rebind.isra.0+0x14d/0x180 [usbip_host]
   usbip_host_exit+0x123/0x4d0 [usbip_host]
   __do_sys_delete_module+0x346/0x510
   do_syscall_64+0xdf/0x4c0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

I sent a driver-only fix: do_rebind() looks the device up by name with
bus_find_device_by_name(), which holds a reference, and the saved
pointer is removed. That is the lookup drivers_probe itself does, as
do the driver core's bind and unbind attributes. It fixes the three
cases above, and keeps "rebind" working for the usbip binaries and
scripts already in use:

  https://lore.kernel.org/all/20261127144551.350348-1-lucas.pascal@pqshield.com/

It doesn't cover everything raised in this thread. The invalid opcode
Jeffin saw (bind, rebind, unbind) is the BUG() in stub_disconnect():
rebind_store() removes the busid entry of a device still bound to
usbip-host, and the unbind no longer finds it. I could reproduce it,
with or without the patch:

  kernel BUG at drivers/usb/usbip/stub_dev.c:439!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:stub_disconnect+0x2ae/0x300 [usbip_host]
  Call Trace:
   <TASK>
   usb_unbind_device+0x6b/0x1b0
   device_release_driver_internal+0x32e/0x520
   unbind_store+0xd1/0xf0
   kernfs_fop_write_iter+0x329/0x4c0
   vfs_write+0x5d2/0xcd0
   ksys_write+0xf7/0x1c0
   do_syscall_64+0xdf/0x4c0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

Refusing "rebind" while the device is bound could be a follow-up. We
haven't hit that one ourselves.

This analysis, the fix and the reproducer were developed with an AI
coding assistant (Claude Code), and I reviewed and tested them; the
first oops above is from our own servers, the others from the test VM.
I can share the test script and the full logs, or send the script as a
selftest if that is useful.

Thanks,
Lucas
