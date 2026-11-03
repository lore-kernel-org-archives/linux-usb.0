Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704590;
	b=BJiVsg6KxCa6uzxconSYFHFAfSVC4+GCiUdOM4AuSkhkvPxfJLzl7D13igQIKT++2l3z
	 GjCYE2DkkZVUapjtVIayVw8HqydC6bINvVzkMQCoNcOMgo/FrVUbNZvf0eGhYRa0tqIAq
	 VERJTIX9MpusGtjZUdHROCsOWZI7eIDGiP9N5PfmDeczYbs/ddZwCNtRxrWBZ2SsC/Agx
	 ixpOugQhsXNv9RQgK4SKI5aYH9z2tpuXraTfMV8VT6uMEAN09oMhWhBBnklumL6FrXaEp
	 V2LKiE6KVCIfgG5J8U8ud5yuYMs1kOY2Tm4sRU1fFfLx0XtTrY4Uo1DB5r+/6wahW7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704590;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=MdcImZfmP7xvfy8O55O9UVy0YpebqA7j/xs36t95j+c=;
	b=T+ozSSuW2fKqqHKoac0mqMpw7KSE/hTW4lfSfYrZQw20HqgyPLWw4PtJuDq/7ZfsJygi
	 Nz/FXD09jP3ISF4JnkcR714ic2/H/U9u7UMYOb9mlP8IuZM+T9ZPtCbF4YMXUkWdOYDGa
	 tHL/7/73ravcq9qem8jZuKuxqJT2ezF60JYaYH2oXi+XgAbn9VoFbFrNDQ/vG6hsoBF34
	 WXX/nJJeQip9HKCkpkSlr+XCOxA83PCGr72QfcTrumL+nsLhPhkJlJhZFD+cEQawzm67n
	 boNWpwZjhi0iQfcHlW9zBSrn65meNgQrBN30u3HGxwTRkYyCzIzfdBHNbiR6ATfzvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=KIOQAVK6;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAFA606BA77;
	Tue,  3 Nov 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEAFA606BA77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=KIOQAVK6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MdcImZfmP7xvfy8O55O9UVy0YpebqA7j/xs36t95j+c=; b=KIOQAVK6C4zOx7s/9SES+d6yND
	TZVBFWp2mqt3UosOtMX8rvbhOJQ5lRDlvYSESsF2gxC/JQT0i/Cn5r+3i+8EXUVnNzxay6XWVXpJv
	p9cpNbWUeuPUzNaOJW6FuCn3QusMpLBu0WLS121rp6NXc2Ji8G4R2ZJ1ZbO8KIz4xRF7Q52GSIp71
	lqvxCLMValsPhgx0HsxBmUfUCJQAHYHJ4PkF2XFKK4XIvWcn6DsqNe3jpWw/MQyxip/mzyU1CIRBK
	AvUut4JxJvAx9cnYJqZO4MASW3usZpUVCHVRcyap9XuEuR5iLClYJ/7ilx6azkImGF7G6oO4lCyla
	JUU8ZmWQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xOCV1-0005qO-01;
	Tue, 03 Nov 2026 12:16:19 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xOCV1-0001FT-0Q;
	Tue, 03 Nov 2026 12:16:18 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ti,usb8041: Fold in TI USB8020B
Date: Tue, 03 Nov 2026 12:16:17 +0100
Message-ID: <3928338.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261103095425.3097720-1-wenst@chromium.org>
References: <20261103095425.3097720-1-wenst@chromium.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.6/28173/Tue Nov  3 07:27:52 2026)

Am Dienstag, 3. November 2026, 10:53:29 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chen-Yu Tsai:
> TI USB8020B is another USB 3.0 hub that currently has a separate yet
> similar, albeit more limited binding.
>=20
> Fold the TI USB8020B compatibles into the TI USB8041 binding, thus
> allowing the TI USB8020B to correctly allow downstream ports through
> the common USB hub binding.
>=20
> The requirement of "peer-hub" is relaxed, as done in commit e44297dd2b75
> ("dt-bindings: usb: ti,usb8041: Support nested USB hubs"). The hub chip
> might only have its HighSpeed data lines connected, and thus would not
> have a SuperSpeed peer hub.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Looks good to me:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Cc: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 -------------------
>  .../devicetree/bindings/usb/ti,usb8041.yaml   |  5 +-
>  2 files changed, 4 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Doc=
umentation/devicetree/bindings/usb/ti,usb8020b.yaml
> deleted file mode 100644
> index 61217da8b2f3..000000000000
> --- a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: TI USB8020B USB 3.0 hub controller
> -
> -maintainers:
> -  - Macpaul Lin <macpaul.lin@mediatek.com>
> -
> -allOf:
> -  - $ref: usb-device.yaml#
> -
> -properties:
> -  compatible:
> -    enum:
> -      - usb451,8025
> -      - usb451,8027
> -
> -  reg: true
> -
> -  reset-gpios:
> -    items:
> -      - description: GPIO specifier for GRST# pin.
> -
> -  vdd-supply:
> -    description:
> -      VDD power supply to the hub
> -
> -  peer-hub:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      phandle to the peer hub on the controller.
> -
> -required:
> -  - compatible
> -  - reg
> -  - peer-hub
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/gpio/gpio.h>
> -
> -    usb {
> -        dr_mode =3D "host";
> -        #address-cells =3D <1>;
> -        #size-cells =3D <0>;
> -
> -        /* 2.0 hub on port 1 */
> -        hub_2_0: hub@1 {
> -            compatible =3D "usb451,8027";
> -            reg =3D <1>;
> -            peer-hub =3D <&hub_3_0>;
> -            reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> -            vdd-supply =3D <&usb_hub_fixed_3v3>;
> -        };
> -
> -        /* 3.0 hub on port 2 */
> -        hub_3_0: hub@2 {
> -            compatible =3D "usb451,8025";
> -            reg =3D <2>;
> -            peer-hub =3D <&hub_2_0>;
> -            reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
> -            vdd-supply =3D <&usb_hub_fixed_3v3>;
> -        };
> -    };
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Docu=
mentation/devicetree/bindings/usb/ti,usb8041.yaml
> index 07e13fae640b..74021d13a43a 100644
> --- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -4,10 +4,11 @@
>  $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: TI USB8041 and USB8044 USB 3.0 hub controllers
> +title: TI USB80xx USB 3.0 hub controllers
> =20
>  maintainers:
>    - Alexander Stein <alexander.stein@ew.tq-group.com>
> +  - Macpaul Lin <macpaul.lin@mediatek.com>
> =20
>  allOf:
>    - $ref: usb-device.yaml#
> @@ -16,6 +17,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - usb451,8025
> +      - usb451,8027
>        - usb451,8140
>        - usb451,8142
>        - usb451,8440
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


