Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FE0284896
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180527; cv=none; b=PjHkUolhUPm3j6e8Eg4dDHo01DNqM2co11znEeEXKHVq0tE6hekUAuJwaXOI5M4F/FDn8pZ+xorjcPxGsrbrKZReyZpz+PT7BcVVjT4S2A1/xp+31+XA79wqeRDRyQefOoN8HXy4tRFlrNEBrFgyIHnp06s6aoxtTs6nYT3PteQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180527; c=relaxed/simple;
	bh=84kovXgRlCrcfAouK/xoduVpd2fRB6kd670xHXBMFtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ie+MZHRkjYMh7JxSdiKv5MJH3oYpowRbBLuhEyKO/PlET7Vxyi3a5SByCr1KEKP0O0KBqss0yTscj5CMdOziYROf8nVahG9gmsIMMTUtmHKyW9DE6RiSWRICPTOiIRfY1wJJbN+GpP37d4G7+ol6wNHiMZjAFeOx/GxpLZ65H7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i7nC8yBH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7nC8yBH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso12814239a12.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781180522; x=1781785322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmXS6lUukW6CWkQV4b1sCEleRd6onwJhOcR8iNrGcso=;
        b=i7nC8yBHHysM9Vd+13M1horgH3Y2z+aZqzduH9Bx/KX4cjFMKkULon/Fktfxk7iAAQ
         JSizc31Ml/C9/gG+Wq9aMiMVCgDQJFCpR1M/JWcm+LegKS+fH5DjTBwaN6FpzyHlsNih
         aW7sy0TIWgtzmel3zU4z+CMmfQHhVhc8sqTxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180522; x=1781785322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NmXS6lUukW6CWkQV4b1sCEleRd6onwJhOcR8iNrGcso=;
        b=e+Vi/AimKF53TxSLFDRuobYG9qeLfBfSFD62IvVm54F7Uw4Hz70BUS4vZsFnDoHJpx
         dNZc8YP2jy9JKEiEAQZ5z1vSIdT1VrqwxJ25Oc8+5nz8FBlGm+89emPpUeuvJZIy3lEK
         lL0SP0jkMRT4SbNPowPEJtTH6GoH77rl9jirbSMt//Q88hpTsxX9R+uscoqlYcb56i1j
         vaQsI/wNpXzAQMwfMqzzBl7EQswULUXb3xQQHUCYZJiWyHBCWlKmZD6dd+H8DcXMgcCy
         P3RSRTciF2RaZ596nU1yjy+GvB0raZV4+5wtytf2gXPEKMl6JZeGQStBubdUiZ2MivVR
         ZFag==
X-Forwarded-Encrypted: i=1; AFNElJ/YdBfw9jnw5XCXBuNbWCg34HiO4w9wdJ6kY9Wub95rX9wuGRgFGNao+fNHJVCGng1UKmZrPuoTDd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0GEWGxdePbNMYdtvkQ9Exg51RwTblEzVLf1ruUJP9htjju0X
	6/zK57rtr/2+6MfghKb5q59agy6uoEbQpaRlocodAsRLOaoLJc946i2+L1GDL1l6KQ==
X-Gm-Gg: Acq92OEPYltMi4bV73Ec4LRigF0VVhn3XcBsuisKqDOdGJnBexMMlvorutt4vEhaixN
	3GqItkz9faPKKjir/kX0zziPM5huV27qn30EPwD6XHMVn9Qe+5K/3LqaEfOCQg9VrvyHqmTuPbb
	Gn8ooUU3zCNy1bADHAWeFnDYcwpqlzghS7/S5TwvOE4MiaZuc+7dHtJgqcy8XzfIn3k7s3xH3f5
	t/XbRPVDcp+22gaUjxkovQ0TegugWUm4an44paCm5BiRA09oXf0ehENEbK/7Sb/4R5686zJbidC
	CSPU9nK0gid/oaTX67tpK1rrVJA2FJonftZ87L0/lB1jhCxhIEmDoAHsYcQ92Vyn7Ou5MrQ9uli
	LBw0FNDYNHeWR42H/wZjsdt523VdNGXWb3SCNL9MccQKkbDR/g6Knxk93PGq+QJIqI+JsL2AqOY
	uzuN37A4PXpp+OZQhoo6lvjvxply3YTzdaRiQH634PQWGHr3naMxT0yLvgVSW9/TXUUp7eUPnhz
	DygNGR2apSrArUAfu3yJkcRYwR+LCw=
X-Received: by 2002:a05:6402:358d:b0:691:ad29:ea40 with SMTP id 4fb4d7f45d1cf-6930e2c1d46mr1152883a12.13.1781180522284;
        Thu, 11 Jun 2026 05:22:02 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm6853113a12.29.2026.06.11.05.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:22:01 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 2/3] usb: typec: thunderbolt: Check cable altmode support
Date: Thu, 11 Jun 2026 12:21:45 +0000
Message-ID: <20260611122146.262184-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260611122146.262184-1-akuchynski@chromium.org>
References: <20260611122146.262184-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the probe function to utilize the new
typec_cable_altmode_unsupported() helper. If the cable doesn't support
Thunderbolt altmode, don't initialize altmode_ops and prevent altmode
from being activated.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 32250b94262a9..2eccdddf1b1f4 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -284,6 +284,10 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 
 	alt->desc = "Thunderbolt3";
 	typec_altmode_set_drvdata(alt, tbt);
+
+	if (typec_cable_altmode_unsupported(alt))
+		return 0;
+
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
 	if (!alt->mode_selection && tbt_ready(alt)) {
-- 
2.54.0.1099.g489fc7bff1-goog

