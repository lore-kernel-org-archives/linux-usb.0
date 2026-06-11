Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DF31197C
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180530; cv=none; b=lqA6z/0K8M5WL5wnla5nohohUxMuO/7paV9exhItMgFpiewyKcjJH4XCbxZSsod2VZkgVyDGnaCfAM2pSNu72BCT2TQFaHmSDb7k7RcsPJtPe5P/n/1PREjGHrQO0hVCL3IdEAYnUmIbJqJ0NyodCtaEEyK6ag+/1unAUsd0rVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180530; c=relaxed/simple;
	bh=omjlL2gFyfPmmEjvHJqHfrd1oebp0ripdj1saowjmBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzhfwQUaS1UFY8JbewKCdj/XjVw/rvG1S7dYPXuJZnW8vC8yInq3AU+kadJJthZbxJ9piUrELpuu7t5sTVJIQxLRPQkSSeJJLdIhwJWkuOkmVoY48F3Fsr+NhkfF4pkkl7iAKDbbgF/yPR0x+wuIKzs+AyLC2YAA7G4biTFlhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GU4qWzGW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GU4qWzGW"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68acf0a15b3so11437835a12.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781180525; x=1781785325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dU0WIeEmv4jADnoXKywHegSdnlv2E7AO+U74bqUHkI8=;
        b=GU4qWzGW80mUIingwO8viRrA7nf1ACexYYYmK70rBBnKuW9kFEeWMd0jTPaa4qZv9R
         Qgo/zA8C5LK5bJXTtlY+ISffZ5sAZiVm6fr5JXY5uq4/hxhrxGexDLI4lTAfWBfX7jcm
         xu8IXomdpjGyuh5yysOu07MjP026uoCvzMhFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180525; x=1781785325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dU0WIeEmv4jADnoXKywHegSdnlv2E7AO+U74bqUHkI8=;
        b=Naw0Logp837dc9F8JxZNWujj9lKFBVXCTLgcZJbSoqGfGCeRGuJ9Wm7XJi6GIn5OfG
         1suybKuVI/dOkgp9UBXqg2qHGXisANiXQF11b63Nf3MnyKxyM+bQ9QtIf8LVkibeIgXI
         W4VWpvRJtWH+4Mf5gSuh87B5P7/3BaCKieN9Mv2A+myucx5r8a36tDboDBVMMkbeanqq
         32RuZjT1zbgkHs6JMRMq/Sq6ufIIpFgykGQODwOPbjbMdsvAKhueWawieD4NDghx71D5
         MZtAC6ADtk6QwH8nds6W4h2huma4W3BuxLym0DdVLuFE+LN0ozZdDjPa0x71w0yrX06d
         64GA==
X-Forwarded-Encrypted: i=1; AFNElJ+DtmTymE/9+4BS8JWw1O8Hgd4yeXBDm+odYD3+VV63rsdlV0Bk54Zs0Ti/zLsmZstyjGY7VwNGgvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6MxlDJogWdZMoG9u0qkEY/2qCMMH+AeJ1VnmsXhgf+P0I4Vr
	cppdLDXETYJwILkKSDgKy84PcrnYv/0nHt+KQrq8P+898tLlf+CYWebC1ONy5cEchAuZru2tEmR
	GaDfFKA==
X-Gm-Gg: Acq92OF9iliA2KI16l3wPNitrLWrzc0uPq1qWKT9usRiLXzP+97bTWS1PYD5yU3wVCM
	7FNMOoftkIzoY5gvYXOIDUSof0ZYDgCYtFuwHFd8155apD/nXk7x/DhOA7c6sxbP4tNQySAhYUL
	HoXLDG5VxngBWH3vMv5ib2dxmPy2aLImtwXnxjtbVAgHch7g/5lTrHcBCRW4mmKKGvPah1b8wJg
	d8rgCwJ9Kdxez9Qll+Egx9CmJMZm0XJRIu9NkTz+skWUa3ihu7iqyfEeffJBRcXHHniYdf3LOju
	jf/LYv4N1zeybBzLvCIT5cUolo2bXCBazZNBXqIDCp2TqehmV/DRRG0LiBCL0WWXzjE+pQxfPgW
	0a/gU92IM5L6X0b/flCOlC1g87QTcdqTLKzWMkyjFjfkZgh5ZPEQIy/GHuwtyEF+6A++BkSv16R
	WfCM3seIZf6hx4yvalQlaNBchY+SEUMEkhuqMllUj3H4C0xUyfp0kU/M9GluLsOg90X1AHOFV9Z
	eOL3CdEd30U4H1Iy8axA9QFn8azSUI=
X-Received: by 2002:a05:6402:51cb:b0:68a:de40:26e4 with SMTP id 4fb4d7f45d1cf-6930e30d09amr1121873a12.25.1781180525179;
        Thu, 11 Jun 2026 05:22:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm6853113a12.29.2026.06.11.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 05:22:04 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 3/3] usb: typec: displayport: Check cable altmode support
Date: Thu, 11 Jun 2026 12:21:46 +0000
Message-ID: <20260611122146.262184-4-akuchynski@chromium.org>
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
DisplayPort altmode, don't initialize altmode_ops and prevent altmode
from being activated.
A captive cable shouldn't be checked; it may not provide discoverable
capability information, but it is inherently designed to support the
device's requirements.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 263a89c5f3243..5ee33a69b9cf7 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -790,7 +790,6 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	dp->alt = alt;
 
 	alt->desc = "DisplayPort";
-	typec_altmode_set_ops(alt, &dp_altmode_ops);
 
 	if (plug) {
 		plug->desc = "Displayport";
@@ -811,6 +810,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
+	if ((alt->vdo & DP_CAP_RECEPTACLE) && typec_cable_altmode_unsupported(alt))
+		return 0;
+
+	typec_altmode_set_ops(alt, &dp_altmode_ops);
 	if (!alt->mode_selection) {
 		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
 		schedule_work(&dp->work);
-- 
2.54.0.1099.g489fc7bff1-goog

