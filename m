Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05D39F165
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121165; cv=none; b=jAMNJbNIN5NbBBK/MsKciT0rc7W4HNu7DoS51XatXme/GeqLam9ypH37Cw5cl/2CU8XmcUkDeFW3CGPkyrFqCLVTTMjZtBMr9EijRA5418izUWc5FyRmcAlNLF26rHqyFP9yQ3tA+TMSvYyzDfs+/pgH93DRR1UPube5Jnc3ulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121165; c=relaxed/simple;
	bh=GKn99OYoElK84ZVJ7YP6UqBYdrLq7HXpoepjfR4DCt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gt/m3uQaUCOWslFD7QYdcqdKL3aPJ3Z+c2INnk3Ytq2T69T+Dzn6y5qjWvhmPzYF6a98qAop2zIobFPJlQk9YyknpJDlytqv9onxBNDCH5NbwOrbkp4jBGaIqQkKc3thW9++RYNGGDHN/ailRxNEOvavWgw/WQjJUSTn+iFhyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GUXR4g3X; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GUXR4g3X"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec450b950dso581409266b.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782121162; x=1782725962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRBiib49+edyErnYaxFG8Uj2VeeIA+JfDglsGlUnnhw=;
        b=GUXR4g3XNFY8kFfOeA0kU94XtubFr4kDfilfgq4yv7yDUbLK+9Wg2kfI/9w6OzvNXQ
         Ez8HMuT7q1RHnlMe9Uf/QVI+nKScze01MeYwyYiXYlWZlKoYPoTd5G/9WJ5bZPhiqqM1
         NhMThr9N8vaMt9g2qaFmUiPUgSTbG6FdltAEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121162; x=1782725962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRBiib49+edyErnYaxFG8Uj2VeeIA+JfDglsGlUnnhw=;
        b=lv5N8fUah1j/zWC0lDAHIbTz3LSMX352+v0BMJj5N/lxAhRe7UeHfcj4r6QDYQoIWs
         LiM9BvJnrGxxgUBly/pc2TCwkXEiOVtxPZL86pGKoMfoaMSxbPpZMk/Pkj1yCIbI9FCj
         AnaFjGfQpi/ArJWkzcQ71egPA5BO8yLij///A7CNc39nFgIIBZymO8G5KGS9r4/+LkmO
         cfXLRC7WqPJf+96wiGZB78MEoDZeAiA6ROtLA3mfiISvpxgQy6wrgYJt1J+HLM35CQMX
         RmasuwqJc17wOk1pO849Rj9qrdHaAOJ/iDHOJ6NM0R1lZGvJLqU9d4QlzPRtgRdAxPJX
         cd9g==
X-Forwarded-Encrypted: i=1; AFNElJ/vgSHaEuR5iFZxEts2fxmL0Yz4dmUVsAyvZ0qrPdsqv7XjFXa8JqBxan+0Zw3gBqkr+rE1mQvdGn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUwkxuTZobgvEu48ik3kCwGG/hVSNIPD2J/xATI1OUL6mLdgtG
	JthMi1WEWGK8rtC/uPp26qV6iA6qPJPxhTybTbMwFJHSly5gKzsAmFNE/qDfPDGBtSStPV8wNWU
	MJaxJxw==
X-Gm-Gg: AfdE7clXkNwE5TZ+bsbYInhoNS/mcDaMLSns+UmDolOUyIiSnyPIn9GskVC6kvzPuZV
	Rnc4ITh31m3CegsyQ1anf1JunvbCE/pU7dz7c0YoODHPnDcoHQC5RQBKwGKFhfvcFuT0qdM2pEP
	O9/xHug1gPXeRhtd+yw8/E3R9+L0aXz9edzVX0/fnXrSdRmwijixqLGxJWtwdaBX3vG4FFpVTDq
	QBqQAfLdThX6rU8F/hSwYxPyvO7yCa2VlpIFmr2kAQwQAYYSa9kSUQsDOv3HTw/rB+WtM51Xr+D
	QzW5+E+iwHJQs41/IZSNDeY1rw6DBRSAsUOx7hygN8dZHOpGQQ/l/uchs1x+I78oeM+i2AWPGW7
	CSCrD1kF312yUpn/QyTo0noI+v/DsKvth1g+lVLsUDsVzlaeNRXWIipjrJu11A//blXSGI418oR
	FL6SBRl/htUTv9pSwcf4EShWWA4hQ+VReyn42jhO9vulMHmkVvYSjnb+1G8WNCATBQX3O+YktgM
	AKC0Bn4C8mYT1JKQeZ6
X-Received: by 2002:a17:907:a78a:b0:c07:3582:bdb8 with SMTP id a640c23a62f3a-c0b6143ca3dmr529352166b.18.1782121162176;
        Mon, 22 Jun 2026 02:39:22 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e526asm324855566b.51.2026.06.22.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:39:21 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 3/3] usb: typec: displayport: Check cable altmode support
Date: Mon, 22 Jun 2026 09:39:10 +0000
Message-ID: <20260622093910.1210089-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
In-Reply-To: <20260622093910.1210089-1-akuchynski@chromium.org>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
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
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
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
2.55.0.rc0.738.g0c8ab3ebcc-goog

