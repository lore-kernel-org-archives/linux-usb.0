Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2538D3F2
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205309; cv=none; b=QjKutIn2Cf0eqcpEGRLD5qPvq7HU4OzUlj41GHq15CsHMxejXxZpnd+NY3qehqFxoSsOHIx+3SF1evW2Bywlpb+LQmsvrTqHZqoblFYsoFemB9WLVbXrBNF79+ZFXIvoqLjdtXNLTW9DCtoaXOUziUPV9HZ7X/6YhnXR/2WYMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205309; c=relaxed/simple;
	bh=Y0h9lW0LDoi9blqrw5CZKAZbEFc6aWRY8BXsuOuG93E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IyUyW96uqTiaYHl9DfiovpndBzpqUoO8qEXxsrnmfUJ2t6fK0gSIZyOYNxUs/Y7uCwkuhwhj/PrDm06N6ebXB+k+briDP5l8Nt3wKfDzQ33ywkbiw6VkL6fG4aQgflnE2i92Y5N+y9fup4L1fmnIHU5qcWrxyBt2Gqb8CgtZL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BevOrWYu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BevOrWYu"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1211195a12.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787205307; x=1787810107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpFXM9w4VzG4DesbOqhO02EsB8OGin5A3lj0s1H0hy4=;
        b=BevOrWYuwrS4zQ89B0Z6RWOq5iwnUYPu6BUtcRJt5S9RG6ZGrQQYIuGcn6GMBJMrf8
         zHmRF7NWBbb12wlYuuTIB3H53FhLDFXUkxIM2z1P4y/fW/9c2Be+tSsk54uURksg4j0e
         hcYFtM1MJXTENUet6NWCT/1CV3xQfw/vUUkJ3d/Rt/KQi9WQRQlwRakReseOj4vlccxo
         /Z0JRh5AD4a/WSecc00zXWsPAboLC9K0KpP/uEUs5cuRmE8FFq/Kofv3LF2hdtBdZoWc
         wWPmUloE6xCagsyq60+O61XG0dfnimFBJOhhKGBvgLD5l5Us8K0px53829CHzNFjF8Sa
         YT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787205307; x=1787810107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpFXM9w4VzG4DesbOqhO02EsB8OGin5A3lj0s1H0hy4=;
        b=IyT7IbHkoensG7EWGTKb2KgbMpJpF2rOWHFSFqlRlYT4tnHUIP93Bq9jRCkpCkLQcK
         jOjXk0+yqEBLFLQyJyf2LY0Om4q4Qi9gTlOCAKXTw9h76t0Tidyip3R8gpoTlrJCU0qC
         /l9LSIQIG3E7kNxP99KpvqYTDBJ4mDTBU+oiFUNtnLQRhU31/SnlzT+ah12xStWkGh8Y
         59Ca3iAORdCpvRj8Mufcw1VIy4k1smX7qh2TGYegUSGP4DtexpbC/rytJZm1yF00Aj08
         w+9lU9yrHfV3nGT1UxJ2qQMaGTdw2DWxnxdS4R/vtkkWA9D1eU7e9LHgE2RBD2Sv46BA
         GQRw==
X-Forwarded-Encrypted: i=1; AHgh+RqCkJ9CScLhBZ1XTKh59KS+Sp+9UYK3jq+rrydXo+TWRokiA1Bfgo0x+QSjMOnL9T5cZFqa3PbxkX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zQHw0ctswWMfTcF4Noj7mAK4wKPGwq3pYBjIPKLsBCtBRH2z
	WBU1CNofTodJjzMIgHbey22tEvfziIc4xyKa/kwJyLkzoAAC2R8PZnbo
X-Gm-Gg: AR+sD12f1f1qTOKQMvVmWbOO5eFGwY9cyvOD5jaiQo6BiNpAUy3pTrhztNbgMNGaYyn
	tpxXtKFnhYzeJHR4C0zbxHJWOKJOPO59JlpP5Gmg18IMaDomJ9yIrtqB9GnZlSxHmX8s4E/x/CT
	g1LD23j3MKJn74TcluWORDB9FN7ZtV1LPNlCzQAn2HGZt8qxD4/2b89bkrgTSYKUBr0oGIwQh0i
	4H/pDtYylM57ldrFryO69vw/pTv4RkPElzX9ROrH3ZYPZOQb/9lhkFZfoiIBjC5gux0SyncEPOm
	75LZlmk3i2PI0hnR+iqKf+29RpZ13PadWLpq9JgWldNr6TlChIFnfgqTrakMfGO1QawzUIvSfP1
	u+KrBucBGdz54zapSRlGE4qYHnA9x3liZLHTgvgVW30P3YglzFN2uSYoWPvmWhnnJnI5IlmZBkn
	9REZXFuIxN0z7UMa3rV9ipBjxWKlEWEXesy+LmOe3aHOETxyEwDMJT9FBbnKDD1KhLlWQ6xDDyc
	FTyYw3+zUl4ARm0o47fPprD
X-Received: by 2002:a05:6a21:3382:b0:3c3:8d86:9856 with SMTP id adf61e73a8af0-3cd0128b46cmr19378726637.14.1787205307341;
        Wed, 19 Aug 2026 22:55:07 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3d708sm11312936c88.1.2026.08.19.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:55:06 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: [PATCH] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 13:55:02 +0800
Message-Id: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver directly and skips
device_bind_driver() when the interface is not yet registered, so the
device can reach teardown with dev->driver set but knode_driver never
added to the driver's klist_devices. __device_release_driver() then
unconditionally calls klist_remove() on the unattached node, which
dereferences a NULL klist pointer in klist_put() and crashes.

Guard the klist_remove() with klist_node_attached(), mirroring the
existing check in bus_remove_device() for knode_bus.

Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223..14752a5e5 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (klist_node_attached(&dev->p->knode_driver))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.34.1

