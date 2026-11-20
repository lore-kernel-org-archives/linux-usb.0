Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218028;
	b=ETW6itFKJ+gWw3skKTGs7lwQ/aWN0Y6in1fRALrfKj8ZTAEHzc9iaUIUjOOikYCxdWmy
	 Ea0Jmz/fv8e1fYVThOUc3c4eC36zHbdp2bNv0PWmA7k11VCrSnlJFSCFkOxsCVXMPMWWh
	 XhndAMv3wGLFwAZ9lFiSrWtGS2xC0HjuuN/IebqgnEhJJd1om9dZ1WEgIGsm+RJGNIy20
	 dk0OGZt39Pdjw8R7dMZnSGTgJXUmcUVWLs0eXRnmulYyCys6J32/6WFWZaLgzBdwIs4+4
	 oaoW5+f8VYcQXs1LazjBcqDrpyJpBU9DKcVtE2Bghvsy5OoipaEQdAaQQtTqqcLS9sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218028;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=fpAXd9Dd8xrOaZ3dfPBtxIPQ7lagwt0ZBB4LlAide2s=;
	b=lPaoHDg9vFetaxJMZ3byig51nQWFe7ImmL7j5WfKXNGtqRYI3LTVJda0ki83AFlYeOuc
	 WGfuf7GmeoaVB8An7Nb+zyTrMrJOB0hyQ8nxH+K3N30ql0vMTERNqzEYnBARxvj8sr+TK
	 zWxYVG++4NSplOJkKVGNwF9hcyfqSEJPREOspBXABgbOH/1HPt9eyWyOgEjWeli3P/oSb
	 ICETN2HMyt/NxxuM29xS6JtaAywgp77Q+8OeT272BZ2nx2JjZOCzuBlUVaDICYEGq8+PD
	 U0JFGP9JcuB3KK1MbMCEnvt/VO3j3EaC091Gcve9YzOYVxRXYWf6vKYn7Mj3UIlFBBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K4NrzT6H;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91471606A320;
	Fri, 20 Nov 2026 23:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91471606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=K4NrzT6H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fp
	AXd9Dd8xrOaZ3dfPBtxIPQ7lagwt0ZBB4LlAide2s=; b=K4NrzT6Ho4A/a1AHQt
	Y1foc6QFZs3/57nGlhIfoozQivXkbmBaPROi/XoW0H+oFOyz7OtHZ2v4wjyRdGET
	Yn6tlJRj9hhU0UutR20ELoZcjWLRQHG8fNc9UT2+pQ545+5GxF0Xi565elM4Wneq
	CyiVSIBPywkYYIdAlmTk/ZsKc=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXH61Q2gBrI_0gIw--.27688S2;
	Sat, 21 Nov 2026 07:40:01 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Freimut Diener <f.diener@pengutronix.de>
Subject: [PATCH v3] usb: phy: generic: request the vbus supply only when it is described
Date: Sat, 21 Nov 2026 07:39:22 +0800
Message-ID: <20261120233922.2691166-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <2026112011-macaroni-manatee-e057@gregkh>
References: <2026112011-macaroni-manatee-e057@gregkh>
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
X-CM-TRANSID:_____wDXH61Q2gBrI_0gIw--.27688S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4DAw1xuF4fuF48tF13Arb_yoW8urWkpF
	W8GFs0kr1DJF4xZrWkJr4ft3WruF4fJrZFkr1xJwn5WF1DWa43Z3sFga4rZFZxuw4kX3yY
	y34DJFy7GF1xu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ui2-OUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RGl2WsA2lF1NgAA3j

usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
regulator. The legacy usb_phy_generic platform device registered by USB
glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
up in the dummy-regulator path and the regulator core warns:

  usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
  exclusive requests (id=vbus)

Only issue the request when the device firmware actually describes a
vbus-supply, and keep treating -ENODEV as "not present".

Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")
Tested-by: Freimut Diener <f.diener@pengutronix.de>
Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v3:
- Drop the blank line between the Fixes: tag and the trailer block, as
  requested by Greg Kroah-Hartman.
- Add the Tested-by tag from Freimut Diener (NXP i.MX93 FRDM board).

Changes in v2:
- Add the Fixes tag suggested by Sashiko.

 drivers/usb/phy/phy-generic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index de26b3023..24b7ba536 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -238,7 +238,17 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 		return dev_err_probe(dev, PTR_ERR(nop->vcc),
 				     "could not get vcc regulator\n");
 
-	nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
+	/*
+	 * vbus is an optional supply that only exists when the firmware
+	 * describes it. The legacy usb_phy_generic devices registered by USB
+	 * glue drivers have no firmware node, and requesting an exclusive
+	 * dummy supply only makes the regulator core warn.
+	 */
+	if (device_property_present(dev, "vbus-supply"))
+		nop->vbus_draw = devm_regulator_get_exclusive(dev, "vbus");
+	else
+		nop->vbus_draw = NULL;
+
 	if (PTR_ERR(nop->vbus_draw) == -ENODEV)
 		nop->vbus_draw = NULL;
 	if (IS_ERR(nop->vbus_draw))
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0

