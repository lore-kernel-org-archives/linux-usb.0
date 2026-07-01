Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBEA4252DE;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948959; cv=none; b=FhQR/4mQss+s/hjCX6rjjNkTP9klbljEAdBj83pPKgGhfp4YsH0Tf4cZx798cue9qr4ido7v7mhnB6uPa6bO9DMrOH/oieww+ppJX9HcDBZyHVF/GDYWhlrxXBJpczlyr7FrZJzcIx5cdXNrKgzRwbJJ7aqNKm0NfdCdBGDcL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948959; c=relaxed/simple;
	bh=nnGI5Llfx315OSkr3KF85F4G29O47I0rAPMmwlSB0jg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPK/1njKQZsFijq9UUMkOiVz1D8/WjhX8xV2QhodECtt83LFLKJ6kaXLXRrtVAdPSPDZbD8gV+Diosl94YhLxsoMZE8UU8lrQOt0XXlZFuktbbsSQK0qSj8xHJXDS703Gp2ojAciWoxrI46leO1oCirSghZzHLd1+57u+WVGQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fA5gwduv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fA5gwduv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=nnGI5Llfx315OSkr3KF85F4G29O47I0rAPMmwlSB0jg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fA5gwduv4R6PCj6Ok4lDpi6RVT1C3/7Uu/Lw1NASH9nRtG8pqN4lnk0vZ7S2RmBZt
	 20rFSvjQVW6NHCbweNAHvZcQKrQHnpZO3PpICDPYfYwCjMmdln9MT3G/0XTohHpatE
	 BDHk6wl6Xs8IwjZ3dbrkEeUo7m/hr+tx8uSIubtxDCJY2IIDVnU6IFHxoSc5WIij7U
	 vJHG78Z0YHy6YgzHk3zb7aenRptWDzwb74lgouFfDDenojzQkwKpEVR4/igxDa6fKN
	 eXUk2ffd2h0rX+1jt+trsW9F3cFZCcFMsvqDed0IT654Q1+oCo+GK8u75oKY2HmPgK
	 tck9usm8/7wvg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C25C017E35D6;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CA3A9480066; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:58 +0200
Subject: [PATCH v9 20/38] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-20-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nnGI5Llfx315OSkr3KF85F4G29O47I0rAPMmwlSB0jg=;
 b=kA0DAAoB2O7X88g7+poByyZiAGpFpFPInzjXhLNL4pI3uR+HYQuPhnN6adGQreWXl1Kh076J7
 okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PIO/qaoxMP/16M
 cEZhplt5kwN1JyGbK2tJIrSl0vOFds5VTRuaJj+JL+sT2Mkjf8D1URyLZCGjGrflfXuhm+0q21Y
 1ALF9hDW2OB8KewwAmnpqiiQpyng8C4FUxmOgK/1sxoVbLpD2Ynn0HX6rfQX+AcSK3DL6Bxrw1Q
 trDWka1EE5c5TypxhhjjePEappHGkixSRyUTM3Sc71kC/7TcmQQOau7OLVEyw1muJeRkAzhmbTt
 zKSis51m7N+fbAmiDdUJyVbKrlcnq+1EVOug7Xiv4sV4rrb/Ze4C0J6ghw+7WXvZ/B8IFyBJmk2
 zJVDnrJ1XpFZ7+vyj5frByLbOOdAAD60dtQnblDhveeTp/qXLcCQgag5gy+XRc6WAQKdUYyU1yB
 hXLieBJEN2PgsXu9sB6tNzochL4zcV6Q+e7nRbzrzKRxQhriX2bGSBu0MPw+cVwDwzYySjvXf+n
 z9/Uoo62joG3JCYz25aqiXDL5V0chfHUQSTHtKQuL533TjqOQOMZoLAytR/VsRNmK7QckHDd4mA
 eQ2lxrPdwh7AWV+1/rRhlOLBKqPuwnjaqa7ffkX6hzk1q40xigeGT4I8HIenMtc20R4+rL7FSnC
 ZxHk5jblixl1xEl+G23XiAbhKL3l0QOWRlAE5opNarIj3kwXDbhSjH3WXu0I6yU7IFLDG4Q8Fyx
 CfDWx
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8f06bb9b1fcb..eab9e82dbfe4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -626,6 +626,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -637,7 +638,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

