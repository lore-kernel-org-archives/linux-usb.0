Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433D367F5E
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182341; cv=none; b=QkGFpRZCj1R4G7B9GduVER7w7z1VRHTK0ej6/CKSx27pwYnnGvR2irKxRQsqXP5zV8Mvv7+mofUX0i/dIhefJOUhkawgSiZOAkCJPtTTj7m73ECnFTHETt6rpu+x501RV+32U9haXHOf6v7aJ8Hvpf8tvOeDSr4krXQlgzjk4mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182341; c=relaxed/simple;
	bh=vHBCWX3GxVPZ1VL8oCPRLa0fRE+7Pjxzf2banjKJJRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlRFdQNhOtBBZ1OeaBcgyx/M3GAdeQSZghQMAjgwtT0r+FdyCsepdm8uFTop66KFhWdCB+bR0aDDr9Ja2CNx7yoJ1qDmAEHOxd1YVnxDmTQ9ugRBXh0S7d2+0xQr+03mTco5NteSmeXBAeb7uC+lCuMiBZqjZej3uIRIRfwzEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAAXB3gk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAAXB3gk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495773ee3edso249395e9.3
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182338; x=1786787138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=nAAXB3gk+6S7/47Itmm2n6FD/RkAAhSOtFfXmu4ZyV9Hm2cKi2YPdmrt1fgudNauM0
         lw/w1Ob8hXdJi1GBsYclNHmfgk7VmLoi7arl0nvsz3Be+obBca86P1V1ME+KBs0o090B
         ntJ9fA4ZTPH+p94EWC8BgeCWq8oey8Mem4U4Js6xKAkQPkHZw5jAGFFC3eFEFhJ6p/kK
         RicykpDNFp84wvv17NtBiU4BVO4RwD80mQVGrY8wK66Evd9oQcr5ceC1QInLnVpOTGEd
         gAiITMj9LNFaz5u5UXVUY5jutzUAa86c9WhKAxAwhan1/Gjik69BjwFOos6/rtRwU3p4
         9OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182338; x=1786787138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=s8x8i6aJay6seud1/epQDGF8R5kE20O5g1Xl7Qfzug8+vH/gdH8PcvdNedafbNDSDq
         N0zYkH55eXQJ64YmRx6LSEDQaVBppA4kIXYPiTgpVNI1H90oZOUCm1tEsqDVlrETFgzx
         h/OhzgWlHWOuAB00WoJtC+euaocduuN7cXuqkKAp7UxpYHIjBEwWBDUOe3cnDC8q8E1y
         PXMnCc1Y4MfmK3gG51nn1SWMjU9YJpfwGBJGNh1CWZQRWgCVqyPswaFeh/LPW1k1JE/E
         Gvgn3uNNRMmbW4FoBURDWyrCtCTTImOVdjlN68zOqp5JkBars51OUMRi/uj2Ofzqnr4G
         3TVQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKPhlD7Hd3p6gFosgh/mTIHVr7EUWp+32EgXhFujBnwTYvdtbUwmXhwVP75IxSnyFKY4VfDXDLd8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7x+6bIgA/vPDH0sBmPSmin9fn8ELQnGOc4bxtvDP+enlkkVH
	ONZS9bA7xJ8isHnq0KB3He+YoqBLX0hRN4/9PzH3PV/BpDhEWWHVE7CF
X-Gm-Gg: AR+sD11V/LHySPd0h9gBhNNdx1hlq3C1PwdIC4yC0I8JoMoBXYj7ZKvcE1WrFHQOTV4
	q7xvxc7HTmTiB+ENkgQrnltfUOBho5cab9t94AIPfdGMWWyn2XsKjQvgOsRbhDfRv2vVeLGqAWc
	HJvRco/skQh6pDKW6NYcpLiTtm8SNSRo4aBMwXb23Mkr1EXCqPa1zFJlHlnCs/FGJ8i82qBhx1+
	H/Fk92DwKRQyuHfQdcs3K7YErPHwQUle8YiQMJJSbRKZ0LYQTVc6T3Gdx+nPj/ZR3yFOM73ZW2x
	Y8nBEkTwZDd1vzXgXWT4IGcky9OUcZIgIAj86EmPhrry+fltdL5ZlDXlGERvnVCZ3O/3cDBli9H
	rY2zeQkUZF35e0cXh3lBsCYIMWHhSXc6M21726RXCJg35AS55wOU39W6++YwVSuIWRtpB/u1Zda
	b8zgfRInvLlM4SkGWqerGZGM8ecsidGYqrLirjyY+ofistTeni9LX25mDI+g0WCdH8/yzle9VCe
	gtcGbipMki/08Vq/QheAAkkSgJOTJ6t2aFzEerL2ozRgjyS12kI3BLv+obGzIagrmNzzg==
X-Received: by 2002:a05:6000:290a:b0:47f:7526:5a0 with SMTP id ffacd0b85a97d-47fec47628bmr22114967f8f.0.1786182338193;
        Sat, 08 Aug 2026 02:45:38 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm12913518f8f.5.2026.08.08.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:45:37 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Date: Sat,  8 Aug 2026 11:45:18 +0200
Message-ID: <20260808094519.8417-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

The Tested-by tag is at the bottom.  It comes from the same test run
as my reply to the dw-dp v11 cover letter: Orange Pi 5 Plus (RK3588),
drm-misc-next of 2026-08-07, this series and dw-dp v11 on top, plus a
local board DT patch that enables DP Alt Mode on the USB-C connector.
All 35 patches applied without conflicts.

Scope, so that the tag is not read too widely: I exercised the
DisplayPort AltMode path only.  Modes up to 2560x1440@144 are clean at
the stock VOP2 ACLK rate, and 3840x2160@120 works once that clock is
raised - a VOP2 limitation unrelated to this series, which I have
reported in a separate thread.  I did not stress-test USB3 host or
device mode, and I did not run repeated hotplug cycles.

Patch 16/35 ("phy: rockchip: usbdp: Register DP aux bridge") is what
makes dw-dp probe at all on this board; without it the whole rockchip
display subsystem stays down, HDMI outputs included.  The details are
in the dw-dp v11 thread rather than here.

Thanks for the series.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
