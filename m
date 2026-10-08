Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5838734A
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475983; cv=none; b=I0lQoU4g58rtrdY0a+0syGxvuO0W8CDh1/AyspvX72/xbamDwx6pa+23ZZMxDdnxAqRYkurORJGJcIBREZCArF52FDQiIw4DEQRCr4/Y6FzfM3n+vzOSR0rxupMn4E+Id0QI58HkTyjzBl1WnOQh9g43z8TQLZBz12k4mVqOsMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475983; c=relaxed/simple;
	bh=BmN0rljmONbdz/PXm/OprH8FzTn9S1DwuWMcx7k7+c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSrdY78zsNVGOS+Cgmyp0GP3QM9eH08ieO83kgG2I9Xat/w1WFFPUxGllMNuyXF1Q7klT8KzEG6TrWI/6aFRCGxnsWpEuqABwMCJz/+MD9cGsN5FqAm/BWzEECcTeVWN/8StQazOzu+RXcZljem9gy7G5RvwKVrVciiMd/86ngA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XupFFtTr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XupFFtTr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1603963a91.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475981; x=1792080781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDdHvibVLCCzB2QsTRiQrrzTd39n/2ojg5xJ6kjQ3YM=;
        b=XupFFtTrO96/gR8ia8VI1HtA41HTTwWQyJWTNIf0/oW856kZcf/cPGuKxay9By7YnW
         eSVL57Gx05aD/L/EO8RIO6ZR11JRc6CAkpfBCNoOenwtxAZeL755jvt+mrtD13UH4z2C
         6QQdDZHMnrrmTWQEDt8g0TPkzq2LSouuqjdajtz5QWtAiz9QPHL4lJPlL5t6h6rfbhQp
         QS7Qp5e8Xv+s+AonGQBky1QhTVdv2YnnXYkPkDkExXVXfxnvTwvCtvZwOOw9nmgbpmHF
         uaG/Bwob14dD56SlgtpwB2L6oNt/HMUFG93kGCMJVLZs/aHJWn3owKMMrBQA5bUNW6sW
         FEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475981; x=1792080781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDdHvibVLCCzB2QsTRiQrrzTd39n/2ojg5xJ6kjQ3YM=;
        b=QNr21KR64x9j3nyBnM33Sqms+xGcixYr9K8C8MHDD8R2zYm6u4mAafB+lsivORM4jz
         2fDyHdw3kIlM7FSYbyeoTmcd0O2hr1DHlCyFnwULRu90pNTj/G8DDpRGk7kT5sZmmqV1
         fCjTSUAqsDMwNAzU0cMR0XYWJ96afm/ozBuVg0EAHX/utdLiIXfCq/f7eFNRzgMeBRv8
         PNs1GfrnMDbkxMcXYMFBTZVypWIqzVoB6Wkuvfgs6zX6j3FYNQJXZTqIeWPhDnlUfGFi
         BUXpOwsDykb6p4XUprIwYXs7l0hOnDXPACrLtDvqk6pcwXiUY9dG5M8EgPPoI6ZJxTr/
         IoAA==
X-Forwarded-Encrypted: i=1; AKwUvBygsaCUYGuVWCyNA2zQtbPBrDq67VPYV8RgZjCZRE37X+HROcyCHAIgbbZJl//EAivubAo9HXaCLpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPunEYhHx3i1eNaDR9ktKosoVj2uKxmFjfqi11Q6JyDGCHtA8r
	VxpUfotXe1WLTKRoNAlY9AOYZFWym29R6rv1aL4IRpG+OvPqtNVgvecA
X-Gm-Gg: AYBFou1phoH0c/1SotPthhXGFJauSh2+wWNnjt5Lb6OvEAIAXPRIBH6Hxax1OGz/VqH
	hnyzWFAB2Bs5HiCY3jv78k8MtOFk/t7ratssse8DzyG5Xx3HPnlwTXNR5n3y3a//e1yVmaDoiSD
	HLnGb7xPCvU3UoIQCitsDlAXckB4DPitcdv5wn46mPt1cNixodthv4cSLqghz8OPo1UcBRp2wiy
	uBgpJwAx1fcp0VJItaFdQHPl4k8wFEiaLLe2xIp0aFZU1k8WCooMCs2d3DheyWft5wAHGG8ySpt
	hFOXDkvhR0n11kKQnypnWWV0V7V6y1BlR5Mo9KbVH+W8kku2UryuVvNobCEG7rVje33VhydBCEO
	pmUCGh2OxwyDC1R0fsIdmEB1v2dsEuFxENmmFg+MxxZnH5Ga3P43RwzKr0LIojuoNdj4WywVVWa
	ioYY9225EMC7qF2LSQ0rC6ZjS9+6d5BdkhCjgk1i3SbOxCSbzcXXqTvfQaHAgZSDCZYnpdEo0m
X-Received: by 2002:a17:90b:5848:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-3a89f687798mr4750893a91.5.1791475978758;
        Thu, 08 Oct 2026 09:12:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:16d2::246:b6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a7e9e4sm4834011a91.7.2026.10.08.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:12:58 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v3] driver core: bind a device with a preset driver even without autoprobe
Date: Thu,  8 Oct 2026 23:12:53 +0700
Message-ID: <20261008161253.138698-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
References: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() may claim an interface that is not yet
registered, in which case it only sets dev->driver and relies on the
later device_add() to bind it via __device_attach().  With the bus
drivers_autoprobe disabled, device_initial_probe() skips the attach, so
the device is registered with dev->driver set but never added to the
driver's klist.

Releasing such a device (from usb_driver_release_interface() or from
sysfs unbind) makes __device_release_driver() call klist_remove() on an
unattached node and dereference a NULL klist:

  KASAN: null-ptr-deref in range [0x58-0x5f]
  RIP: klist_put+0x4d/0x1d0
   klist_remove+0x14c/0x2e0
   device_release_driver_internal+0x4fb/0x620
   usb_driver_release_interface+0x10e/0x190
   cdc_ncm_unbind+0x2ac/0x350
   usbnet_disconnect+0x1e2/0x300
   usb_unbind_interface+0x1dd/0x9e0

Autoprobe only governs matching drivers to devices; a device that
already has a driver needs no matching, just the bind that was promised
at claim time.  Do that bind under the device lock when autoprobe is
off, so that a concurrently cleared dev->driver cannot fall through to
probing every driver on the bus.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v3: Sashiko noted that the lockless dev->driver check in v2 could race
with dev->driver being cleared, letting __device_attach() probe every
driver despite autoprobe being off.  Do the preset bind in a helper that
checks dev->driver under the device lock.
v2: fix the unbound state itself rather than usb_driver_release_interface()
(a sysfs unbind would still hit it).

Tested with the syzbot C reproducer in QEMU (KASAN, dummy_hcd).  The
race that leaves the interface unbound is rare, so to make it
deterministic I temporarily made device_initial_probe() behave as if
autoprobe were off whenever dev->driver is set: the unpatched logic
oopses 3/3, with this patch 0/4 (64 USB connects each).  The plain
patched kernel shows no oops either.

 drivers/base/dd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 137bf1dea333..bb1e76bf6122 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1142,6 +1142,16 @@ int device_attach(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_attach);
 
+/* Bind a device whose driver was set before device_add(), no matching. */
+static void device_bind_preset(struct device *dev)
+{
+	device_lock(dev);
+	if (!dev->p->dead && dev->driver && !device_is_bound(dev) &&
+	    device_bind_driver(dev))
+		device_set_driver(dev, NULL);
+	device_unlock(dev);
+}
+
 void device_initial_probe(struct device *dev)
 {
 	struct subsys_private *sp = bus_to_subsys(dev->bus);
@@ -1149,9 +1159,10 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	/* a device with a preset driver must still be bound */
-	if (sp->drivers_autoprobe || dev->driver)
+	if (sp->drivers_autoprobe)
 		__device_attach(dev, true);
+	else
+		device_bind_preset(dev);
 
 	subsys_put(sp);
 }
-- 
2.43.0

