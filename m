Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2442883B
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324365; cv=none; b=rvGoixsbMJNxVx2OcfCjo/or1gSrHkT+f+5iRUf3bBdUspZOFwThVexfmjrVgICdmUfoCVpPHUwQva96rs1GPwpUrZ/sJqmvVGhyisSZaT14YDY5ZJZOR0sa3h3LM0txkBCw18WDBGD1q8aQ6di1SDHy9Ihx+a0pOkg8DjRE78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324365; c=relaxed/simple;
	bh=WDEAc+a/SLkgrSJkUe7LKkxiz7rqpJlb0a2xNqjXnFE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=unRyAW3Yp0zCDdt562IKroxmmbjXKBeObesOtDBHVjET0rhp6tNAFYSHbR0jREUlJCFRBUZoyqaUCLMaCFI63ct4fQbLsup1mEFQAkb7T4J3LZpunAMVd4J32mrVHlpI0bfMnS+tw/Ndy9WF0jHVk9a26GWpmAHwHK3HHStqzm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgP00wgp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgP00wgp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so2139085a12.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324362; x=1787929162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=XgP00wgptpWTzQS4mZIO1B8F5epij68Bt6isUbuprd2gXyYEYMHp2kc42POCUqEsJb
         iaQ1Ds5/UoheFW3BCB7GcLHIQRY6lU9hGzLT4Gq7ap03sXqs8ztKzdpoVY1kNjsm8Tw3
         BHkevcqHjs16cfoTck3zJfSkizXL2hTGbnqCvoS+5fqF4qOEEHVZ+2FOzJymUJlf8umC
         Z16XJh+koCx29aGFu53A0J7IcukTewbM1fypYQrpS5PFW7xwwrdIcWB4Roe/QZ5vZ2MR
         NC7kHWeos9vR/jNkb60kPBHMtvlkIOCD7mdijRuqpkXMTLC+87uD/xhbh0I1dcJbCT3H
         iWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324362; x=1787929162;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=JtJ6AUbLek2ZVRbdJEpRLiFr7jaAKduqtYhWxevV1UF9eqD7dtl8PIRmA5Cs5DG7xt
         zPE9wWLCV2jSpISmBRGpoHn/lRPH+UoNfYKE3TZU1dBIUTMTv2L6AXRFb2rWdZELNZZa
         4uwauU3KVJ8F/vteKKluTiLpjVOJctoWLXAI4iz2loNasb/eBV7/IxdMa/d53TTo16Ut
         nA9EqDWpPP78/3BJVBtO/iv87a+LZKQ851HkO2DcR7CcwlbaFGTB4gAHwNHyHVdPRcPR
         8jC3zmHPMqW4ItWAJpnLNRalWQIRIG6eUITumB706YiRgk5qjcORCLAY/ARjhlYZgMpB
         tEHg==
X-Forwarded-Encrypted: i=1; AHgh+RqiaWyLkhVtE0nSKwnfiZ0VLxaapwIfmtxhFFralL9SWrwulbLwqaWF7Y2z9G3BuZjI6XdvbLjpZPg=@vger.kernel.org
X-Gm-Message-State: AFuF++mqq2uqqm8s2Drdq9ijuH1CiiuHr56RglPWY0WCHNiBJKctTHtA
	58bsgzCL9mNIh7DgBa1PTLKxhqc3Ri+oLIX8Kgjl2g83/cd4aK2InB7q
X-Gm-Gg: AR+sD11SiNdrvwTAKbg+/OtLflF6TmzrQWzSOTgRM8DLDga/NPDxzaCD5+X0sC7uVi6
	NHZX0Ia4mwm2E5yq9vJgcpLf8ark5n+N8Ag+ejpiN3EiRnwVbampVCa0iQQvFZ18CzwSIHHK1nx
	AtoRDDzaZDA56Ss9+oZZ4MR4jOiMzLW72KISSDQHkcJ0CcTM0pGSUN6pWRxsObzzK+K2ufokC9U
	msA0xwGJfpGr1gMczjbvETkWoaMxbv1E+O4qSy0ENJwtweXHB1QUTCjAyqHjWuoS2BhYKYxfv5s
	TRkAxI5Og8qT/h819plNz8G38GgzrRfTKaTOfnPXDW0mHqgY5ql+5Or1c06Fi5kalQKakwcaMU9
	X4sRyqb4s7dpdo9OMIsbHkHnph/beNEVdrogFmoVmuQbKbo+0GMB1XHPPUl1t6cQpaZkesOydeY
	9hyeEsVG1wwB9WRP1/kvYVuD0c/PFJyGY+pzqXg3gkbZdxO9jnASjipCzfh7XZ+k+8lnsoExzEW
	2TvIIDfa32L05FVhyYctJ9P/DSU+FTWynBW/rbqbtYe0M66Hcq4w4lVCBJ24kRgDeN9pqsmIEC5
	oBU7RLnCw+SoHg/3jueZMJIV8SHuMjt91i+P8WHoC/GBm6rH
X-Received: by 2002:a05:6402:321a:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a42f216beamr8673257a12.9.1787324362464;
        Fri, 21 Aug 2026 07:59:22 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:21 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: imx8qm: Add USB HSIC support for Apalis
 iMX8
Date: Fri, 21 Aug 2026 16:58:56 +0200
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBniGoC/yXMwQrCMAyA4VcZORtYypDqq4iHLs3WiM7ROBmMv
 vuqO36H/9/AJKsYXJsNsnzV9D1V0KkBTmEaBTVWg2vdufWOMMSIYQ5PNdTX6nGxPpky+o4vzI4
 o0gC1nrMMuv7Pt/thW/qH8Oe3g1J2/bdeCHsAAAA=
X-Change-ID: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

The Apalis iMX8QM/QP routes the second USB controller in HSIC mode to 
the USB hub on the module. Add the HSIC host description for the 
iMX8QM/QP SoCs and enable the HSIC path for the Apalis iMX8 modules.

The HSIC host node is added in the QM/QP specific dtsi to not conflict 
with the address used by usbotg2 on the iMX8DXL variant. Therefore, it
can't be described in the shared iMX8 conn dtsi.

Tested on Apalis iMX8QM with the Apalis eval board.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
      arm64: dts: apalis-imx8: Add USB HSIC support

 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 ++++-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 16 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  | 26 ++++++++++++++++++++++
 6 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
change-id: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

