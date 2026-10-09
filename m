Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFFC168BD
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 00:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507444; cv=none; b=eT/fwHjOdkd2Ehg7UpXVSKU4o0NTYwoshKxC0fNXjHYhCNP3xV2wf/CuOPBX4nli5M0E55XdsS+TKayqIM8sKpmg1yWVfqOxm4KMLHTSl6ILMY7jDqmJGjLCXSdea1wJsEPIvfOltMyQI5GOvILqH9WfEDs95q3sF2nlKCpmoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507444; c=relaxed/simple;
	bh=CjNYu265Gtz+X7qBnb/UogVrXDtYACULQPTjz9Jr16c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=De4JbKI26FuaUOQd3scMG/h0wDb4SeG4vuxV6k18EZ3RBGbtxElQi8TJd045Pz6uxgZTJrFrSNKpNLBcyhKOP8L33USRpUDV1rPhkl+c7yxk+byifxUYUE6SkVXAGdRxfFtASm85w5r7vXoSdzBMX9b5JV/1lqYzRJi8k3DIH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eer1K1dH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eer1K1dH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so57101835e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 17:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791507442; x=1792112242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHBweLHo3kgYXnvznsE/p6q6nh/cKN7XIUKJAQEgHHs=;
        b=Eer1K1dHzs1amf2lzjoyeub9OcdxOLBdrZhhx+0CSFKCHpVwJ5D53ztzKjmkQfKozl
         BBGEUweMGOl7Lrye6ibdBhAfzFu/OzSPGpmMPETEqYoOJI8hlM2tylvdmhq6/TjgZLPM
         RdkiwnldD/jqTGu600rqpEskDKM4aDjk68AhYdXzSTICH4+FAlavY95GRCpXhQIvi/6L
         vGMZPp98/XkN93zNVHHn5enNvS9oNLZ5+Ba9mkzpVQ1rGizxa8+pZ8vfxlx+FGilG0nQ
         iKBskNMkAjTl5/ia8h7K6ZHFOL8N6I0L+QKOMqijBZO5kftOSwiV0rjKXd9N0jnzQ/gh
         YoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507442; x=1792112242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHBweLHo3kgYXnvznsE/p6q6nh/cKN7XIUKJAQEgHHs=;
        b=lwXyQC9dTCJ3JPGmIVVacR1JDBir8Al5SqLMPsLeC7jQlMQ+lEIuzBeil6uXcSFgLh
         +IH5f9ClgK7EQ9FbByAaf9mKXCslPf9ViVT94qxvFU0Gh6JX8EXXlOT5+u99zwPUvDBk
         eylnDzsWxni+nbRBSiDt9zsOrKnXvmZ/GF6y/sdQXvmXqn7YRkDFnbpCBiRG+uD1ebjR
         ELVpCbdNeXxBODAwG3WQlIYw8geNhyXWI7l/SJO/yD7nXKARccPxdwKysOHSu3IijVoG
         D1TTd/JCqHml6wyFSR+LnD9NNQiuApKgvtxofqJ7zIEXJ3jXd8x3HKly6t2UOyimh2p4
         ookA==
X-Forwarded-Encrypted: i=1; AKwUvBx1NTSuv/uJ4PHTnOrJWMl/H5ePqtLImYM+DamhIc8sd+46IPuJ4EerpzVgrP6CUGqNrjHLlJ8zwtI=@vger.kernel.org
X-Gm-Message-State: AFuF++lpJw7yoqCDm2+Qooln58aoTGUoNJBwytQ9i6gMCxnaMdH8MMUQ
	cGXleuP1eRzSpJiPNLbHA1rLExtiV4kYueGfVIEQ0RiKNqEz+k0yInIx
X-Gm-Gg: AYBFou20aojpLYIplM7KfUsanAzXZlr9Kz/ypHr79SNOrX9N6nbXqbKD4qfkUl+1zcM
	agvYTwPtAZwpPK/MdHk4sSdl4ch9ZxtUSj7YEFJKg1X2QOQ/PsCFqGGtIAZwqOaCZzucQqmMx6f
	GItzZWoNTKUKAetA5gLDlzCd4aL2S/aAB/9VoBXmPXaDE6nr6ZWQVhyF+3JvzhLy0VQrSIQRF3F
	9dvbUV1F8DbeE4azVa4pNWwOdjn/BCg72fByOq19FMpZWbc5rK9Cz2Gh4mXy5wl0pskmxis6XLg
	yIrOoWtzvGJMbdze+R4LlnrICfbivmdkKk6GdRCkyf2/UZq9i9KRzfkpKN9XLwkbL5M684bk/9Y
	UhQDqAYsdQ0uA//CFwTkHmQ/w8maBZ3aUIdxNk3DhDXWouQhu0pnDc4dow7gp0TA/NKBulhhyHb
	XlxRFZw0s11py4xYCepHVPKAzhWDjMf7makusUeSe2wGlvbNKDfUo0NF1ezj253F2y8W7f4hSpc
	7fL/wbQbjz6gBp7Vr6wYl16EUJlSaC7JcIys8cInNfZQ4btUNHq3Q==
X-Received: by 2002:a05:600c:8b09:b0:4a1:6f78:842f with SMTP id 5b1f17b1804b1-4a18e4987b8mr4207445e9.11.1791507441595;
        Thu, 08 Oct 2026 17:57:21 -0700 (PDT)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm30700305e9.4.2026.10.08.17.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:57:21 -0700 (PDT)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: netdev@vger.kernel.org
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nisar Sayed <Nisar.Sayed@microchip.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: usb: lan78xx: reject invalid EEPROM write requests
Date: Fri,  9 Oct 2026 02:57:02 +0200
Message-ID: <20261009005702.164936-1-stefanomunari.sm@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM handling removed the -EINVAL return for invalid
EEPROM/OTP write requests. These requests now return zero from a
successful usb_autopm_get_interface() call, even though no data is
written.

Set ret to -EINVAL for invalid requests while preserving the runtime
PM reference release.

Fixes: 8a7ffeb795f8 ("lan78xx: Fix for eeprom read/write when device auto suspend")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
---
Tested on a Raspberry Pi 3 Model B+ with the onboard Ethernet
controller, using raspberrypi/linux commit bba53a117a4a on the
rpi-6.6.y branch as the baseline.

  ethtool -E eth0 magic 0 offset 0 length 1 value 0

The command succeeds without the patch and reports "Invalid argument"
with the patch applied.
---
 drivers/net/usb/lan78xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 5655941f1478..7ac263454d45 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1719,6 +1719,8 @@ static int lan78xx_ethtool_set_eeprom(struct net_device *netdev,
 		 (ee->len == 512) &&
 		 (data[0] == OTP_INDICATOR_1))
 		ret = lan78xx_write_raw_otp(dev, ee->offset, ee->len, data);
+	else
+		ret = -EINVAL;
 
 	usb_autopm_put_interface(dev->intf);
 
-- 
2.55.0

