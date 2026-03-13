Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751040DFB7
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773440709; cv=none; b=g3pWyQq9o9ipzdaJjCnQjKBiPWtCaian+F9tXzmOcxpRpL2+H2/XzJ9y2fn4KB18tl235dTq48BFcDWPpjXUEhtEgWsuoWS9kNBdhGuLLttKgpblvA2lSbhJUDo69HOnCkiJfXPcEVrq8ngvZ3TrvxRRPmqOw/WgQei4gLdLU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773440709; c=relaxed/simple;
	bh=0dXQFfLwyqTDNO02P7pMGtlWHfEe0Lwb57EnQeVRc2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sim8rSsW2XzQyLNPnzKbrfZxUXttIAineOB0vTlb2isgEI3N/i5M9uPM+f9TuZGh8F0nI+elQeBHq+mJ5RSD5VKBWvRbOFs/u+vGjr8WEPkn0JuFCWOChmewwk48YZyBmijJ8PyJtJTlsnZkDGjtDPE/kaItCtidxbEMc+/Kef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbz0RRCC; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbz0RRCC"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509101189f1so26121481cf.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 15:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773440707; x=1774045507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ16Ge3prHbi18Wm6MkAhYmn4692JC5/iHiiLdA10g4=;
        b=Kbz0RRCCkBrP8OGmX3NCu47hBdkXSGtYA0PTtvRRyh6bF+L72ue4hAR0b4RpQXg2Uj
         PHCupMoZXTzPbk3o5EfS5XJXdtmY+j8q+jorQPg9kGzXZ3rr3Q6vEY9KfQSdLAyBp6bY
         /j9zuyD6XlTgWbQHm/6SvaS4HXq9kF9SMyoMbTy+jtfRZ6V+v65CW4+GUbBksQVQrPSn
         7cDVra02XZE+5M8GQ8tUNRyBtppC6oyqJkL6Soy73ydMZv/EkUPBcEFybxWX92+7Xd+v
         H1dXITC4mhTxmcpodMgMKO2hsLM5z3p9+VNzBTD/xwP6KRlVAOH97GCpSp6WOlTpO2Xm
         JZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773440707; x=1774045507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ16Ge3prHbi18Wm6MkAhYmn4692JC5/iHiiLdA10g4=;
        b=XcdB+3C5CBLNxYjGDIDhgwg2GFIly4sNKo1HXxpOxB8bh32mYHmO/dnN94I8n7BgnX
         SGH74K3N48MxR1rXlJ2+2XLqh7NZfc+2G0pdOOZG+5Sd+ctxAB3GmAcwgAEQgMGBC51g
         BaWaxseMtMW2hlNWVL+H1lGVrUz5R+zGGTDS810fUcOVAIjePhsigUtODTqIDQ6eW7TR
         DWn/ejchgJyZETowImCjtptqL4ZBgIMx4xIBHdoxBP3LMB4oEDU2n0leMvQ/j2KAASAt
         WvWa/eoERFn7TROP5dCmZPobhm+pIzsSlXaK+DTFEnM1wX/09h9jGUZ5NxW20b1ybexe
         ffrA==
X-Gm-Message-State: AOJu0Yxt5uPyjnNUZQODNaLZfuyf8YS2LPNW7JFcP1RniS/oguSdu1yI
	zHwrL+GhSKHwKJ/AEusVydQw9pUaAra20SlLrQbhdI86Er3jowbkv0rOIoRGVDre
X-Gm-Gg: ATEYQzw6SGQXuxDyblghPUAt530SNXuGbh1ncNsdQ2oEhFajpl1wKqcChqeP49sYtEV
	151zYPhGSHo3kxrbJWyZpUm3M3UTtHWk9obTR6JXeYtmdIfBRGdxypZOUtCMtIM4EmSavxptGl6
	6ogKqWCGft/pf9E6t3UE8/gB8QYb94pd8qTnZdfrKZr2z8AXgf/RNxAxMfexaLlW82geRoOYCZq
	dhmUAsQuJjjNHd5/IzrJcBU6NmsSs5VkWOoMHhDW+QlPmd0BALEF5efze3kPYUyuYV/lzKtZXxs
	g1Ebzqs2EDydO38v23qYajdLq0upPiyO8ZNMYzdXiEeUvro/oP6hNf+iLvSTzvOSH/NCyneYbhZ
	p/VSPEgWKg0wRsP3BpjoDop1PLgPea6gZPKEqQqJLHhhdVa+Qu7Rs6IxDYbBPMTuru7drIvwKcw
	hC20oT8m04LeEfJJRTV3mQM8t1KlopqnOlK6i+Cy0sEln11k95GFKCn+ZuLSQwm57jjsjbpoJAw
	eouqwaH5/YWe02BvLng
X-Received: by 2002:ac8:5e06:0:b0:509:2222:420a with SMTP id d75a77b69052e-50957e37e66mr61462371cf.60.1773440707324;
        Fri, 13 Mar 2026 15:25:07 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65cfec56sm67069096d6.39.2026.03.13.15.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 15:25:06 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH v5] usb: typec: ucsi: validate connector number in ucsi_notify_common()
Date: Fri, 13 Mar 2026 18:24:53 -0400
Message-ID: <20260313222453.123-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The connector number extracted from CCI via UCSI_CCI_CONNECTOR() is a
7-bit field (0-127) that is used to index into the connector array in
ucsi_connector_change(). However, the array is only allocated for the
number of connectors reported by the device (typically 2-4 entries).

A malicious or malfunctioning device could report an out-of-range
connector number in the CCI, causing an out-of-bounds array access in
ucsi_connector_change().

Add a bounds check in ucsi_notify_common(), the central point where CCI
is parsed after arriving from hardware, so that bogus connector numbers
are rejected before they propagate further.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
v5:
 - Fix format specifier: %u -> %lu for unsigned long (kernel test robot)
v4:
 - Moved bounds check to ucsi_notify_common(), the single point where
   CCI is parsed after read_cci(), so bogus connector numbers never
   propagate to ucsi_connector_change() (Greg KH)
 - Changed dev_warn to dev_err
v3:
 - Added changelog (Greg's bot)
v2:
 - Kept bounds check in ucsi_connector_change() rather than moving it
   to ucsi_notify_common() (Greg KH)

 drivers/usb/typec/ucsi/ucsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..b77910152399 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -42,8 +42,13 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 	if (cci & UCSI_CCI_BUSY)
 		return;
 
-	if (UCSI_CCI_CONNECTOR(cci))
-		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
+	if (UCSI_CCI_CONNECTOR(cci)) {
+		if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
+			ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
+		else
+			dev_err(ucsi->dev, "bogus connector number in CCI: %lu\n",
+				UCSI_CCI_CONNECTOR(cci));
+	}
 
 	if (cci & UCSI_CCI_ACK_COMPLETE &&
 	    test_and_clear_bit(ACK_PENDING, &ucsi->flags))
-- 
2.43.0.windows.1

