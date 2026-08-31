Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083EA3D0914
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165696; cv=none; b=jqseKBM+DvLPYCJ4V50lohcOvB0Vx66Mh6bpu3Db63Z7rMAOb8TnikZ55wVoODtRocL1Vlg6B5z9xhKJIpRjtXcRh5zLq+xlX4Jnd0qPrhTZEAhyKr9UOs3FeWK8NH2TiMJ2sFDGEnS/AIP/jqs7oT9ZyLO0omwALkqr02S4O1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165696; c=relaxed/simple;
	bh=to6zl/n2CMI8LEhJSWsLmG+6IaLANuFS6dLWdh6lZl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7UNPq5SLL+WUBY1Q54wnCyae4Gnby2egCxmUQxr8vtlYG8XbA3Rwj8/PdPLnWr4ud0pM/Uhuk/COLXQVgrP52TlNAI887hKelzoXQ2Y9QDeLTkR+MVtSO0RfiECOPNwt69laOSHgSYP0DyhExCF+0W0IscjeQwgZqtEYd31lkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHXWP9Xt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHXWP9Xt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d712281f8bso35476615ad.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788165694; x=1788770494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqfdJve8Ni4RVv0b2fgjV6qAXoGzSYyxkoSoeuiqXN4=;
        b=IHXWP9Xtlg3hy0oWbqLNzxTIS7X8CestPW4oRm4nMAYsj1MGwbC2c0B+IIrw84e5Yp
         g85KtM6u9VkvFpK1CKZ+Z7oEG4gesiDVZziiPYvQbz28vQK0f4WCc7mrwdsh5BrEqJQG
         v4Rf4+JUnFvvKMzClZAjQ7V6tPHguqZ8kKx4eBBBhpZE0d81EUjsteQ0n6Y0C+e8eXZt
         03ejxkEdzIC1ymT7C5fuqf5ixGUWU+LPQTtK4xcQLIc21SL8v5mhUPZaC8O4SlCdlBFQ
         e3zUbQm+GbQs0RJI23LyVpTLKAjvUg9szcBc9JdCf04x1J6CrBse3JdEb0ccXo6Tenqo
         RjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165694; x=1788770494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqfdJve8Ni4RVv0b2fgjV6qAXoGzSYyxkoSoeuiqXN4=;
        b=ite8AHFDAQYktJzll9w4XiWgQ6b0i6lVQEWzKH1j9mMsPDCmEQJn8sWS+6aMGShhhQ
         SVBJjXJSh8tLfi9krIJ+FprsV9UEuZ6gHULt2wk2u81fFDTB138HjYieAyV9NoTmGSzy
         S6jr3vZMGIBZJYmcsDC3BDy7OQJZ/Cz1g04Pa1V7QAACIEz9/r3FAO4I0kCjLVwxiqtc
         4Mbz//nFfEmmmr0wl/ER7mAu1vX30gBVUoQ0x7bwbhdJ2x1xJpos1YN+FMfokQsnRgfs
         vx7eCcHeeD1lkRdmGSOUzHpQnIfO/6FhxmQBDKM4G34s/Pn0zlcPwUCHWwe9P0gDdeII
         VumA==
X-Forwarded-Encrypted: i=1; AKwUvBz76JqC4C2hj7fd2L7nK8LA3JZbVTJ0vbi4Un8qeAow+zaFaiBqlBAa4LmWuc+t0SUJCiMKw94HeeI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRuEApYGVXk5rvuteP9Tzh3kfgR7saVvhVRZNsH7fOf7SvASbj
	Zoao80lhEEPI7BYZechxwoQPN9QYFCqpciGBcqa/RQibh+wZRNOVUe/C
X-Gm-Gg: AYBFou2XPBiwJ9kyjKQf19stKJEhuYfuQtAzHZOsZ7q2BycUhjSl6iNugF/OyKIq7OU
	G0qbynuRjBk61qwGCJa4p3zxX5dOyonskz9xt4PVlAEH4JvmvvlPsT4BsK8tGxUWmK/enMvxD58
	ngOa9jsI+iC+4MUcTVEKF/gr8G0ZDdIktek8YA3quVsXRewWzdL4QF0rHuqgsWDbqWfNlsaspqm
	o3BTTEEIabpRxzxfNaKzW0YmJe0+7eOMsrj8jg3hqVwv7koSzdPYUA/5Dz3vz4aVxOZGmQeVmkn
	GPJgzVwUpMEpJVxfzddfKs83wSkYiuJrIbriJIIATugjQNCamZ4XfpIUSPqn2BnLL1Zib8vGfay
	jWcvIt08rVVGc8HwAYQUGXOZDLkpJTemwQBeQ7N1RcXnsssIBTR1cOqadI2ql1zD6yuzHFHu753
	kp3cmGkvgQHafSLxzr6zMSHAWxMKzf+RD3JxPyS5mRfGrOh9K+FcHaip4Yheq5EOa3oDD9v3XpC
	/BP+ZnvKKedXbsASOZ6AqxcVE4ObbPaWhyzDZU+bA==
X-Received: by 2002:a17:90b:3c89:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-398f86c802fmr2915772a91.19.1788165694102;
        Mon, 31 Aug 2026 01:41:34 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. ([2401:e180:8832:3ee7:cbb8:f1fb:c6e2:ba18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm20592434a91.8.2026.08.31.01.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:41:33 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johan Hovold <johan@kernel.org>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH net-next v3] net: usb: qmi_wwan: add Compal EXM-G1x support
Date: Mon, 31 Aug 2026 16:41:24 +0800
Message-ID: <20260831084124.65074-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
its QMI WWAN interface 8 using the DTR quirk.

Tested on a Compal EXM-G1x modem.

Assisted-by: Codex:GPT-5
Signed-off-by: Ian Lin <jisayme@gmail.com>
---
v3:
  - base on net-next and mark the target tree in the subject
  - add AI assistance attribution
  - post as a fresh thread
v2: https://lore.kernel.org/20260828082309.12513-1-jisayme@gmail.com/
  - split QMI WWAN support into a separate patch
  - identify the Qualcomm SDX12 chipset
  - keep the device entry sorted and add the product name
v1: https://lore.kernel.org/20260828075644.6228-1-jisayme@gmail.com/

 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 8178a8758..fdfdcf24d 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1446,6 +1446,7 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x2c7c, 0x0316, 3)},	/* Quectel RG255C */
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0104, 4)},	/* Fibocom NL678 series */
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0112, 0)},	/* Fibocom FG132 */
+	{QMI_QUIRK_SET_DTR(0x04b7, 0x8217, 8)},	/* Compal EXM-G1x */
 	{QMI_FIXED_INTF(0x0489, 0xe0b4, 0)},	/* Foxconn T77W968 LTE */
 	{QMI_FIXED_INTF(0x0489, 0xe0b5, 0)},	/* Foxconn T77W968 LTE with eSIM support*/
 	{QMI_FIXED_INTF(0x2692, 0x9025, 4)},    /* Cellient MPL200 (rebranded Qualcomm 05c6:9025) */

base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
-- 
2.43.0
