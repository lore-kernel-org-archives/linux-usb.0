Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED90333F5BD
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565026; cv=none; b=O0uke3bvhusADaE0JH2w9pV/Jn64fYqkiNVyDJQANnZRqP8RMUGe2NhO2XbVSdyLDbHUB5qBCyeOfKtZJGRThSW7k4txRjRYkNLpPmicDocOU/Ucim+CviBl08wCDnoOwC9E7K0brpR7UlDQaCg/N/edxrVySRnbFzLFMHdZeq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565026; c=relaxed/simple;
	bh=q2OxhXoNoryQUJ7dcDSl9Zap0385aC8XUYBM510IMyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UUiBgwiEDXKUE4lL2T6o0vw61bMrBnLjLi/SRtQ4iKVLxhEkgJXZ3tZnNFqb5frgjjPH+uTbAlDFReYY1dTE1wCT5viyyotYwRr+ap5jSAAncU8Lp580ZpVJPvgO+MJ79g9ZoEUTvI4BSuQJmTPbxEiBXCZF8kmapTNlwPXQBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp22cOOR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp22cOOR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383cb94f742so1133078a91.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 19:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783565024; x=1784169824; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gW0VHancYNE2HGZLJ9P1AKn89tN1JP9pInjIXieptlY=;
        b=Cp22cOORAI1XPbrYTjcS3DaikguFLT7jaQNMWs0XApRZviQcASgpx7763J4/Jq9eBw
         +VcNE/iGKLdivd+BD4ybvmiQnvJZZQSQizoF7OreJP8DFbdHDVV4AuadHqknpEm8egZg
         IdZET26Gq4peEpPyWgjUyViWAojX1ja5o40hsjjXGp4eAqO1ruhkN0pdriBbCFk4UBu6
         3u18TyM6moyqw9nfG9loRLJGaa4m7wP5R2p6wmV+yxvtwMpM5H/wPNofgqL0ITdYsybv
         kvq+44RuENCuPgHI5UcYtduK+nlmaS65vCdxlsbR5tnCfGKzgucBOQl9NkoBsxRL9JDq
         hqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783565024; x=1784169824;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gW0VHancYNE2HGZLJ9P1AKn89tN1JP9pInjIXieptlY=;
        b=H8RXatMq84NvKhR2yHcT+ljKtXq4xBVweLT14C9FZ6shhcBw60X/Acf7zaZn59OvDF
         farOZ72X+Xa7wkS0LC4tRuxPz5+vFnCFMyW0gds45vfYRVqIuskKXnN3xwutXgVqWcW7
         eJR2t0HV2HlNH4665FpxdU7h6o9SFp2tzmCd864/2VB4vR+n2MJt2sijJiaCUXXYmizq
         ISqttk07w+lvaMKfqrnkBsNrj2zMeE4F1QIlIrDSztaGQX1nS9+oFKmifjPvqBoUyQN2
         OB06EPOhOLrbFBbXXiZVwv0yPN4+M7LzpUAaux6QpEcxadm7pE+LyVYpRc7p6tuLR0yf
         oX7Q==
X-Gm-Message-State: AOJu0YxvFa+Tr2bFMsuSTfg7uOT9f4dphmOpqHEI3HTkfYxNdm+3uSXV
	IH9nvgmrkgicclEfM07vN4l9Xl1VVzGxg7kotG5O5qhpZgqilDbJ0Snv
X-Gm-Gg: AfdE7cmDxiG6JSP5A46L1HlyZAZNk4MCe4BbbYTQnk1ecSeSJE8ywF8M3D/OfdKqbZH
	AZtZ6F296kf/08GPe+274/w9dVk5sTj4jY5CAknjUUab9n2AHXFVUrTF6lYcHT3+AwekpnRl0xh
	BjzOJe8PVtSqUzDHYqZxRS1mhRFgoGo9Ehwkd9vGVKxpqu1P6sOZWRf6V4QGCsCuYqkU9U1wyUL
	nyYSDK7GjV34L63jyqjb1zmM7mUyirpb8fvfZGxet2PxuWlbJA7pKEi5kmzdImSFmTpTga0r2Vd
	P9ldWoieV4oaH0DPxD44OlTHWO4NWTFc7yn/vrpMJhlAMFbU5cWNItDwFaq/dwgIYi/EGJlgFAo
	VDyy3W8K6b8JTwnMngqC2VSpS/MbZE8XyihzFUZu4viAcwhW7C8uvLKxaoGnDpwvr4jVY9rYJBg
	0KRW/qvonwXTH/31M=
X-Received: by 2002:a17:90b:2f88:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38941acc562mr5664655a91.23.1783565024233;
        Wed, 08 Jul 2026 19:43:44 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:7d69:9e2d:a142:ea02])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm24556490eec.15.2026.07.08.19.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 19:43:43 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Thu, 09 Jul 2026 08:13:33 +0530
Subject: [PATCH] usb: typec: ucsi: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-subasri-usb-ucsi-v1-v1-1-74bed201e489@gmail.com>
X-B4-Tracking: v=1; b=H4sIANQKT2oC/x3MPQqAMAxA4atIZgOpin9XEYfWRs2i0tAiiHe3O
 H7Dew8oB2GFsXggcBKV88gwZQHLbo+NUXw2VFS11FGPGp3VIBjVYVxUMBmsG+956JhcayCXV+B
 V7v86ze/7AR70A3llAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783565021; l=2219;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=q2OxhXoNoryQUJ7dcDSl9Zap0385aC8XUYBM510IMyc=;
 b=u8qr83ZOry/ErdFi5cV+JZboscaRLj7BePYlO9oZEtPvohcUMxYfeKyUMq8E2LXs+9QlzLyAc
 ZsxmIZfkmA+C2Az/Xeu6omTZ4SifGYU1iNXaqCYWEqfY2/q9NB1MfKk
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in ucsi_register_plug(), ucsi_register_cable(), and
ucsi_register_partner(). This prints symbolic error names (e.g.
-ENOMEM) instead of errno numbers (e.g. -12), making debug logs more
readable.

This patch fixes coccinelle reported warnings:
./typec/ucsi/ucsi.c:1026:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/ucsi/ucsi.c:1156:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/ucsi/ucsi.c:967:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 92166a3725b1..bf896e5cefc3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -963,8 +963,8 @@ static int ucsi_register_plug(struct ucsi_connector *con)
 	plug = typec_register_plug(con->cable, &desc);
 	if (IS_ERR(plug)) {
 		dev_err(con->ucsi->dev,
-			"con%d: failed to register plug (%ld)\n", con->num,
-			PTR_ERR(plug));
+			"con%d: failed to register plug (%pe)\n", con->num,
+			plug);
 		return PTR_ERR(plug);
 	}
 
@@ -1022,8 +1022,8 @@ static int ucsi_register_cable(struct ucsi_connector *con)
 	cable = typec_register_cable(con->port, &desc);
 	if (IS_ERR(cable)) {
 		dev_err(con->ucsi->dev,
-			"con%d: failed to register cable (%ld)\n", con->num,
-			PTR_ERR(cable));
+			"con%d: failed to register cable (%pe)\n", con->num,
+			cable);
 		return PTR_ERR(cable);
 	}
 
@@ -1152,8 +1152,8 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 	partner = typec_register_partner(con->port, &desc);
 	if (IS_ERR(partner)) {
 		dev_err(con->ucsi->dev,
-			"con%d: failed to register partner (%ld)\n", con->num,
-			PTR_ERR(partner));
+			"con%d: failed to register partner (%pe)\n", con->num,
+			partner);
 		return PTR_ERR(partner);
 	}
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-subasri-usb-ucsi-v1-34dde97e0b61

Best regards,
-- 
Subasri S <subasris1210@gmail.com>

