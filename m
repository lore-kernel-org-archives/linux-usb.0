Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834A4C9563
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324369; cv=none; b=hUXH2IXwzKrPh2LO9HxMGNy42amNUkwmj8Sx3YEqNfojTcZu+I3dpdyALcD84IrAaqDvfLDeR2MFmSNenQA7psqcMRwttVx/foQIMg/Q6LNqH0nUX/XKjFLNafmxYHxKpbcMBp9Y95tUKalA8fxWhqioUD8b2vUPa100CtHQoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324369; c=relaxed/simple;
	bh=MFMnu7MMa0CHJ6IkSia6DPQ5adij+E8bN/z5A2eXBLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/jlMbAFvzqzYdIqZMoeM0ioH3IvE8p/inVQpj3aoRB0SxV18tCe0WG3Bim/FSyFk8SBSTCUFGP+SvZBOxnaxgQDl9rUK6paQUPPrqz6NfIb8yjF2PShAko5iOloCOMutR2fVNU4n9/L1eIo/w+HXIRdZplv5LncxkjUps47OvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B35AVIR1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B35AVIR1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so2374172a12.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324365; x=1787929165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=B35AVIR1rk06bzvqL8mUQhRPFl6dLUlM2u1PxFjwcQ52zXHgLJXiRQa1Y3IIl1q9xG
         wIrEPgGTdT7KFr7c04tg+Css4NQqiyaaT1WoTGHqDC8mB3fE34ZJ2WEOaPOty+cqwfFZ
         dZYZqse4H2yu5BCuzYCInaOSQ6pgg6P/jhtpb6c0e4wbKCvKu9sooTi7RXziy02PXjlE
         ENiDtDyZ8YGuKtKxZXXf5VO+eVd50uPQrxm+3mUBkuLrfs1B1exLUU2X+dhtA7Z+K9Nl
         IFO/b9CBF3KgaT65ABSeC9Llcu+VVhuN7I90m+gWSxBka2rY8pEILLOtMAEP+bDLitI1
         GA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324365; x=1787929165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=ZcPmGNIp1Agr9G5MK3ftKNnQ7Qn7TwQ2ODJAHU64C6cis/Zg1sSxLpz6e7reHwqyr2
         ARer8Ax+1YLOUKhcrCBNFDc1tnFFjEbP+8gwlCboI7qSmhdUGNwFtRwlb6T4LN/1TXz5
         MYnHV2sjGRCFpxOXn/gYRDx1tSvq/kxkzG2AmQbh35R8FlcKnZxS5iT+yHwmR6NM8GVz
         LZhjHgjhZtMYw7SB/NyIMFloHA6VWm3CodcrBC7MKyliEEgq+UjvVDjbiLEWBf47KMd2
         klEvH+JjCfCeyPi6Y9bKXSAC1EOW1xnSDRqkp+9LhRl3GMUGNvj8goVVzd4An7U/mkfQ
         WE1w==
X-Forwarded-Encrypted: i=1; AHgh+RpWbHujTYwtd/IFE7+Xbgxp5oJGGC5MVft6aRyfh/3+gWtPxJ+8BcDnLsNZsJOs6zMSGuB+Or3LP/g=@vger.kernel.org
X-Gm-Message-State: AFuF++ledWhJ7P+5jtdCJQNxJsrCLWhiYfC2EIJfUa9W9V/EmAzXOX9m
	j6+jyELsaWhUgADuGGaiMz7G+si5Ru9UZ1BVyrZIVO/mC18GAxHUMBAz
X-Gm-Gg: AR+sD11qQH58ceOwYw3mO4Gb1XmoAqrptpnil4M4pkSodWNp3DxnAHlI6QPli6rbTBJ
	MjXXPeNjcoD1vv418erb5jgizZNMLRTYCHYiqUlGHKAtHYkvdVFyFW0NGMD5Px7u6AQrIjoQerq
	zap6T30OyONLMUsPpqlaw3tcBH7j12hw7nmRZtaTqBdasC/Motkseis9p+dp9myiW9HFvwh0/Yq
	gcN3Tdg3gsU7ZlTHy65kiXdtsNJ8loUx2GXvxeDT2pUV1n4/P5+CDyiNsD9Lgj7G9tYE84v6Kyy
	MvJ7cnAdLe9q2nd0iVz5t3XGl1LIz5sUV0q+Am4pBRGFHWnNxBTElyLPnddj5rvgAbyYni8OKF1
	Fv7uAUnhxQsEwOyrlHj3Efc/zwNqfz5ObRYqD3qwJ/92FgBOUK+k3ex4b7ikt3AFj3sWIyPIETx
	b4NpmU3YDUnv8CM3TPeivWMFYt+XWEP9BIUtcseDWjC7m2MkkUpbqCtZPZSdksylz3rEI24aUfu
	PMGP3y9+R7ExsFyF/DiWaePsleR1caxhEknEVQMSZAaFGiyifiPtDsiqjgmsSpTlJFBiJdPhnfJ
	7CnhlbujQxS+neCuv60lB5syOCO6N4iQkrkTzw==
X-Received: by 2002:a05:6402:5406:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a42f1bcdb3mr7491043a12.10.1787324364681;
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Fri, 21 Aug 2026 16:58:58 +0200
Subject: [PATCH 2/2] arm64: dts: apalis-imx8: Add USB HSIC support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-2-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable the USB HSIC host path on Apalis iMX8 modules.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi      |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 +++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi      | 16 +++++++++++++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 6f5af37ba9af9..1d4e92f674f87 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -133,7 +133,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 93f485140b20c..68fb2eb8c7e67 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -222,7 +222,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5c86bcee55fb7..baf09624fb27c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -271,7 +271,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 681f24810d52e..64604f91d5673 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -870,7 +870,21 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	pinctrl-names = "idle", "active";
+	pinctrl-0 = <&pinctrl_usb_hsic_idle>;
+	pinctrl-1 = <&pinctrl_usb_hsic_active>;
+	adp-disable;
+	disable-over-current;
+	hnp-disable;
+	srp-disable;
+	status = "disabled";
+};
+
+&usbphynop2 {
+	status = "okay";
+};
 
 /* Apalis USBH4 */
 &usb3_phy {

-- 
2.43.0

