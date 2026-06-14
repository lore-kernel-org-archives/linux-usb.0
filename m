Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EE70830
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781450569; cv=none; b=SJh/xgdp5ySE0GlbyNlSSsNflCUaUrcR9olMNU9ux5vG6SeGRxz4iRalOIKlOdUKvhwKBsYDwUpb8r1KSCR/d4qyJ62Mx9PyMzfGmZvTLMCNvwLGnhZ/SR2i7bH92kNWUi1h9/hdahP0wfVatiuz4WKmp5/jyk3XTB3iN87WkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781450569; c=relaxed/simple;
	bh=wdJNW15WRnR6mm7uLGWwYjcVt2wSr8fK7OPrm9yFFmk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HEFZyq6nLKVg1hpwjQCOmMschCmsh24tsFYT23xw5luTzuNkfR9HeY0QHy6Rkic6bq0UdBcn10NGANbR2uOfBPR991eu7viP73n5sVAJXhwykbi/L/WQUQ90rEEksdO7Cf5IgOxAysmbuHXDhHydbaFprIHQoGJhkmwQjWOmYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBvSLUvh; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBvSLUvh"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-91562bf6c12so304476685a.2
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781450567; x=1782055367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GO3hFfMczhC5hkmHG+NBK+mHvTn3MyYz4TwN692B5ao=;
        b=eBvSLUvhZ8WFA6my1USHRz+4FIx2prWqNmEdREcLtfYK9vrvMxdy8c9Fop8rBT67OU
         JKd2OKGRdPzjUpVf8ZHq2P4OXtTDko8XnSMlQeFF34J+0rckFQaq8wSah2CNyLVlNaHa
         OU7YuGgycRaNLoB43dmqc4pIBLDNI+7Ab85VyeYyCSGyxUmAHCyjeA227fVFDWbod0+K
         z1dJmg+Q406PpFjQEQ7/XhoE/YQ+QZ33bqHssQtA9pxqNtytUu8i4Mo634MSdef3K+eF
         MbLn7kkO6mNZTwrYPMp/+CQgShgnKEFPDrfa4dADEjLfArK7gJtnynSo2jfq3OdodFbo
         Z7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781450567; x=1782055367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GO3hFfMczhC5hkmHG+NBK+mHvTn3MyYz4TwN692B5ao=;
        b=AOH28At8keHWc3uKVhiblgdm0a3npPi1PF63iuXmz3ZFTzdRB9XwesYhJLm/oQETdf
         sp1xAmT9hpVLADTfFEUkQ68GV7nUhurqMRPpBaqGcqr6ORLByPY+K3Er3bzlMQFK+gzt
         tOLpMj3xo7V6/txHD9bcyFydm0/lRc9zqnZsLIVNW3xqwP4GvxXZEClCJ7dczc6DHkvU
         WIeyorFMoUhB1Le2mdPAHBevsJ6CaOPALZkv92Bp7sk+O0I7X7p3HV5H3FjC8/nNrYSo
         jVPjiIQ68Q6ipWGtVz3vTA5QslC0mAudcrQXEtt6BkhIzAZUYHOPt8nnXunCO+DSAyDV
         8Xdw==
X-Forwarded-Encrypted: i=1; AFNElJ9iOfCtRlb/reVE7ZUc+4oem0/Mcm6LC93aLctmKfLAMAhFtyL9bBd5Qq/3trVhxbptIoHOCjmEdwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66DIdrLE818DYEoi9doWbqA62mxeRGTWhgVT4L/sBE4QkVoEN
	n57kNzPDsSb10tEh+v0uIfabOxyeBxzGX56P30FY+w4J+5qqYyqqCOYS
X-Gm-Gg: Acq92OHvAMO9hwuippYoJ2Wl6VudCsRgvIUE9Ux2MZxJz9n5fYxXG2popczXhvTtlqP
	9m82BUQNi2y16Oh62DGd093K786v3Urpq8b9s3p0yprjGvvziyGJpttAzVFZHJJ2UH/Ojhs0RbY
	p9zBJdtigmtIDpW0/uoPwTws9jfGBNOvkMfmedGCh898sELoxp2kym6oIwttMLLgGwWX2uQdJhb
	FnPODh1HpUnmEGDwbmWwUOXqdowd/HejSZ/0boicr/PNI5pPI29Ly6v0u3b84eY3xdWOHyXvBii
	ecDOE0yFbyqfPaBnxSwvrF2mWRYHqbtvWoxxZ7neTpgk2CBPymDeMbdGZZTjNp3ncvJY0o/7Zlz
	05y8ELrS8CFiagjnjOFKYOUTNxm9OgCO6HPuYTcFe4K8Sb8mMWGlZ2LSmEVscJJGX/sK+4KMlvX
	L5cUH9tuV887paQQELAPqbmPm/QR/usFHhX7OLPOO84srai0q0O13zaQ==
X-Received: by 2002:a05:620a:198f:b0:915:a6ca:f12a with SMTP id af79cd13be357-9161bfa0f5dmr1744290685a.54.1781450567313;
        Sun, 14 Jun 2026 08:22:47 -0700 (PDT)
Received: from localhost.localdomain ([168.92.225.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04f5b7sm788985085a.38.2026.06.14.08.22.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 08:22:47 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-out-of-bounds in select_usb_power_delivery_show
Date: Sun, 14 Jun 2026 11:22:45 -0400
Message-ID: <178144969600.60470.6584137935143789620@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-out-of-bounds in select_usb_power_delivery_show

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/79c08ada299b3ae37b7a0af292ca413f

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[  102.318332] BUG: KASAN: slab-out-of-bounds in select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
[  102.319225] Read of size 8 at addr ffff888117d2f2c0 by task cat/8378
[  102.319943] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  102.319952] Call Trace:
[  102.320044]  select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
[  102.320066]  dev_attr_show (drivers/base/core.c:2421)
[  102.320081]  sysfs_kf_seq_show (fs/sysfs/file.c:65)
[  102.320085]  seq_read_iter (fs/seq_file.c:231)
[  102.320107]  vfs_read (fs/read_write.c:493 fs/read_write.c:574)
[  102.320140]  ksys_read (fs/read_write.c:717)
[  102.320146]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[  102.320160]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[  102.334419] Allocated by task 1129 on cpu 0 at 52.398062s:
[  102.336306]  tcpm_fw_get_caps (./include/linux/device/devres.h:59 ./include/linux/device/devres.h:63 drivers/usb/typec/tcpm/tcpm.c:7986)
[  102.336658]  tcpm_register_port (drivers/usb/typec/tcpm/tcpm.c:8519)
[  102.337014]  fusb302_probe (drivers/usb/typec/tcpm/fusb302.c:1759)
[  102.337349]  i2c_device_probe (drivers/i2c/i2c-core-base.c:591)
[  102.341175]  i2c_acpi_add_device (drivers/i2c/i2c-core-acpi.c:291 drivers/i2c/i2c-core-acpi.c:305)
[  102.342660]  i2c_register_adapter (drivers/i2c/i2c-core-base.c:1594)
[  102.343044]  i801_probe (drivers/i2c/busses/i2c-i801.c:1665)
[  102.347449] The buggy address belongs to the object at ffff888117d2f280
[  102.347449]  which belongs to the cache kmalloc-64 of size 64
[  102.348432] The buggy address is located 0 bytes to the right of
[  102.348432]  allocated 64-byte region [ffff888117d2f280, ffff888117d2f2c0)
[  102.376916] Kernel panic - not syncing: KASAN: panic_on_warn set ...


Best,
Shuangpeng
