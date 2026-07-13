Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E111E3B8922
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932215; cv=none; b=l/piV5BzfE4VaCKnVCPLouC5M62G3vUq1sSoa4D9DLDhwiJbFEEHz0x/B20j0uya7tytNSbccCn8c8brLUwoq6dSD8GFVZ9svnpFB0VN+IFoEtrdHmXCK3mni4HqnU3OjBimFAfrX3Z4oJzdyzoOH3U09KSj/hp1gOT1iHUQ9Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932215; c=relaxed/simple;
	bh=JDv9cvCfz0toNbSmDSr6BptzpJnAo43DD0S2XFnyi08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTb1jyUvqdsjs07arU9RS67SFkKqxkxAPFUnwG/kBaXK78MlZeOqczf5zgeX/YjG0Z3B+QtSsj4IdAhtKjpmbYyLxUoAieLidgjQU2N1rnEUdQ/RNhslWinBfUOdNRbGC4HVpGD4MEFkFuYPL9G5ohYS28fx/1XpTdeE2VyoNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LffXOtB/; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LffXOtB/"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so3336894a91.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 01:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783932213; x=1784537013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyXVzMnf/nv4SeU/Mt7kZFwDd9i4afrIe4YGwvAaufo=;
        b=LffXOtB/oR8eWH/kKjTcKdKJP4tPgYldJxowGj6ZAXwypZK8ss1bAERtVq4mA9BqQt
         DbQjVCJmTxOrec602EzfcXLXtIYE078sbihK4iNug2VHiCDT+2Eev61d4tbFvgg08DtP
         +8sAIuRickVr5bEo5o4v6HA94pKAy8vIbUT8mL46+vOaVbMQo7/CFS1p8A+cht7hCFrD
         H9OuTG4qYSDf6Gt9SwhJfkCrGK2Y8wwh/wvmrh1iqbIyHAQJGbEwkjbv3BPDa1J33kBD
         8dCYjHsZf+3cV6/gQ5H0L+xaFQyC6hTf/o3LpoeI00no4vew0nezivljHkF1worPmqqZ
         2txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783932213; x=1784537013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyXVzMnf/nv4SeU/Mt7kZFwDd9i4afrIe4YGwvAaufo=;
        b=Kbc++QyHYpWKoTJ1AsPOpvCZJAIpdzxvR96IBelytgUbHZ5ysqUCTPUrlENVYZ29dn
         /MwWcO52jqPXFT3DNGRu3PJusskHevck4pCI43TXi3AJt0POaxI4igp6ZSnYUD+5i6W7
         jL7LAyZ2XF+WKvx/cydvnJyQOzWLlk3ZBMpgUY52OmJEq6nETwFAdfgoVk12X72QJvDd
         oHCHdkzMbdtc82E4u1RdFHMC/b/gQ3CsInX5jGgQ73oZ90wL6mKGpdSVMJ+MT0RkwIx2
         Kmv5TqXvKTt3jCph2pxcksXQJ7+cae6ElxFsBKWRsvec6Y9S3RuWnrM0+HarHPCHYCGW
         HCFw==
X-Gm-Message-State: AOJu0Yy/V1Rca0fCjYgScEPhdECkHqMu3/S6sLGZN2uWAX/R9t6RKGRt
	lFmVY4b01vIlQSke94kdn9SlUtwT1tQ7a/oVxt0sxMFAPYMoztP0NhNu
X-Gm-Gg: AfdE7cliOyeStBMzOx6xQXNZLo2cBvUV81MufVJFFjwpi6KCqXrRwqt0hOsyZIZaj2J
	3jRufQ2JS/9AfPUyrOAHp5mu412X9+4lSFo9hF8lB2ifstzLWMNvHdNHGnPi54//Gjy9HSkUA1h
	hi2NrdjKCJx6GdcTBc3HZmRqx/sC16jvzx3fjaDp9SmXU8uDgCTs8iCI1ycMtzMb7x+0X+tMHho
	bzcroKdjaGUeswkU3h7WfBocd+ij8UydIugAKGMwGhmWZnIU71QKKFxM7kW0qG6FOSuLS4Z+oxc
	jcLecTCFBYct5wOkvnZIlbEv13Z87bc4fTMB33Uevd1IXMQxSXEw9BcWXPNCAFCRDXr9s7GQCGx
	WGE1WsR3Gw/c4MdLjgy0wvl3Ldwj5N3Mbihq6f6n7fEy/pl3o0vxlN+Vp6vBBTSR7n4B8Ap3I+Z
	E+RqKaVRXq/bfhYVbyYk/j1w+h/5g8OY1/SRMYhe0ydQ==
X-Received: by 2002:a17:90b:3ccc:b0:37f:c2a8:ce45 with SMTP id 98e67ed59e1d1-38dc73b936emr7922432a91.4.1783932213308;
        Mon, 13 Jul 2026 01:43:33 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm6066648a91.3.2026.07.13.01.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:43:32 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Mon, 13 Jul 2026 16:43:22 +0800
Message-ID: <20260713084323.287516-2-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713084323.287516-1-acelan.kao@canonical.com>
References: <20260713084323.287516-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the duplicate altmode detection to ucsi_register_altmodes_nvidia()
which is used when a driver provides the update_altmodes() callback.

This ensures all drivers benefit from duplicate detection, whether they
use the standard registration path or the nvidia path with update_altmodes
callback.

Without this fix, drivers using the nvidia path (like yoga_c630) would
still encounter duplicate altmode registration errors from buggy firmware.

Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
Cc: stable@vger.kernel.org
Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index b9343bf67357..3ad7bc48a9c0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -727,19 +727,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
-		memset(&desc, 0, sizeof(desc));
-		if (multi_dp) {
-			desc.svid = updated[i].svid;
-			desc.vdo = updated[i].mid;
-		} else {
-			desc.svid = orig[i].svid;
-			desc.vdo = orig[i].mid;
-		}
-		desc.roles = TYPEC_PORT_DRD;
+		struct ucsi_altmode *altmode_array = multi_dp ? updated : orig;
 
-		if (!desc.svid)
+		if (!altmode_array[i].svid)
 			return 0;
 
+		/*
+		 * Check for duplicates in current array and already
+		 * registered altmodes. Skip if duplicate found.
+		 */
+		if (ucsi_altmode_is_duplicate(con, recipient, altmode_array, i,
+					      altmode_array[i].svid,
+					      altmode_array[i].mid, i))
+			continue;
+
+		memset(&desc, 0, sizeof(desc));
+		desc.svid = altmode_array[i].svid;
+		desc.vdo = altmode_array[i].mid;
+		desc.roles = TYPEC_PORT_DRD;
+
 		ret = ucsi_register_altmode(con, &desc, recipient);
 		if (ret)
 			return ret;
-- 
2.53.0

