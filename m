Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15CB4A68B6
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966080; cv=none; b=mttPr1Vy/LENmEaP2APZY6t+sQu9pNEsDbvIRBl75tmPjUv1Z8vbYWoBhdYXZHyA2c4SLLRjAYNiTaOnwFbHkAun4PV88zYa/Zj1jKXA4J4qIGzAf+0CU40/Hzpv04hFkiGI9qT4v97kc0YOxwZdZG6G45QcYNB3Zw9gvedK48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966080; c=relaxed/simple;
	bh=f4Crb3c+dv8KnX89knlqIY/7BdSoK+Hx/YKrvclncpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igIcb4aD+GFli6VRqzjfWJvBrAvrYZWTRFB3HfYIvvwC/tJF8+TCrfYhRncqE6n7woz1JvY61bFn0k2rrTZt+WEpqyNdEYFbdwE9J1pmACOiwzHlH+8Sv6bvmrDCOxkGiV69ubyXi8gi3pWcN29zVpCNY+X/Ti20BxcdpTtEE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YbyIAv97; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YbyIAv97"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso70483a12.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966078; x=1792570878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8YsVbXOdF61Llj8qBDqVp2Fp9mYBbP2iNpUhV0IltE=;
        b=YbyIAv97IqjvLGoQERwaAOsZvgnQuj1InwSqSY8ZDdnH2ekgpXjwCAkBG0DWIm25hP
         aXA+QnP8GZaVYp3jqne2xaiLaOfkSMX73ByMowHfzpcCn4BzxROy9mZ3qSrDM9qgFlT+
         I0UFTtlK/rgA/Hmzd6RnDH/c5ZATYlX0wvWC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966078; x=1792570878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8YsVbXOdF61Llj8qBDqVp2Fp9mYBbP2iNpUhV0IltE=;
        b=aQebV7DKx8DK6Go8kC8gZRhVPJaWp7960GuQeomO5ShkGH9Gj5laPVRkFLbbjVOgkX
         hCekf7IcfitPe9IduX1I0b+c3M/M31sQKv5O7L/dvA2SoaEJe3zOa4oVN3ZLs42OSUGz
         7ubwZrpIDGcBZAXi2a7lNurl/De/aMYAYeq7LDTZeODclSSs5ZT67+OFhHyOjhzOficL
         HRDAyjBf0625EqxG4+ZNGNBjUii1sqDJK3s+MdRSTA0bX+ICw1woNpQlQYcH6fl7qp3s
         WpkLruJlmVfVI/WgtIrkG1x8vD/vR11qRetwDgmzP/FLKXPYxV6dns3Te8EvY8kN21SV
         G1cA==
X-Forwarded-Encrypted: i=1; AKwUvBxuMIHk37qzijL50ij0tgAGDnJtZgQXrpfBrm9EtSETP1VIuJSNKd3+y/DWBs52phXIiaUoQUT0K+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSfIeGQIWcR7GpddSjGwsUYXZZtKPrc4MGYoY85cPQV02M07zS
	8b1o+V8sgfmU5q3krPcw/ChUVkJU7hXvJdFwA6YKXTH0kDsOfzRJS92SjeFKVTuY2Q==
X-Gm-Gg: AYBFou10Yt/f+RIgM6BupAKDHBv93BzUggBkxJmXfA3ZUWWjYfs/1I1bTZbNitVK/99
	1rRylTjYExv3USsIT6F0/CC2DGdWcwo3QQdiD+1J4Qh1KdfviDTIdpg1I/YRP2LZT/izG5kh9jm
	ldmTw5PNQ8ARta988+9wJtSd2oRYiZmFb6sUWtKI+AkZe+1KCI+jMCSWGNAjEKIwpWezkHRu0y1
	4qGAmjMKJr3UNH3fmbHDkysgDNe+nLG+gpbuty/a5mPn7kzKhIP5UrsK7pbVZz9IZkJY9zwy/78
	7Ity3nZeCjcv2RlOCA+53CVQvAVpFq8WJELuFGNFFFQldGUaOX6Ts/Mh7cqh0tISMSEjYYcl+L0
	q+0dCBSzfGZS3xaZu9XzuqXLbZRtA1bIXo/ulnpyDE3pLL0dPJRhck1aqGp1/l2WwVYxYsTOUTS
	LeKw48JOTXqzLgZnBE3MhwYy+DEo7/FfB5Wvj8j8I+SNa692TgFU+WSeMmh/9+i7zYVVi5s/DIP
	0Glnk45rPfqRU7wnwB81bVnslKVtkw1dlZWK8GaQSs1DvaPW2AKYzd4gy58sosh5rlA
X-Received: by 2002:a17:90b:4a45:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-3ab3a2fe791mr12737876a91.6.1791966077891;
        Wed, 14 Oct 2026 01:21:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/2] dt-bindings: usb: downstream host ports for hcd and dwc3
Date: Wed, 14 Oct 2026 16:20:34 +0800
Message-ID: <20261014082037.1774672-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi folks,

I mentioned to a couple people at LPC that the USB host controller
bindings were missing downstream port definitions, and that the ones
used for dwc3 don't align with USB hardware port numbering.

The dwc3 discrepancy was originally noticed by Wei [1] and Konrad [2]
while adapting my M.2 E-key USB support series [3][4] to Qualcomm devices.

Here are the binding changes. If you were CC-ed, then you were listed as
the maintainer of any one of the dwc3 implementations or platforms using
it. So this change would affect you.

Patch 1 adds the "ports" definitions to the common USB host controller
binding. This just follows what is used in usb-hub.yaml. Nothing
special.

Patch 2 "fixes" the port numbering used in the common dwc3 binding. The
dwc3 includes an XHCI for host mode operation, and its port numbering
should follow the common usb-hcd.yaml binding. This clashes with the
existing arbitrary port numbering found in dwc3. I checked all the
big projects, and it seems that only Linux is using them, and it doesn't
care about the numbering anyway.

So while the patches looks small, there are actually 26 other dwc3
implementation bindings that are affected.

And this series currently only has the binding changes. There are
probably close to 500 dts files that need to be fixed as well. I asked
LLM to help me fix the arm64 ones already, and it seemed to do a good
job with some hand holding.

Please have a look. I fully expect there to be a lot of hair pulling.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260731073306.1895428-1-wei.deng@oss.qualcomm.com/
[2] https://lore.kernel.org/all/c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com/
[3] v6: https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/
[4] v9 (latest): https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/


Chen-Yu Tsai (2):
  dt-bindings: usb: hcd: Add downstream USB ports
  dt-bindings: usb: snps,dwc3: Fix downstream port numbering

 .../devicetree/bindings/usb/snps,dwc3-common.yaml      |  4 ++--
 Documentation/devicetree/bindings/usb/usb-hcd.yaml     | 10 +++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.56.0.212.g129ede20d9-goog

