Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9A2772D;
	Thu,  2 Jul 2026 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958896; cv=none; b=EE1H3lFvePXwDmFDNRZ9+SsFvxsS0Y23Y2OAWZTENeIXOBGdrzw7jhaKasnohd5PBgxlz2tmJuaOi1BIH3yiSkO+n9xEc8V2ieJ0Um6RkzV53f7KGXxLiKkNeQFV2L8o9OEa5iPKvxZsWhFGLsQITrLPlghXbNKSZYX9mhcZMRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958896; c=relaxed/simple;
	bh=CX8Egvs+0fO4cgLSD6PRjtA7e4B7g/mxtAHU1lfy688=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=B7+NgLpm6w3Nsea8gr9xTLZjOnhd5UuI6jTGw/1eQHv2WYTMsG+pdymFIE9IGSopj6wkReLE2sremxSo+6RBcApxsy7YBmSR679SNDokai1jaZBM4/9K+ewQTpO7z/pQ8myETdTVT2Bf1HLxGeuqVznu7sRiU/h9kChRresy8nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=afK66Grl; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="afK66Grl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1782958871;
	bh=idwQSJN/Dhl2hStBJ5/0ZsBca0fiI6h/OyWU3x7y/MU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=afK66Grl/eSRxMvJVqMC6CnbvmrKlxISj/pE3SnDREFy2o9UfUqm197h5mPKWu+Jb
	 8yynUC/Q/91rpUxZ5wvS3LNf5sv/w3vanrwc22bW5QklqAsuUSiqz0yhJl0T61OKs7
	 IDTfxCy2H388amjrPzZS9h3cGjweasJ343VgaaVs=
X-QQ-mid: zesmtpsz7t1782958866t83e02629
X-QQ-Originating-IP: mf95NGDHpd+fNnVYt9ffe9r+uG3SMnEqnFB1oqIfR3k=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 10:21:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2467726936307217513
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Xu=C2=A0Yang?= <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for TYPEC_DP_ALTMODE
Date: Thu,  2 Jul 2026 10:20:36 +0800
Message-Id: <20260702022036.44-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OHmFukASalOrbytKcYRSn0JmUD4gbksuirIedQBpsyMUi3ese7HiInBJ
	MPM0O/jlgeosQ/5jn1Aja2BP+gsnLUmJfNnAWhe6DMGb8DnIlfWrfXCuW1mor7+LTED9Vi0
	0jdJxDK4Ddrlqt4OTytITDfrB5fZIXBwozwpQip4JjYf5k5aYk4/RR6npYAH4JQB6y8prae
	FdyGYbddibEI0FgyGPo6zheh9jQm8nF8YfTaPBcIpU4W6iLgsTFe0+wyh5YPfqrtbpzN0XI
	c/SBT8pYKcSlDHZfq15y5rKRqA9UyNRfbV14xjEy49edtpWwJqwqjXREbDrdvFqrfV/u8i1
	upjhzMA8tgVpbypmZv8R+9U6ox1zcOUczPlEYDoCvfQiETOFhNR0jwI3L91SqssKWK9sybG
	w/ji98SnUAC0d/9Iy96WIOUMEy0WFmcZ1snelyNYqSyAqAeUAn9d/aP9pvKYxS8tr5ukOHq
	h7jIjgpRtUnezrfCcPkNexXGaLqL4jm/8ObYR2Woy8Zua6maxkBxjKcloDqiDvfRHnidAoO
	rWkxL1R3N+AlHyjoVR4KgV6VTUFaNr3gQdp34ZKuyq6u0ZFbap27A5YSwpmv/qnYS3v2OOC
	Pe3OGSlwMqmY8HNGL1WGnYPR5Sm8TyOeoTQsF6u+2RNNhtx+5q2SW8SVWoN3tpdJnWg9Ija
	e3SELzorD5+ZuJcHGi5KrsmdFDbqCjT+cuSdCVtH2Migb/X2FwC4RgWNsDhapoYjM78TZys
	mquhw/drkrgj5N40/AzetQTpSRl2pwK1TzyUPUIJVx/6MHzi2Xg0/L3nZYwPChX+O3MEGpN
	W65iKmdWB/REyxRnSz6LsKKPh3xbyOqeiaHed7jDFTD8kQfd4P3lmlhmK2e0wfuuxj6yKmy
	yTNBNBUwDwKpt4R73YxUGAcxZqoSI63jthP+gohKwO+t2kSaj+QQn/t3i8TaI2Nh+zQQxGR
	niOFL052QxpCzIcSCipJoKWJI4Vpvl0Z11uB8sx4ZlTDHwP+h1Ddc2YGavuAbOXtfElhxIw
	z1JX55DQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
also needed for embedded platforms. Select it when available.

Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/altmodes/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 7867fa7c405d..b054c0b6a8d4 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
 config TYPEC_DP_ALTMODE
 	tristate "DisplayPort Alternate Mode driver"
 	depends on DRM
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
 	  displays and adapters to be attached to the USB Type-C
-- 
2.54.0

