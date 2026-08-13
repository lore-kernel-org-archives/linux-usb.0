Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3643B3C9;
	Thu, 13 Aug 2026 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654333; cv=none; b=fH4ziIZS9AqfvaUDOabNZCjlnMS7Q/41GIJ21FC0dNeZtb4TYvzbZY9/E53p4PnLpDU2e0qrqW30zEARwHen7OclWA5Goq3gN588I5+okRunS/KSzau1BdShZQiThTQyFCnShHQuHYcp8PGtovGG9KV9nuF/IL/NtAc9swzrjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654333; c=relaxed/simple;
	bh=az155ty4ey0N2rbig1QNJwsNOxcqCRBwMjN2/AtKJko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lxgz6xQEBCmi1wwcuRrIQIapAvh2n+JA9Tg64gSW/HgeyrlNhKsYM73296qiFrdLiFSQclLPqmIJqVPltSvm8pDTrPInEPNK5jkipiSusB12yJ/0nGXqZKnhqvNHoyYVMfWX9kLT6qTxwjg8FkfbnAYA0Q7G1YfJDiRqYfkCJ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LJ3Yu0Ah; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LJ3Yu0Ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=az155ty4ey0N2rbig1QNJwsNOxcqCRBwMjN2/AtKJko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LJ3Yu0Ah5WlEHZOCFyFFK60xmXWrsoYM+LSAN8ldjgHeZWVD3yc6hc8iADApun9he
	 CVwDKLdmhavQt5gZdU20+5a2vAZ08Tqu4RmzucM9iR/+8wikAq/OGDPZ3xZp6OCvok
	 uPoSPVt930JOhl+ss1i3SwSxvwcOTqS23jCKnu8UHiqt96B2lmOrgKIiQWRL1fYmDP
	 N4WQ8Ha6zl2HQuoBnlXBZlcw5hEQ1WD3AEiduSMsux52LnHvL5P21E1QxorhRiiW5H
	 t0ELvP+rIPuvealhNgZip9Phogceht5uhvgJ8a8amo8HB4GOkx2Dtu89qy+GkE13X3
	 LM9v8YpemCbEg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10FD917E35C5;
	Thu, 13 Aug 2026 22:51:51 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C99DD480079; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:17 +0200
Subject: [PATCH v14 34/38] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-34-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=az155ty4ey0N2rbig1QNJwsNOxcqCRBwMjN2/AtKJko=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmXuvHkIKLF8WzgW8Xt3dZVo/ImSA8pyM
 bLRFywusTTPjokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaD2sP/2X1hCEWM8Y4KcuUUh/u4WxeCzFCA3ny1NLWS/KbPpa+38JVyDC81Z7zXIZC5QB15es
 EdPXoyygKp6CqbvF9D9F8Cg6dPwap28pTwagQNFNRWfFDd9Osk2ifO+sbDMlSWDF+JcvDvRYm0M
 3dhe5ZdDx6k73+IhefVtJznNzPZj3i7ogUkj3CCyDTNAFJbZGjNzo6iTnUrhi1Ww+iAClIh9yZb
 M8FhwEnp3u/SmLjcUKfvbkv1sLWjuveEVDyhx7n4ul31i2b8J71v1T8G8ipS6YwP4MtdO11wOoo
 GAAH/ytvst+ujqfUxtl6uthTFQGbLRLiKeYUA8IjgaFwZSiLJYdUEuLX9JHJYeSEyyPwzgw4xTT
 HdizEvrOfVbDc3O6MWl3Xqh0GtFEj1+ci/8fgJK1XX9V8gyiOPAXsSx2OqMbUXhx8pCYvWv1acU
 m25neI2sKpfQZB4ykjikGq+QCCFdXX9q3wDrAN5pEmCPisb1ODoFWk5nIiEbOPPRDVwyWjRqyok
 7U28KIUYqqGotUdh/HVaznprBE4g6MqvJR9ONz5ChTWxmU2TBNSi85gFpeFaqIigzuerkegYdWk
 pjflGl7Bk7axvxdX+P06tSTyWkuUs7S3qp0TWLjiaQeBCe5J59xy6bDvjRn4t2RfyEWAYUgz9BV
 fXVugwMD9jljp0Dqa3PwzRw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 21f282216aef..a6fe634574bb 100644
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

