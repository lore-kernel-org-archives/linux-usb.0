Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6724426EB3;
	Wed,  1 Jul 2026 23:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948960; cv=none; b=D9ksCEoBi7ytBcE2Be0FGJGKIeteDB5uiITkppkHw5bJz3ZsC6a/T8Y42dVrdPdNNOJL++6TtkJHX6bwUin9l/VSG+sZDAw/9nA3AtU3MhsZ18Mh066gTp/Pojl82o8ftU6wXeZwp9OwWN9oq6Ej0j28ayRs/rTUdnFiZWWlDsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948960; c=relaxed/simple;
	bh=W5jYrAum20qKXLQnGb/B4JCipsc2gTq8Z+PJJaGnvv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVnf/5ak6R9PKHbWTZVeP3eUGLhghy003Lu1l9hjEa8L8OUvtY4PF2A5YfRVFwpNZ9yDZMk6tZuGAlsKv20pOQ8/OS+wxu1SvAF5gmd+YZl90QQ3DD5NidtgB03FjPMDQGLmAtj5ezSMClj2kCZoOSGxnboQtplQ1C423e3clsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GMZZyQIl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GMZZyQIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=W5jYrAum20qKXLQnGb/B4JCipsc2gTq8Z+PJJaGnvv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GMZZyQIlU575XEhDRt0N5tgtDNesmMJLW18d113Gyv7M8gx16ygdAJHVvrntYG8+J
	 ApgfefBXHzOR9UiCuYwIWVq9G2WTAGWb3gBn6Ii8ALT54f0TSnpBUnUDhyudQ3wmqN
	 MiHnD1o6QeUyTpOI2OKUbBO+oK8GgUjwLMi4li9n6iF2q1Hd+sSua4qJ2SrOxwNi0i
	 YhZSty9Msi1GN8mDnfclYqdVkaZXA+24IfZnQ2k8E1Uw5fLL2QXQZdn9/2Q/UuwNrn
	 +9Ae2EaTeOe3TmYx4XrOP9dHSCctkyqN7On2+PbNiin3fK+c2PW03uKXNp92eE1fqt
	 Hk9wwMLZYIUhA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BFA517E35F5;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D629748006F; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:06 +0200
Subject: [PATCH v9 28/38] phy: rockchip: usbdp: Disable USB3 on probe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-28-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=W5jYrAum20qKXLQnGb/B4JCipsc2gTq8Z+PJJaGnvv4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFTpnQm9rJMPM60lI+AIyU6bC0eHnVDgr
 oWG9+YcUg0bE4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qafNYP/28D/+snNi14jEl73SZCLvc5/6TkK8mp13P7JSsbKlnJtSEaoZOCLZuGgNUOvEFM3Cm
 skKfXzgDSmR6uAvvpG2Q3lEjT5wxZGlRnlJj21mmCM6XPpsRorzXYUJ1xIeoewQ/I+RjgWUWqEn
 Ldg+DZz1LmKTpLruKBl9F62YEeFDBT38UmXRMHjhdUSdTs064paamcDNSMpjhFE+D4dOJK2m8YG
 APpSaE74A+kvhzQEd97FOZSP7x6V6qeIk5fLXC20x3DVV44OtBLktAAj+xa+FwoKI1hmcAgyfTL
 YGyzla1ft/NL8RS7vc2OfoyzH1tt153/n08R2eT1l7XPTcxYq6hVgYcax44CJ4toLe3CZ+ylhpW
 p7yFp+02KqKJEujTF0n5mzu3X1+BvTpmVx/5lkt1tRUgBp0c3AcofuU/2bEW08H1Hok7jggq1G+
 6/BTQMLXhAUALsgDWiFfxbYkBqovBdqF/+7lyC/hMuBet/pbdGhdTqiUObbgJIm1qKVFP62mI4V
 +npWVyqWih8p936wSn/TRhsFbpYUc+dibhcZwriMgguokNqa5wbVL0wcA9Tf0lcnsjXxO/tzko+
 r0LssFdBjnujAOX/pcLvCbYmHFu/olEZy7ZmiETu3soTHWPpcDOL6xgCC0R5dSSrDFXQhn1CMat
 5SFehG+4mQH3K+2xyk8YuJA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Disable USB3 support during probe, so that the driver always starts with
a clean state. With this it no longer makes sense to use -EPROBE_DEFER
for cmn ana lcpll lock timeouts afterwards. This error code should only
appear during probe and the PHY initialization function is also being
called at normal runtime.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 146edd35cf83..f788405dfa1f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -756,17 +756,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
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
@@ -965,6 +955,8 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		msleep(100);
 	}
 
+	rk_udphy_u3_port_disable(udphy, true);
+
 exit:
 	rk_udphy_disable(udphy);
 

-- 
2.53.0

