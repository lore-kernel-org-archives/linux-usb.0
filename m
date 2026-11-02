Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663519;
	b=bGT4X3t/VR49pROg7C9l51uirw2tp024kQR16kyNGsn75VzRD5FQ+QhW/AIWy4CzvPCY
	 IA+2FN0lIlAbNLwgPfTa7e24pf8fcfhywlxt8Gx4DniEfP+ImJotJ8PTQDjZ8TvC8sM7Z
	 YOY//66hmyk5qzsToqMkRrGZjK3XCuQg4EzUVQdizZpZHyjM7u0PR5FG4yupHtm06l96K
	 /7Ml9/zMf5he4e89wKP/HYidzSgTjkLxMdaQ02XzOnQ1wTDFZAQdQzZ2Vz6l94MeaoSyj
	 qRffyRHmS4KTe3S7FwzKKBPr/bbJC6zYZI6JDxcEyRBF+6g+P9LKklUSw1J870YDCGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0b6CWUpDDg7nvX4yAW5I5URG5gPxBouEYD/8SJ9ABv0=;
	b=3r5OpV1scjXgXaBr9i1c0s4icnyc9Qv/Hij1IEKiYS5G7A32Rekktm6+F7305DqjpOhS
	 +VoRXVWifTfSFzC0cn1TfSVGYn4IuDgNPWHaJQH5TBJa43ccevNaqOhoxzlqVFJyA0yZ4
	 N//Ud6Nl0s5Pk4sfoqNf0RIgcxZfFUggV+WV2+rTLuOJq9swycKZdCDjawnCUcPRPE8dG
	 qWFja2W2HEglPBInRQgw5xRIYK52xeVRQSJ8qQw79tK3Zj873cHKjmH+jEPdN0lJdN/bH
	 omIj+O9l8dU42XTxKJE9cNTuoDPnvN/aJcWcpdiX2GJ6Zy9Mh5pJvja/5aRs5QRJn7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzRtkl5q;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFF606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 23:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HzRtkl5q
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22950775e9.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 15:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793663517; x=1794268317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0b6CWUpDDg7nvX4yAW5I5URG5gPxBouEYD/8SJ9ABv0=;
        b=HzRtkl5q72gjo44f57XNzxpUe0stksYOSmwi631m7w0A8oDDscBabfvEAVxKzqIDEj
         QI5zK4sFB+7uFhrWo4rL6qlJX7xIYm1To89/52v3nvOKu003plA0iINlSx/InF5eezIC
         +uVa4bbzk9pV5TzrpolsJSyE5gj0b0DeE2C0SgjrVuthVjK/CaNfRCzhiJSg4FXwgKL7
         fBnV5YSFiQDlmHBpZwvXgt4WSqKzlhSVwQMMAWa5suh8p/9kjxDit9oTOVmiziCM8HBK
         IhwJpst+KDKtFvk5ZuFucALXyqqRiIwC1CwyIq4IXzpHcgs4i1HaHpF3rEar8E3yRGBG
         WyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793663517; x=1794268317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0b6CWUpDDg7nvX4yAW5I5URG5gPxBouEYD/8SJ9ABv0=;
        b=HqiVzkQW6P9R10WiS29g4meAQ2nAjbNKDfZnpUQGpGAv76dlcPtEIyjHukPnbdDXTG
         cgtl+hXrvkrbeZ0GcNPWG1YLPC5bJl4WkSqrdCarlivTBypF/Le30a+liazhgcGLpzLv
         Vb7keOvHNwEJcJhk5lT3kiUwDWu+lKQYO6BA9YumMRQfgRyrjg0gXTuLLL6cssiNjmNP
         cekK95PGKvRo550fnOKIr+tJXT+C02NyIxXQwWvvzvkpBfcFDvjVRRJ93H4De3LaP3uN
         oYFSJVL+zINmUw9I/M+a1p2AFUlo6f4afFNrRi3yScOlrH0CegUdDLjfbcqsrgKAEeCy
         1XNA==
X-Forwarded-Encrypted: i=1; AKwUvBwKx6yDjeJGRPqdAWiUMvuvXfB9Ljdcv6PymbnJVvI0e58VVOOiowy7iJHKifiWNjDTi1NMKATTP1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsRstMl7H6gbVRtoaPgFhoR46ErKnzL9e089uVrDA4iQM28QB7
	PubtjlTSQW/kAKYeqTQfDoZMIN6wzEiKRvW62g64neMKT7hneX4MKkgR
X-Gm-Gg: AYBFou0+RxQ8k4Qym5OREeAdntarETn5beLzW80c0sL4i5q04xADO39TdVqQR99JMqY
	r5sA+wDi0kK+Dln7rDEPMumkjzcZhosXoHrACfLDQOoE6ZO87AvsIidiqMFcDZZuPd13Bw9Ucy5
	p+7NyeZkRkkpkg0TBqgoMFWtCIECUWhd3tlmbmna5Ewd/ILp5l2NiWHkGzZ0MadNQrJ+M12fNIz
	XDe1FY/Sk/HpMKpI+tIUlAkODJAcWyaQeT3HMnQg4sOSXWToXrLSw/dVXwVhF625gYB22ZFsRSH
	ACsfcZhqqgn/X+zRtFe4ITcp2lc4W9xZuPWiUs2/L1juDdP9/kSlBjHTgMXDVZe5Y316UdZ54tF
	iTE9AOPRV7uNr2/k0NBps/0JoXFc5PiysCB95FJCoRQe68NSLscsEnyJFqJbyExqHwtD/sDRU55
	BbFea+i9tvHzdMtqMxNmZdl8cHobXcK7NpVpJXlVhiOFn4V55BTde6lylgwazmzUX0NPxTtb/wm
	kaEo2tMhFDY+W66RmRulXpDJCeLXuR4FmhoDjvYFAdv+ecLP0n5dEGYBNH5ZYPc88/7I8NgdOsG
	hhGKQdLXtQAiat5EoK5S9s+VBWOiwW1hR86MAf6rwlHfN9AR1lmHXONZoRi762ZVrX7VjRqxsw=
	=
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr248989255e9.22.1793663517545;
        Mon, 02 Nov 2026 15:51:57 -0800 (PST)
Received: from fedora.fritz.box ([93.93.22.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09ad5ff8sm210203745e9.4.2026.11.02.15.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:51:57 -0800 (PST)
From: Stefano Munari <stefanomunari.sm@gmail.com>
To: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: usb: lan78xx: resume phylink on non-reset USB resume
Date: Tue,  3 Nov 2026 00:51:33 +0100
Message-ID: <20261102235133.23011-1-stefanomunari.sm@gmail.com>
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

lan78xx_suspend() calls phylink_suspend(dev->phylink, false) on an open
interface, which always stops phylink and halts the PHY. The matching
phylink_resume() is only called from lan78xx_reset_resume().
When the USB device stays powered across system sleep (e.g. s2idle) and
the USB core calls .resume instead, the link stays down until the interface
is brought down and up by hand. The ifdown triggers:

  WARNING: drivers/net/phy/phy.c:1670 at phy_stop+0x44/0xc8
  called from state HALTED

Move phylink_resume() to the end of lan78xx_resume(), which both resume
paths go through, and call it only if the resume succeeded and the
interface was open, mirroring lan78xx_suspend(). As a side effect,
lan78xx_reset_resume() no longer starts phylink on a closed interface.

Tested on a Raspberry Pi 3B+ (LAN7515) with s2idle: the link now comes
back up on its own after resume and ifdown no longer warns.

Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC management")
Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>
---
ftrace on unpatched kernel (s2idle, woken from PL011 UART IRQ):

  lan78xx_suspend <- usb_suspend_both
  phylink_suspend <- lan78xx_suspend
  phylink_stop    <- phylink_suspend
  phy_stop        <- phylink_stop
  lan78xx_resume  <- usb_resume_interface

No lan78xx_reset_resume() or phylink_resume() on the resume path.

ftrace on patched kernel:

  lan78xx_resume <- usb_resume_interface
  phylink_resume <- lan78xx_resume
  phylink_start <- lan78xx_resume
  phy_start <- lan78xx_resume

phylink_start + phy_start report lan78xx_resume as parent
since both are tail calls. On tested kernel phylink_start is tail call
optimized since with CONFIG_SFP=n sfp_upstream_start() is an empty stub.
---
 drivers/net/usb/lan78xx.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 181e8c087655..0136818e8cb0 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -5371,6 +5371,12 @@ static int lan78xx_resume(struct usb_interface *intf)
 out:
 	mutex_unlock(&dev->dev_mutex);
 
+	if (!ret && dev_open) {
+		rtnl_lock();
+		phylink_resume(dev->phylink);
+		rtnl_unlock();
+	}
+
 	return ret;
 }
 
@@ -5385,15 +5391,7 @@ static int lan78xx_reset_resume(struct usb_interface *intf)
 	if (ret < 0)
 		return ret;
 
-	ret = lan78xx_resume(intf);
-	if (ret < 0)
-		return ret;
-
-	rtnl_lock();
-	phylink_resume(dev->phylink);
-	rtnl_unlock();
-
-	return 0;
+	return lan78xx_resume(intf);
 }
 
 static const struct usb_device_id products[] = {
-- 
2.55.0

