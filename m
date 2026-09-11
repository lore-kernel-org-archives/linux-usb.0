Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9585744F56F
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128677; cv=none; b=hyBnJ1+uyohoxI+K0tSSjyWEnX+bGL8PHX8G64EAYphk4e34CzpTme55Ge8ynsfbop5/KMymWl9CbYccNoDhWjmAWT/SobaOMEt2PKfF1GyoWlK1HDDD3IHXR/6mk1pQ1PTXXTXhOTyz/ajV8yo3zkK6kuKs480RNsFt8Peo0Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128677; c=relaxed/simple;
	bh=/+Pb7qNhdW/92Ds/TAPc2p4+sY2XjxgqvinBTafmXbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYNGfOIRr+PxxQ38rN1SAg0Elbfr7xorTGBGc1Kp0+hXeXqIUeWJOFLCtZ6DZgmtg1hNbvegXIYcvoJun5Ns6JpL0dBVJVJ/JTbHpuPsUCUWsItg1xRlRQlpENVIjIdHVday1IZU6tTjcQkNQ1GRHkjInqRiPkicngDoECW8L0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqYd/9Hd; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqYd/9Hd"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso5022455ad.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128674; x=1789733474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Pb7qNhdW/92Ds/TAPc2p4+sY2XjxgqvinBTafmXbM=;
        b=rqYd/9Hdnib5pgWLC+/wbQphPmDcTbYi/1CSStnUfvwpOtjjBEm147yfHJModCdoRG
         hpVfcEUQxObSDelNT2ZY4qJlIKApXRODUS7hPGohTo4t8YUSfvRhNof1MF4/VTqotj+t
         9Vq83NioeIIxSmuPspHiXT6sl2uwsUwxIrJLGpL7CYG+TZ/3Ae3olIUxmG8SagoctMsX
         U+D9nvCPFFjZwM7Fy0zWbRjOdv4ZOgJ60sSZbI6a8wAzFGf3SBGOyLPapTWzcXWN+8dD
         rddpH1JJuF/Pxm9VACD12WF6K0XWBlJr8BenWbh1ynTXbQcil2vaZD4Zct1T2jWI87an
         hH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128674; x=1789733474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Pb7qNhdW/92Ds/TAPc2p4+sY2XjxgqvinBTafmXbM=;
        b=mkL+hJVaTB2SQC9QEtWzz4uBatjhQiPftCNcibL4Myo0rYLVjm6majYN7hOotssegK
         TAyul7e5TVBt7QqULjXCG7KoiJ0F9TkK7/AnCu6SV2a6DTrFs7NAMDPQRx3xdv+plcGf
         LHhHkyy6bGsXUzS8OLSwfLzawWerbbfDftJmI3a1B4fKq1ZdnzqCh/GiIqee7h0klv8R
         0bCrs3f1fPU0lTherSB0GieK1Pb0TCYcsqDAg4LP20oQYkhEUg/MYB5e5q+6+0ZhTYCh
         Mtu+4t+SKFwJZP5OWUKzKqeeDy4VJQGHDgCvIOXTNefzXJF21rqn3L69iT0EXtat3j4+
         px/A==
X-Forwarded-Encrypted: i=1; AKwUvBx03ic+hMZYz447SL7Qz0N8xN4o6DaspYmdcc0E6t9ISuWBuVS/ehIB8TtUvRBdXM3rIzDoyjrgaiA=@vger.kernel.org
X-Gm-Message-State: AFuF++k2063xCRVKzRRLRbiGrz6g8CW7hFOT4JOOKF1XoNonkcvx51nj
	udosOwlwrXgR+vJ12LIlnnZp4CMu3KIeIQJi68ywAfG8N+0juGiO1s+S
X-Gm-Gg: AYBFou0OUbIYFXLV5PVUZRe+ie92dAeTjagvHCIDZMYuhs2kNuoiyKHhhRenDkcmuxD
	preKOYsgbBqezmYDqRDFdrv59FiQ22Qk9iwC5XFjqCg7On23U7cIwpezOYj87JZbSM35PrXtJO2
	PH6OAkZOaVmSUUXN9Ir62UIZYhqsJIq5elw+J0rmhfVvOki06d+b2fW0MdIXQaXmIt8zP8DZJbN
	mX/3dFftb3P6AXR8ZuyaWqk6tPR2u7H2MqIvgLBSEqgkXrQVFXEUnddZEplyXAiA3wbQ7UWyLo0
	9LX1CmghGciVIVqsrEIA95fi09arzjGEMeX4oqKmkAVvMJcm/t0kj71T3Z5lHAah0itaSQ1pylt
	kQbjbHa9mZaouJpNX1ZRp46MJ9zKuGhopPuNf9/xpYNf5Bl7AgmrNp4M4cAKHpeY4eESeG+kSFt
	wxarR0FlO7CQZrnqMcIAZAhm56sILE2Z5ALGm7bLRCABxrpqtX9S7KXMVnVfH02DNiuy+47/tRW
	mxmHl3+ikTFvb70msEdGUXkqMy9ZeMo9+yoZ/nH
X-Received: by 2002:a17:902:ebcd:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2dd2a1cea57mr88482635ad.2.1789128673438;
        Fri, 11 Sep 2026 05:11:13 -0700 (PDT)
Received: from localhost (230.161.92.34.bc.googleusercontent.com. [34.92.161.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm10945715ad.2.2026.09.11.05.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:11:13 -0700 (PDT)
From: EricLin <ericlin050914@gmail.com>
To: mathias.nyman@linux.intel.com
Cc: ericlin050914@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16 Flip AI+ C3MTG
Date: Fri, 11 Sep 2026 20:11:05 +0800
Message-ID: <20260911121107.33832-1-ericlin050914@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <31c54bec-2b64-4cfc-980e-9eee999aabce@linux.intel.com>
References: <31c54bec-2b64-4cfc-980e-9eee999aabce@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Is this a new issue with 7.3-rc kernel, or something that can be
reproduced with older kernels?

This issue has persisted since I performed a fresh installation of Arch Linux on this device (which is Linux kernel 7.0)

> Those resets are not that frequent, often several minutes apart.
>
> First guess is that its still somehow related to power management, and device
is reset (in resume?) to recover.

Well, these messages seem to appear only when I use this fingerprint sensor

> If it works on newer kernels then git bisect can help you find the offending
commit.

> Enabling usb core and xhci dynamic debug could tell us more:

> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> < Reproduce issue >
> Send output of dmesg

Here are the outputs of dmesg (with debug enabled)
[    0.467820] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.467827] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    0.468960] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.469267] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.469269] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    0.469270] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.471205] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.471208] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    0.472349] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.472638] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.472639] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    0.472640] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.717291] usb 3-6: new full-speed USB device number 2 using xhci_hcd
[    0.840784] usb 3-6: New USB device found, idVendor=27c6, idProduct=6090, bcdDevice= 1.00
[    0.841565] usb 3-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    0.841569] usb 3-6: Product: Goodix USB2.0 MISC
[    0.841572] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
[    0.841574] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
[    0.957240] usb 3-7: new high-speed USB device number 3 using xhci_hcd
[  197.151533] usb 3-6: reset full-speed USB device number 2 using xhci_hcd        # The first time of using this fingerprint sensor
[  197.401517] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  240.364042] xhci_hcd 0000:00:14.0: HC state intact, continuing without reset        # The second time of using this fingerprint sensor
[  240.364098] xhci_hcd 0000:00:14.0: Setting command ring address to 0xffffe001
[  240.364262] xhci_hcd 0000:00:14.0: xhci_resume: starting usb3 port polling.
[  240.364267] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb4 port polling
[  240.364278] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  240.364280] xhci_hcd 0000:00:14.0: hcd_pci_runtime_resume: 0
[  240.364344] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x2a0, return 0x100
[  240.364407] xhci_hcd 0000:00:14.0: Get port status 3-2 read: 0x2a0, return 0x100
[  240.364418] xhci_hcd 0000:00:14.0: Get port status 3-3 read: 0x2a0, return 0x100
[  240.364443] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2a0, return 0x100
[  240.364468] xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0x2a0, return 0x100
[  240.364473] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x663, return 0x107
[  240.364500] xhci_hcd 0000:00:14.0: Get port status 3-7 read: 0xe63, return 0x507
[  240.364526] xhci_hcd 0000:00:14.0: Get port status 3-8 read: 0x2a0, return 0x100
[  240.364531] xhci_hcd 0000:00:14.0: Get port status 3-9 read: 0x2a0, return 0x100
[  240.364537] xhci_hcd 0000:00:14.0: Get port status 3-10 read: 0x2a0, return 0x100
[  240.364564] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x663, return 0x107
[  240.364611] xhci_hcd 0000:00:14.0: clear USB_PORT_FEAT_SUSPEND
[  240.364612] xhci_hcd 0000:00:14.0: PORTSC 0663
[  240.364616] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x663, write 0x107e1
[  240.405029] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x7e3, write 0x10601
[  240.405066] usb 3-6: usb auto-resume
[  240.405138] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x400603
[  240.405148] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.446041] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x603, return 0x40103
[  240.446119] xhci_hcd 0000:00:14.0: clear port6 suspend/resume change, portsc: 0x603
[  240.456987] usb 3-6: finish resume
[  240.457379] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  240.511402] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  240.511413] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.517961] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  240.518038] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  240.568969] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  240.568998] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.569335] xhci_hcd 0000:00:14.0: Completed reset device command.
[  240.569436] xhci_hcd 0000:00:14.0: Successful reset device command.
[  240.569550] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  240.569556] xhci_hcd 0000:00:14.0: Slot already in default state
[  240.569822] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  240.570131] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  240.605942] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  240.624155] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  240.624165] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.630984] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  240.631050] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  240.682009] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  240.682037] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.682206] xhci_hcd 0000:00:14.0: Completed reset device command.
[  240.682309] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[  240.682316] xhci_hcd 0000:00:14.0: Not freeing device rings.
[  240.682352] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.682578] xhci_hcd 0000:00:14.0: Successful setup address command
[  240.682633] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000000fffff000
[  240.682637] xhci_hcd 0000:00:14.0: Slot ID 1 dcbaa entry @0000000021fab8ba = 0x000000fffd7000
[  240.682642] xhci_hcd 0000:00:14.0: Output Context DMA address = 0xfffd7000
[  240.682644] xhci_hcd 0000:00:14.0: Internal device address = 1
[  240.693858] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  240.693930] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x80
[  240.693941] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 1, new drop flags = 0x0, new add flags = 0x84
[  240.693945] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000dd219587
[  240.693951] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.694317] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[  240.694634] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.694762] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[  240.694779] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.695003] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.695040] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[  240.695064] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.695313] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x603, return 0x103
[  240.695616] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  240.705786] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  240.759625] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  240.759638] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.766960] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  240.767032] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  240.817914] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  240.817926] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.818251] xhci_hcd 0000:00:14.0: Completed reset device command.
[  240.818348] xhci_hcd 0000:00:14.0: Successful reset device command.
[  240.818446] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  240.818452] xhci_hcd 0000:00:14.0: Slot already in default state
[  240.818685] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  240.818774] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  240.853852] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  240.872609] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  240.872620] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  240.878941] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  240.879016] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  240.930917] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  240.930930] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.931094] xhci_hcd 0000:00:14.0: Completed reset device command.
[  240.931198] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[  240.931205] xhci_hcd 0000:00:14.0: Not freeing device rings.
[  240.931220] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.931500] xhci_hcd 0000:00:14.0: Successful setup address command
[  240.931542] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000000fffff000
[  240.931547] xhci_hcd 0000:00:14.0: Slot ID 1 dcbaa entry @0000000021fab8ba = 0x000000fffd7000
[  240.931552] xhci_hcd 0000:00:14.0: Output Context DMA address = 0xfffd7000
[  240.931554] xhci_hcd 0000:00:14.0: Internal device address = 1
[  240.943853] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  240.943921] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x80
[  240.943931] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 1, new drop flags = 0x0, new add flags = 0x84
[  240.943936] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000dd219587
[  240.943941] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.944257] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[  240.944602] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.944652] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[  240.944680] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.944870] xhci_hcd 0000:00:14.0: // Ding dong!
[  240.944908] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[  240.944916] xhci_hcd 0000:00:14.0: // Ding dong!
[  241.109911] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  243.707621] xhci_hcd 0000:00:14.0: // Ding dong!
[  243.707776] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[  243.707787] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[  243.707791] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 0
[  243.707934] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x603, write 0x10661
[  243.719855] usb 3-6: usb auto-suspend, wakeup 0
[  243.730866] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  243.730894] xhci_hcd 0000:00:14.0: config port 4-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730899] xhci_hcd 0000:00:14.0: config port 4-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730903] xhci_hcd 0000:00:14.0: config port 3-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730907] xhci_hcd 0000:00:14.0: config port 3-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730910] xhci_hcd 0000:00:14.0: config port 3-3 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730913] xhci_hcd 0000:00:14.0: config port 3-4 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730916] xhci_hcd 0000:00:14.0: config port 3-5 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730920] xhci_hcd 0000:00:14.0: config port 3-8 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730923] xhci_hcd 0000:00:14.0: config port 3-9 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730926] xhci_hcd 0000:00:14.0: config port 3-10 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[  243.730928] xhci_hcd 0000:00:14.0: xhci_suspend: stopping usb3 port polling.
[  243.730936] xhci_hcd 0000:00:14.0: Setting command ring address to 0xffffe001
[  243.731073] xhci_hcd 0000:00:14.0: hcd_pci_runtime_suspend: 0
[  590.653758] xhci_hcd 0000:00:14.0: HC state intact, continuing without reset        # The third time of using this fingerprint sensor
[  590.653792] xhci_hcd 0000:00:14.0: Setting command ring address to 0xffffe001
[  590.653954] xhci_hcd 0000:00:14.0: xhci_resume: starting usb3 port polling.
[  590.653959] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb4 port polling
[  590.653969] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  590.653971] xhci_hcd 0000:00:14.0: hcd_pci_runtime_resume: 0
[  590.654004] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x2a0, return 0x100
[  590.654029] xhci_hcd 0000:00:14.0: Get port status 3-2 read: 0x2a0, return 0x100
[  590.654041] xhci_hcd 0000:00:14.0: Get port status 3-3 read: 0x2a0, return 0x100
[  590.654052] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2a0, return 0x100
[  590.654059] xhci_hcd 0000:00:14.0: Get port status 3-5 read: 0x2a0, return 0x100
[  590.654065] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x663, return 0x107
[  590.654077] xhci_hcd 0000:00:14.0: Get port status 3-7 read: 0xe63, return 0x507
[  590.654088] xhci_hcd 0000:00:14.0: Get port status 3-8 read: 0x2a0, return 0x100
[  590.654094] xhci_hcd 0000:00:14.0: Get port status 3-9 read: 0x2a0, return 0x100
[  590.654100] xhci_hcd 0000:00:14.0: Get port status 3-10 read: 0x2a0, return 0x100
[  590.654130] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x663, return 0x107
[  590.654141] xhci_hcd 0000:00:14.0: clear USB_PORT_FEAT_SUSPEND
[  590.654142] xhci_hcd 0000:00:14.0: PORTSC 0663
[  590.654145] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x663, write 0x107e1
[  590.694874] xhci_hcd 0000:00:14.0: Set port 3-6 link state, portsc: 0x7e3, write 0x10601
[  590.694893] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x400603
[  590.694899] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  590.694957] usb 3-6: usb auto-resume
[  590.735791] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x603, return 0x40103
[  590.735858] xhci_hcd 0000:00:14.0: clear port6 suspend/resume change, portsc: 0x603
[  590.747785] usb 3-6: finish resume
[  590.748300] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x603, return 0x103
[  590.748381] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  590.802405] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  590.802416] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  590.808744] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  590.808812] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  590.841739] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  590.859876] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  590.859888] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.860243] xhci_hcd 0000:00:14.0: Completed reset device command.
[  590.860288] xhci_hcd 0000:00:14.0: Successful reset device command.
[  590.860389] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  590.860393] xhci_hcd 0000:00:14.0: Slot already in default state
[  590.860528] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  590.860677] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  590.914691] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  590.914704] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  590.921816] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  590.921890] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  590.972820] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  590.972840] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.972927] xhci_hcd 0000:00:14.0: Completed reset device command.
[  590.972957] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[  590.972959] xhci_hcd 0000:00:14.0: Not freeing device rings.
[  590.972982] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.973077] xhci_hcd 0000:00:14.0: Successful setup address command
[  590.973099] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000000fffff000
[  590.973103] xhci_hcd 0000:00:14.0: Slot ID 1 dcbaa entry @0000000021fab8ba = 0x000000fffd7000
[  590.973108] xhci_hcd 0000:00:14.0: Output Context DMA address = 0xfffd7000
[  590.973110] xhci_hcd 0000:00:14.0: Internal device address = 1
[  590.984557] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  590.984681] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x80
[  590.984688] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 1, new drop flags = 0x0, new add flags = 0x84
[  590.984691] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000dd219587
[  590.984698] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.985041] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[  590.985286] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.985342] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[  590.985370] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.985541] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.985603] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[  590.985612] xhci_hcd 0000:00:14.0: // Ding dong!
[  590.986371] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  591.009222] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  591.064173] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  591.064184] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  591.069758] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  591.069829] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  591.097722] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[  591.120775] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  591.120787] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.121111] xhci_hcd 0000:00:14.0: Completed reset device command.
[  591.121136] xhci_hcd 0000:00:14.0: Successful reset device command.
[  591.121242] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  591.121247] xhci_hcd 0000:00:14.0: Slot already in default state
[  591.121381] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  591.121480] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[  591.175511] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[  591.175522] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[  591.181795] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[  591.181865] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[  591.232780] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[  591.232792] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.232840] xhci_hcd 0000:00:14.0: Completed reset device command.
[  591.232852] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[  591.232854] xhci_hcd 0000:00:14.0: Not freeing device rings.
[  591.232865] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.232981] xhci_hcd 0000:00:14.0: Successful setup address command
[  591.233001] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000000fffff000
[  591.233005] xhci_hcd 0000:00:14.0: Slot ID 1 dcbaa entry @0000000021fab8ba = 0x000000fffd7000
[  591.233008] xhci_hcd 0000:00:14.0: Output Context DMA address = 0xfffd7000
[  591.233010] xhci_hcd 0000:00:14.0: Internal device address = 1
[  591.244582] xhci_hcd 0000:00:14.0: Waiting for status stage event
[  591.244665] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x80
[  591.244672] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 1, new drop flags = 0x0, new add flags = 0x84
[  591.244674] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000dd219587
[  591.244681] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.245049] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[  591.245301] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.245354] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[  591.245380] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.245580] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.245743] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[  591.245769] xhci_hcd 0000:00:14.0: // Ding dong!
[  591.345699] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling

Best regards,
Eric
