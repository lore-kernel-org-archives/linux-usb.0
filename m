Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F9499F22;
	Wed, 14 Oct 2026 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966713; cv=none; b=TuHNiLninoLnz/LKSB8o3vw7Lw4tPvnzTDzcsTa0if7w8Yvypj98+Ja3nXYE+vEqoa4hrJJwleDScJlWB5I1OYEQvA0Mnsp8hqH6tLiJzSC2NYlSSyWq50/98KHCqA8EpITldCSTlbVySjZ5KLEScYW4Q203jd9WiH+2EOMw480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966713; c=relaxed/simple;
	bh=t6T0/IE+VbOtvLS2MxCUUG9WhbUtPJFAWm8Rf47UbAo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qnsOdhuF7RcQhVdpGUYeuk0kdV5lgvMH8qq3kEeUBG3AuR2/lI831sx93BEtYEpyi7fINBzSAl3JTwNCkvyI1VBUUShpD7nlxN4EcdIE5pvllaEARfasdXsrWOCmyohJpNaBWloKglRp7Kl+XA32VKbX8NSgVjTnD4WRDaxZWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpOmecjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpOmecjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026671F000FF;
	Wed, 14 Oct 2026 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791966711;
	bh=femQLxGvTMcV5afk19U6TUxPM9LkYx6+V4SrP/g64Gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BpOmecjgRouSlbFzkaYl9WvfsZEYDOWSpsHMN546yfZe8DHx7OlKpmkDd7zhx1Oh7
	 Fu6p2siNvwPnFnwY6EitAdGOuW7UTmeExZqX5gXUCHqBngoUZDydxA274hZUyZPr+p
	 IkXIyV3dSf46shhCVUI3tqgY4qyR4FBwfE8lOuQeelXnJBmYTU/WFIZEJlOokamR1X
	 iVjFfjzypBGkjlyCaTaQbd5b3IOEj62zVQg1AfCKZXd2QimEuMx8M3ropwiXb9T/mi
	 7p7RF9fI4r2X7BrzEXrTZE3VFPwz9A5PqhjAAOLugskvsVMarf8cBU6uI6jwd3HBTd
	 yAAApEeiGLTxA==
Message-ID: <sashiko-outbox-171013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261014082037.1774672-3-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 08:31:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dt-bindings: usb: snps,dwc3: ABI breakage and semantic mismatch fo=
r OF graph ports
--

commit 8b21cb9c9f29433cb69a312829ee4e457fe73ca5
Author: Chen-Yu Tsai <wenst@chromium.org>

dt-bindings: usb: snps,dwc3: Fix downstream port numbering

The DWC3 controller can operate in host mode, and USB downstream ports start
from 1, not 0. This commit reconciles the downstream port numbering with the
common USB host binding by renumbering ports 0 and 1 to 1 and 2, which is
explicitly noted as non-backwards compatible.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..4b6304bd2ec16 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -410,11 +410,11 @@ properties:
>        property is used.
> =20
>      properties:
> -      port@0:
> +      port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: High Speed (HS) data bus.
> =20
> -      port@1:
> +      port@2:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: Super Speed (SS) data bus.

[Severity: High]
Does this change break ABI backwards compatibility for existing in-tree
device trees?

For example, existing in-tree device trees like
arch/arm64/boot/dts/qcom/sm6115.dtsi already define port@0 for HS and
port@1 for SS:

					port@0 {
						reg =3D <0>;

						usb_dwc3_hs: endpoint {
						};
					};

					port@1 {
						reg =3D <1>;

						usb_dwc3_ss: endpoint {
							remote-endpoint =3D <&usb_qmpphy_usb_ss_in>;
						};
					};

These existing device trees will now fail dtbs_check schema validation
because port@0 is no longer valid, and port@1 is documented as High Speed
when existing trees use it for Super Speed.

Furthermore, when the WIP OF graph host mode connections mentioned in the
commit message are merged, will a future kernel attempting to configure
port@1 as the High Speed port functionally break USB host mode on older
DTBs that route port@1 to the Super Speed PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014082037.1774=
672-1-wenst@chromium.org?part=3D2
