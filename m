Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED80233928
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261232; cv=none; b=lqWmwioz2EH4le0coL0HuGj4xzJzcdRcrMoECyTLhqFpvBCRCl3580UpsfReS23M4WkEHsHsuSQDGIxydXcLie+FEIx67b5Sr+o7KrN0U7VoMAt1dTNqch3ViVHXigL8cMd47+N9uSaC5CKobt+EWCiWaN+a5zLGgwBwU0Rolgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261232; c=relaxed/simple;
	bh=f8o/A6U7OoGeCow9Wv3qAA82ZXHwRJiMj5f6rOrMHew=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zoxs0CEi5b7Fy7+MyGrJA55V8UsifTjDAfkJ5GNdc/KK6HCxHCLs+a5xAZDwKFH4/eHtScChYEnMrokI4eOg77LqeJ1WHbvnajRzMMpl6FXA0T2vcyFsXqgTm9WTMvlcfTeqOuCYRmmsso/Vd0Taw5jcrkmbBSWD1qb/t5w8tHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=nJiW+VqX; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="nJiW+VqX"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781261224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuXWeaZUn4HHhcWHF5iQYvYctTIR6OtS7Xwvq7/7gzQ=;
	b=nJiW+VqX35zVJOKKTD3RZfnVhXf37o0na34SuKhiD5lt8l9vWR0CHSOuZR+Ha0sdlnIjU/
	+XAeMLl/FFzWb6Ur0lR4QtjRix/kE2NL+zwkBq3Ym3bvIVGLDiF6ZKcPwBxDL74bhk/tZS
	YqBUrpJ3RfufAvEi+MSAoe3TwDx+GfSmp0uz5FbgkVBSw5HcvuZnwmdvWr3koNvyQGn/SS
	U6mO/OlredwC8eDP9uO9YqU3EuHtQpfIgUFX10tjBIggJcWuWlkKsXdwmQYZE89D/y560N
	8w2ZxsvcHLMt2KVmqR4lauCK3hbXtuoQAykouQkbI8FFOpzweX/kpsByQXZRfg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 12:46:57 +0200
Message-Id: <DJ70EIJ98W7C.2GFDF1LGW816V@cknow-tech.com>
Cc: "Diederik de Haas" <diederik@cknow-tech.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <devicetree@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Fix devices suspend freeze on
 RK3568/RK3566
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Heiko Stuebner" <heiko@sntech.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Geis"
 <pgwipeout@gmail.com>, "Michael Riesch" <michael.riesch@collabora.com>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-3-jonas@kwiboo.se>
In-Reply-To: <20260609154124.445182-3-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT

Hi Jonas,

On Tue Jun 9, 2026 at 5:41 PM CEST, Jonas Karlman wrote:
> The EHCI/OHCI controller depends on clk_usbphy1_480m being enabled, or
> the system may freeze when registers are accessed, i.e. during suspend
> in ohci_suspend().
>
> Add the missing clk_usbphy1_480m clocks reference to EHCI/OHCI
> controllers to ensure the clock is enabled when ECHI/OHCI registers are
> accessed to prevent a system freeze.
>
> Fixes suspend pm_test issue with EHCI/OHCI devices due to the missing
> clk_usbphy1_480m reference and makes following pm_test modes work:
>
>   echo N > /sys/module/printk/parameters/console_suspend
>
>   echo devices > /sys/power/pm_test
>   echo platform > /sys/power/pm_test
>   echo processors > /sys/power/pm_test
>   echo core > /sys/power/pm_test
>
>   echo mem > /sys/power/state

I did quite a few of ``echo mem > /sys/power/state`` while switching betwee=
n
the various pm_test options on my PineTab2.

On my 7.1-rc7 kernel without this patch that resulted at some point in endl=
ess
'rk_iommu' errors and the only way out of that was a hard power down via th=
e
power button.
On my 7.1-rc7 kernel with this patch, I have not been able to trigger such =
an
issue. Over multiple boots.=20

So feel free to include my

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

FTR: I'm still able to trigger resume issues, so more is needed to make my
original tests [1] succeed as well. But I always suspected there were sever=
al
issues at play including the display pipeline.
It looks like this patch fixes at least one of them.

Thanks :-)

Cheers,
  Diederik

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/31265

> Fixes: 91c4c3e06a25 ("arm64: dts: rockchip: add usb2 nodes to rk3568 devi=
ce tree")
> Fixes: 78f7186095db ("arm64: dts: rockchip: rename and sort the rk356x us=
b2 phy handles")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd39..c930a6fd6ea0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -321,44 +321,44 @@ its: msi-controller@fd440000 {
>  	};
> =20
>  	usb_host0_ehci: usb@fd800000 {
> -		compatible =3D "generic-ehci";
> +		compatible =3D "rockchip,rk3568-ehci", "generic-ehci";
>  		reg =3D <0x0 0xfd800000 0x0 0x40000>;
>  		interrupts =3D <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys =3D <&usb2phy1_otg>;
>  		phy-names =3D "usb";
>  		status =3D "disabled";
>  	};
> =20
>  	usb_host0_ohci: usb@fd840000 {
> -		compatible =3D "generic-ohci";
> +		compatible =3D "rockchip,rk3568-ohci", "generic-ohci";
>  		reg =3D <0x0 0xfd840000 0x0 0x40000>;
>  		interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cru HCLK_USB2HOST0>, <&cru HCLK_USB2HOST0_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys =3D <&usb2phy1_otg>;
>  		phy-names =3D "usb";
>  		status =3D "disabled";
>  	};
> =20
>  	usb_host1_ehci: usb@fd880000 {
> -		compatible =3D "generic-ehci";
> +		compatible =3D "rockchip,rk3568-ehci", "generic-ehci";
>  		reg =3D <0x0 0xfd880000 0x0 0x40000>;
>  		interrupts =3D <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys =3D <&usb2phy1_host>;
>  		phy-names =3D "usb";
>  		status =3D "disabled";
>  	};
> =20
>  	usb_host1_ohci: usb@fd8c0000 {
> -		compatible =3D "generic-ohci";
> +		compatible =3D "rockchip,rk3568-ohci", "generic-ohci";
>  		reg =3D <0x0 0xfd8c0000 0x0 0x40000>;
>  		interrupts =3D <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cru HCLK_USB2HOST1>, <&cru HCLK_USB2HOST1_ARB>,
> -			 <&cru PCLK_USB>;
> +			 <&cru PCLK_USB>, <&usb2phy1>;
>  		phys =3D <&usb2phy1_host>;
>  		phy-names =3D "usb";
>  		status =3D "disabled";

