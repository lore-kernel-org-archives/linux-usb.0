Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B7425CE4;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948958; cv=none; b=Ea+8Y967KOs2olBF4DQeL9YoNGIinbIrzlVysp93MxvjcQ7+/epnz+YQsHD868K887QmIY/MtR3WYhJdBQdSh4+uB8UOiX63m4BvsSETTwAhE52JYPwB1q5I0JniME5OpVQtmPuHdjdIoHI7CckdJJ+0AtyAZY6zYco5tyvZcgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948958; c=relaxed/simple;
	bh=k0pGr7k0QHKfkWVayOd/7CosZlxE+m9eDyIdiae8YwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bquu9mT+wJPod6cq0gePQXz14d6DZk8Y22LbiMukVgjrWLI0WoHClRKH4rZH9F6xQnl4rV+OBg62C3RSbopullIzyywOVE2zmbHRPOtsOptcQtT/bk/hepUk3xtIrYiObz3maizqeqdkoukXF8b+XrsvaakiKUYcLw8cB1DWuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HPdr/Jlq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HPdr/Jlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=k0pGr7k0QHKfkWVayOd/7CosZlxE+m9eDyIdiae8YwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HPdr/JlqoB112+kFToTxe14n5HP9kwoV4GvLLVP7gpQWJq3NdxnVaKn26bDB/Q2Ux
	 QBkK36wcQvBBl3mfXE+UQNGFJNFwmJ8mCZfEXX60+bJUFHPz0U5UEUu9eQNq7jnQj3
	 rciFbsz/Ob3nJmmKyFl5JGC+Y1ML8xpkc8AvYuroorVQdf7Rq0SWCQ+tZRMVgjTyCs
	 NS/MSrHntcktBsE+Od8TzXRFCNWko7mKciKmxJVE6cpEv25DuKcKGcvX9hJzUlAGnG
	 WHWEgUtiG6Y7DCwL/4ngpfk8M+aaFoEbN8LXS4a5vi4cfCv+BqKtqPC8ow+ewoAuDt
	 2bYY+Y3EV2BXw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88F0517E35C9;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C12AC480052; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:52 +0200
Subject: [PATCH v9 14/38] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-14-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k0pGr7k0QHKfkWVayOd/7CosZlxE+m9eDyIdiae8YwM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMGwJ+KR0Ac63pCApaxCu+rVmLn1aK/b
 jWqkIzi88nf1IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qakJgP/A3oEWM8tHSfLtj5YAJssGtw167JlQvaK5k68BJu/jT/35HnFs94knc7ht0dpzyUyVK
 UHpinHODVRG61XApQ5woLrLTxW0Y9eJ9AJp0kIydrJgw1kYihL/SFZ/fyN2k6o2jVfPuSFrY2qy
 dhQ70ajXeYCDm+EIMkUU4x3LBFVUSAI1n9BrEi7HQrXL1l4g1kEIPFkjrqlo0V+9ZWXUIkTutGA
 kAyqf1jdMkSJRtGyJVu34mpvMHMNvNBtMGLJA60Roq8TZrAkoypt2mUqk0z5++EevOPU6qLzITZ
 fTN6wJDoaYwyl/Nww+0k8laRFMB4AYuxl+bxHOO4mtfrxtQvaYZ+hYJTyxz0GP/M/Q3ammt9Y6x
 fQXhOIyNTf4Ypg0T3REUq9s/L8B2qvlOkmxtutBRjBpHa+EJnIJxrySTBHCB3eAFhOVk00ZDR2X
 f2blGQBTyf1JpFlZm3w+pW/Nnxr8yv/0zOvVqgJsWCRcRKo4n/A0XbpoP4tQUEmE963EChN5shP
 ht+eMjHoBuDhVdNa4ReFnpInn6zRh6vF6qNuTVJ6pmCbKoZ9oYitGLc52r/5rh3g5mCjATqp4bl
 nH6NlXi/T/CvSc+UgV3H12vduYXo2f0LPMKgRC5EIvZNLxj3ol16mTpiN2r3tkLDF3V6HfBlshc
 23H9fStnvmBbC0FoGrDoznw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0cfd23a405cb..ee7ec86bda9e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,7 +550,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -579,7 +579,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1084,9 +1084,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1104,7 +1104,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

