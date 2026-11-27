Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790758;
	b=GJ++DJgHFNQss66qcwNHEOIAuB+d8BN/n99PmjTKUT0/GF6L5dko2KtkeHnPw5PKceGY
	 kbLx33cGhS0dParG4SwsqzPb+S5TVguKsF+vcjMU2HeouzCW5wL6T3T0Xz8IPCpPCf+6Q
	 OCCK1v4Tgg8q6qsWykGIxgQB454fcrq5RcLRBxC47fY9Yly8CtXnzUnsyV3u78/+8wvnR
	 NcTJicUaWoksTHIPF1snU9uOsvKMdPIcFIcUBm9iXWRvz/F3hyztyijkOdF2A/hxC8n23
	 6FYRlJBWuxfUU/jGEKRYbd26LxiC4SHSW+RO+19uVMKf8ngqgC6IGCIpBBY+FuOqddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ALvyzdIFixfKHJ2qzeSOm/bjJPNlu/WA/9jITs5VP6Q=;
	b=fPkp0zkZNBwSB/gavEvONjJ0PZLPVlVpNQo0OYnXH4QMLstpgAijVXk6o6qmfp6R5pOC
	 H5wNE8kc47m+DcYXGdQjfSz+mnnYsNAibhDdN3ZKyZM0AEiK5PIknpV7KrNYdb2CFpNx1
	 aMMjobPfBjWDcAlh1M37yEOZTVnfun2gRBH3I9S6++nCtWyHfolLs/XrUV44NrggkZc0O
	 LOAoCY46wJSyt1kmE9ntsHVUQoZZxOqononX6W/GlW4eutJ6dCxR76QR5gGeljCupgLC0
	 Rgooh74D1b0ecHncs3kJeWtcHPyNXuhX3GxiTxyb/s66J9xdYY9gfCIW6NL9XmldASg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pqshield.com;
	spf=pass smtp.mailfrom=pqshield.com;
	dkim=pass header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=Qm+GDqqy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51DC606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=pqshield.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqshield.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pqshield.com header.i=@pqshield.com header.a=rsa-sha256 header.s=google header.b=Qm+GDqqy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso63566545e9.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqshield.com; s=google; t=1795790756; x=1796395556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ALvyzdIFixfKHJ2qzeSOm/bjJPNlu/WA/9jITs5VP6Q=;
        b=Qm+GDqqyozVQmEXcbQaHYGtSMG3e07KVs2j8jmDxXyk7NDkoO9TPPVXUSRoziF6Q1q
         wfMj4jioA3SY2KpGxD8AfZ/I+Afp7e9NjZv0eXciTnsDB+H3OOQJ2ZhAuHnxfQpgPnop
         +bMqLW336b2iPLK9nCKwwg8GD/k+GerdlttzHrT9iiTJUj8P8lhuDXnnajs09Cvnr4KE
         ZHyKCaVgX9FB7/nN22yeijhL9CGV9c6yAPOZbIlkaKsQfoT3mjxI0RQokirZ7gGihs/M
         cJWJn6/bXGTQ1YVDBs0Z9WhBT1/Ao0fB+nceIvysc8SkK84rBjBpR/FBD50GTWo7xacM
         hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790756; x=1796395556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALvyzdIFixfKHJ2qzeSOm/bjJPNlu/WA/9jITs5VP6Q=;
        b=NGcAifuOtlVJnTqtDBFznSpTSuYSo5JIevSABZ/jgBgTbqhLYC2Yul7wpFVakU0bVh
         Y3CxvWlaeUmtsP7NAhAnp3BiwG8xEGgf/GmxL2UlTrre8WaEFzGScF31qtBg8J/buEuA
         bHZo0qamTTy1qEcFe10D6GYMNR/JDADwVUmx2ETdXvshblruw1oOvQBNHoEZuEIW9uSE
         vPDo/jmL0xhqV4fgqkd45yQtzUBKA2bkZI83ojTVpAg0hoUjz9SkfzYvKhU5TEHsOLyo
         BrNMZJrJEfP77joWfkF0414lJ9/OGiV9KNkEc9TCjV4spHFanTcgnaT4VwyZl8ouLU9o
         SHJw==
X-Gm-Message-State: APuU4Z9v+XtXFmqJm9RQF9iq+lSB7GdDh2gxp9Jcy2VirX7HhvirIUb+
	rxDr4o/HkbKDHgN7zRDkl37tPP0vhDP4k/Ztr52ESXYKHjJ8vphVLn1AhnQQMm216rQ=
X-Gm-Gg: AZFdTZf6cXG0CmXUU9oA4+GtZyEVB7yFqDUaTdATPRhs0a1C1ToGSYNxgBi0nD26jGs
	j37vMtikIpwW+9tcCBhELeAcRQnAeZt6f1ZpwUp/JTOw1ks7Kd6clRCu/OIUbuSI7KLLtsXkVHm
	1wQp79GhEIg3oS9ZUCdJJLFi90VL+hu1w43Mo3nqHxo4VT3ypU3BDZiKQdHlXeg8RqIqc/HM3l6
	gU7AaERXONmgM0bHgpmOysEXS+UOWO6qTFNAtPvtYzEPgd06b0tfJi3qGdv09OwM/ynytdHv4st
	iygZHuEqnJLa5XrDMS5cYAASKoBnUjBzm5TLI4Lrg8JWWVIgThcQ3FurfGPQdynh+KeasRl851T
	0RbVTdpi346wzF+OAYxX7tBBOpJWwncqzC4qS2bfkqx9vQZYKZYC6HYtVH+O8PnxLNwsUvbhiv1
	EbhyNZqfEZl/XVJ2aSaoPiCgSaPvis5IpMk65vmyBRIMXJLlqUfB5pVwW6UrMIpe7Fw9Gxe2ZCe
	cRl9J/hZs5tBGDyljHYBxskjzxkmFWLz3D2YSiCKACb4UsHmMkMgkdmomZGl4N1nMBMSuyPTx4/
	sFNXO1DgbkxMRcUtFnrH/ONyN0sNvIlR+4Ic9OiMIA6ibHlvixvawpQovfiMDD5Tw/2qR2NqFD+
	yGb+zpovuffb9bg/X+uxYzQagFLs=
X-Received: by 2002:a05:600c:1115:b0:4bb:a602:6c8b with SMTP id 5b1f17b1804b1-4bba60271damr135352625e9.14.1795790756034;
        Fri, 27 Nov 2026 06:45:56 -0800 (PST)
Received: from lucas-pascal-pqshield.wework.com (host.178.94.68.195.rev.coltfrance.com. [195.68.94.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm54650190f8f.24.2026.11.27.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:45:55 -0800 (PST)
From: Lucas Pascal <lucas.pascal@pqshield.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	Lucas Pascal <lucas.pascal@pqshield.com>,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Subject: [PATCH] usbip: usbip_host: fix invalid device pointer use in do_rebind()
Date: Fri, 27 Nov 2026 15:45:51 +0100
Message-ID: <20261127144551.350348-1-lucas.pascal@pqshield.com>
X-Mailer: git-send-email 2.43.0
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

stub_probe() saves the usb_device in the busid table without taking a
reference, and nothing clears it when the device goes away. Writing the
busid to the "rebind" attribute, the last step of "usbip unbind", passes
that pointer to device_attach() to give the device back to its original
driver; so does stub_device_rebind() when the module is removed.

That pointer is invalid in two cases:

- The device was disconnected since it was bound to usbip-host, and
  do_rebind() uses a freed usb_device. This happens when a device stops
  responding while exported: closing its usbip connection makes
  usbip-host reset it, the reset fails and the hub driver disconnects
  it. The following "usbip unbind" oopses:

    BUG: kernel NULL pointer dereference, address: 00000000000000e0
    RIP: 0010:__device_attach+0x3b/0x1e0
    Call Trace:
     device_attach+0x10/0x20
     do_rebind.isra.0+0x3b/0xa0 [usbip_host]
     rebind_store+0x99/0x140 [usbip_host]
     drv_attr_store+0x24/0x50
     sysfs_kf_write+0x72/0x90
     kernfs_fop_write_iter+0x161/0x1f0
     vfs_write+0x29e/0x480
     ksys_write+0x71/0xf0

  do_rebind() holds the parent hub's device lock at that point, which is
  never released: every later operation on that hub blocks (hub_event(),
  usbdev_open(), driver unbinds), and only a reboot recovers.

- The busid was added to match_busid but never bound to usbip-host, and
  the pointer is NULL, as found by syzbot:

    KASAN: null-ptr-deref in range [0x00000000000000f0-0x00000000000000f7]
    RIP: 0010:do_rebind drivers/usb/usbip/stub_main.c:204 [inline]
    RIP: 0010:rebind_store+0x147/0x2d0 drivers/usb/usbip/stub_main.c:264

Look the device up by its name instead, and hold a reference while it is
used, as the driver core's bind, unbind and drivers_probe attributes do.
When there is no such device there is nothing to rebind:
rebind_store() still removes the busid from the table, so that
usbip-host can claim the device again once it comes back.

Fixes: a46034ca57ed ("staging: usbip: trigger driver probing after unbinding from usbip-host")
Cc: stable@vger.kernel.org
Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
Signed-off-by: Lucas Pascal <lucas.pascal@pqshield.com>
---

Notes:
    Developed with an AI coding assistant (Claude Code, Claude Opus 5.5),
    which traced the production oops to the pointer saved by stub_probe(),
    wrote the fix, the reproducer and most of this changelog. I reviewed
    and tested the result.
    
    Seen twice on production servers (v7.0 distribution kernels), where the
    oops left the hub lock held and the server needed a SysRq reboot.
    
    Reproduced on v7.4-rc4 (9437ee8b6cf6) with KASAN, in a QEMU VM with a
    g_zero gadget on dummy_hcd, unplugged by unloading g_zero:
    - bind to usbip-host, unbind, unplug, "match_busid del", rebind (the
      "usbip unbind" sequence): slab-use-after-free in do_rebind(), on the
      usb_device freed by usb_disconnect();
    - bind to usbip-host, unplug, rmmod usbip_host: same;
    - "match_busid add", then rebind, never bound: the syzbot
      null-ptr-deref, with and without a device of that name.
    With this patch all three run without KASAN reports, and in the first
    one the device can be bound to usbip-host again once replugged.
    
    Not tested by syzbot: #syz test is disabled for now (syzkaller issue
    8122). The third case above gives the same crash as its report.
    
    Jeffin Philip's series [1] addresses the syzbot report by turning
    "rebind" into a no-op and making the usbip tool write drivers_probe
    instead. This patch only changes the driver: it keeps "rebind" working,
    for the usbip binaries and scripts already in use, and also fixes the
    module removal path. bus_find_device_by_name() only runs on a write to
    "rebind" and at module removal.
    
    Not addressed here: "rebind" of a device still bound to usbip-host
    removes its busid entry, and the following unbind hits the BUG() in
    stub_disconnect() (reproduced, unchanged by this patch).
    
    [1] https://lore.kernel.org/all/20260811160541.29461-1-jeffinphilip14@gmail.com/

 drivers/usb/usbip/stub.h      |  1 -
 drivers/usb/usbip/stub_dev.c  |  1 -
 drivers/usb/usbip/stub_main.c | 32 +++++++++++++++++++++-----------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/stub.h b/drivers/usb/usbip/stub.h
index d11270560c24..ab5726eeed29 100644
--- a/drivers/usb/usbip/stub.h
+++ b/drivers/usb/usbip/stub.h
@@ -75,7 +75,6 @@ struct bus_id_priv {
 	char status;
 	int interf_count;
 	struct stub_device *sdev;
-	struct usb_device *udev;
 	char shutdown_busid;
 	spinlock_t busid_lock;
 };
diff --git a/drivers/usb/usbip/stub_dev.c b/drivers/usb/usbip/stub_dev.c
index abfa11d6bde7..b03c77d598e8 100644
--- a/drivers/usb/usbip/stub_dev.c
+++ b/drivers/usb/usbip/stub_dev.c
@@ -371,7 +371,6 @@ static int stub_probe(struct usb_device *udev)
 	dev_set_drvdata(&udev->dev, sdev);
 
 	busid_priv->sdev = sdev;
-	busid_priv->udev = udev;
 
 	save_status = busid_priv->status;
 	busid_priv->status = STUB_BUSID_ALLOC;
diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index 01452f7bdabb..563c92ab88e7 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -196,18 +196,28 @@ static ssize_t match_busid_store(struct device_driver *dev, const char *buf,
 }
 static DRIVER_ATTR_RW(match_busid);
 
-static int do_rebind(char *busid, struct bus_id_priv *busid_priv)
+static int do_rebind(char *busid)
 {
+	struct device *dev;
 	int ret = 0;
 
+	/*
+	 * Look the device up by name: it may have been disconnected and
+	 * freed since it was bound to usbip-host.
+	 */
+	dev = bus_find_device_by_name(stub_driver.driver.bus, NULL, busid);
+	if (!dev)
+		return -ENODEV;
+
 	/* device_attach() callers should hold parent lock for USB */
-	if (busid_priv->udev->dev.parent)
-		device_lock(busid_priv->udev->dev.parent);
-	ret = device_attach(&busid_priv->udev->dev);
-	if (busid_priv->udev->dev.parent)
-		device_unlock(busid_priv->udev->dev.parent);
+	if (dev->parent)
+		device_lock(dev->parent);
+	ret = device_attach(dev);
+	if (dev->parent)
+		device_unlock(dev->parent);
 	if (ret < 0)
-		dev_err(&busid_priv->udev->dev, "rebind failed\n");
+		dev_err(dev, "rebind failed\n");
+	put_device(dev);
 	return ret;
 }
 
@@ -232,8 +242,7 @@ static void stub_device_rebind(void)
 	for (i = 0; i < MAX_BUSID; i++) {
 		if (busid_table[i].name[0] &&
 		    busid_table[i].shutdown_busid) {
-			busid_priv = &(busid_table[i]);
-			do_rebind(busid_table[i].name, busid_priv);
+			do_rebind(busid_table[i].name);
 		}
 	}
 #endif
@@ -261,8 +270,9 @@ static ssize_t rebind_store(struct device_driver *dev, const char *buf,
 	/* release the busid lock */
 	put_busid_priv(bid);
 
-	ret = do_rebind((char *) buf, bid);
-	if (ret < 0)
+	ret = do_rebind((char *) buf);
+	/* a device disconnected meanwhile has nothing to rebind */
+	if (ret < 0 && ret != -ENODEV)
 		return ret;
 
 	/* delete device from busid_table */

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
-- 
2.43.0

