Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB22D3EEB
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788698752; cv=pass; b=RhHO69Vy7yt7+uMZ4RrIQ5TTwvqRA1Tvsv3Y45UlHgrd+7qnLkmg3zeKOcjzbS8l/1CgyFA5I4FD/WqTFyQGtPL1qldO2WldtNx2xw4gyljXjrXyo2JHqkAfRpUtu0A49UogpTnO6Qh0l9dgUZZpEBAe/iihYQBu+tIJtOdFQAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788698752; c=relaxed/simple;
	bh=WmHF2V7uCFeYQSt3FlN6ZqcyhMgg9l/UOA4n/C2dABM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Hjv453+8oa5j6jp47xjeDEOrXFBK5niVYv8N+J514UuTZIL76BR2M41LYnrP9gJFyIEqw+Og4vPBhRfl0rfBQ44gYM7romqD5WcegJOQXCZoG7r4uKGXyDMkCO3LQqzE9WRy2rNhmmuTcENfiXTLPPJpUqnQUJvXPfJP4KwwKzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZlEcESw; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZlEcESw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9db539a54so20677735ad.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 05:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788698751; cv=none;
        d=google.com; s=arc-20260327;
        b=euet4ULbJ/q2AT6hoJNyR8QYZBqlvWG0PpXipc/MfR3R22lcJmHR0ZKAQfNoj7CgIM
         ZmedVNW7DT08CWlq2Dv2mOvxBlLGM1yupbgiyrJAi9dhQhUFm4DI1HYKJlZNrWONA3Rq
         YfWl/VCiAAIVCNyYl5lV6zlO+6lNrEEqwonArDg38dwMpcyi2gPSy6bVyj808IGPXW7F
         ZsqZosz4NqaO5ifgDeiB6PVLjTZipTw49PVC5kPick8Ud3VQVQ8gWxa4UnkilgMDUXB4
         KqJo5zmHYJRw536rs0juPfH0i3X0LH13DgFQKdBuLQNDkvoFXe5rdY/4vEenW+VazzKD
         LOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=y2d5r2gb05PRzQuk3XzRlcn5a27Va2oemRcADWFNB1E=;
        fh=VimqKRrJCN9rdcfuq5onff2+63396vNbthBTDDSyxg0=;
        b=BYzmnfb8JKw61kB2+9jDNAQ5RfUjYGseMuXUk27Bs/F70j5e9qhhMuAxciQWRhHHnP
         TlBPRCseiej2USSO8jU0XISvJQd/GiaN1+dgOU9ibiapkC1ssUUz4FENL7ai+BagqK+O
         z2B/hWFQGy0x+b2Pi0UCp/cde4yoy6MYaooKNdfEwT/UQyV8Pa/LYvZnLxmygD725OrX
         MyuCt3CrZas0x+8+I8ZqJVjQJkC4F3lCY1zGcs+G2KJY8qwj6/f/vvGCX1+/tG3Zt8C4
         y2YSgQQzWgr4MCj1s/EQQm+l8I/0H6EwV/cAkqda4ngpokOVWYFKAnSQKjKLW2qcn7bw
         8bkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788698751; x=1789303551; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y2d5r2gb05PRzQuk3XzRlcn5a27Va2oemRcADWFNB1E=;
        b=CZlEcESwssy+3+zaKjzz4HiVqya/1MYRPcDxs/hWB7zfLF/xVGgQmJsT+/0FMHx2iV
         qOTrZrcFk27DxZeJCoSINO+qKij6n/rnDlx7yeYHZOG5LY31mZ8zyYm2sDTx90xoobA4
         oRvp55VwcHSoq+rTrhGe5wGwVLT9c63m7eqPzHKY/nft4Jz0jad3B+RDLB9MvLSijx46
         eH/y7iB3McxnPJOvb/FqClwUdUmjg2AuZOc3Olj4ljhWTeMr61Q2Gme8EAn0Cc8EWAUq
         AF8eaYA8xASWwbD9PTxnBzLFnS59Bkj/6SXxflvUdVXTgfwlDLoOq+RZCSIzUJQtZooJ
         FL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788698751; x=1789303551;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2d5r2gb05PRzQuk3XzRlcn5a27Va2oemRcADWFNB1E=;
        b=Kodjs8CdTJgi+awrIl8VlKUbSvgbai6NFt04/Zop/C48yXFPGqJxCz+2aaOhUs7bGO
         CKUvmjz9MWLhp09kceJxjvPsc5SX4uYwYQuJgzw1TayJV1ZdiI2DLkCDVLZbNefbt3Vf
         5l2DGBYFnOXgGUh6+CFT0LqkuSNZlyrGUzQbalCIOYKrNevoOfRhX65d7+479C6yoi2O
         PdqNpcAgaM4YuQWA4Iz5pooP2G7MCMTx+ZHOsXNMQoRskLtZZl2WI/7DZzxmdq+z9oTO
         X2Vn740otbXxBi0gNN8Sz1f15FS3KWEuCtgTRqE36o7wFljvd1ncMpEAfwYaCjT6NNfc
         3Nfg==
X-Gm-Message-State: AFuF++m41I0d0yLJCk0vGUDs4jN2YB3mDDSiFPJOWZ8wmPUPyePVjT6X
	ws4ypYIZhefKok0mzoCc/TAsr22kLRimWJCk538k/f0HIQrEspmi2qkNGPUiELfRT2WFWcR2kEa
	pLjn0jM0u4kb4sxiUQ84ljUagbeSPy6uqij6a
X-Gm-Gg: AYBFou3PTBZ46paRnO5VLfjlLIhjHTaaG6JCwE4k9rOVj7lYY0R5bymcLkVnvqK2QOb
	OnDQoWg8s7zJLsOB94lYqw/Lorq2/AJF4ox2bK0UNNMAspAHWmuXlgYHQ/dviU1urw/C4lZD8DO
	qbAUBwDZZtBlc3vC6HxU3ifiXL6nFKXpbtXud4NhcgvQRFmdZi0Nx57OOHOdRLYFYRUk/rETuRR
	aI43bAr4QCGAj8uZx/LAVRzTFkrsdBon0pgOC1fBJFBf5IMRVsO8nXHNGmjgTo+WRrfhJxKnvBu
	iaPrkHkDO7ymkGjtSbVmFrMh3pEHcdMqCf5CeklsQsdUmg==
X-Received: by 2002:a17:903:2ec5:b0:2cf:8131:75e8 with SMTP id
 d9443c01a7336-2db125c412dmr278447795ad.13.1788698750783; Sun, 06 Sep 2026
 05:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mikey Coder <mikeycoder284@gmail.com>
Date: Sun, 6 Sep 2026 18:15:38 +0530
X-Gm-Features: AcwNN1UXAsNeo2kNNl1SH8eFk0FwZ2Mg8gi-1aciso5eqXPPsDDAkxiW2b6CqCg
Message-ID: <CABo2BzE4BMBeL-pW5DvAqyJ8aMVT41OJbd_VJ40ngUmPD=eG2w@mail.gmail.com>
Subject: [REGRESSION] Samsung USB tethering fails with rndis_host TX queue
 watchdog timeouts on 7.2.3
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I appear to be experiencing a regression in Linux 7.2.x affecting USB
tethering from a Samsung Android phone.

USB tethering worked with the previous kernel I was using (Linux
7.1.x), but stopped working after upgrading to:

7.2.3-arch1-2

The phone is detected correctly by USB, and the RNDIS driver binds
successfully. The network interface is created as expected, but packet
transmission appears to fail immediately.

Relevant `lsusb` output:

Bus 003 Device 005: ID 04e8:6863 Samsung Electronics Co., Ltd Galaxy
series, misc. (tethering mode)

Relevant `ip link` output:

4: enp0s20f0u2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
fq_codel state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether 16:7e:18:7c:69:7f brd ff:ff:ff:ff:ff:ff
    altname enx167e187c697f

The kernel successfully registers the RNDIS device:

rndis_host 3-2:1.0 usb0: register 'rndis_host' at usb-0000:00:14.0-2,
RNDIS device, 16:7e:18:7c:69:7f
rndis_host 3-2:1.0 enp0s20f0u2: renamed from usb0

However, transmission then repeatedly fails with:

rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 13: transmit
queue 0 timed out 5353 ms
rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 10: transmit
queue 0 timed out 5120 ms
rndis_host 3-2:1.0 enp0s20f0u2: NETDEV WATCHDOG: CPU: 0: transmit
queue 0 timed out 5120 ms

Similar watchdog timeouts continue to occur while tethering is enabled.

The complete relevant kernel log from this boot is:

Sep 06 17:32:34 arch-nitro kernel: usb 3-2: new high-speed USB device
number 5 using xhci_hcd
Sep 06 17:32:34 arch-nitro kernel: usb 3-2: New USB device found,
idVendor=04e8, idProduct=6863, bcdDevice= 5.04
Sep 06 17:32:34 arch-nitro kernel: usb 3-2: New USB device strings:
Mfr=1, Product=2, SerialNumber=3
Sep 06 17:32:34 arch-nitro kernel: usb 3-2: Product: SAMSUNG_Android
Sep 06 17:32:34 arch-nitro kernel: usb 3-2: Manufacturer: SAMSUNG
Sep 06 17:32:34 arch-nitro kernel: usb 3-2: SerialNumber: RZCX919VQYR
Sep 06 17:32:34 arch-nitro kernel: usbcore: registered new interface
driver cdc_ether
Sep 06 17:32:34 arch-nitro kernel: rndis_host 3-2:1.0 usb0: register
'rndis_host' at usb-0000:00:14.0-2, RNDIS device, 16:7e:18:7c:69:7f
Sep 06 17:32:34 arch-nitro kernel: usbcore: registered new interface
driver rndis_host
Sep 06 17:32:34 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
renamed from usb0
Sep 06 17:32:39 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 13: transmit queue 0 timed out 5353 ms
Sep 06 17:32:44 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 10: transmit queue 0 timed out 5120 ms
Sep 06 17:32:50 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 0: transmit queue 0 timed out 5120 ms
Sep 06 17:33:25 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 4: transmit queue 0 timed out 5008 ms
Sep 06 17:33:57 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 4: transmit queue 0 timed out 5813 ms
Sep 06 17:35:23 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 11: transmit queue 0 timed out 5689 ms
Sep 06 17:41:39 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 12: transmit queue 0 timed out 5001 ms
Sep 06 17:43:01 arch-nitro kernel: rndis_host 3-2:1.0 enp0s20f0u2:
NETDEV WATCHDOG: CPU: 12: transmit queue 0 timed out 5001 ms

I am running Arch Linux on an Acer Nitro V15 (ANV15-51).

Kernel:

7.2.3-arch1-2

The USB connection itself appears stable enough for the phone to
remain detected, and the RNDIS interface is created successfully, so
the failure seems to be specifically related to RNDIS network
transmission.

I have not yet bisected the regression or tested the previous kernel
in this report.

Please let me know what additional information or testing would be useful.

Thank you.
