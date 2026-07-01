Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B81C403AF2
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908194; cv=none; b=mLbHN8u4D6g1iUf4NL6Nrw9TgTFNQAmgzAzIkiXq7COqPn2Yw83YdcDN/P4TZmkaNxLjFggRY4DtuQC1yIUC1rdv9Rb1/Bo61mcEISYE4ZrJhX10WaPXgh0TWhOXt63/DWwEEUsUIb1fpYJCey7c1suHYTBL91QyRCuJM7qi2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908194; c=relaxed/simple;
	bh=obE/b2q8qcrlt5PUa6k2aHlJSkiqEXB5r2KcjRfVFPk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IbJp0qyx4YXNkAC6dK0gI9kKg3cUrE3OYS8ODWXHMahOlkMtHNad1Hbx/vUJaYZ3ttdIqpv4gyFE+r7ElRwIk9a71EGHT6zd31tAEHb/hq3iafcVCJQJC6wdiKKnXkM6hrHi2C4afRz9Nxby1XkInZGeFoteRniJhvHBcrZOUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apv7xM2d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apv7xM2d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9b42be8feso5206295ad.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782908192; x=1783512992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FefiUA1QiWl4Hiij9NEBlfC5wi8+6dRKuxnJt8tS554=;
        b=apv7xM2dU7EBm+eJRqWpFpYF+fgLZGFwbVw/lY9T8kxfSNfz26SPJ6J/0+4nfEndcd
         Axv0Y7mvdQSXZN69HPfpXeg86hoBPIlrAnz88vaxjzWG9R9ug4r1Mfy70LW1+jfK3onA
         onCbd493GSrsnLlGNWdoeqjRDkw0u1TFPk3HyHYAVULEBdRQRR9j4tjC+E19e+PZnEjw
         nK+SgcDaFO8iJsQBIIt+IiaseKGuIN925ANtdvfigCaWFmaQ1qePZqKH5dyoD8n9xaF0
         u1LBGzp14zhmUTIb0wPT2njm5SazFU21M2jlYOy5//TYfAXuDYeo7z+qlBbmPa+3L7zt
         oQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908192; x=1783512992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FefiUA1QiWl4Hiij9NEBlfC5wi8+6dRKuxnJt8tS554=;
        b=c9QbxNlEP2PX/28iZGeG1gjqF7bUT5VN2mSd9QPbFIhB+1tWtEGQBpo1oI8s6L8hXt
         MXA33nHApbm/ncMFoe9bkc/VzhhwOVBTLSWZt+YaMMy1uz+QCwk+xUW2+3DiDxaSXj1N
         W7psagf1OAOap9DhybJ4Xfq3HX10EO0vp644BevKJTk1t7nLLmZ2HbCGn85PCcZhx72F
         06DlLiHiOlgXuOuW7hCxHLB8eJTQfTe6cY7wfY0nzRGR1IiPVOwUSY8gjKte+jvK4x0A
         HQ7pC6pQLRe2KqOM860BVVDc+iHA1j2pEzV2Tthh4pj+vWlmPpxn0yQscJIhOTzfnBZu
         rU8Q==
X-Gm-Message-State: AOJu0Yy+ohRop6vtU8Md0gXB18KDWbRzNXrJK8JracMYGIGXoERcdEyO
	l/oR2XZBpEFadFFyuaOde3MpVUa+Y9XilKfprIgga7J0bHWt7vkiHc8=
X-Gm-Gg: AfdE7cnCWT1OJLdY+LrWEUkbxOlqLSujGe3DNnULwkCCh+vXaDe3ob0ZPK3apJeixLo
	3601gNk5a2ou0KOyc+gg/IqGkV99BTDvKPK8jKHCth+hqNtOJWEQwcTYJX2wNYWg5JKfF70A2+b
	LjqSlu6H7jWpioYSFLePOPAAM4nNdrni6zVkczWzEomUgShr4EahqhEnFgvLT2NugloX/oToGI9
	DfrmaYB57hm/IrmolRcKCDtKhleyWdz+hajaIw/m79fFWTW58NcXEt5fbQTf7CYfMBCWnohzfXL
	/FJqnLDPqC4Aynn2pGdMfdebK3fFmPBTxu13Sgc4RtNJJizKbAVbDpGfInOuOseIiOKDV0nXck/
	h0LVXBkQz1QPd6d+/3g1LgDj+k9b4VzvlXkwkj+3D55ajeg+njLjzc0E/1TSebOhQ9hIBqLt4S2
	EUoUAb2AKS+fUBg2yG32pPxXbfreHxqYJV2C7qjRZ4QJHBhxB81+u1kGJ/mfNpGMIlWgTmrL2Um
	c5z1xqEG6kJs7UtrjbV+lgWfBEjWU1Zuk3/t/FH7KfvMMTTjw==
X-Received: by 2002:a17:902:e851:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2ca7e7579a1mr15832145ad.22.1782908192336;
        Wed, 01 Jul 2026 05:16:32 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c2e8sm31114115ad.43.2026.07.01.05.16.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 01 Jul 2026 05:16:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: sl811-hcd: disable controller wakeup on remove
Date: Wed,  1 Jul 2026 21:16:25 +0900
Message-Id: <20260701121625.96815-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sl811h_probe() enables the HCD controller device as a wakeup source after
usb_add_hcd() succeeds, but sl811h_remove() removes the HCD and releases
the driver resources without disabling that wakeup source.

Disable controller wakeup after usb_remove_hcd() and before usb_put_hcd()
so the wakeup source object is detached while the controller device pointer
is still available.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3c9740a117d4 ("usb: hcd: move controller wakeup setting initialization to individual driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/sl811-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 4ae47edd4b8b..b044977f6f56 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1591,6 +1591,7 @@ sl811h_remove(struct platform_device *dev)
 
 	remove_debug_file(sl811);
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	/* some platforms may use IORESOURCE_IO */
 	res = platform_get_resource(dev, IORESOURCE_MEM, 1);
-- 
2.47.1

