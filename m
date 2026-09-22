Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2569390223
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 02:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045316; cv=none; b=A7PtbQ0p7jJoTxzKlXfCHoC/wgPOOW5lbbRXoS/HxmgtaZySkjz+4PfvE5Q9iQhCxyI4cZRFa2LTwEok4GfEmwtpBqq+wOE99VfPXUYmDScclA/OkpbaQsZRptEI2gTPSrFPXULo2jz0nOHercBMTPaZfhHsCWD3LM8haNOlYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045316; c=relaxed/simple;
	bh=stmJOODU+Gnhhw3HiNjW7TxChO7ziDyF3KPhjuQ4+XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAohKz72F+yOoNlmS80e4NGsIK5T9MWDsE8G3vzrbcMkdC8cIvGpWHmpIS2iC4BsPozzuQmdRsnoQPjkrVhw4VbcDznvVPmP0x9IF3X4h+rXboIiTyajFT2eGv3YVLw2GvROEZdKoIJIHMvB/8u5fD2V4/B4TUFHHI3TDH4OgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3Eo3Wda; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3Eo3Wda"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so33194205ad.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 19:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045314; x=1790650114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26rOLZ6VAdNb1QMWubw0rV33TxsyOkNQWkVFzg0YEAw=;
        b=h3Eo3WdaF41QW4/183DmG5ceX5mLNuuJjV7+t7zkBFa9ndGjsBU+eJtOKnUYpK3dS/
         FRKnQyj22Yenvy2DhNlf6U2UDASw3uqISP5gn90zvykTTl4dkxTVRgqJps+/Fad1NJk3
         fH0b7EJDYgBdNbnpXG+8r6SnYbNt5+M98muPsArxymyvoxc+/4O4BzHN7axg+xP04XsZ
         vWp0KM7HDf7zmyKDgmc0M+VFMzjr+yHgWP46U9dD493spzgNE6yD9rmAlCSotEEk1wph
         IxVnjpfH7eE6iPJfQilkpCYpBTr1hUvWTcj8bi8/EVDQYQ144+KYZL7VfrigO+TJfZ6f
         pPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045314; x=1790650114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26rOLZ6VAdNb1QMWubw0rV33TxsyOkNQWkVFzg0YEAw=;
        b=L1GV4xOv29HqTytknP9fFmAJZKZEoddLZbo5gzqJfKMLzujvmAVqm4jgTsT7uYyKfV
         NCkcne3sOQnaab+fhCRLEJuCDnRdPnXeCgZOI16De35F5b38kLbqAzv84OGrV2ifJyzJ
         YI3Pbt6W9G9hjetj6TiBgVIn7Wp8q52zaOySSGsCq3pciZOYg6nJ3n3GfBUYFbNja+8X
         HwWpcU1bQ90d8jmltpkAFrnaR/E0nfFnXXyprFFFwtRX+02zL6iAw5LrEF/1mftQhLgC
         wXzCCAnC0TANBvcMhBQ74KXmf1Rd3ZxrlAm+OPmZzKjSHOUcXnGCtLUOw33s1JYCO529
         Kt6A==
X-Forwarded-Encrypted: i=1; AKwUvBx3yg2FqI6D0gbR2JPVPbXFTBBc3Lp9diSkUOC4FjwXEXUuLK+BEZOzhHNLJygB1uYl6OloFCWviKA=@vger.kernel.org
X-Gm-Message-State: AFuF++nbj5YjomMU1nDS7xIlOyNgnpSgHnvS0ykf/ViMPXLLXoWrWGKa
	S8Ahq+KDDu3/24PKcp5dM+nd1k3a9d0d/iyCg+/+TP7oZIDzH+NP6q9R
X-Gm-Gg: AYBFou3fWDI2QLJ8pBK7vSsG4o8b4UWQD3/vOmoYp8oCkbK6aSFnxyZkl+WhXWP995N
	I2OVV22Gs7gZJMLE09W0l8tvdDDhOnCw6p72Ox1vQg2dyLSx4STy42VNlmpK0RqwfU5Zi0yH457
	OnNLeuI+Jl3235YnaPw5pwqxYxStTfFfQK3E3s3g+FrgYNa7YgdmnjiaOWWx7x9RnqvqetPJEk6
	PjAg3FjpIarJmMbVop/tESLzpWcKaYWdRpagtsq8soPqjD7X9nsxNKYTw3McfEidKZOgs5fRuAZ
	jFYJZ5GB6gkwgSmHuAAZzsNhvj9x0vxs++Zc8+2rnkx/RWEzWORSM3d2LoNHVZ3SHmSoEdvjn6V
	kSB9ikwgt/NGlu/0xbLOYAecYgItX23G5B2mZlowxYBsL1qo1B+lLSqt42sVCOYE4K3tgi9H0rs
	gcuAuW1X3jlXFrLaWi96lhGN9blPIIDQPnWGeliyRiRFkd9cmQINeYvuhWMlqVeDVoOHBzjQ==
X-Received: by 2002:a17:902:c402:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2ddb1b7a04cmr194077855ad.8.1790045313882;
        Mon, 21 Sep 2026 19:48:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d06808csm1648645ad.83.2026.09.21.19.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 4/5] usb: dwc3: core: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:19 +0800
Message-ID: <20260922024724.191412-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..6d253810c71f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1588,7 +1588,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
 		if (IS_ERR(dwc->usb2_generic_phy[i])) {
 			ret = PTR_ERR(dwc->usb2_generic_phy[i]);
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dwc->usb2_generic_phy[i] = NULL;
 			else
 				return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
@@ -1605,7 +1605,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
 		if (IS_ERR(dwc->usb3_generic_phy[i])) {
 			ret = PTR_ERR(dwc->usb3_generic_phy[i]);
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dwc->usb3_generic_phy[i] = NULL;
 			else
 				return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
-- 
2.55.0

