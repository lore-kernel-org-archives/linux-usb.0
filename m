Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36E7E0E4
	for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173020; cv=none; b=c7Y6MGCMzIrlSmUiYeJMnTYw+ykFY8/g41SLm7cj4Xa9y96jxIyw/3J7kDw6y0mm0wjjBdgsdOWJ4dAKBLmjx2/fVlybtwZALjk4GSuXPj0nu0SmuMhWj9ws/NPieKGXabHwLIwtYU/FjKQRnygud3aY0UkZ7y9K2Qq1S7OaU+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173020; c=relaxed/simple;
	bh=Os5vXeijPOACtMf6ldU4PKq2AIjdi1dyq9Aw5PTVWzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TO3kFqGm1tJfEXWEcls1XpY3VXl92kMOs4wDPEZw+Gnc9UweRWlI+K4TqZ+oCrsOhMj1uIpZZLufjI3/8YhNb1O3cqRLJkXMRL0KjA/N5I7wXHmV2Q86QAezsdOIquDxlLgCkO1jI+ENqKXLY6U6DMrv9P8qszhEFGD0FgVNPcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQw9nckI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQw9nckI"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so1592180e87.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787173017; x=1787777817; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Ck5M2RQV75FIAXCjiKnVQG4eMmlUO09dKla/af+mCc=;
        b=AQw9nckIsr0TnqmZlB7r7xnPINe68XmfVfwl0uRmluxIzLDnddHizvFdRYJJUHt0Zr
         srZvBP6RPoliLnuKLruJ2mURWa/g0jsr7dqKq9jUJye3hpM71UI/IRT8+SGuyy6BizLE
         yhP9L//fULrRNVLPWPzRrhF+VYywQ3V837KwpZSPAXUk+MlMedB83Ckzc2qdvO/HRGez
         00kciY5lWpmR7KfBc7rsOPM7L5vGeP49iWcTMhqWdhuB6cpNmuQPXVlJj0CWQjAgYI7z
         WPbMT5GNRRHIysRORm0ETVyhb7Icvctb/sfq12ibpxxFlCEq2qu45CkDnipFdkYkIKvM
         JWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173017; x=1787777817;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8Ck5M2RQV75FIAXCjiKnVQG4eMmlUO09dKla/af+mCc=;
        b=PFOiIR6nJQC2aFLHlJMzI8a6miGXaLo79b8gAJEXW6i6PKfv9OTO2FNeDdPtNKWkJg
         o/XRd7ICVo4DE8ohfdATNHPnPs8g4tBGod21AjVFfx9mc/gT/QlVYHsiFJLdrorMFDzf
         CF7PMsCW0DbwwB6FDM9pLMq1ByHIFh/1IKYbOL232tGQKEGfudp7KWFuYADaiomFjoz2
         RTzzSJxURuCv7YS12jS7NmnoGi68WuOJ1kYXiXbzDhtQzf7/B2UiUa3QXL9ks2npMdhM
         gusVaCFZxqYLLJM6gN19PUAO+hxgDPd38qsdIgJG9w7w72M1fUEDGHM92hw28ws0IhMM
         0O8A==
X-Gm-Message-State: AOJu0Yx6TFD7LpkhTQuZS2FpiIhowEs2UAhsGOx7JEahRhievW75+wmv
	ntf4G8AyU8qa5ZnBiXuZU8S0MV97HS3BHXLPo2ZZphELo5uFtL6rj3y+6H84jg==
X-Gm-Gg: AR+sD10uUXeSHBHht/C9wjCa2SM6g/EayjxoiDSAGnOmwh28ATHwcvWyAZmV/BLa6YR
	8EctKp4W4/zSAQme2NUlRiwFw0QtCBHojc6PNygc+cjPBkTCjNLrbHo9HEDpK4GZBrUSdVv99Q6
	AyaDv8jMQjisYLVtDPtQhjzjFagfWKxH2k+of8QSNeEyVZrLDdzIr+z2W0UsIt9QilfujtmKQ8y
	/vU9ypq7HasCtt7fnaX67Kr9TxUSM3/hodvJL3jyOOU9aEf8HoY05AZWSim1ZqWf8eGml9kPJCY
	pApSzxEVSnIWsD6GDpzSJ67SmzIQ984EC6J4GVqS0kEXvpTAr/GoXnISN6FyC1z1U8BUY3KhDfe
	s9TvE6vQUA1Z2NDsK5rMFIfW4sk54hKqO4jBDvhnBRT58ayQy/bcsF7xPl+MHJkIp0JYiDJq6zf
	0CGqst4enOp4fnGWOmbnJW4sBlQna7Chcw7lphRWfq6+2vjVcO9O63M+SPjgqKWdHNpNm23k3BM
	UWH8VVW
X-Received: by 2002:a05:6512:10c3:b0:5b0:eda:de26 with SMTP id 2adb3069b0e04-5b478bcae85mr3036505e87.16.1787173016494;
        Wed, 19 Aug 2026 13:56:56 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788dafe5sm768509e87.52.2026.08.19.13.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:56:55 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Wed, 19 Aug 2026 23:56:47 +0300
Subject: [PATCH] usb: gadget: u_ether: replace memcpy() with
 ether_addr_copy() for MAC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-gether_copy_ether_addr-v1-1-18a12e0175f1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqEMBCE4atIrw0kWUjwKsMgeZTas1DpOKKId
 5+M7upb1H9ShjAytdVJgo0zz1OBqSuKo58GKE7FZLVttDNODVhHSBfn5eie6VMSBdP7pIM1Lmg
 q50XQ836HX+/H+Rs+iOu/Rtf1A/AD2WN6AAAA
X-Change-ID: 20260818-gether_copy_ether_addr-e1fad0b218b0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787173015; l=1935;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Os5vXeijPOACtMf6ldU4PKq2AIjdi1dyq9Aw5PTVWzY=;
 b=Wa9t8EE+udfQ8SzjILOiXamB3qmrDWVicNE8WPFE/Q6v/U39fWZsLBm3CD3So6UkhEC+mDZTp
 XPKN/r51v6NBXT9htXvTgzW3qn8iGTcQowd5W/1UBLstYBGe3w95FUs
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

There is a function for copying a MAC address buffer in
include/linux/etherdevice.h, so use it instead of memcpy().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/usb/gadget/function/u_ether.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 59d85d6a84a8..62f95de03f32 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -779,7 +779,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
 			"using random %s ethernet address\n", "host");
 
 	if (ethaddr)
-		memcpy(ethaddr, dev->host_mac, ETH_ALEN);
+		ether_addr_copy(ethaddr, dev->host_mac);
 
 	net->netdev_ops = &eth_netdev_ops;
 
@@ -929,7 +929,7 @@ int gether_set_dev_addr(struct net_device *net, const char *dev_addr)
 	dev = netdev_priv(net);
 	if (get_ether_addr(dev_addr, new_addr))
 		return -EINVAL;
-	memcpy(dev->dev_mac, new_addr, ETH_ALEN);
+	ether_addr_copy(dev->dev_mac, new_addr);
 	net->addr_assign_type = NET_ADDR_SET;
 	return 0;
 }
@@ -959,7 +959,7 @@ int gether_set_host_addr(struct net_device *net, const char *host_addr)
 	dev = netdev_priv(net);
 	if (get_ether_addr(host_addr, new_addr))
 		return -EINVAL;
-	memcpy(dev->host_mac, new_addr, ETH_ALEN);
+	ether_addr_copy(dev->host_mac, new_addr);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gether_set_host_addr);
@@ -1001,7 +1001,7 @@ void gether_get_host_addr_u8(struct net_device *net, u8 host_mac[ETH_ALEN])
 	struct eth_dev *dev;
 
 	dev = netdev_priv(net);
-	memcpy(host_mac, dev->host_mac, ETH_ALEN);
+	ether_addr_copy(host_mac, dev->host_mac);
 }
 EXPORT_SYMBOL_GPL(gether_get_host_addr_u8);
 

---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260818-gether_copy_ether_addr-e1fad0b218b0

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

