Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136B36E493
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 06:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295710; cv=none; b=eI40/xy499xld/oLGQiMamxxe44U5d5RdSFC1IVHH1hEzYUyyhJNKADlmZ+v9yq2khsozDDrKluzWtAf9QWn/yNw0UgkfvW9nvrgxKNVAM3GDUmbgDMIROZ6eAP6nzhv7l1Lbjzw4FTaZwbSdA5AcuZ8FlvEK4lyd+PFBHJn8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295710; c=relaxed/simple;
	bh=i3NzfKMNL7tCBAg6BF56HuN1UX3KaECb7d9dUSxUt5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaV6OqWWBHuXPde7TTY1B/SGxWyfWIH6P5fXfC5/zwXbGlLEo9PJbtkkrpywAZJSTIj4eFPuyMJhGI5U69lgDFsXcsBeVh1D9g5E6NaE8y8UZlwIrUVtCizaOfnyEnNiOm9JppgwVb2toEfMt0aIKEaQWtB6ZEjLp2x6VeNf0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4mDGSgD; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4mDGSgD"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899e85736e2so16733566d6.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773295707; x=1773900507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuqHAr62ZNn8KR69qskzLNS25tm6vaheaTX24sWfXBI=;
        b=a4mDGSgDQJChPQEkXP7SBiFZLjeGeUf8C3ADLMBDc6+lKTiTZ4SbbHSehxtc4C67rQ
         fs1nHylAGh/z9cb+aQqp48/69VQXuawLpLcYOjUEiNFEM1G4QOLYHsy8/Z072fuj+F5P
         8BWeIxRoYCDHnPKUy6fugz96kL8HA0pdn55yyPyC8EWAnzV79AngN6h+e1YfKduk7SnN
         axak8MbH8c8tuv61XOePZ8lo2vEnSC8pE3OgNZI1rk0CyrtLLtCQ89aeLdqcXXtlqark
         Ktr9ZtgY9shMVSHRa1RUGkupyttCwXC21n8mGxjALva9WKVNQ/Aow+XowtCGOlJ7zl8a
         WkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773295707; x=1773900507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuqHAr62ZNn8KR69qskzLNS25tm6vaheaTX24sWfXBI=;
        b=ZydjNt55504hCkHZlTz1xntqlPCMPt+84WuZDB+lm0L+Cw7FqQXj6sQbuM+YdHwSmB
         aEwQkqfegfFyJU2ztSfkyvxO0zckTJUoGzctsnzK7VhF2yE+7tYzLPex6SuvmbQ4KlXB
         zqbm+6uVCDFV5VsxbhNfTUloOXyOca8crA0L57FHW/rBQfM+6UvvwM0nrCqJ6o6/1wUi
         T0TRRFxWkhKFzSzJ30jhGJIQuKyLoo+EpydkQ09O3dzPbkMmMxWI4FNPSpspGq27Iiar
         xYY+7BZ0yieZc8xmkLbubPDsUtjRiWb3xID/OlEqi6wKcEIj0Z2ZlSd1xsxHPVDnbBxP
         pipA==
X-Gm-Message-State: AOJu0YwwmmXUp1IqEpQL1QSSAFgIy3N1E4eflm766QRvBr9AGFB/lR78
	XPKIiRb5oW0PF/3Bv80NDIScMEPlGf5GJ6vqmhlvE4rmLxAZIBCTm4si
X-Gm-Gg: ATEYQzyPlAAMp4CLPZn1hokxaexWARFQIRqEZRdyREM1RhcdemF9p4/MszZrmfC/GIX
	bE1eueN0RG2ePNlBSPK3Mwh5Z4ZKkh3yAnZt5sOMjHNPCSJ6jwheuO82/q/CI1yVKgpQn4+KvD8
	fOnNwBxW+Yqs5wecbE9XYx1w8EegWRvVH7cAQCwXyhlnuLfY4ABjCudLxbGNUcUVWwu51xwuzDB
	qBaTfbIBdhwH3ndJxMW/hGo6w4u/75SIfDSRVXb3SRiiLYUDxq6GlAD2025ZuWkvTnkX40c0MAs
	rzIFYUWZ7Qt3K/d9HufmFUGZuZC9tdGDTUCD7sV0ziN/95tCdSm0uqNOAAfR8Sen0Vn9S5jCiL/
	ohQ6ImpVJ8U2RqKlY1wlwPWbKjyVELg4qG4NHIyg/QT98UzhM346FE7Uud8M9DhC+AAKNi+0kkb
	Hs9pN9YVYvXTFHspwfavLYW5gr+UEZ91Phs+A3MCMMTQmUmDIX+ENadaBrKCcdTkBSaXv/zq7a+
	AQyVdbLNZOA819+H93t
X-Received: by 2002:ad4:5de8:0:b0:89a:929:3d2d with SMTP id 6a1803df08f44-89a72a23728mr32646356d6.16.1773295706971;
        Wed, 11 Mar 2026 23:08:26 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd5274sm28472836d6.3.2026.03.11.23.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 23:08:26 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH v3] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Thu, 12 Mar 2026 02:08:15 -0400
Message-ID: <20260312060815.55-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_connector_change() uses the connector number from the CCI as an
index into the connector array without first verifying it falls within
the valid range. The connector number is extracted from the CCI register
via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (0-127), but the
connector array is typically only 2-4 entries.

A malicious or malfunctioning device could report an out-of-range
connector number, causing an out-of-bounds array access.

Add a bounds check in ucsi_connector_change() itself, before the array
dereference, as it is the single function through which all connector
change events flow.

Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
v3:
 - Added changelog (Greg's bot)
v2:
 - Kept bounds check in ucsi_connector_change() rather than moving it
   to ucsi_notify_common(), as ucsi_connector_change() is the true
   central validation point covering all callers (ucsi_notify_common,
   ucsi_register, and backend-specific call sites) (Greg KH)

 drivers/usb/typec/ucsi/ucsi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index a7b388dc7fa0..b4f630154aba 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1345,7 +1345,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
  */
 void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 {
-	struct ucsi_connector *con = &ucsi->connector[num - 1];
+	struct ucsi_connector *con;
+
+	if (num < 1 || num > ucsi->cap.num_connectors) {
+		dev_warn(ucsi->dev, "bogus connector change event: connector %u\n", num);
+		return;
+	}
+
+	con = &ucsi->connector[num - 1];
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
 		dev_dbg(ucsi->dev, "Early connector change event\n");
-- 
2.43.0.windows.1

