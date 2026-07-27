Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03742DA2E
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 16:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171288; cv=none; b=FvLSdt0n2TtG7XaBJPgT4icO48v1OHzoMPlzzpmuIcHhKjzjZIMpLzx5UXntgNIx8ocSqjY9qr0ftejgXv8m6o40MuKFgtniGRTnBAARprxMwDrsBoRbEYzcOgXeGCiqnfpzGtYVOG2Z1r1RjaG6anu8nnjOsyyd+DQswoNQfs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171288; c=relaxed/simple;
	bh=D6YBInlF+BCni9SV7D6+sEf9YYOna4s7Kuxpqvd6N/o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dazZVLDkDdvJfOEhy5JBf7u58raRgTEgm+si0dVzqjPAh/s5Gy4iNDNuU5ETSx/4wv7fXNXqIz4coaax/iVFZOlGxl8UhcxYvKlbK4xv5sbyXs8ec1NYIeBDXMD4CUIBpkyui9anGiD2J8I0984Qpwn+8UfZaSv/P0/HvEYSH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U/Pr1yu7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U/Pr1yu7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f6de72faso783145e9.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785171283; x=1785776083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7m5xbkL5+ZlX3CMxUIn+D1M7ggaj5CbKvZ8y1jT79E8=;
        b=U/Pr1yu7hhAq8Y25lccP98EJiUSWoxu2FQkMPrWzbjJQRYwP5nKVGBkVTvFBXrjV9v
         p1aqBk2hSzc7sfeLbsCuxGSjTBBxYdfjijea7059chRmOc7HEDS0plII/qeUWJzP9T2/
         qWIaB8ef010/cGD+wvbyhd8yd/sq+XnaWGFO2Lb5PNPObvdCDpZv5FxowCEj1JtDhM2A
         Qdx8hEKGOB1775ODjfK8NyBClOMb4KyaexLAepRB4k9h1FTjOgaMThQoxutZ1ppujt5r
         SSedvFTtAB49dASJaIs9suRTOXJVW9flbGUGyUnNBatW1sJK0mLEwtChLMvIZYJjip3m
         RGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785171283; x=1785776083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7m5xbkL5+ZlX3CMxUIn+D1M7ggaj5CbKvZ8y1jT79E8=;
        b=BhSEwWpExNmwCuSjsveYi2kGyNXcnSbmv7E0/PXP/yPF2CZLxd3e9IZCFCjMQxFQF3
         2UIR0WCDs30KCz8CdSnNLsCJs6YyBnkK2L7anzTp6wzHswtksuT54yFX61Jg+pfVVbtn
         BE0ZZuq3dt+IvsQoq0BZtq25a0ejgWYPXuI7TWiESM1AAQzH/KjJjSccq2BiBHrkN0Fh
         qXgkfX/iOoobtzS0jLoPaAWj9zjHF3VJth5twyX1n7m20YmnQWEm6+cmhhUk2TnDoyUA
         B/XI06WNuP3JWobjsd6/KDr0DCgi30MT1yxv6SyWJYXkOw1V3O+YNpxGT9enp0D9NdxY
         vzhw==
X-Forwarded-Encrypted: i=1; AHgh+RrUgOGXjXePEXa98hWvlnaEjve6UCyYwJaER+vHdkqulB9/IioMu1xh4hLbW3aEqEk0iC4kU3p6Oco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJv9VJHLxjZO7X8oQ7vZUEIt85iOu6l6ZMSzr1VKir5RfF8t9p
	4fkbkI6V0Zt4azkZjlsiPk9sXupFBYD8vI8s0UUmCnsZ0z+mSTHgfz94oPf7a+fC6Ho=
X-Gm-Gg: AR+sD12+/uUTuWjoSAwzCmZG3npgjFipY+BG1kdtzh8coGgbUsluj1sLflSuoBCSiEW
	0vpUTEGdE+JXs5U5lD9QvNr2YO6BYHoSgIX8tg1Qz+IRyx/jVlMuKMQPZzbSSGj13/zGaNnT1Uf
	VxgMkmsJWnFz/FcT0VxoNW3SHMOAaS6cBw/2pbxf9cZs02Wl4Bh5pyljodrmRUcZwGoVJBuSO4P
	gUEbb3lUaDg4eAMFy14PJfPKgFbnN30AuNUzDfeLA+flRsx0xpAGapPHv8q4MswwUnXyerHRfI9
	j000inQWSZtWLraMYOrGUvXrUYRNGYItxst7NuW+QDqudAMzQ6RMMNLcXCfBMYS7FOXmMwhiPjO
	cYWNQ+DVj3F8hmye2f8POdipcH0r1y/w4q23vUTx20LKC2+s5QeBajCqv8eIZfY2sc9sFF/Vggj
	7mHI0FE27SuwaXAW2HLALQgxp3Zk9bEE1p+0H0uf8U+hkN7PkyBv823/1dwBXgEgknVkf2nIqUR
	+1hubjk1OGAGztt
X-Received: by 2002:a05:600c:6090:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-496c46395e8mr4733315e9.1.1785171283248;
        Mon, 27 Jul 2026 09:54:43 -0700 (PDT)
Received: from localhost (mob-176-247-22-136.net.vodafone.it. [176.247.22.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a9451sm6837215e9.1.2026.07.27.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:54:43 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Kees Cook <kees@kernel.org>,
	raub camaioni <raubcameo@gmail.com>,
	Sonali Pradhan <sonalipradhan@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_ncm: Restart timer when eth_start_xmit() fails
Date: Mon, 27 Jul 2026 18:54:41 +0200
Message-Id: <20260727165441.1969927-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=flavra@baylibre.com; h=from:subject; bh=D6YBInlF+BCni9SV7D6+sEf9YYOna4s7Kuxpqvd6N/o=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBqZ4yhZel61Oe+41L4WxGM6DlwzgqArwmoelJcm KWZobJL16mJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCameMoQAKCRDt8TtzzpQ2 X2MwC/0a8rxRlvBJYDq8JcggQG30XnTneY1WzRjSvkCaQ81/O0XFm8xH+7OY1FMrQqMCHbSYi+d LNYv9TUsKrGHWSP8oBkfv6DycVafRnPR7206WTmpFrXk4wYDzkLH2A1unaRpjUPUoZqoncwjc9J n9Xk84A8Di4EoFxQLSZM5J6JzZhZKiUbwHODIA8TrpS8oJ3YuIm2GiuRte/D1dQsB3um6v4sU8C fXbKmshNvKq6DHsHf7UCWbpupY146AhBwVKvfkkU98ljPqec6pLtBmi4rfdk+/nQGkipPPYBvT4 zBmxrz33O7jzsSDTHGQupM6TcIdj8D251Rjfyz9E04WoIzOcA3nbUAsk6EicuGi4YE38dbUsqUG sU395bvVX/9cGKJ4gBSTQBY7GAK/fOpbYTyRWySAZxS62+S01UQ7dhWeVh8gSYQeYjtXicvWnlM 528XGK8tPHedoApGWSCrtw1J9jxMQESTQBTDUACILAdY5Gy3yyhTqHY44Vj3azjxp/dGs=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

The ncm_tx_timeout() function is run by a timer when unsent data has been
sitting for some time in the NCM driver waiting for more data to be pushed
by the ethernet gadget driver, and calls eth_start_xmit() to trigger a
flush of the unsent data. If there is no available struct usb_request
(which can happen when there is sustained network traffic from the gadget
device to the USB host), the unsent data is not flushed, and remains there
until enough new data has been pushed by the ethernet gadget driver to fill
a USB packet. This can cause outgoing network traffic to stall for several
seconds, during which the gadget device appears unresponsive to the host.

Fix this issue by restarting the ncm_tx_timeout() timer if there is no
available struct usb_request.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/usb/gadget/function/f_ncm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 64eabda2f546..fd84086473d7 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1158,7 +1158,8 @@ static enum hrtimer_restart ncm_tx_timeout(struct hrtimer *data)
 		 *
 		 * This will call directly into u_ether's eth_start_xmit()
 		 */
-		netdev->netdev_ops->ndo_start_xmit(NULL, netdev);
+		if (netdev->netdev_ops->ndo_start_xmit(NULL, netdev) == NETDEV_TX_BUSY)
+			return HRTIMER_RESTART;
 	}
 	return HRTIMER_NORESTART;
 }
-- 
2.39.5

