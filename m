Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A523E559A
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462186; cv=none; b=M8vWsYrZuhTWCNOPRQvOYvPMr0PyAQH6kwcFlOmBu8DWKshSymMt303aHDeFKPo/XexgvdDt8/3eHi9gqvkSufwjD+AkFmUV7uIpqcfHbu1ZWVtMSGhB0wgYrYsIa4Orq+MIHOIPi9u+SC6Jh8njhK8K5uaUUN6DCeFQV44ovlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462186; c=relaxed/simple;
	bh=gOA5yml4+Yws9KKNInNvCnm18pOTkkdcEyQ+aZ8d3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6ngIZ29hpbufw4IYbnoOn7Ox2bicyKHnE1Fs/BBuIzmwFIr1B0vQh++HShuUBaR3Jz2NVtUsHyw/71+QaeOaAk4ki2h43ml4WDz8eHZh5maquRLWFnPGYcvffUfbW4zt4rmPY8ypjSl5jEVZeHf1bs/bKiKJPL2a4Y9WuRgbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bHkFrS8M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bHkFrS8M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7f11150cfso4651145ad.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462184; x=1783066984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=bHkFrS8MeYtlGmJLwWpG6IsMJbDZrsLgVCznFNXt+0fE7iT+0aCKIKUlrIru/JLYPi
         Iq9oP2xo9R0rZaGyApsWnHfOua5yl5heAGyE25cAMTWa7UpmDEEsjm2mJZXoXm1+RoJy
         nYkABbOtXTU2A4Z+VOVTqHRwIEoPQxoWyoB5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462184; x=1783066984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xYGUQ3BK82lNxZT2T8m+B+M94mEtALcyUvit8Pk1ycM=;
        b=hsdR+fkn/tPGYABgYmIxBZWE0u/xrN2lDsjT6nyP//i6u3q1yd4fpFsUZj2A63HO3l
         oT6Fu235gAkk2J9BP+bJ5Cv4ITmQG9e/alzXXRKLyb330+ALKtAoqVlGwq1CwbncHjvP
         zk94j+yXKpQwiz16BBKOVDd8LUaLFo8u6S5wYwQcEr8qe4niLSVbGBZm4JvrpFR+xf+J
         7/N2MGxnhZHw2woxJSJCj91q6q0OVW4tNgA2vtBPPArjqbh2OGb/HXKM4Y8IB3BVjGoH
         3RjmeYUvmtfklL8l6TtQJGr4PxUi1ZOjX3F0sOcQYI74Ajll8y/b6jw1+yS7GsY+s/pr
         fgOg==
X-Forwarded-Encrypted: i=1; AHgh+Rp39eYr1F8g8Evvzu5yyZBA+LyE/iWUBag5a6Fs2iVKAyr6YMOeVCubXm/KraNSkTr5o96fQJczjwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyilEXAJDD3AaRVJfAmiJ6HYh9vkAM3CdVO3ZNlAF9SMFdBAJw4
	Yx1kr1eJlJ5En3tsU8xi3GleAJTsa/2INGIGwdlNncfwP/G8SkXeQ8UIj1xIk5AdmOvgShOsLRX
	yhLE=
X-Gm-Gg: AfdE7cnBDLSkFoZKCREt9h5+CduAOZltK/yNXSMnO0H8VqQqaiJQF5rTPCiHlzFQkOJ
	XUI/f0H6mEcgqv2ItEnzhoEOPbcOaNXHIyFSY2qs5ZEAJPDNIA2xyNAbacZ8XgQhZhFyPOuJqdo
	2irTk+8bgaTVpEqFPbzNxyfsOGnDrBzHzmShq6JIzObQVKFFssI/4Ye/dSKzsSig49WA3JizOqb
	9vhGjBp1tvn7x6FSCtaHNHZE0hmddUwOU3odwJTpykBT/OT3c+mVsUAvcz/pU53ZY3OYUpk92El
	o2zXQghwlSJCfu80DcyqCylgDspWklil8GdZ8tbSkpvpsytJpA55c3F8RgI63KjEYgcZs6UJ8EE
	AOkogih1qOxHUOeUgrkGhlQ+Ur8WAd9Lm1Oxl9Ufrc2D+VIOem8T3m34qD+/TNbtNBeMwKIOPEC
	VbFRE07t9VR22TOl4NmDwfFxxsaQmmRdslQde2JOXOOLQvQeyBLMRv+2m/Y5Tg3sB8MvHDVOo=
X-Received: by 2002:a17:902:d2c8:b0:2c7:e823:6834 with SMTP id d9443c01a7336-2c7fc657e3dmr59806355ad.8.1782462184290;
        Fri, 26 Jun 2026 01:23:04 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:03 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: mtu3: condition PHY wakeup for host mode and runtime suspend
Date: Fri, 26 Jun 2026 16:21:52 +0800
Message-ID: <20260626082218.2750459-3-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Host bus activity during gadget mode system suspend can trigger
unexpected system wakeups via interrupts because PHY wakeup is enabled
unconditionally.

Improve the suspend flow by conditioning PHY wakeup setup on
device_may_wakeup() and restricting it to host mode or runtime suspend
to ensure proper wakeup handling in gadget mode.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_plat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..b4f4c776adb9 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -544,7 +544,8 @@ static int mtu3_suspend_common(struct device *dev, pm_message_t msg)
 
 	ssusb_phy_power_off(ssusb);
 	clk_bulk_disable_unprepare(BULK_CLKS_CNT, ssusb->clks);
-	ssusb_wakeup_set(ssusb, true);
+	if (device_may_wakeup(dev) && (ssusb->is_host || PMSG_IS_AUTO(msg)))
+		ssusb_wakeup_set(ssusb, true);
 	return 0;
 
 sleep_err:
-- 
2.55.0.rc0.799.gd6f94ed593-goog

