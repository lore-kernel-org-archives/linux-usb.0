Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3CA347BC4
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790463942; cv=none; b=cvCqmJFFydABHfHHxYOB6161kAe/vNGLAkCmai42F8rX3NqroMWxL4agLEx8Fi2txmqE+TdYasL1kLAWZfXq+dHmqKlgqh6sueBLlgcfhF6jvSky7LifY6E6rgAPmgErQa3spdSVJh4T1KXNEjL4BlQRHW32Yr96VN1tKPsGAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790463942; c=relaxed/simple;
	bh=lUZwpcjfJVbjPXfPcIHxuhk3nhpQ2sZnS/KtAXx4GVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6ZmVHAOVNY8fFCAlhj1F7jPUHGwlyRsuqoyaxXGm52HrXw04cKFJGZEt6UrPMqI3B3U5YdvGSxe9m/dKR1YWAvm+K9y4aqENhWXjkc1wD6bF2OfxUTOzvxUNy4WCpdu/GhJFGZPLq0zwf3/CIOM4QR1TatCt9zRej7mikPxCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pxAM65l6; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pxAM65l6"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bec20a6fso706329a91.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790463940; x=1791068740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5b+3IogLhmEcJn2krORIy7k4m3K29JGGK/T/+oSR1EY=;
        b=pxAM65l60lZ2HlYEikg54edpgUfZrqhxZYv/ooKkv4BstNJinUOdZVWF5lyS1QiBdc
         FTj7wDn+KdIqp2i0TLcZasj87lmTRIWsRNXLNo80hbzfMtsgfwwRxeZY3syC+8KHeNKB
         QzS3zYiwpnNvuLKzVDDSHaeSxNASvpDORrG2Uw/+4HiHowa9+MDeefoPVZzz7P067uus
         itLPBJcxwzUIliZxLqhW4GzyyWeaOtHzMA0dtUS4g5cKmv8DSK3656XIrCj3cPY8zMLp
         wrb0ZnE4fU6QHN28So5++s6JaFGqeYMs6WJQvbMhAPliDLL2JgWllbTqwqFVJkggX+2O
         MfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790463940; x=1791068740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5b+3IogLhmEcJn2krORIy7k4m3K29JGGK/T/+oSR1EY=;
        b=a5uJ0UfgJaMBaMVMmuwTbODsOvw1i7vgu7fSrirF9i3hb5lu90Jd5f4so4TzgBSqnL
         hYEah9MYhxOeoLiaCA1gM5DpdGpCJk47E7vhxFM8cH1f8qHYfl/V85JwuB1QPPME6wp/
         pHxggzF5OTmvgiMLh8aRk/2zpxL+P7E4BMFdgeLDYz0yCt7ZknQsJp4RQJ8vQsSng3a/
         d09g/ib/U16CBO6viC+1j9OLw3ZrHPOcP3lwHZu2M9OOwQNGQv9povvG5J9T2A86hcKf
         FLxY4y3GTsT2yS3xa7aD0Y4sVK4UVRxOKNHO0tI6Rv/i2LJFIJSA6tlPGTvpS+GqNDmb
         t8uQ==
X-Gm-Message-State: AFq9FYK6Z6BlnXogbXr0GDvBCwf3P77QGlL+30EYIh/S8Ia4kXq7l4cd
	xMq8l7CLif4lDO1AFq2vdYPZ2I1XvG+E88ll3ruHXiW3bVJetQ1UMuaQXfXdQjtD
X-Gm-Gg: AYBFou2BgZ/qZuFaOKsfe0/dpBlMhEHVTizsl0rUZnLCt2RdmiKHWo3G1Eja1aXa42l
	mawb8nNW3twn07mMWrStT3rA+H32bCZYWr8HuLEVB3ituzqyx7mDN/jilDBQ3jNmb0UDSu10/7h
	P0zNntyk1pO2vz0fxPZkBGDfLsukV3WwyTf3wAs6LnS7dREdu+kXI9+O39tCxyoJaFtXfigYxVB
	aWTYjaSL3c5ht2NyhYnP5i6JQ7MNkAJafk8a2Ojb3I1zi+OCvNROhrCrzpDBvZ7DPkNqSgytncJ
	KqcxYik7Qg2wKw7+vQTvuFcWfBrRdm9uvFNQXX/8b4fn1MNJgOTZI0TaRtY8G8V8M8rVT1t/sid
	bmQbFoAfbATWsb0sK12UhDAkSjiinYCJtgNbO7L1nX8m7H280eFo7cPDzGX73qF153fSXnWJjSA
	cj4mOCvblA6DZrg0fEGKPlEiKMZby9mIHAv2HPhpEZN0ScbYTJBy1f299qyvPoKkujQA7XkcpQj
	cnML5HUTDyXyWnoMa6wCcWKbjLHWG+Y0PA4t3fXAgsDj468pwwkiK2RpnfNd95vxKixxJEUjXk4
	U+0ItnCCMy1aAmOtZfYTYco2Bc+vbKMZc3WlYhckgYKzD+7n
X-Received: by 2002:a17:90b:5247:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-3a098b628d9mr5530592a91.36.1790463940362;
        Sat, 26 Sep 2026 16:05:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm11778543a91.4.2026.09.26.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:05:39 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] USB: bcma: defer probe until USB3 is ready
Date: Sat, 26 Sep 2026 16:05:38 -0700
Message-ID: <20260926230538.223565-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Northstar SuperSpeed data goes to xHCI while D+/D- go to EHCI. If EHCI
probes first with VBUS already on, a SuperSpeed device falls back to
high-speed and stays there.

Defer the NS USB2 core until the USB3 core has probed, and enable VBUS
only after that host init (of_platform_populate binds xHCI when
xhci-plat is already registered). USB2-only chips have no NS USB3 core
and are unchanged.

Remove the TODO since checks are being added.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..9a5704358996 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -396,8 +396,13 @@ static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
 	struct bcma_hcd_device *usb_dev;
+	struct bcma_device *usb3;
 
-	/* TODO: Probably need checks here; is the core connected? */
+	if (core->id.id == BCMA_CORE_NS_USB20) {
+		usb3 = bcma_find_core(core->bus, BCMA_CORE_NS_USB30);
+		if (usb3 && !bcma_get_drvdata(usb3))
+			return -EPROBE_DEFER;
+	}
 
 	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
 			       GFP_KERNEL);
-- 
2.55.0

