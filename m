Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843137;
	b=ltosc/qUInOC08ynaKzahSk/CTFcRUkBb8HKZixhiihpRsHtfQaY0aTR5EdCrk3mfnrP
	 HlYcBcIgRoQML0IDcTwrOR4hAURK1MZ4b6YoTYPUF6Atuc23ukNGfVkKELaA3wiNWv+/S
	 GjY0o+mncV3boByBXULJ6/c4GTQ7RB7lQrYyEPe+brAzTP3uivG1mrVzTK7Jjz7pdh9Ic
	 u8TifuhTcXMuzHbbFvP3QyPycH9llFYHmH22AlQFTAlZ5sno0DfNZFASI7mGRHZwmaR4K
	 LfdwgiyhdCfmbCdcbafAWJ4uA/gxfFRpN33iALiqZZ53ypX/wK1sBHZOj3NI0f4bfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EwqanC4M//urKrhnu/RwabK4F7B0Lv2lUKD040FjrcM=;
	b=uQXX++MM29QGzSA4NIJz2F4CMzLMJSNeV+6dUSvMfLBiEnb/vM1otxmRTkvM1vO5nG6B
	 9oHeKWlqEMLs2SgYwCSI0VcoIWMxN/TXBLmNI/R/KMJUbjK5NvKYbe/KdYvp/eNYbPdrs
	 nUcWnyC9yfkL3GhldDGhtGOYiIo10TU1b9+6heGMFQvHQ7nfuZ5d27dm8jQF5rYQQdEIc
	 lGa/YHWG4IHGbiRIJcRhuzFhT4mz3n0nadEvgmVk1EeXfPI2J48u9KX6anro+3x3jBSO5
	 /OY+GbQX1rymmR4qhr0Km8fJHh69DNUsRuyzhLXAKK3KdV+IZ6hx8zWbXqQbodskUmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lh2wdXML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF5C606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lh2wdXML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54E81F000C4;
	Mon, 16 Nov 2026 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843136;
	bh=EwqanC4M//urKrhnu/RwabK4F7B0Lv2lUKD040FjrcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lh2wdXMLoqvKLR53O/h0SRa/DnCPL2qWL8C+9qcQaDGaPCX267Pc9s1xtKzYbz/Bw
	 rpydxgmH4h/8zN7XYzaVw1sT3MV4vtOw8t5zXfbftx4pqjNqro1Zkieo8JGFuKyFyM
	 XtxUNDarrXAIMlrFxe9fWp6AfAUiGa6ALD/DcS2bSdC5NNzlBnhLwMyekE2oNN96ym
	 AlooxawwU4gklLEdwPcW2PfTjLVm3r27FbvK7TkkfsXolVDan1B7qHr80kq512284U
	 Bxo5Vj+nYfIQqBAgOrsh/zAoxrzSgbYJHyhZ31JtGFYakvL1ocEOWrvM9/1BrkiyMg
	 IN2IPBCVun/Jg==
Message-ID: <sashiko-outbox-217285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] dt-bindings: usb: tegra-xudc: Add Tegra238
 XUDC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-3-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-3-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:32:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a compatible string for the Tegra238 XUDC device. The Tegra238 XUDC
> is similar to that found on the Tegra234 device but only supports 3 USB2
> and 3 USB3 PHYs compared to the 4 USB2 and 4 USB3 PHYs on the Tegra234.
> The XUDC binding only defines which of the available PHYs is used by the
> XUDC controller and the Tegra XUSB pad controller binding [0] defines
> the PHYs that are available.
>=20
> Unlike the other supported SoCs, Tegra238 controls the XUDC resets
> directly instead of using power domains. Describe and require the
> device and SuperSpeed resets for Tegra238, and keep power domains
> required for the other SoCs.
>=20
> [0] Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D3

