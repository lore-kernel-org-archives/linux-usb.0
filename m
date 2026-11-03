Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693218;
	b=YEWJlLXNOomBLAjQkYt4bP5BH+8zGKEe7+wRQCLeTD98XWoD7bIzf4wzRbNt78cUufVR
	 bGh8iiG5oV/GXEexhritujooZ0LVHvWlTmwSP/X4Rt0CFQjNPC94l5/wzPf8RUOi51ZOR
	 EmegH4Q+j+AmuJNJN5i4l/AAtQHMjiwJDYJsqFlk2seYY/k6Lx0g7IuKftT+XjqGcTyyg
	 udIKWiWhW91yOGHtB+3//VL6ZvXPovZZbbiW6G69w8lEnTzjmA4JNc+DKTsGFIT1VGUn5
	 74ZR/GqD4UfPYn2asTx77ZmsRh3hyVriii1AtUH4tEVZdnA9F3Fi5UFQzXudc1uxX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693218;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=72hKQr30yvvw9qu+sAyRgPtmAEut0OLZbZCclf9Qv3M=;
	b=sn23mtcN/DnZ1sUOj+MfZ37ZzXxHWaphG3TifuEPCV63mYYgM4WqvR4HRWo0ShMsUfiR
	 XgmzE999DgVo7FAC3NXOwBZTkjLVncB1HTHt9D+h3KhtGLlytp7oa0gd5INBBs/ReGrGM
	 mkJzHT7tOvZ/fcCa5V0jcbTV/fkaz9US2i3oHh47KA8MSIPyG9LxaJ6NnarhpbuJLbFXI
	 zGnLLdGE1zrh0JhyBBqXzsdDGzk27vobjiQKJE08nbnfu0o9VqVxE6CGInMKiG8WicDCS
	 wl0zVAWoKuwJaa2T4y2IAMu+ZaHfglIkNRP7H11R8CY0wDNqQVvhpfQbU5GeLXCkUBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRKxF8Ls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97679606A32E;
	Tue,  3 Nov 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRKxF8Ls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B941F000C1;
	Tue,  3 Nov 2026 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793693218;
	bh=72hKQr30yvvw9qu+sAyRgPtmAEut0OLZbZCclf9Qv3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mRKxF8Lsj4N6GcSRPiWnqzm61uFCKmKkIIkRt3jFnLckcthI5nkp7M4Xt7sU0lgm9
	 gHrGImQsM0paEClEO35Yc9STLPbvlzHm8voR0fe79jQNvUJJ4zCAklWJREkr3ecRPH
	 Tsij4IO01s6di/z9eoWjdOIdscMAsxpZpQOTD+ocuV2xug7VIpGIkKDI0BCuyHphqq
	 zSO2LTMW8VeRG7nQxe9JYcXSAJgPflUfNXbsqC5NjS8453g/rQ4aEqH3NOjuXeznHc
	 JVNP044KZRo4cDukI69qAT21KAjfrd7tlhux8kaVJ82oRtfH2WUFaCOWvnn6FOyNQm
	 6G4Ppfc9D3q0w==
Message-ID: <sashiko-outbox-194798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103074929.1971195-4-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <20261103074929.1971195-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:06:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] arm64: dts: cix: usb4/usb5 aliases used to index syscon mode str=
ap bits
- [Medium] usb: cdns3: cdnsp_sky1_probe() returns positive value on invalid=
 ID
- [Low] arm64: dts: cix: invalid simple-bus node name usb-rcsu@91c0300
- [Low] usb: cdns3: cdnsp_sky1_probe() parses undocumented DT properties
- [Low] usb: cdns3: cdnsp_sky1_drd_init() disables clocks before acquiring =
them
- [Low] usb: cdns3: Kconfig help text for USB_CDNSP_SKY1 lists wrong compat=
ible
--

commit f03c94102bbd5a8d24fc4ea8c5c765d7b2a4ab36
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

arm64: dts: cix: Add USB4/USB5 nodes for Sky1

This commit adds the USB4 and USB5 Cadence USBSSP controller nodes wrapped =
in
a shared RCSU simple-bus region for the CIX Sky1 SoC in sky1.dtsi, and
enables both controllers in host mode on the Radxa Orion O6 board.

> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/=
sky1.dtsi
> index 06a311ee14ef8..c10db0ff9af64 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -17,6 +17,11 @@ / {
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> =20
> +	aliases {
> +		usb4 =3D &usb4;
> +		usb5 =3D &usb5;
> +	};

[Severity: Medium]
Are these usb4 and usb5 aliases being used to index hardware mode strap bits
in the S5 syscon?

In drivers/usb/cdns3/cdnsp-sky1.c, cdnsp_sky1_probe() looks up the alias ID
or an undocumented id property and passes it to cdnsp_sky1_set_mode_by_id():

drivers/usb/cdns3/cdnsp-sky1.c:cdnsp_sky1_probe() {
	...
	ret =3D of_alias_get_id(dev->of_node, "usb");
	if (ret =3D=3D -ENODEV) {
		if (device_property_read_u32(dev, "id", &ret))
			ret =3D -ENODEV;
	}
	if (ret < 0 || ret >=3D  SKY1_USB_S5_NUM) {
		dev_err(dev, "get alias failed.\n");
		return ret;
	}
	data->id =3D ret;
	...
}

drivers/usb/cdns3/cdnsp-sky1.c:cdnsp_sky1_set_mode_by_id() {
	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);

	return regmap_update_bits(data->usb_syscon,
				  strap_signals[data->id].offset,
				  GENMASK(strap_signals[data->id].bit + 1,
					  strap_signals[data->id].bit),
				  mode << strap_signals[data->id].bit);
}

Documentation/devicetree/bindings/writing-bindings.rst states that nodes
should not rely on custom aliases or instance ID properties to parameterize
how they act on a syscon, and should instead pass the register or bit offset
cells directly in the cix,usb-syscon phandle arguments.

With the current approach, if a board dts omits the alias (as in the example
in Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml, which also
does not document any alias or id requirement), cdnsp_sky1_probe() fails wi=
th
-ENODEV. Conversely, if a board renumbers its aliases (for example,
usb0 =3D &usb4), cdnsp_sky1_set_mode_by_id() will program the wrong
controller's strap bits in s5_syscon. Also, placing aliases in the SoC dtsi
exposes aliases to disabled nodes on boards that do not enable these
controllers.

Could the syscon register offset and bit position be passed as phandle
arguments in cix,usb-syscon instead of using usb aliases?

[Severity: Medium]
Related to the alias lookup in cdnsp_sky1_probe() shown above, what happens
if the alias ID or id property is greater than or equal to SKY1_USB_S5_NUM?

	if (ret < 0 || ret >=3D  SKY1_USB_S5_NUM) {
		dev_err(dev, "get alias failed.\n");
		return ret;
	}

When ret >=3D SKY1_USB_S5_NUM, does cdnsp_sky1_probe() return a positive
integer to really_probe() instead of a negative errno such as -EINVAL?

> +
>  	cpus {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <0>;
> @@ -606,6 +611,96 @@ mbox_ap2sfh: mailbox@80a0000 {
>  			cix,mbox-dir =3D "tx";
>  		};
> =20
> +		usbss_rcsu: usb-rcsu@91c0300 {
> +			compatible =3D "simple-bus";

[Severity: Low]
Does the node name usb-rcsu@91c0300 pass dtbs_check and dt_binding_check
when paired with compatible =3D "simple-bus"?

The dtschema simple-bus.yaml schema requires nodes with only
compatible =3D "simple-bus" to use a node name matching
^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$. Should this node (and the correspondi=
ng
node in the example in Documentation/devicetree/bindings/usb/cix,sky1-usbss=
p.yaml)
be named bus@91c0300 instead?

> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x00 0x00000000 0x00 0x091c0300 0x00 0x150>,
> +				<0x00 0x091d0000 0x00 0x091d0000 0x00 0x20000>;
> +
> +			usb4: usb@14 {
> +				compatible =3D "cix,sky1-usbssp";

[Severity: Low]
In drivers/usb/cdns3/Kconfig, the help text for config USB_CDNSP_SKY1 says:

	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
	  (device tree compatible cix,sky1-usb3). It enables clocks and resets

Should that help text say cix,sky1-usbssp to match cdns_sky1_of_match,
cix,sky1-usbssp.yaml, and sky1.dtsi?

[Severity: Low]
When cdnsp_sky1_probe() binds to these cix,sky1-usbssp nodes, it also queri=
es
several properties that are not documented in
Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml:

drivers/usb/cdns3/cdnsp-sky1.c:cdnsp_sky1_probe() {
	...
	if (ret =3D=3D -ENODEV) {
		if (device_property_read_u32(dev, "id", &ret))
			ret =3D -ENODEV;
	}
	...
	data->u3_disable =3D device_property_read_bool(dev, "u3-port-disable");
	data->ssp_disable =3D device_property_read_bool(dev, "ssp-disable");
	...
	data->oc_gpio =3D devm_gpiod_get_optional(data->dev, "oc", GPIOD_IN);
	...
}

Because cix,sky1-usbssp.yaml sets unevaluatedProperties: false, any dts usi=
ng
id, u3-port-disable, ssp-disable, or oc-gpios will fail schema validation, =
and
data->oc_gpio is never referenced again after cdnsp_sky1_probe(). Should
these undocumented property reads and the unused oc_gpio handling be removed
from cdnsp_sky1_probe(), or documented in the binding if needed?

[Severity: Low]
Also during probe of these nodes, cdnsp_sky1_probe() calls
cdnsp_sky1_drd_init(), which disables all clocks before enabling them:

drivers/usb/cdns3/cdnsp-sky1.c:cdnsp_sky1_drd_init() {
	int ret =3D 0;

	reset_control_assert(data->reset);
	reset_control_assert(data->preset);
	cdnsp_sky1_clk_disable_all(data->dev);
	ret =3D cdnsp_sky1_clk_enable_all(data->dev);
	...
}

Since data->cix_usb_clks[] is only populated with devm_clk_get() inside
cdnsp_sky1_clk_enable_all(), isn't cdnsp_sky1_clk_disable_all() just calling
clk_disable_unprepare(NULL) on all four uninitialized array entries here?
Should the cdnsp_sky1_clk_disable_all() call in cdnsp_sky1_drd_init() be
dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103074929.1971=
195-1-hongliang.yang@cixtech.com?part=3D3
