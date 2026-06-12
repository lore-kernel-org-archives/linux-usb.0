Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C639B978
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241684; cv=none; b=IfLotEJtAkD57E3280ShFj9V196rK3EwvW3rUTui9EY1YY9nYHZ4+SNqNRRPvxCHl0nT961ONorC9mppBAyxrixKOv4P6DB95F/sGBnpUONIGL8oSuR0NUpx5Ayg+j5Hj8io7PnV5Njur1mPQIguvSlWJh9uiVdgSNg6WW0otVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241684; c=relaxed/simple;
	bh=d0FojcgqGHxFZQUGFDioGsFSnSoG08U5K4yGq+rirxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbYyFscvqqJjYhhHKdiHkVAoFwldQ7wOUEMPAdJ+4b0OCjgm4mCNTTtThpzPf2fucaRdwBxQMxFPUtdiVFWkzXjQ675r2mNeLcudhDN5W+xfqAcdMXgIQg1t2I0TWa6338D+v9568Dt/WIgt2hkfNZoAcW6cv+LQYsd/rgO+VY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM5jPKVf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM5jPKVf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-842307473b5so496200b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781241682; x=1781846482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY1YZhB8AKmupMGzw9E2JCn6oLAGuV3NZ41mLtimSng=;
        b=NM5jPKVfPyi8WUlpAbeq4F8rLLuabGsIWUVmMsFsaPsDiaypjsCqqumS4OEz34Cm3g
         E2+oZfJKourMlr7cAXjROmyawqprqDyjKz1b25AOXxrM0RF/m/pt0gvNBb18cHVln/p/
         ajF2Gs1PsdYqvbbgF/o9qVNCUPVu8l/B07X4x0P4o0K6bw23rK73l8/OfPqIUSA+Xiz3
         o3lkHSj2bJJ0YwF0acLAKhBJKD2himmP/V7fxns+ZLmuq+tTZmFX2lf58422WBhK1NU2
         uz3Zqu/fkmSKoee3ZZ2lRHITfQG5ipdPpb7qMS0CcmFeXkjANPIXJZJapDzoLxdsOs/t
         r+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781241682; x=1781846482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LY1YZhB8AKmupMGzw9E2JCn6oLAGuV3NZ41mLtimSng=;
        b=IDCBZBVKxMY/k3n3WHqci5BB4hgLq0hN5HRaX6m8F9yQFp5euUwtf1aPUfY+mbEnH0
         KtSCTu3gdnV55dSeFdQG6YJ+sTrm/HIGo14VMx4rJPDBSFpuJS5vvOWPGDwVAbIP/tCM
         TbejXhdK9gR9JEN96Z9/ryIUrHA/QPrIyiUawBCBiD8I84lbgTeh40I7Mm7vUxTTMERL
         UxBhuSY7YyK+vkzU6pKSEEerfqpcEZw4zLoSoRF4c7Vq/u0VoKO9KFDdnR0DyI+KYY77
         dQgoLMxxsRldFcKVz4amRdx0lrQ3TWPMB8BjBGqfcoAsX2vtavcVeKekqWQX71ypwmDi
         jeLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8r1B+GqdNg0jCp0Ue362G0n0MerNFMio5rQND9EUB5qG0s4EOgkgFNsp9yDIwG2uDXA98TM7nsltY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/D6AbVZuZbdMOwebIdgneL2/aOx50NWC3yYvzIrorSo+IfTUe
	3HB9kUO1pJ11WOEjfZi0MeSbPMkGPtvtbzHr+n8tz+V0CwHnR1geYBlP
X-Gm-Gg: Acq92OGc4ah2kC1tnfFhZQLLXOF3mV5dVOXmNp7D/OEdqgm9GEIpBdFdAXoReBvqsT0
	qq2RUnz4GbdnV5W5P7o/IK9eUN9VhTImHOYtvbGCycoJJ3ryrmPSYoWDzwhbj3w9V20M9fijv8Q
	RlXpygmCSspje4Eb3RFbKf4wfknww3FEpV8v3PyMpwVFrcoF2wCBlZ1y3xn1ZL9zEXyT3E8qZSE
	gXc2L23+opUBqV2BGmLIsBJO5AfzHFR56apElJ8fxIKy2/v7Gi2LpANp6KbECqcxnhb8fZwtdns
	uWQkTduIjfS5J8SGz+4iO3bKEk+nIFeovBFgQzZRku5WHTfCr2BQFxxzmTn+I6v32dlTgJZW4f5
	/eN7Eq9hFBFL4GmjgPBZ1bOJRMg9E4lQhWKHGuTLxZUSFlvdyotuj14WD6n484dQfgT+zOsxEZs
	gv/DQDGCzkonrZ2az47g0hMgBw1L67vJkoRiGbKbZPnRJ1LPg8o0jo
X-Received: by 2002:a05:6a00:3486:b0:842:670d:f6dc with SMTP id d2e1a72fcca58-8434ce46526mr1408285b3a.27.1781241682423;
        Thu, 11 Jun 2026 22:21:22 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b009e67sm1018294b3a.42.2026.06.11.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 22:21:21 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bleung@chromium.org,
	jthies@google.com,
	myrrhperiwinkle@qtmlabs.xyz,
	pooja.katiyar@intel.com,
	abelvesa@kernel.org,
	yuanhsinte@chromium.org,
	johan@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] usb: typec: ucsi: Add duplicate detection to nvidia registration path
Date: Fri, 12 Jun 2026 13:21:11 +0800
Message-ID: <20260612052112.1325812-3-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612052112.1325812-1-acelan.kao@canonical.com>
References: <20260612052112.1325812-1-acelan.kao@canonical.com>
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
index 9cd7fd7a38521..9eeb38e7472c0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -706,19 +706,25 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 
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

