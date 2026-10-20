Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527992;
	b=A/91CP7CQYDkLIgjgYFcddJinntoWMFg5XDSxZ61t5K0fxTVkNzKjrXJ3sRtMY9WSb2A
	 agcdZBhceZDp2STli5YmgswMj4kL9ePpU7rfg//q7QUVwKqoG17Olds/NiTa1ZxACh0N0
	 OKndgtq5GGZayZA+ZEKgaHHq1wsMi4SKyHAKJiMedj9lbUfkXtnTV/+okRKHQVWQX/jcd
	 RfGOWqjfqnkW6Dn4taTU4nSY4SmayPlNRUhTiqtfEUnWd8woxD0Kc2HsoqVdu2YisTxZp
	 NEStyl8ZqAWEGxr6XWsuKIYzO7/QfYFB/0fvmiQ/Jg5idtqBDcVenFgKpZBpFkh4MFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
	b=Lv+Do8rvCgWgOJHfX4z/nD1AdjWzpIViH5nmDZPZi6R5P9HeDF1wx6Aw88O81xEcNZ9i
	 WHnfZDnPnOZ2cUwgj5a7NUW32HecqrG6i8z8LhCWjTbe9qgvh781XZCQOI2vw65+vLowE
	 rzfgNvCOVXAbZ8S5sHRDKqGOB3HkUb6t4+ezUA28+11m/mdzmPySM6AkIWiJHY3Y8EPNU
	 IvKRW+Fd2k66hPZx1b3deUMmFW0od4Ie7hCMEDt16S7DERB4IXUAd1dfEwJjGRI/02/9v
	 FM+MoytHzjkEiwQaiZtQk+I2oMkvYuYl8Ctevkx80E1aAg8qJA+q21wWrxphymnVMjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDUhniMC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B937606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 20:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B937606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDUhniMC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so59435e9.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792527990; x=1793132790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
        b=bDUhniMCk9VaZC4P1e4MZBeS6+Mf8v0Sfn6gz2lsOALe/xTYJoG+zRD7x2K1Tx3y0c
         DBi8h+nl+wyqK0cPe3qZ7MdZ/zOiAY28657CYzVbqx6qF7LD1nzMsW+f+OkXQX9OvOF3
         ZDJdyqZn85WM4iAcmESXI6neuaweZObtgil420tlRBF0GdqIAkTxWXbpVi1oWVRWv3z0
         iUPjDYf2oPi9Q+jaVczM/Fj90W2Sgt9kfyRZQ2TVFd6hoSx/wxdZ+xV+cZlnsvncliyH
         57pN6grjm1VMgQJKPYecqVj1eRSVjItnQtayxZiKxmFwhM/rZecOCkCahPUgzhMAZuFQ
         WZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527990; x=1793132790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rjUyibfg+Fb7pOHgHKUgkDL1wyDBRIdMXVrklMIh2M=;
        b=c0JbTBJ5Em1ueebfyhziyw5ThF8GR6pWdIQUYvp7wcF+mQvctg/UgRD2TaqCsYBGDh
         mYVjf5/aPeen6kBxx6pMO3yBPKcsWtowz7KGPwQjnZE2BQR1KUnvYAXxpiWZDuJF715K
         IdgK/bAt2itmikWcN3sMKDEz1/vHeTTw7wZGz9xREugN1uSGzcrOu7ab1g8ha828S4/9
         NNzHanXqCLL+Sn6ysOugVGYNgTUGAr7+ZFo0loLbrBAVMctRxp1KGZqriaZf6TdlbgJK
         Wbl2BzdgEyCj1s2871RUjgRbpInxP6rrYL5mNOh+jZx+NnvzXMTyptVQ7Nek4hiXw7kB
         67NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmpxWn1x2KpTUtj3q8Db79rswjCR+L4aUhTv9iNbQnuoYF2O7qwusNue2VS0I9PCpIn3OhvKLhJGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFoXJjlpP0hS1psuddWfB+UjESdXWzvNzfpLx7Z4H0Pbjm7YwD
	vz6D8D9pSCNJEzd1o7CLl7bqMQkgGTR1AK+jWWcDIrnPv9Pc7oIZ5ZzwgiGrJr6L
X-Gm-Gg: AYBFou2V1WalWYK8BGzt2Uh0GlWym6cOSxEdGIZ0DMqOa+icCeTCU/GpEuHNtIZj/7o
	UxPxrsb1MmrzwIro+G/Vmht/oOfra+rxRaOTh6pxZT29xNtiflGcGLuDlhTBZKeHPHO9MSHDM2z
	OhT9Uffle4P37hXHTcTIkCh+SRjzrhj59kTjY0WweCOgHnz0YCWRCGObQSczU4gZOVDyfoQOv3A
	sgV+INcpOzeRkEsExfIdED3XZEefRlhqpV6c77eidQk+QBXEKcLMQNbcBJfOC3Qfmm+G86UMM8p
	Io4xQsXW2jzlM4Ejkq7mIbgw8Wh8Et4Gvg1n+SNPpZST4aIkJhFhP1QOyPeogbCNKKgKEapuRxE
	tdaF+CfenyLIIbhSuQRfpmCTKE81ULMUpuvWRE9DE+D1ygSn8x/AMItUELgdnGrL0v4wzO+JCBz
	2syH4Pc9hkPOAq9FmuR/+Ha4+EbDy93IaP1MoxEQv0hCVC7lB+zmGI9Kv7h7tG0h7Fh7g+HIM7A
	fzh+lJ8xcfLt3am7wzbu5sL0y6InZ1AQYNUsToMM9o=
X-Received: by 2002:a05:600c:3f06:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a1d760f7b9mr257835365e9.25.1792527989648;
        Tue, 20 Oct 2026 13:26:29 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm104991895e9.12.2026.10.20.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:26:29 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: usb: lan78xx: fix error handling in lan78xx_open()
Date: Tue, 20 Oct 2026 22:26:14 +0200
Message-ID: <20261020202614.30277-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPEN
set. A subsequent open enables NAPI again, triggering BUG_ON() in
napi_enable().

Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.

Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
With the fix, the injected allocation failure returns -ENOMEM and a
subsequent open succeeds. Verified connectivity with ping and SSH.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Changes in v2:
- Move cleanup code in err_napi unwind label as suggested by Nicolai.
- Add Nicolai's Reviewed-by tag.

v1: https://lore.kernel.org/netdev/20261016000521.92868-1-stefanomunari.sm@gmail.com
---
 drivers/net/usb/lan78xx.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..2fd1fd0cd565 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -3484,17 +3484,20 @@ static int lan78xx_open(struct net_device *net)
 		if (ret < 0) {
 			netif_err(dev, ifup, dev->net,
 				  "intr submit %d\n", ret);
-			goto done;
+			goto err_napi;
 		}
 	}
 
 	phylink_start(dev->phylink);
-
-done:
 	mutex_unlock(&dev->dev_mutex);
 
-	if (ret < 0)
-		usb_autopm_put_interface(dev->intf);
+	return 0;
+
+err_napi:
+	clear_bit(EVENT_DEV_OPEN, &dev->flags);
+	napi_disable(&dev->napi);
+	mutex_unlock(&dev->dev_mutex);
+	usb_autopm_put_interface(dev->intf);
 
 	return ret;
 }
-- 
2.55.0

