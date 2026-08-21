Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C38324B33
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320390; cv=none; b=IyEcLKoN7vzp+M/K1naeH0sTFKVBCDhndG4xE+RJ+QY/2ey9nk0lC6/ebDHFNBTPBAbfYIGMqUk1erJH8v2Fv5AIErGghfWE7roag6usiOhDe7SGR6eO2H4z4DwCzDY4NlLiTU5nprAcSdNORGrUzNbBaRm3RAHAazXGAzJknng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320390; c=relaxed/simple;
	bh=bcVIeuxH7OuUJ+wC/h6WnWnKDDC/AKdiFS2tnABFAgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qChJtYQ6aAoi4fKM9Aa3tIwDLma4J7mKqUu9Uz5rUbrGRhBS/KzvF7SqRaJGssy/+tu9N/9ZGlJSFlYm9SAfrd6eUYYmXLSuA5VGxpEuCx/eNT9DotZklOiPvaDTvt3qckcxEsHS+KyeOd08lwNor+y4LJOO2yb/DA2HOsSEze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzW3s3Yp; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzW3s3Yp"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1073453a91.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320387; x=1787925187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtWi7dCSmO1v1H5hXBdpE85NppeNwpU1PcOyFZFGvPs=;
        b=DzW3s3YpJ2GcnI1IJ1OFN6GgP4WkW/1LR5fDL2WFDyguj3eSqDymnOzUYTaHFkAHCX
         LpJcGqxkosAGerwNukEKT9fOaMTyTCosH9ptphUBzS0rDIVHJx980k9jh6vpCNU/EfVa
         abq4AGf5anILIkGQ4mucM4VQVBSb9kWd8M4NupglVUN88xT8WqXCtiHUy0d/IwsChhfH
         WOwBkd9w8AXiijWrWmzdEMeYV+azpzxOjk6eUZiA+BONHYLB63Ybu9jCALBPL/JLL7bB
         fJp9++L2WsA/jzVVRM+eaE7u5BhktCjBhVSDJdELGncj3enH328+nVW/2SXEIz/8wKIq
         BfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320387; x=1787925187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtWi7dCSmO1v1H5hXBdpE85NppeNwpU1PcOyFZFGvPs=;
        b=BALmvweveoSyv//5b8rS4pFdroLfbbVSGBors6YpR+g+b3851Dn8jdA8fY8tvSzVj4
         0Q9+WiZT562hk1s61R/zMD1ZvSp34/Y6oudhqFN8mDCsFe/GmHkSvWZOI3JQiIKiRbFH
         Hl7kZlKnw5M2fLfgPIbe0zlEg29SaYsoUclfnkzCYk2JA5GPR2PqoNMxdiYDyaYuc4IT
         bedEEjVEvXDZskWael8fqxRku2eki/RDgIUT0o9RqjCvIif+c45n0H1a6ULaFySu2Pbe
         6Ss7nUIiqiz5oEzZQokJbUxCs/bhuvUGF6RKx94BaksLvRXKIjFAcpZ//+vMv9G1Ljqg
         J+Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6ToWmzWwE6CW+PPBetEyuO/lNCy2EMpl1b3wGginzYGfdwucOkwczeKiAVIpnD1TcX8P2wHRzyIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mT1Uzs3fFdJxQeFXHsEYMdPLhLfSU4UObrWfT/ewCaVFsJJrNm
	mYtS9NdkP+UPX/YNWlna+ugSMUxcpuHrmzAGQ9rjaacHsjpC8wsZeI+I
X-Gm-Gg: AR+sD13fsTypvzUfgBz60JjKcwFhktefKcLI10SogcSpXDxs9SyyXjLSsYtQxAk4gie
	SglYxS+KXVRYFHS4XSpbXVF6Za2rIo+crwUajjU9alWMDNNdQFnuXW5xA3Stgcrrgmu7MRHWipL
	kxsaZGRw1utCF3ZJfd3+Ex7d7SmAYO4CE59Ddcf27b55iK7ReYcoVkdBOj8T8V1MGuRlHUx9PDE
	VI8f2M/ir9WlddI04SluOr6NoGyilt1WZ3EdlOOzvMc7PjClNgVE6lu0U+eKJQqly49dvLRaV+8
	a5s3JJwYLIKZkgOP6rR/2ZyZ3WN7cd++Sddqx3RigVQXgPgIYORusKnTId6zpPMb1Bad2s5/+6D
	8a1MzZ6FM0UQoxFK0M/ScVtdVe6p1zS6BzDgEMSqMWD4OwIQBnF+3z3feO5NAVLmMQpsM3Zlzd0
	ACeq7AbROlYTmj8CS/9tChNJdXHoCDY5n3XSP2OL09nRuflM/caOXmFvBq0Z7t9gfz
X-Received: by 2002:a17:90b:288a:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395c3719f99mr12113635a91.13.1787320387327;
        Fri, 21 Aug 2026 06:53:07 -0700 (PDT)
Received: from Default ([2409:40f4:1021:524:57f0:975b:bd1e:1e04])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19947145eec.19.2026.08.21.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:53:06 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	mika.westerberg@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+520d7648a0d934061fb0@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: fix null-pointer-dereference in wcove_typec_probe()
Date: Fri, 21 Aug 2026 19:22:46 +0530
Message-ID: <20260821135246.17907-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_get_drvdata() on the parent device can return NULL if we attempt to
bind our device as a root device with no parent. This causes a null pointer
dereference when accessing pmic->regmap later as pmic uses the parent
struct. Fix this by adding a NULL check for pmic and returning -ENODEV
if to_platform_device() returns NULL for pmic.

Reported-by: syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a01783ea233350598b5
Fixes: d2061f9cc32d ("usb: typec: add driver for Intel Whiskey Cove PMIC USB Type-C PHY")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/usb/typec/tcpm/wcove.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index 0e5a3e277c3e..80bca8edeba6 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -612,6 +612,10 @@ static int wcove_typec_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
+	/* check if we have a parent device first */
+	if (!pmic)
+		return -ENODEV;
+
 	wcove = devm_kzalloc(&pdev->dev, sizeof(*wcove), GFP_KERNEL);
 	if (!wcove)
 		return -ENOMEM;
-- 
2.55.0

