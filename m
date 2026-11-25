Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565333;
	b=jHpD9CG4i1eUhdEVvm4q+6EkgC23S7/OHwMpnLHba5p9X6nrdza00CLYk9dJsxTClEol
	 qQ7cgMrGgWcwUDU0mDEzy6LvrtxgKdcZhL+odw3TFwDGVF8I1t8b5gVWU73dgDmIiA4bG
	 O51z1Ksa/mrDLPxIvDBkUGOlphsoJYE4o2qVj2y6SbXJI2NDS5PNHEgOyX7hddrTEe4UQ
	 C27j148Td+V9v9AAhE6cw9ZayLJHsnYDgACNfIIdc7c7sHmKRMK9hoOQ71Cc4ue0zy6aD
	 EHFd4FDdbHvwJdKuhZz51E2Blugehy6tzvYlAFZRLsaKuEIBG6nSA5FGe63mBmB84Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565333;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JWO5eOPOWxAZPbt93E7PWjAf1XN4ASjz7QmgH9tcpEc=;
	b=lbgCdpEdyMrpz8EcpLeoi7RK6hceB5jwYgpX4Dc1Zpt8N2bbaxYs9hBpV7Mad7uQ7sNe
	 DgtkbJR2phpTqQwJZTa1RyeAUWAFb5upqS31IDxPrHb6fkMjPhzJ8YZGGrQQ539SQ39NW
	 sADcsU0T1fO3rL6TH22LplWc3ZqJ7S2B0NZD43Oz3drEOLcUOxagZR2oFfA+MFmAlUCPz
	 L/DlrtWG8wcijJg/Q/EQf1tj2CYed/B/Rq1GxH0dufwUQm4sq9Utm9PCNjMo5tGEP95/w
	 Mp4SxOMb4U9cbaIu4QhfrtghKbR+jPiUJAV0uCHXFRAk/9xe+GnwQy+DsXZy+OS3Zxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB5606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 00:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=RN0C6Ro7
DKIM-Signature: a=rsa-sha256; b=RN0C6Ro7mR3xUBlTXWHMW8JzTNvfK1fed5xacdf71IeJEJwD3NWiUDgYMAhQp03XnNzPUO8oIKZAE3DwICH3FqBFfIMReUZPT/8RlV/qw8UBDW+4p/6iu/cxDyMK/21KDinJKBDaXxUEnuRXbL2GJ/+pJ62PvN5j3+1am3bJJpyWnOSe7UsfUlGuEErYZE1gI2GIWP/9J9+nuC4PrwKgGO1UU0Cdoy1TjbCN/13uMwHsNfTwoauw+t4u1EQoxgZMYdH4l0IdFQ2kc+C0dL3rGcb3EvvMUq6lyN7gIne+5lSu5TDMAK5EpABZ3GfHW3KOk41jJKMu9AKT/SIdxqu4Pw==; s=purelymail2; d=purelymail.com; v=1; bh=Z5AUULqU4STKqrKUgodGKeg+HOQYh1gNqO/mS1n3Tic=; h=Feedback-ID:Received:Message-ID:Date:Subject:To:From;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1592599783;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 00:06:31 +0000 (UTC)
Message-ID: <9bc95b2c-9b63-4b2a-b692-287e9cbe7d67@mentallysanemainliners.org>
Date: Wed, 25 Nov 2026 00:06:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add USB support to Exynos7885
To: David Virag <virag.david003@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Language: en-US
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/11/2026 09:22, David Virag wrote:
> This set of patches adds support for USB on the Exynos7885 SoC.
>   
> The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
> PHY that theoretically supports USB3 SuperSpeed, but is not implemented
> in any known device. The vendor kernel also stubs out USB3 functions, so
> we do not support it.
>
> This is a v2 of a previous set [1], which was split into a clk patchset
> I did submit back in 2024 and eventually it got applied, and this set,
> which I never ended up submitting until now.
>
> This version fixes some things noted by Krzysztof Kozlowski, and also
> contains a change made by Umer Uddin, as he recently tried to resubmit
> my old patches from github [2], fixing some things up, but missing the
> previous remarks.
>
> [1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
> [2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/
>
> Changes in v2:
> - Clk changes not included as they are already applied
> - Add Reviewed-by: tags where appropriate
> - Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
> - Use unsigned long for set_ref_clk_rate
> - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
>    error.
> - Keep dt nodes ordered by unit address.
>
> David Virag (5):
>    dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
>    dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
>    phy: exynos5-usbdrd: support Exynos7885 USB PHY
>    arm64: dts: exynos: Enable USB in Exynos7885
>    arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
>
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
>   .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
>   .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
>   arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
>   drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
>   include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
>   6 files changed, 90 insertions(+)
>
>
> base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a

Thank you for submitting the fixed work. All works on gta3xllte.


Tested-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>


Best regards,

Umer

