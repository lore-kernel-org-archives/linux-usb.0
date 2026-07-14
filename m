Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8842BE92;
	Tue, 14 Jul 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057186; cv=none; b=p5QAjHRRzqy0DOAnISsJkjiKAxHO/3T4wHqDwtd1gnpXx9XpHwIpADfC6bPcAQtmkM/Gsx9F/qiy40HP3WoPwdihxfy4Kv05xE9Ae8eP83kauSFseh0CQBdKa4tUa7/x7xPSnkUu6MTteHILVmtg6KpZ6J86vmeIaICXSRlKpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057186; c=relaxed/simple;
	bh=iV0TFUhsGtT2QxB2V0jcayH1eq33X2v2R8/s+ngigtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ot6fFAu11Cl7jLYuIazetBk3Kxh5olY5b6pkbDooX8KcPi6k7atybM5wJCNrbdGh1NYyBx0oDVTMdk/JXnaPBzm/oq7IfmJz4pFTREUdQn4jryEHJ9d77bT64ZCjtpGcqkgtK7NoDG94BxFc85enN6ogZKpAhjJu+VdEzTgoqRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ldoXBN7g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ldoXBN7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=iV0TFUhsGtT2QxB2V0jcayH1eq33X2v2R8/s+ngigtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ldoXBN7g8VUh9UpqzFdEhAZ0g+R7v8dmLB6WPf2eabM9JHGHxhwM1t94WHb1AE5SS
	 CA+y1v8fdD7eUCnVaJ3hZXwS5DU/o+/yEve1Cihkt15y7+u2v0LD6xo8ZtLnAqX7SJ
	 0H60l1Eg8dXNfpEXd1nFTFvW6HOEs8Rgf3BeLZV3r9XSiKNWsIumkxLt3+PceO43QG
	 ay6XFBNOz19wYmjnaAT+fj++/9nyFlqhGmQU+cAgAsiN/Imb4aVH7l9r/Ddp8yLV8E
	 WHhu6YVVOzIPXSwfQthRoaLyof8zdjUO+gPZa3VFlffBg9CD+vpEg7iz3JgSXFitCZ
	 kIduW4nfMG3BQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3023717E127F;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 096F4480075; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:32 +0200
Subject: [PATCH v13 31/35] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-31-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=iV0TFUhsGtT2QxB2V0jcayH1eq33X2v2R8/s+ngigtU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDx4uduaatH1g7+Qw6gWCWQExoRIN3bu
 DPb/UwcdWTJW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qamgEP/2us98K92E3jhqGo13ZHrkpP4mj/3OIV+MXkJ42gKbUsEt8AOB3wPTMI3k/RTlVYEcg
 DRHqtQGGmCLNK0gf2ZrobsBdb9AVDs26ZF2uHFzcl4rDtby8pKBlHWZX7px9dGtscAUPKQBdCVn
 jH0m1Op67kDOhszUHVqFwPnFmZvvQLAQ3zWv3pH/XjvMfGlnqhRMFCor6jpMOZKxvCbqCByKFy1
 eZt5gmkm08K6zn3HIWCuld2bR7Q37/q6I7/u/oI2RMSnWWTxByt9uYgAn5KMk9vCqEEaonlIpW4
 W29uhsBojJrDe82TXCpX3WKglY7uoftxfL2PZMHpyUnpigTQnQ+PRCnuvneJr8O5LPZSpsxgPfm
 CSeBNEYHhYF2W5VYUh0VD6hQFovfWhh9LNS7tVpfSKSsHpDuI5lSaQFGCsDtuL+ss/XDvGx4Tn9
 CbFj3Fcf9BkhtK8XfatJjQgYeidDJ/E39s1MQpVR6467cSVFa40FV9ZPbEDbcgkNrn4dOfilOYP
 JC0ihIRmnbGAYbMU89my9EEnEdBUrdCRsexpSAJi2vM5FH5eP+ODsfRIWBgZSVni5uCcxx38YcW
 MoJmX9Ks6I8RM1edpXJUIUPYIJFxaqQXqdlGgq7Gvq81mfBQItUxRO8zEm/QwbGELjikogQx0S/
 uJNKpmkYGdlHs6vQvEDQvRg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

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

