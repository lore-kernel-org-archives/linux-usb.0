Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A637306776
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906015; cv=none; b=AhpIiQB6sET3onIYDGSs9+ZeW6JgJQneENC3DCbDjmI9cnrnfiMSPbgD+7o/3CXdt7UycHYai8OZP8TD4Q7RENDFBLmJ6exbf2Sqlnzz18cOigHybX2anFDqKmWAsLvohnH80F6VsvnHN6wA8ZDreYgk3f3quGsR4MEs9mYq88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906015; c=relaxed/simple;
	bh=Re5sa46Y0/VZaCjTaqs6KcFdiUfTXL1/i5WhJPbAY0g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o0aeCDksV4Z1LRiYovJHznoFIhgr0XXKo/H/g1wpO0Lr0JVE0HIAsF3NttdzHkNeAgzhKcS64nkvQY4K9v3xC+LWgyUoGuqTXEczfGrgMznGOgeNHt2hUC6pYbM09lGYB99YeO0XhchEtgAHrwkhlsH7OuVWXbKXqj57W8uIMaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zeq1BMag; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zeq1BMag"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so265846a91.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782906013; x=1783510813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyFzszev+usYq40ARSSCzs6vScHOVyEQ8o7LSEdBPeA=;
        b=Zeq1BMagXyXrIpheTCUhmTFpi681odKjO7oUFvzPo8uDISU4mYvQ0ei2lxOST8SAse
         qspQvXVHRkddFdERTTzR2gcTYcGK5xAQKhT0cPeCTdgigj8vQ1CUaOepPdLs0krACZcU
         JyX19Xyy4G1QqWYzOsGPBADq7bf2VBOcETrg+Bsxt1iMFXA3Gq3mO/f20V7aHRL5bjP8
         i0N+Jct54lPBnn/lwBFLLjaJYs8NIconncmcJr2gsF92isAdArlEHhcU1eKLGo6p71b9
         MZ22SblD4HrCJ1U4AJrbTHn33DDPtRTIUIYhi1ipSpvvRdwwJpKueBemz3wqOWRnGG2g
         gaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906013; x=1783510813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyFzszev+usYq40ARSSCzs6vScHOVyEQ8o7LSEdBPeA=;
        b=s2p9XOqhhCulLeJNt4gBDhmfuEOUYp7NwUiwprN4bsaWH1VsDb6uoKSJe5+mEMCJ59
         H+yyC5N/eLJ7gu/kozbBf9lDALedtliiLy6US2t0EselQ6Z/MQhY8M1pZKIWT0Xfg2MV
         PE+RGrgGCUig94WC22E+yXbiCePxEtTTp1Wj7CRjpbv+EGKav6Z3wrdv906tZzz+5lZk
         GI9s/hNhPZsSVZ7U+dry2UwAUj6vZwRvElIe1AXjY9bWBzlqgCRJ+J8WGrpFrS/CP126
         Vu591nCm3tvgAclzadaF2dzzVrJKvM+m884vm8htU9mfk9p0F+ORSLgOv/4l0fy0ZNx6
         5oUg==
X-Gm-Message-State: AOJu0Yyoe/myGF0vbebfKXJCDDvyxAjfERbws8hKJdw0INbZ3Z6qUMsq
	JGZePZsAqz93m5ZpRat79gX26DHm/ONtpozcwP4T6yV99aJAZDZBluR1/Bd+
X-Gm-Gg: AfdE7cmvhQEAZsEGs2140lVj68eB62dA6Kf7pGnG2GXKqRmlaEtRN7+63G8mle43F3p
	PoqbDLA+8apZ+yNKrOfBoYpSnjzjVj5PmFywNDNDQgA0uP7Ol6sL+JeUCEp/rooMVKA7IqUXBMd
	ALOWluSDSYQnRG1xN3GZqgyWWboMx1Ql6AYQYKJWCVlAgunrs0SkKeJq3l4frkgWb7ZdIJ9EI00
	gymFP/8CeKr2kYGLCynmaDa50iIAz+V1Llu+EC1iff1bG5LxfIh4m3Iwo2K9fwZjnG9wz88D849
	3vsA1fOeH7Sp+S+kkFKHufCDBM8nMLDT7zuZM6NIEESvA2rsZdcxdx76G2iGyzynKWc00pExy1h
	dQptjrBE68s1dOurYo63NUjfSTBZgP/YP/q+bvDwQt1iGZTcCprP1MOAkyV/vlc1I9nJDrBfelQ
	iu71b+Gt0RJHWAtXQzgEvKaIaddFs3+AIwm8RZNipH9mrtmekPOs7HedJ572F9tV5n3rxQDO7hX
	vNS4AmXHmxgt1QZVBkhUuQk7D55YuTyl8oqCrC0aogg4xkReGkPCT62Av1U
X-Received: by 2002:a17:90b:3945:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-380695868demr4370404a91.10.1782906013540;
        Wed, 01 Jul 2026 04:40:13 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095e83b6csm1776277a91.8.2026.07.01.04.40.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 04:40:11 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: typec: anx7411: use devm_pm_runtime_enable()
Date: Wed,  1 Jul 2026 20:40:06 +0900
Message-Id: <20260701114006.75738-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

anx7411_i2c_probe() enables runtime PM before returning successfully, but
anx7411_i2c_remove() tears down the Type-C partner state, workqueue, dummy
I2C device, mux, switch and port without disabling runtime PM.

Use devm_pm_runtime_enable() so runtime PM is disabled automatically on
driver detach. Since devres action registration can fail, route that
failure through the existing probe unwind path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/typec/anx7411.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 604868ebf422..41df115912b9 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1537,7 +1537,9 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 	if (anx7411_typec_check_connection(plat))
 		dev_err(dev, "check status\n");
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto free_wq;
 
 	return 0;
 
-- 
2.47.1

