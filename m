Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76F23C50A
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770615018; cv=none; b=Iksr7YRFWoCtHSQCQYUe5FwN8zZVvZlGyytS7rTAPxpF5NRjmY7VZjp+XkkJRyRMmSWk09jAJ7Zj2guHZ+o/CnEKCOUy1KZttQJuEPnuqqI+hhxXtv+1y/WrNaCa7Kica3Ro+GCozVGibe2qO1iaPr9gpQQSV/cEDZFhYZ+TiOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770615018; c=relaxed/simple;
	bh=90MB2j4CgmVye0Z+2xbcqnupOoDkQTzlkenxahCSWw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dXLoL5SybZ/4yVebTFZFCamkcn9BaEmft3AKR5boiNM5p+wrph6gv33BWmB2eVMSp58usyMQauMFiq9aAVM6FsCMS/LGjQ3TG/SC5S9s03yVw83MYEHO5OjxcmSJGSK9De/UCxhFpJGhw6Bbx7DNUsPPvrwgJD8ChhX0gWoRbqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=CYllLlqH; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="CYllLlqH"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5029901389dso31831221cf.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 21:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770615017; x=1771219817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N61Q8cV41adr4A+NhJ034xStLnkhNVlJ60mnC0rmS0I=;
        b=CYllLlqHU0F76Bp5u1HsU9g65VdG0IkzCFGqJ2P9eEFBEiFnC2V0qf7g0R1r0QPEkv
         9gfDWiEyNhHSLRFgReVkFE2v6smHaqcGRlOv+bsxlGf0IRl49G7gE+cHgZA3iolSBS+3
         PEgfl4yJNvbrOtlUmWkfm1Vxv9TsGyKtgwktTFU6/gVfMAnZ+QiinbyPEBNC94ohIHve
         0HCwCHJcRIalShPO3GAB/lBvQxw4HkA0s7YjX+/hyaeH+b72PfH7+C/ySncFF6GR0cJV
         xxo5FiC60bcfbyVKE3KOZqo4QWM6FjRtz6if317ERdPelFhJZTjBUqLYIcVqzd/C3xHL
         sDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770615017; x=1771219817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N61Q8cV41adr4A+NhJ034xStLnkhNVlJ60mnC0rmS0I=;
        b=LgH6gA9zFjMc8mOkdQfLsDG5o75ca3IsVBv98rdhEzl40ccWPZ8YTYo8DzpvYF1Tk6
         RCnwyT/uqhy6136P20OolimM4AIpIVSFdIi6brHl7mR9+KBHqtjn2N9xIz1/EnHgrL8c
         PnFduC+n67juBJwndY8t6ZhCIVi56CHrA8qqiVKGpw8q+0guqzXZjfePRJEpl1Yy9HcN
         d0l+PKoT3XnpPcS9hcZmv4reZA5uBM79OKBoHhF4wl8KaOhzZn67kb6wxCFGpO/CQRO6
         u6OYI8uI0dnOm2h/orQ40aTW6ruKJV7WRvLxhwEzpwPtzCsKP6DQFFK8bEaeaP4GilEl
         P9+w==
X-Gm-Message-State: AOJu0YxKT8MuHkfy908CFFt+4tkJSsvROOdm6jO7mqwPC5zg/L2ePquB
	hXqLsnbRkKmIIIF0qe9JloHSHBCUum6kKXqvdIIN1UX2SXuhUVs02IQNvwoYtw3zMZI=
X-Gm-Gg: AZuq6aIKcDKtAaFCW1rDvzcMUtauwx2yh7T6zAiUIdBxcTZ9dYAwMxzdNL+V04JH8YL
	FWchArwTdWUpWaMvllPwxs1EpLe2QKWDR4OPNzcYIFFFWw8CO3aXO5x80XyRIjyNCEVykeaEkGt
	YI5HD0NFZU/6FRlJTEGmuxp40NHzuBJFC9PSwzrAh3y6kI7oB2k94VPxoHt14aL6N7s3QsXgUAg
	SOG6r7jzOdEXa7AM+8f+nbwK9RD6YQJA7CY9y5V6ExMPfzMKhZlPE3L6VJ3OwVktpPX1JMr2mc1
	RcVUWnQ4lhIjdcAG+UnZQLVw7hfErsKa5KvqjSQSoNqU5jWQabvUFVRzOOLPORbs/ST0Z0S3ygo
	VLVPYK50OGAuipQFq17gL43jgR4q5EX+IkXMWf8cGaKJr6zmROrOV7F7fl4cS6GMl4F9bfX6wam
	M4TpeAv3k2xhym/BdqVFua4VizfUlferR7cVqmMO/rmxqcYO1hVrYBTV5cV7DKNUPJO0e0qff2u
	ohUbt/DmSwG+h+/ZBxT5feuSR7CW0w=
X-Received: by 2002:a05:622a:13d0:b0:501:498e:5c29 with SMTP id d75a77b69052e-506399f5ed5mr134423481cf.59.1770615017536;
        Sun, 08 Feb 2026 21:30:17 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50639171cd0sm69343471cf.13.2026.02.08.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 21:30:17 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
Date: Mon,  9 Feb 2026 05:30:13 +0000
Message-Id: <20260209053013.1701134-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kaweth_set_rx_mode(), the ndo_set_rx_mode callback, calls
netif_stop_queue() and netif_wake_queue(). These are TX queue flow
control functions unrelated to RX multicast configuration.

The premature netif_wake_queue() can re-enable TX while tx_urb is still
in-flight, leading to a double usb_submit_urb() on the same URB:

kaweth_start_xmit() {
    netif_stop_queue();
    usb_submit_urb(kaweth->tx_urb);
}

kaweth_set_rx_mode() {
    netif_stop_queue();
    netif_wake_queue();             // wakes TX queue before URB is done
}

kaweth_start_xmit() {
    netif_stop_queue();
    usb_submit_urb(kaweth->tx_urb); // URB submitted while active
}

This triggers the WARN in usb_submit_urb():

  "URB submitted while active"

This is a similar class of bug fixed in rtl8150 by 
commit 958baf5eaee3 ("net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast")

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/net/usb/kaweth.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/usb/kaweth.c b/drivers/net/usb/kaweth.c
index c9efb7df892e..406d1bd070fa 100644
--- a/drivers/net/usb/kaweth.c
+++ b/drivers/net/usb/kaweth.c
@@ -765,8 +765,6 @@ static void kaweth_set_rx_mode(struct net_device *net)
 
 	netdev_dbg(net, "Setting Rx mode to %d\n", packet_filter_bitmap);
 
-	netif_stop_queue(net);
-
 	if (net->flags & IFF_PROMISC) {
 		packet_filter_bitmap |= KAWETH_PACKET_FILTER_PROMISCUOUS;
 	}
@@ -775,7 +773,6 @@ static void kaweth_set_rx_mode(struct net_device *net)
 	}
 
 	kaweth->packet_filter_bitmap = packet_filter_bitmap;
-	netif_wake_queue(net);
 }
 
 /****************************************************************
-- 
2.34.1

