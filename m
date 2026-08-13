Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C043CE48;
	Thu, 13 Aug 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654675; cv=none; b=pS1lN2Ce0BQUzyYG4piHZB7OU/u4e1XzUeif+dlsyyX2QSUXHylJkW4SLmbl6ih7fOsI06wm5xCMH52taXzC+1jlbRLBUOC+GRZkqI1fEhWtr2HgjJhk9W1/eBB2TBraRs7BiKFr5oD6q+aDb2CTVuJSSAhKGP+P6nO7CiSVkf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654675; c=relaxed/simple;
	bh=5++WUnhYCSGnCuoyK1wn6bt/tbeLPu0eYE6lmnwMe74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0BA5zo2i72/GtBzjSapj0bU9wclY9iQWCIjITcKSIaG7VAZrjpSnh2fsTh866NWGGbIk7gq1Fn6R0Ejw3dG38SdIja1WlOYZIHR8GFeo6ujs0auMCfWNGqMT3sMn2O0jgbJsKV2l+7QaCtWGZBjRzuJNANA3DWccFzBWGik50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j+gcyugQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j+gcyugQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=5++WUnhYCSGnCuoyK1wn6bt/tbeLPu0eYE6lmnwMe74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j+gcyugQy04ug1J/cIqWJ+Tdpkqtk+81bso1Ys1M2gR3IuIELh9RtRLNSk8NYLYuG
	 gd5qFHiUvVjjPAzA7MAAeqBkclV5F66Mu4ELEv+Cfp6URDOlgE4Z/dFAgbLJDKJOKo
	 4Wd2vekGAAse8lMVh6xdKzlUKhXiWtKDHxbvbe9RG0hfWMpIXlHIHsllOvFKzav8Ah
	 JSMXnuxkcdwmN4D7K9tEUpy/kxcXTCDm/E0WDB6EJc9Yl8Z4SOau173dVpt0lsjJTg
	 e78vM3AmQocCmgAVNhUFF4gckN2zTesvM7wAjvOc3qkfm5iKhNM5K9i4Xl0XLgfb1b
	 9fHcMqxWIU7cg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5C0917E10BC;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B4A79480067; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:04 +0200
Subject: [PATCH v14 21/38] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-21-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=5++WUnhYCSGnCuoyK1wn6bt/tbeLPu0eYE6lmnwMe74=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQjR9TiFFz4ChHyq9ZUQNrsfSTyPXsdO
 YUTRyohqp8uB4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qayPQP/RSaRXsnAwHtNUyUJnHjiIVkxyU2STfol3WfWuSVHymkcVRPkbsiI9OOZvDNaeBpHES
 eo5hyltXzm/JN5vH35uuuT1h0mDX5p6/e8YAlFMSEDXopITScG0pxheqV2OgdHv63yHy1hVRhwG
 qkmyHvldKyhc/HKLKWfo8YHVdNLMPRQa9m2TRVSRm2x4a/QC+KVKDDBakMcOSHKkWlUBkWFa32t
 qbhxpbGdkq+KbFfKflbNMtA/HN6zRNYr9UDyMqCj9PeoTz0Es7Az3ofZsVshZO4KE4eewYju0+X
 1LTNQ+19+VTpw/RsSYIPrRVn7H23SxkvamGxfDuTsLTkk1ME+3woAxk4MhRn2NMxDZ/Wgw4OUU9
 pllDbk2NUYcDyMiyjekEYgaiqNxwHh4VnKExvNnPqZRDe243y75WH7DnMwa5euQEO8cuUDQt95+
 hhJT8dMHRz1PcHvj5JczfmnpzAW3hm7SZWi0MwmEXkX2TSC+2xETBEDugyaEkYDRFc1eh2NHohW
 onzfpdRDgCJtQevxdDngzMUDVo7ds/85INPD7n62IuacKOZkL37JOH6IGhDS+1M4JF3X/Uo7U2X
 e5IPA3ZvtaeUigHGtipli64NGqPNGMITazGpaELU78JLZN4W4aYv4ag7tEcq9+Hjxh2A6vnMAA8
 tqsegZtnzluyl1ZhdTR0r3g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4e54020d1755..0399cbf96e19 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1293,17 +1293,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0

