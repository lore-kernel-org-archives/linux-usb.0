Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D14457A0
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614182; cv=none; b=ZWWd3XY/YeOA1BEggJijZ2ZnfsjWjYm09nFyq8/FVj+yBLt/0SGI89mhCcdENpq7OjTaKUY2BIYMBQ9Shi+1El+e3bfbvwahnxFoa+TRkwN4HkU5MXWx/ACvmDn9iVIQi41C3JNexa88O0gHqamW4989Y27ONTZodeRPh3hU9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614182; c=relaxed/simple;
	bh=kxznEwWSWeLwBy4WcmW9aaOKCiueS1kXCDEWn8ogGb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mu6J9CjNyKuG+LTbCm9bdCwdFMBRZXxDHFlwwYgdyjgr1GfNEUp495PefwelLoku91T144Nbw4uAMc1bnpfLWriv7CvDCCtnn7loB4FNdsV7BeEnmS+aZAtc3rHengfS4Tm0qITLFhohpC4bhqAF62BqrqM0ugoyv5q9MqSAAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Ws5h6jfR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Ws5h6jfR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4994c49f588so7243695e9.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 02:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1786614179; x=1787218979; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PJ/Vk0IqUKoQaaPNgJ0QAJec1n39bTY+37UOcsvpPhw=;
        b=Ws5h6jfRPzaOij9MiWRPjOwgNArQ9Ig/bigY+IK28UypBFKg4OEI46bZh3XXdkgv/C
         v/aI7nUQWxAi7eQ0/ChJeKHBp0DgvIdvkZ6bnCdOfvnY0gXkhQ/9WUX4tG4Ha0RmJYBo
         1cCyjONmkEb4Jo+euG7ayOeFbN8odVNmGbYeMX4idsGxNm+VHg/CcKTyeMaWWuOoVXH+
         SEHsjayd+2kkkAfpBCLUxqHPAgnFoRL9bKxM3Yb3oGdYvbgKmr1ndnOWSlK6BnA37qpd
         fyoY0xvXVGoSve8uK+cOtuNc9kXV/inZRiyBAV/Y/5YXP6nex9MBHvozRBkeEhgXHLEa
         uqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614179; x=1787218979;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PJ/Vk0IqUKoQaaPNgJ0QAJec1n39bTY+37UOcsvpPhw=;
        b=PYX5NAJkvYcmEGW/uhocqK1DQWUecAV8qAunTn4V/7dr0UuIPdHfSVbqyjQpL7x5DT
         FnLbHSoYasdzFguIesVG65VGgY07MAicgfnFSwUbUTiEx6JzdUVaNOBFAbuD8Y5Uide8
         wHz8JjnZ6blDyGB9tRuui9ymvH3Nej7AY8efVnmLTY14RyaU7XUELVFVCEkZT524Hckz
         MjjTgkJyXIZ1tBJ/awzrpWOt8nscoCKYqIB/JUquYpDvfG9winAlNaP88tpWKTBGj+aH
         Xz8KCRbN10kW2i6rPUiUOquTEaEgpNhz9IFt9vUw79YyeBI8YFvDtz/UxkRVIaTc/XVF
         sYJg==
X-Gm-Message-State: AOJu0Yw5MecSe/USWtlv1jFbvh79ptxdVcWYr17qn24eF3Usmq8fXv8m
	Mh7OxJivgELuzD4PQaam4bvGbn7jHbvpmkRZEgL4vtLVqPdLhKVFVW205fOBXEa80bk=
X-Gm-Gg: AR+sD10Qzf+J2BUHW3hOFQ4+QAFNk7HGzaAqcyI4opq7WSD9l48DmuAQbiOVpsTuWHz
	UjEWprfsbLYF5IiRMXdWabCYP/rofDoNP6ptujJf0aZpr7Hl/k9xAPrkp55h5/7WV4KeYbpHEU9
	fV/sOHeUxbm/4E2uHS8wJqR0n3n9naUZxXf0OIpBv/rbbuxGck0eOPJLRUm6BhtEW44B5q2mt+h
	zKVOcpIi3X0AMv0gng3vcXSrGscsDagqQZQC3iSTzFdzXECIREVu38jCTXy215JodXRXFTLKJCj
	CmJTcbnbduVLKke0EE3HIlWkKc8KLOmaoVRCd1ts7aGwxjlJp55wbl6HJgQgbVFQ0sQb+/drOTr
	mXhwXw1vsmO0iS96Sjwg0zyyzBuwojbclOEqdjBkMPm3mr1I2acFCxaQwi5Ab4Kj+6kS6W9P5Ym
	LKqjboWrx0rDTzpgF7B8UgXXk5Tc0S+l+/0bKFo2z+MT5E/94Dapgeo7+kD9mNnwzMX9H/SXk2S
	SCkuBnzWtDNBO4bw400NBna+/Af1c+9bGcoazmvscel3vBHhG/eQzibcUQ=
X-Received: by 2002:a05:600c:19c8:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4998220c7bbmr36330555e9.8.1786614179547;
        Thu, 13 Aug 2026 02:42:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:b4ff:a571:9037:93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499820c2897sm93117405e9.0.2026.08.13.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:42:59 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 13 Aug 2026 10:38:40 +0100
Subject: [PATCH] usb: typec: ucsi: Handle connectors already attached at
 init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>
X-B4-Tracking: v=1; b=H4sIAJ+QfWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dLk4kzd5PycFN0kY9NUQ0NLS8Mk82QloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loAVWW7eW0AAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Christian A. Ehrhardt" <lk@c--e.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.13.0

After a cold boot the PPM may already have a partner attached without a
pending connector change to report. On a CYPD6125 the CCI register reads
back 0 in ucsi_init(), so ucsi_connector_change() is never called and the
Type-C mux is left unconfigured for the already-attached port.

Fix this by additionally checking the connector status of every
connector and call ucsi_connector_change() for connectors that are
already attached. Whilst also continuing to call ucsi_connector_change()
for connectors that report a change via the CCI register.

Fixes: ce4c8d21054a ("usb: typec: ucsi: Fix connector check on init")
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ecbda2a3783c..740ae4a14f7f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2136,8 +2136,11 @@ static int ucsi_init(struct ucsi *ucsi)
 	mutex_unlock(&ucsi->ppm_lock);
 	if (ret)
 		return ret;
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
+
+	for (i = 0; i < ucsi->cap.num_connectors; i++)
+		if (UCSI_CONSTAT(&connector[i], CONNECTED) ||
+		    UCSI_CCI_CONNECTOR(cci) == i + 1)
+			ucsi_connector_change(ucsi, i + 1);
 
 	return 0;
 

---
base-commit: 55431f6adac42f818a0c76594ce2c6c02fe1034d
change-id: 20260813-ucsi-cold-b35e11991b7c

Best regards,
-- 
William Bright <william.bright@imd-tec.com>

