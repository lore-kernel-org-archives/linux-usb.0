Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360530;
	b=rJaA1QuLMIcY4BR8SHtEIMWzX7cSEdUEjemnx8jRQTkJt475a/FbzloF073NTbI1P8M4
	 TqUqItDg79gdwlcf+01YMgO0k+64EjQcn8PW89mA2JC16GBIpLHeuCJrhzt7BgwpV9sO2
	 il+dZLMREWW1IUdKEZ7vbBP3DjTFsxiuf1mAlTbarhUWZWUMWCZ/jApc1xiF+ZVALWnGf
	 ScffISeev4agRgNphFT+yHBCfmfi3h0ZJiqbwPG1jYQ7ej21+Al6Hy+ZXvIo+5CmZGs//
	 e1P43uLmBdxA/VhGVaYYJtax7oMefIRLpG0kV5F4aHc4wFTq3d//KY5cu6Oo8Oy9ISA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=u3VsFQ8Dfp+icf8C/mk3mu7oWtV5E8PN264bZ4iLizc=;
	b=0PEJU6mYICTu4yhveBNhXECddO7NOuuEKrFdMCCtuhIqUi+6oG2Q0nxYuxny4ZRswHEg
	 LiP0kTECWVleptjfuC85KrsMWv7Hm8AY9/3DO7xA64oKy1AV6jC8GyyaOYDD9IvFZyc7r
	 hHgwdHUfn8w0mJOZgOQ++2LGIFgw+iVQsswxEume4gLkl4Vh2b9J0jwKaEUIVW7imLNNV
	 pZZrbglVEpuPnKRbhME3OVbNtHDL5tjmH42XQX/l06AGOXpaiUIIbyDIMZYwMoQQgab3P
	 iuToLoGLAamtp/fGUrOtmkkcEOxa61/w/2e7jAhP98NLA5zt7Ba+zZceUAT5zY+ySVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cZ/X8bCr";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52253606A32C
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 15:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52253606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZ/X8bCr
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso431565a12.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795360530; x=1795965330; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3VsFQ8Dfp+icf8C/mk3mu7oWtV5E8PN264bZ4iLizc=;
        b=cZ/X8bCrlk870SlIln+ZJo01qQBcwBiGoTX9jAjf57QOUFlpIfnbjppdjR58fSGhgu
         azEQ4EB7F1+HjlOfu/H8VO/cqQYvgwXaYLDgzVteC0pA96gyh7LE6zWpzEIKNVVyUQyn
         orxFIy2OtvJkP5T1YXgcr3+JhDtVUrKTzZIbylzztc42OhmNeyj6Jlcgi1RSK9qwq2xX
         WSXyvnCHmW03eJa39wku9mcL2760ROswAhEYhef1cx6OsiBLtGpEY6hrLe5YI8XxS2yZ
         bN7gmkDtoosZ1LK7lsasfKmv1jIfuOA4svanSCT1XSIu09sWOc6jiV4aC7NGXxBRnZ5t
         7x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360530; x=1795965330;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3VsFQ8Dfp+icf8C/mk3mu7oWtV5E8PN264bZ4iLizc=;
        b=BGHGKY85WBYilR502s+tul5duM/jy1DAwTditw7/CEk2nySkAoeYQ8BxIoRTCrm9q7
         842ipFurvNZGHpMr8KjNPM7y7ezjlv7c/g0/BL4J1nFkmsJZYohHqXLQbQmcaCirfl7Z
         3GvgUjP0ULGUC4E/n3kn/yPf/qZvQYODWMszNLzmkGIUZ7hv4jF80IlgRVnHaHliyndN
         Y9thFzzinvUN23xi5aMzmX7xj3juh8u0im+Qp9nLNQzh0fv7e18yuehJ92Y+d5RsPKzu
         VJKmWc+5PCAGcHWfnNoVSt5LpZrPUVCUtNgCmmM3krt3NQyOo3r517hFP3asKpdhchOd
         pgNQ==
X-Gm-Message-State: APuU4Z+UWD7rq/caf93EMpmWT7XwBmnLMYGB1FDPJvaR9kndok/HPzAJ
	9BHq9pMNeTLWKe9rQB5M8Ku5KcbixZxagYEAvBGbiWgt++4ZOc3DO8Fz
X-Gm-Gg: AZFdTZeTM0t481iiVQAvwd5NM8baWtJA/pPS0b8KJjjdc+U/k8iC2/uSEvTRXCwjDTO
	YNLx/ITPnSBpE1yj1ZMGbTkLK2J3ItS9vmsD9gdUsZGK7fnobLTmVwHy+71G4snZmOY6MxOjX5Z
	yYWzrLyN3ilOZ7rFYRyvuNVAQJhnnv80OJD2nfoLvZRJIo9fQVeMJrutTmv1VEZWi+QKM8rJEwN
	4LrWiMS7QfVqhiHm86SuemttwpiMv99WgyneKKVZ05xQRDAzexc1p4ei/54qZftjJaEutAziFqi
	4eecnlEH9a1ep10gZf7s6s0GDst15WcYcRkHSy2iY0LsFmHB4Sr+gMpLBi6cHcvKqOBQK+CMywz
	BqNFX05EH8vEiolxKvpMlbpBh+9+5GKfcReZSAfJX6HafLf6KtEbTzEzuwVKa81bJH8SY5NwLUq
	PkqXhS1l/u8M7Dm9AUmvxg9mjHjhtvKi0GBz+e9KvaNe9DBMZpDPOIkKIDbBfjnHHZ8o2/KCTJP
	QUtEpMN0jdMhbZRF7nyq6r1yMfDJtUP6Ua3o1l1tPaaG4cD7sWahQ7Fe8TGy4CxAzGwk+4//Nxy
	yMt+Y/BsT/kxXTDqs08zeEtrmBVdxipUFq7qGeQetu9qA6bBP5SDpmt9uOb5cTU1+632Kr0VIrf
	jUf5ScLm8p/8qnIM0FHj5BahW
X-Received: by 2002:a17:903:1c9:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2f03f15511fmr91746125ad.19.1795360529421;
        Sun, 22 Nov 2026 07:15:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2:6c04:212:db3a:1bad])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm38009285ad.72.2026.11.22.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:15:29 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 22 Nov 2026 23:15:11 +0800
Subject: [PATCH] usb: dwc3: keystone: Fix PHY runtime PM leak on probe
 errors
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-keystone-v1-1-66f8e907685e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNvaHUW8ilxYBkMt7SCSd7e4/
 Oo/5wIhzyRQRBd42ll4dgEmjqAZateT4jYYUGNqDKKa6JR1dqSSttY6R6u7JIOQL546Pr6rsvo
 tmx2pWd893PcDx02s1GwAAAA=
X-Change-ID: 20261122-keystone-3da0092b0f37
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795360523; l=1790;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=jcRTXu2U+zD11Pm/Iocm2AeaqCwvwNRbSwsiRk2VN88=;
 b=evVibcupaPFmWpK7PoleSekEN2H7L1Zwp5IzegK/gjy21cw/wQCggdfXKLpEm3yuhCt1hfeHH
 RGVWr7M681/A5Yfyai+aKaIrMtU4jPfURO7p7BieS8phZ+cIBsIx3FK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

The phy_reset(), phy_init(), and phy_power_on() error paths returned
without balancing phy_pm_runtime_get_sync(), leaking the PHY runtime PM
usage count.

Route these failures through the common cleanup path so
phy_pm_runtime_put_sync() is always called.

Fixes: 1c11e74e9079 ("usb: dwc3: keystone: Turn on USB3 PHY before controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/dwc3/dwc3-keystone.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 7a5fc8545d4b..7e026f52a823 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -108,20 +108,19 @@ static int kdwc3_probe(struct platform_device *pdev)
 	error = phy_reset(kdwc->usb3_phy);
 	if (error < 0) {
 		dev_err(dev, "usb3 phy reset failed: %d\n", error);
-		return error;
+		goto err_put_sync;
 	}
 
 	error = phy_init(kdwc->usb3_phy);
 	if (error < 0) {
 		dev_err(dev, "usb3 phy init failed: %d\n", error);
-		return error;
+		goto err_put_sync;
 	}
 
 	error = phy_power_on(kdwc->usb3_phy);
 	if (error < 0) {
 		dev_err(dev, "usb3 phy power on failed: %d\n", error);
-		phy_exit(kdwc->usb3_phy);
-		return error;
+		goto err_phy_exit;
 	}
 
 	pm_runtime_enable(kdwc->dev);
@@ -164,7 +163,9 @@ static int kdwc3_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(kdwc->dev);
 	pm_runtime_disable(kdwc->dev);
 	phy_power_off(kdwc->usb3_phy);
+err_phy_exit:
 	phy_exit(kdwc->usb3_phy);
+err_put_sync:
 	phy_pm_runtime_put_sync(kdwc->usb3_phy);
 
 	return error;

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261122-keystone-3da0092b0f37

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

