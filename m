Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA824D5970
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470958; cv=none; b=GeQrCCkGUAjOPGd4E0DPC06WSXlTQjJexoZZZ3lQanQdlcc+BN4PJtm9pATcfxT8H8QlCOlhbTWRT91n0N7NsPTT7FUFxlqLgqkbhGNOmK8HPJbq/2FvRCcXxayVih3VVcZS6KFM7diRxCjhVmLXQU9pNfVGjhaSgj2WYt0lTLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470958; c=relaxed/simple;
	bh=Z4KM6it7J4sJFNp5ElHidaQWReJi6gu8FtZQWjz+lZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jACvioNUpV5nEHaEY+RMOmrPSDpaD+vHvQ1XFgqzKviCuodtlYQtlVzdLMSlrUbZPh+996TWcXPS79YvLotwbsJavf+vdJrAhu6oJJhL/QbRiOhqueNJ6YPmEVFcA59UhQAUsPbexjEB1tbRyiOgv342R80NpFTa4ovXlv6voGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNIgDKbu; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNIgDKbu"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1684639a12.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470945; x=1792075745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzeqoCgVrB5t7K0uEMyihnfZQe0JdhUNQX8JWUB88Jg=;
        b=pNIgDKbuvHYZtlOnow2HGOvDRQdfpEhxk61LNcGd/0uOwtTDSRKyHIZ2TIs562Ug5H
         tqySz7hKBCKEGVCeW6xYz1wsfnfBZUMjMApEkPOX/M/PfEtv8h/Z60pT/Z4LsOpqjglj
         kFbOceEw3uObIibKa13fdGibCjP6naum8HlX5zBgWWCrn2wC3hyS9Eo4oT61469+Vtk0
         72cm2b41Y5wX3z9i7Y7FQMZBGnOsiIha5/6Xz1Nk1LhR8fT3IlcHB+9hyXC1EYpXEj6T
         AEAXeqtbaWFmajlzXmWcZ1B9KCQArY8UJQu7XepG1nrjyXZhjQX6mT8sm2mX6iv+Vo20
         xY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470945; x=1792075745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzeqoCgVrB5t7K0uEMyihnfZQe0JdhUNQX8JWUB88Jg=;
        b=mPWROewmq3EZr8Ust4r4HXAvFYpN7soQ+bW/yBkqmfblrkZ+AkAm051IjJUtCa1g6W
         KWjXkayiW58SgeaYQyZUpYNyofFR+n7XZyM7c/3oWdCk9PZIPs8evHYeSrZeMlsmjVLJ
         z5CDRoxJvmhefaoeqZHxiWWXC/lyz5VN8QRNe1QISVKinuXdhBQfVDMycdg3xYPyWmyW
         rZw2/pAs48OELL1Rnp5N+ZNnloy0IQ08LNHAmTPvvDo2jq4JPXvW5LYLX78NSwi1E+Gh
         6aJ04tYYaWQSo5O0NS56az6GntPYqD1Z5mBDLmb0yGYO7ekhHGHxNBXxmvgh2yPSxcJz
         ZnZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBLGFbd9TCWZGlLAeyo+t0S22kxjLjeWZpj3tj382toJdZynfCtEohLgUTHCslSsmW6yEetb7g0s0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5jZ9hxjlQ3LNEc8bSZrLNTkHgbu01CHJUoPUsV/e5XZhPenrR
	bXa1yTNXKh9tbo6gYJR82oDdsLRnPHMSrR82zAkYI1xC4s6T8M0ApqdH
X-Gm-Gg: AYBFou3FbSDe7VL0+isD99gn2TYIxytFNZ2Gqytk52bwhSmnT3D0NOMDBqYQmKPX11/
	tjExHVGiHLYCRPjODaOdsd/FcyKZXCYyLGsi6pQHeSjEgus3itin3R5+A21w9rXwl9Ioe/1wP4C
	dY9DlSHKHpIZ5Z4ckyTqrEXiE07O7iZS6OkBBiOS7nEV8PhRtBtct6ThKHYhu0FHzpk7jqnK9l3
	qtxSdckykhwE6viQumt6aeCvzpOu3s73zYyJjHNR8GRDrU0JC7eFgHiwSOT7s20PagS1mrjtlmE
	g5wtUVc37UxH7sJOfx7D/kh8KkZES3yjp2q7k9zku73u9U6zg+ZdE/hyoJ8b27NjGdEVNyDQCs6
	O+PT1s5H2R66X8fiz7mCwFoGIxxf4wPU+Z9eoZ/GaDvpSUHatPbVBPZ6t+HYjODsaDjTkKqEOpP
	CQkx987nwMTLHWnv6p8vC7kZjxhKumjjmYiaS5uru9l/3v5QB4auZpRr9Igw==
X-Received: by 2002:a17:90b:5887:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a8a0a90ac8mr3703287a91.19.1791470944853;
        Thu, 08 Oct 2026 07:49:04 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:16d2::246:b6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab16a4db33sm660176a91.1.2026.10.08.07.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:49:04 -0700 (PDT)
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
Subject: [PATCH v2] driver core: bind a device with a preset driver even without autoprobe
Date: Thu,  8 Oct 2026 21:48:59 +0700
Message-ID: <20261008144859.25548-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
References: <20261008003431.145352-1-ngocthang2710.1999@gmail.com>
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
at claim time.  Do not skip that bind.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: Sashiko pointed out that v1 only closed one entry point: a sysfs
unbind of the claimed-but-unbound data interface would still reach
klist_remove() on an unattached node.  Fix the state itself instead:
bind the device when a driver was preset, as claim promised.  v1 was
"USB: core: don't release an unbound claimed interface via the driver
core" (device_is_bound() in usb_driver_release_interface()), dropped.

Tested with the syzbot C reproducer in QEMU (KASAN, dummy_hcd).  The
race that leaves the interface unbound is rare, so to make it
deterministic I temporarily made device_initial_probe() behave as if
autoprobe were off whenever dev->driver is set: the unpatched logic
oopses 3/3, with this patch 0/4.  The plain patched kernel, without
the hack, shows no oops either.

 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..137bf1dea333 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1149,7 +1149,8 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
+	/* a device with a preset driver must still be bound */
+	if (sp->drivers_autoprobe || dev->driver)
 		__device_attach(dev, true);
 
 	subsys_put(sp);
-- 
2.43.0

