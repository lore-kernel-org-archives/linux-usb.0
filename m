Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9E39BFE7
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 05:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781241688; cv=none; b=WH7T3yXdvdGXnYfuec0ll3pokj+Tf1gT/LTxt6rxaP03pGsx3dJ83883GYzDyk5IoWNkxL2SpRfAoZXyMOL51B3x5kJ6OAKHWjEdzDjaqaLHZcDQp47swV8ku6Ai0znpWREPwacWqi3VozlexSMhB1hjP4G5IIsMM02j7sxR9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781241688; c=relaxed/simple;
	bh=bCDlH3Pg3MhK5JB4icqU+hAOOLprGDN2GMxKN42gIQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+PtjhJ8mUZTlo1X7Lg9SV6g4Xyt8tTGKhdsIiAM2t5SJqQY8xhjIvm+iRsRlAUOYPVHpKqrE8is3YZOV2cbKJsnJFnH/eGwE1PJivAWhGPAzKunhGn2Y38uKH7klXqkq78KR2jj5+Vly/6Srw5D+3JFqV1UHreaYXj/uxpcv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY+nwhDA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY+nwhDA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso396180a91.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 22:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781241686; x=1781846486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0iLxu0OIMq4uond8gTEg2/ZhyX7yERRrr2Iv0KZlrM=;
        b=RY+nwhDAyrl5wsmp1eyCRFYSEQPiJjQnhg3gqjAJnDGBjD8AuWfkYeu1GcLsXZB+hy
         MmVBvksjJ4FOkYfwVBE/5ocouzayNpVYE3fNCHQ4AlEIuxwOYoHxaWr7MlUppN4LDyLz
         OA55FoWG+7fos//N8C4xqKOb2gHQMO9ZeTEHYV6En887g1OryQa3iI7r01JEwdOjizfv
         G6HQmKkAzHDBqMu9l7N6HeTE+T198vnrkW2VWryKr+ahA5BieU0QLDPbMgSu5xLnZdXy
         /U14Blf3d+9pYsYgj4dyf46Jc2VrD5D/2mR3pjf/x8gi7uRVLexqYk34XPkYo3CVvkXX
         vm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781241686; x=1781846486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0iLxu0OIMq4uond8gTEg2/ZhyX7yERRrr2Iv0KZlrM=;
        b=V1d+KO94rZda/YQhyoOgolNRaf+oxq6GpXnYhNbHUTHKI+eXjLEoNqG7J74N70v7fH
         EX28o8PA6xWhJCq9+X7991dc4dPyTS/PtsuENCXVMyU2AuBZJGmKU8f14d1AAMqtVxD7
         I+wn8Ed5AZLKEMFpjz82k7Rm4JYnqK6kcFbsD9RHm0j99TNF0BivjBITbw+G2vZBP8//
         +5IDZxaPNJNObdzAyur+zLLEWAMRcFT9VK3hH90CC5lw1/PT6rQI38XE+0wSDAG+ix/n
         eJs362G/PWCUPUnty1U1JXt+s9/KwfaXh6jFF+N7W12CqX2qovZdr2q6r/uYOMReo2xx
         gBlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f4nM58TJYTc+pPZfyqwMcKg9Skk/XCUKRD/eZBbC59WsW+imoJ24MfK2IDHZM1W9fzzKgkLtcgQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMI8z79S343q5EGiQPjJ45fA5eZLQI53WWu/zvgTOFJ+GGcGgY
	6Qyoq6n1pVDR1Us2Cii00AcsU/Ys+zSHgHjREmdls0o9X6kUdjQYvQSG
X-Gm-Gg: Acq92OEeoYMixR3cVVUSkf0bnnWYANxeCP753F8YuRZIwOEZgFRAk3hzDjwloK8lQj8
	1drx2PaQdYpfpLmvQnkeIt3pSVBMI65e9U534kosqMu91bRsq4Bzg4Qs3DieUbq5ig63Ed8S3Fg
	4alYUYpNH/xzMeF9y6cstVAYQLs4OU3KP2QqUmzhtbkgSlLXLBojJCRE2qUXeRMxFv6TOmWIS6T
	T3hX0TowPr8L/YiVDRLQF5GVhIhGq0mgyEUHugPfTwCUC3EFoefWgTHx4iYax6/gur+F4UlUQcu
	CUURLCIy+Gq/wY/U1aA0Y0xw/ohH1aRPVuj6GoVG+ZI+y1+oW+krNKbDkLnMYw8rw+FjmMUVlOW
	5bPFSzpRTDWjFkdseoMf5R+RV6V+IWn6RJPmIxuvftDgvmmtE4qd6lHea2rv5U3PdkuusStiw3O
	2TleeH4Nd8Eo0maYiSW1/RvidluUn6LhLXEhGBLJBr/rshcxxwVZ/H
X-Received: by 2002:a17:902:ce8c:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c4111adec5mr18173645ad.12.1781241685597;
        Thu, 11 Jun 2026 22:21:25 -0700 (PDT)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c14sm6383225ad.43.2026.06.11.22.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 22:21:25 -0700 (PDT)
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
Subject: [PATCH v6 3/3] usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling
Date: Fri, 12 Jun 2026 13:21:12 +0800
Message-ID: <20260612052112.1325812-4-acelan.kao@canonical.com>
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

This reverts commit e0c48e42d818 ("usb: typec: ucsi: yoga-c630: remove
duplicate AltModes").

The yoga_c630 driver previously implemented its own duplicate altmode
detection in yoga_c630_ucsi_update_altmodes() to work around buggy EC
firmware that returns duplicate AltModes instead of empty ones.

With the introduction of the common ucsi_altmode_is_duplicate() helper
in both the standard and nvidia registration paths, duplicate detection
is now handled automatically in the core UCSI code. This makes the
yoga_c630-specific implementation added in commit e0c48e42d818 ("usb:
typec: ucsi: yoga-c630: remove duplicate AltModes") redundant.

Remove yoga_c630_ucsi_update_altmodes() and its callback to eliminate
code duplication and simplify the driver. Note that this causes the
driver to switch back from the nvidia registration path to the standard
path, which is the original behavior before commit e0c48e42d818 ("usb:
typec: ucsi: yoga-c630: remove duplicate AltModes"). Both paths now
include duplicate detection, ensuring the firmware bug is still properly
handled.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 1be18d1018426..bb7b09bc7c1c1 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -139,28 +139,6 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 	return ret;
 }
 
-static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
-					   u8 recipient,
-					   struct ucsi_altmode *orig,
-					   struct ucsi_altmode *updated)
-{
-	int i;
-
-	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
-		return false;
-
-	/* EC is nice and repeats altmodes again and again. Ignore copies. */
-	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
-		if (orig[i].svid == orig[0].svid) {
-			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
-			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
-			break;
-		}
-	}
-
-	return false;
-}
-
 static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
 {
 	if (con->num == 1)
@@ -174,7 +152,6 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
-	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
-- 
2.53.0

