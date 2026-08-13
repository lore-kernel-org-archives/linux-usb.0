Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089343B4B5;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654329; cv=none; b=G8F1QMn1+fuBaV1XaJgFZpLhRFHvKjoiG1tTgHUfHx/+fge2iihu5FAl16m6LkeZ5KbHajh7VgXyC5BmhGL3Gef1zAq+ics0IWtdhsDwbPnInqHRC0FCuQoEGUECv262OoMhr8DlKmsGaHRbRjThZWrnQvR4zb3vWq131nyZ/L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654329; c=relaxed/simple;
	bh=1qnuCtil87k3ylTmmQL+0LtekRxupUr5oBAKbI9oT6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muRkH8+FsbP40kdmgl2A4bg0AYpdf1xEZCx2aabT4SnRLHUVcGALf7TCLdaMdbJ5nCa77zZGj8FrAzYnqHcPDAevvtKLo2PkyVsNqEspNF3GxtGbPRBSnxaga23t+1nB+0RurDw4yEdRcH6/Btmebf1uEktzwIXGzJn5HU74CXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lb7jUcwL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lb7jUcwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=1qnuCtil87k3ylTmmQL+0LtekRxupUr5oBAKbI9oT6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lb7jUcwLyvwCXo9lnwdS/3PKY597rYEepVGNG7RHxVkt2u3oD0O2WkTdvEMornunW
	 UUyYDVqS7+GAlI27mf50cRjHnTIHBfjAqqn7nLJ/tfSxrLnZ5HRJ7pBLxtS/7/IQ17
	 Y9iYFeP/RCTmYJlL17Y2mUnWru53RpWQyYdZ6XVZoQrQTwGimgf0j1uCpreDUX1FDS
	 bCbhqw98LuEN/GAZrzK7VrpgoZgAlBH+EpalyXZllNXbKiAA7Z4Auygrkfq+FOzR8a
	 JpoEH8pecgEzDAYrQ6PnZpQVsSToOvWunY8Mj0dXZ9FnpN8HVUQooeqr7DwUH4BKTF
	 V5zV4axKb7qTg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E57BB17E156A;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C348D480074; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:13 +0200
Subject: [PATCH v14 30/38] usb: dwc3: core: add post PHY registration hook
 for platform glue
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1qnuCtil87k3ylTmmQL+0LtekRxupUr5oBAKbI9oT6k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmVuTOH4YGCROdyXVExeGE6AbtOVHieKn
 ZZyHmWIvGWQx4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qamEcP/jCdT2HkkJzNg5kQB1WTxdnXLfXnsCWUdCYwQMGk1e2i0nlBO/Km8DaTtgVoxDVF1AA
 VJHnXll3JV4oNLVsGrF7HXhhGwSX4B5hU9QyqgCM/aFAbl/VjSp8GVO7K4YD8is9sMc9ivHWe9t
 aWKZ4FNqqE44vrr4LWLjQykAQc4iJ02EA8ByMGRa4X0gWQzPyCE5Nnq+xJFiMcSnjsIZcosHMTB
 TxYtED+GzfY3ew/cq4U8NPhLwC8JjNGVSP5SYIOVsO9JmzMzIONUKkKv4f7UJytqWb/dd0m4UbG
 b27RRXZvlaSs8trIvyEfIDuBh/MAF1O2lL5GFddJkBEGGVRxfjY0CGqrpN9ICeBBpCYT5ds0dS5
 yNYOzum323PNJ/GYVBWiXr2Mzst0MLV9irdzTL6H/yU54ifP8CudotNqDARUI0KbxFmQWCYOBhl
 3osCURofqm+pb+m1r2ayKZl1lSFtJGfmHoLxvcxK0qhY6P1V3GboUI4hTo7X5kpYNYwdZZmKmyU
 cPsrVikSGge/S39JmSuCO7tkxt7rOH30M7ralk5FWCtyTwbWpstd9yoTpQ1It1SWUfEypSi+/YM
 Tb2YafbwJ+U6abPMayv9EnKx+bQFxF1a3Ww33MOFbvz3bJH8D3nJ2fV86fongoZDXiPNBAJbCw1
 +GpxgQpuUPTC/ME05IO8rrw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6e796489a04d..d0d766e1d20c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..8572d23a80a9 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -996,10 +996,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1650,6 +1652,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0

