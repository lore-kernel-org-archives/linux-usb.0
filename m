Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36A36B911
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138133; cv=none; b=h6j50XAWKB1YE0T/evSpB8pVUxk+NdVOTi5b5WPxMvdCwOUzFGD+H7cqopg9d15po15RCrGxOkbN1vgaggbzpBagBFEsAXmh1nKjqRLaTYkwViGFi0qHoVG5Tfhcur0AqiqJxFw+Mv94tVu+lhIAXVX2T0A0pAHyVL07vVlep9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138133; c=relaxed/simple;
	bh=4mLudD8PYlOLuTEEbJwIHQPFAEvTbwtEdiJBOGu1jB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggPCZ+sA6cZtBhwYGFkGvEifbvFnhDmk9oX6oT0FBd4N0hHRGFJ7+E3wh1Hbym98jp3p4NRcVY6Z2rerVlEoES85KxXBd43GFiC6JRAlRnYPAB+3d9MAt4hF+VgHXnWQOljuHZB2QFOtzVzNVv8d7LeRTsz9htIeYy+lDyemjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdRZEf8m; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdRZEf8m"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39d70d669a3so954766a91.0
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138129; x=1789742929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87DnCORHQMnGKefjZm7JvpLCw1nQMKjUqG2otvelVVs=;
        b=YdRZEf8mkHdOo7h91U72QNKvdVFaLR8I3sLyisRkSYwNGJNoGP2pWg0KRBO6JHvvJs
         GqxdVWCUzryx63cWiyvcNUHP61Ofg3JZCfXb0PC/J6VD11q4TWXGMCZI9pR3y9asmVHB
         UL4MMKZa0+pG+B6pZqYc6mpyGN2D+Uyg51mPUp20phY4JvKgDduY7NtlgV+LTrXDbMzu
         s/dIB9O4yyQM0NSe1fPn6/gfRYYFPuN3775j99uOvKtA643N28hYd4rwB/kENOxCEaSb
         beknmWMpZbbAyzPZ1oj8nJmCEBuEZbyrouWC65eOdRMH4q9yj773ozu278y5hGp8AIFM
         ZYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138129; x=1789742929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87DnCORHQMnGKefjZm7JvpLCw1nQMKjUqG2otvelVVs=;
        b=GST08DLX7nKGkbToOv4UIQd8yPqU0MS5qhBYvoGi2DzBGLtYBO+uzgB7AgAW8spOKO
         +UwU2NNlJg0JbyvQEzH84VVBPpfYUt8Jmg4KAlcsonnRZuytHQbk72bbS21l+b8+IhLZ
         NRFtOBJAPeWs5mG3tfMxAxkYzpYWkpGOI+nPc1+auzgj2s226vM1BZHZYOyFXhv4gnP3
         Lopn6t28dMcik8Qcaai90ApARM/RqVA4o1UsVGQnj7mU6OH1FE53x7+8Gbs+DGr0R3W1
         oXvo0FJhxnC/w2GtocUINS7mFFCAMptxaQS//Im3KBlRrouebpNUCnM4sX2OTSsCNwTp
         kPGQ==
X-Forwarded-Encrypted: i=1; AKwUvBywM30FGAIdCL9ev0z58I6Yu2dGutQ6O3gh/ECFW6i7XFrn/gVocmH8SOyHjM0iFpKqiZasijwWyf4=@vger.kernel.org
X-Gm-Message-State: AFuF++k/MYGewR/UmwNUFgRcN3O4ZxkEeYh7LipRQ437fwRzVkv5GsDu
	m2qQuPc18D4cXpfD7l9YMnq1IIQMftD0zjZ8SVHZEj41QMJ0l2XhKVXB
X-Gm-Gg: AYBFou14nx5ecNbmNdnm5VlXZYqg0PyRPkCzQAz5q0TYUX8ZDPoLGWvINv6z2l7xzZ/
	35zPlKUpuxapXPfXogRZ78tPgZqiNm8jZDX9yzKhtt3qyDfEMui9ipIy8ncXTxogbLs85mIhenF
	3MtFt/JOo5gFl2Frb5UkVYUJjLycKr9u8yZwMK2jOGHAyfAKAqOiQQgMbmzMaWaSirX5VYOJYeM
	br3HXiANl1af891vidCRsZnZtlKvYNkF70cM9iJyh+xlaEkfroNdEcBUS+kc+XYmbf1pRbP7hi3
	2AYwrdVqSmvgR3pN9IQWpoozMUwW0ho1aSyVM22arhpzNH7ssCgoBGyu6RM/+5UFSaVW7ixTR5c
	8Jh9dNmjdjIDeQ9xB3wrdoeEuS32Sh1dWkbvOJ2P09QZkaCCF9DpRY4KZVUK6YqwIr5Yz5Dgzh7
	FoBrruQ+7U/dyH+bEQlEE9/IO+qtOLSE3+Y+A2K3c8QjBwmKUpLUnRZaNnrFiA11uQmcgpZZZEy
	4CPOWDnEmMrHiFPKIosc30+l4eaYx48w7bUbCqN
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960825mr7697463a91.0.1789138129118;
        Fri, 11 Sep 2026 07:48:49 -0700 (PDT)
Received: from localhost (230.161.92.34.bc.googleusercontent.com. [34.92.161.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm5244382a91.16.2026.09.11.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:48:47 -0700 (PDT)
From: EricLin <ericlin050914@gmail.com>
To: mathias.nyman@linux.intel.com
Cc: ericlin050914@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [BUG] Usb fingerprint sensor constantly resetting on MSI Prestige 16 Flip AI+ C3MTG
Date: Fri, 11 Sep 2026 22:48:41 +0800
Message-ID: <20260911144841.5047-1-ericlin050914@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fe9a4727-52a1-4464-9fe7-c5f50d09713b@linux.intel.com>
References: <fe9a4727-52a1-4464-9fe7-c5f50d09713b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Ok, looks like xHC (and fingerprint sensor) were suspended, and sensor reset
> at resume.

> Does disabling runtime suspend for xHCI and the sensor help?
> After boot, as root:

> echo on > /sys/bus/pci/devices/0000:00:14.0/power/control
> echo on > /sys/bus/usb/devices/3-6/power/control

Sadly, These command doesn't work

[    0.481019] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.481023] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    0.482157] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.482447] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    0.482451] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus number 2
[    0.482453] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.484361] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.484363] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
[    0.485511] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x120 quirks 0x0000000200009810
[    0.485793] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.485795] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 4
[    0.485796] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperSpeed
[    0.725275] usb 3-6: new full-speed USB device number 2 using xhci_hcd
[    0.849356] usb 3-6: New USB device found, idVendor=27c6, idProduct=6090, bcdDevice= 1.00
[    0.850388] usb 3-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    0.850393] usb 3-6: Product: Goodix USB2.0 MISC
[    0.850396] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
[    0.850399] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
[    0.965230] usb 3-7: new high-speed USB device number 3 using xhci_hcd
[   26.846586] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   27.088643] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   44.120047] usb 3-6: reset full-speed USB device number 2 using xhci_hcd        # Disabled runtime suspend for xHCI and the sensor
[   55.557350] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   81.929983] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791        # Enabled debug
[   81.983851] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[   81.983866] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[   81.991791] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[   81.991845] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[   82.042778] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[   82.042793] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.043072] xhci_hcd 0000:00:14.0: Completed reset device command.
[   82.043193] xhci_hcd 0000:00:14.0: Successful reset device command.
[   82.043344] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   82.043351] xhci_hcd 0000:00:14.0: Slot already in default state
[   82.043518] xhci_hcd 0000:00:14.0: Waiting for status stage event
[   82.043572] xhci_hcd 0000:00:14.0: set port reset, actual port 3-6 status  = 0x791
[   82.066750] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling
[   82.097440] xhci_hcd 0000:00:14.0: Port change event, 3-6, id 6, portsc: 0x200603
[   82.097453] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port polling.
[   82.103779] xhci_hcd 0000:00:14.0: Get port status 3-6 read: 0x200603, return 0x100103
[   82.103820] xhci_hcd 0000:00:14.0: clear port6 reset change, portsc: 0x603
[   82.154786] xhci_hcd 0000:00:14.0: Resetting device with slot ID 1
[   82.154800] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.154942] xhci_hcd 0000:00:14.0: Completed reset device command.
[   82.155025] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 1) in default state
[   82.155033] xhci_hcd 0000:00:14.0: Not freeing device rings.
[   82.155052] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.155268] xhci_hcd 0000:00:14.0: Successful setup address command
[   82.155279] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000000fffff000
[   82.155284] xhci_hcd 0000:00:14.0: Slot ID 1 dcbaa entry @00000000c504d3ce = 0x000000fffd7000
[   82.155290] xhci_hcd 0000:00:14.0: Output Context DMA address = 0xfffd7000
[   82.155293] xhci_hcd 0000:00:14.0: Internal device address = 1
[   82.166500] xhci_hcd 0000:00:14.0: Waiting for status stage event
[   82.166625] xhci_hcd 0000:00:14.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x80
[   82.166651] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 1, new drop flags = 0x0, new add flags = 0x84
[   82.166656] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 00000000d584fa66
[   82.166665] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.166961] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[   82.167272] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.167388] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 6
[   82.167412] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.167646] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.167672] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot 1 ep 1
[   82.167720] xhci_hcd 0000:00:14.0: // Ding dong!
[   82.314749] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 port polling

