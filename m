Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409CC37F8C3
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790475424; cv=none; b=eliQ09HkxJFjeLsrlB0/PG5FjHDaWF1eDLhhMwlY8LsabnnMmuvi2PDzN6bXjL4uTBEj6+x4EFhAIKzhTT8+5NesCtICwQj2WuiY/20hMKO2SE5AFshygOp7aBk2IgMv1TJ49cW1omSP8OIGXUJb6EmNi8mijN6CbvdeA1dubdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790475424; c=relaxed/simple;
	bh=CimnbEdL/fI+14EzbWIUB3wxS6Zq7zdxIR5jRBUDEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlCvFMl+EF9bnDtIzl8M5YU4CgXGdjfVkkdwm9Ib+slVNan0Hv6MV7kE1+VJJhAXoZb4PG7UryAfRjLDyC7i3ue35crCrQat+RYe9fvtDnFLuPo9z18wXE2JbpmPS7y3Tt2wdrCvl6nYCCa3eZta0t7BXHB8qAg3XKaVXhLK/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgcDPnaA; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgcDPnaA"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d5303884so1206896eec.3
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 19:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790475422; x=1791080222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/SZOGr7JpcDmeWPHecdCBMiWMxgwXtwWIncAhWIkpk=;
        b=XgcDPnaAMOo1Nirw9wLTovHRyPoiJJYNKaXEM9ecn4+Us/0uLbedYYjNSodSG3Kk9u
         dBuuGi/QB65N2UcAmNLNeBsMAM1iiumYpwdrf45rrG2ddi39lItfA+OvmfVAw2r2v508
         P7L0ZRvviLGHVbUmuoeYbUFSLTkOPyr1dTIfqVJLt+/k9rtLFcJLK/4mk7nE53kknOlH
         8QiQVMkiaVIhSafUUgyIe3MoPGavzegyka462nD8QvGO5wuy5UlyrpOskdOhByDj+hjS
         W83Mdg6xkfk6jDwCsRe+jPXPWMFGWY0ZhUIlY85PoXQbQ1gKRe17+QsaXmZ0zTeVVEat
         tFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790475422; x=1791080222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/SZOGr7JpcDmeWPHecdCBMiWMxgwXtwWIncAhWIkpk=;
        b=I/pJq96aTuVZPSi++B+ZFvIrNvsMLHC1WA1WbVNGbDlJv1EPBBtCu/ID9Jm6amSTKh
         NofTpY8BzPbx8HywtpdU0wipHELpk5HMIjbbsHeTyW1Ffsst6y/JYf5vOJy6stiX6CGI
         RIBsM5BgtZF+bIWgVljrmDOOxFxPeYal73+H092ocBvoy47eWxlpRBr8wYfYfHtS6Frd
         uwO1btP9KKnUoKz0ulSuYxz4upudYTyb/XP3n5whxU/VhQbTIdfpalPToScJEXPiu/Mk
         AlBipZZV+OJh6KRc6+2WYVwDyBDhqYU9pFkM4ZqQeawLNvM3Stq/RfT9+nE3q4XU0RST
         pWyw==
X-Forwarded-Encrypted: i=1; AKwUvByp/rYB7WtWDBwPfyrvSBJpHXLvjK80EVyRj9dkjYMrTaDzVbYHBFIyZR3OS7nbBgTbLasq9+/IE1g=@vger.kernel.org
X-Gm-Message-State: AFuF++mh1c5OSiGmahC6FiRB3oG/tRS6pMv0mVZMD0nfZSdLLsbMY/fr
	Wq3D+3o68/5VExNv8uOC3lYwiu93vnU01wDHd0RTNs8wqhjoknif7qcD
X-Gm-Gg: AYBFou1GFw90dsSvh4o0VhkBHELUTTdbFX4tMFWyX1EYXCuGSTqwvEqFSm1spfNsmYS
	4ZJKgl1/z735ZqnctMKlRpirnSqrCVWfjnYOMs230Npv4OOA6FzIOMDuDDOy747aOWXRRH+8bBE
	3nmE1L6VXlzQOOoDS52IvIBJWLEZcIZnyh96KNuQwCSPLs3++L5zEasP5FOSExymFdLnQ6mDM80
	y6EEKOdGv4Zo8Q+sDbHgMdib98ar4pjQ2b0H+poduFDHgQjVKc8p9IpcSAV2vA3nsFfJI3mUpB+
	SyicPKyYuDLgXlrZBSFC+VYipEuYMZAqNlsn7jWmUWi1Qn6bqLeInyRdTsaTRIUgJMzZjeD0OOf
	yNFlTuNfgvDQC2vN99nappAwIgIqepBAtxtrYByFVHKqbHEccAKNNQwiKGDgmfUza3RuSs797go
	bPiyOepwUaBX/KrxTJW1J2GhjokUk2oaJN3LD63QVz9PfIHmq4j/JY5APLq1PQtRvz9rPIgGm35
	YAblW7Y0W4KlJhy1A==
X-Received: by 2002:a05:701b:2406:b0:146:852d:60ac with SMTP id a92af1059eb24-146cdfbd198mr4755230c88.10.1790475422169;
        Sat, 26 Sep 2026 19:17:02 -0700 (PDT)
Received: from Gris-Laptop ([116.169.71.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm15757238c88.4.2026.09.26.19.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:17:01 -0700 (PDT)
From: Gris Ge <cnfourt@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gris Ge <cnfourt@gmail.com>,
	stable@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Skip CAM query when partner has no alt modes
Date: Sun, 27 Sep 2026 10:16:46 +0800
Message-ID: <20260927021649.8967-1-cnfourt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Thunderbolt alternate mode support was added,
`ucsi_altmode_update_active()` is called on every Connector Partner
Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
PPMs even when the partner had no alternate modes registered. Firmware
that does not support the optional alternate mode details answered Not
Supported, which produced a spurious error on every partner change:

```
ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
```

Fixed by skipping the command when there is nothing to update.

Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: Codex:deepseek-v4.1-flash
Signed-off-by: Gris Ge <cnfourt@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..71b28e4df470 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -360,6 +360,15 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 	u8 cur;
 	int i;
 
+	/*
+	 * Alternate mode support is optional, and the PPM is not required to
+	 * support GET_CURRENT_CAM when it does not support alternate modes.
+	 * There is also nothing to update when the partner has not registered
+	 * any alternate modes, so don't send the command in that case.
+	 */
+	if (!con->partner_altmode[0])
+		return;
+
 	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(con->num);
 	ret = ucsi_send_command(con->ucsi, command, &cur, sizeof(cur));
 	if (ret < 0) {
-- 
2.55.0

