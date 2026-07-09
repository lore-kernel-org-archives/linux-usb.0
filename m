Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840043BED70;
	Thu,  9 Jul 2026 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623878; cv=none; b=hU+IZPjxidv/lF+ZfN5FvhUDEGiBcFNjvJSoZgU0qE9G6cduTBBCPsmtGsZ8z8J9U2BLwimENFyEzcRe7s6QMFAZRHMBCjQcqvBYmuy7ZSK0FRwUFD368YuYyunrvXnMJPv943+FGomYWbRDzBAWiWIEGqXBEeOALcR9mPbrKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623878; c=relaxed/simple;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o93XiZvthmYiPZrU/83cfwYuUnQBA/RRVdOt6AuRxbmry0aSF6/o7ISVJ3lNaX4igoLFyz/3ILipB5CMknZwPPiGvfFFTLJksR9Er5SCSktsG6TaE0IAkT1buzQgrzIvW2xTIZtVnRn02jF6zCNu7DA0MF+0VMJ7F1aZuzX8KwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LRlK7PDW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LRlK7PDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LRlK7PDWDFr0CK0wJ5X0K5qNxpSE9LQpuM1vk+bvfJl8aF9s+gkHBktkn3C8zSatO
	 9Bg7ZcYox0jtOxibcgkIJ+m6XvTrj/vixNB4AuXEXtaEaqydAC2QYgz58QRpvAVf+2
	 2dwxJotXrUk0saWcasNP3WByPTfhC5L1qLYSE8E2ZHNR7jfQ+fK0HnpZ/bVtoy5VJi
	 92XH68KAvfo6Ee1A+nBaOuy9sLMSajVtz1BbsRCTyJXFMOF+C4dty/OfjiEXNbevX/
	 qOhyYv8d9sOsBjbzbdy6n+z2tShfn5e2dmKJCHXhx1lbrm5/SDl41rthDbYkPcsC3M
	 h58mdC9Xnue8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FB8117E0886;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D29A2480076; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:55 +0200
Subject: [PATCH v11 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-32-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUwylVYmiHshjS3rqR18XuKYaeZZMQQr
 FxKVYHML17PfIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa7D8P/jz/LFwSXFSVQL2zT8yIcejSNQWNhv82ByFWvDZwflBkyBZpOQVUMbJOUyKTtD35fJD
 VBNAaTvnFeKT8HEOwuTn6N1UG/HNZxRilmuUpZY/Jwece0OvXyfQJRgYS/ZPMvN/YhyJOcUmsZ8
 gHyRi5PzD+BTUMUcKwuEFCnFaYyeySeycVMcHC4DZQvp4XyMbb/bM5fBctOl1xe+SxuNaYfJwqJ
 w1np+AW26GTWybNIhGk6u7fHqIDNTnA1m9+9fWejTZ+qN7sNyCKqx2JZsK/ZMC4OAH6+GdebRd1
 nHljKEHhI194cx6RVKuZ615DFJkaUyQ1mBUkWMEEjAPo6OSBaLwZmqo1G9jNszavyxWEDX1O44T
 FAET37U/faXjNxqQGXg5pc2ppOFxn6yp6ntZPhbjazm5MpAWgrN2Xjm50O6hWpsZrS0Hr2ql/uc
 OGMfPZvmYRU+gbabdQ9+q11wSU4Z4zUV9yYznMClJxssViF0C5jAtN6kzdGxa4vOcaHZComaQTj
 X6L+NyxEyFB1HZSzYZ4I/ISnw39x/vW1bAR3ea4IJXJBE6y/MkGy4cKIfeoLjWHbDcsPnUYd45K
 912LnLfuUTINp3AxUCsig5aPBlhhTrlmsJYrmNLFOJ1BK8hMddTNYwoMhlOA2B8jYiLfsPhxVOO
 1/ssEOhDAiu7BL/pv+UUsHQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its probe routine
marking everything as off and later on does a re-init, which avoids
the problem.

Apart from that rk_udphy_status_check() is called after the probe,
so it should not return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5d151fff9eeb..3fb6eea2979b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0

