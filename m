Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364530;
	b=BirRSoKxwmuynhzVPWG/kRKp7tsZP4SRdtp6qHT3QAJgLkUA/MVwTw2kFWBAHMX9fVRA
	 mIexJM3qEuc43Ka0gtK0WcZ+ayYycpgMBnTGsBqQgk15rhhArEtW3UL2thHINdtqUp/vx
	 UEuFz5Dss3upqFX0VCOn5LiP0vJ8bDlrJKXuISJAtKrfJnVDJ+QTyBViuxDfFmUeoAnit
	 CWSeUgvzV83yuxFdAQOm0QfgC0MCDDTlJ1oms6McoLLsPq/UuOW/+dVn7gfHZFt9cUXC6
	 bytx0+Bm30JzpG6Cy2yCBwfBgnGkTPGaEQBuBsty/vPGDOuTvH1t/cETAWjJmHBeW/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364530;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=;
	b=v6fPAT7Jp5F/+CgTIkmUxfhkD+y5OVfXSJU7rpRX2Du1I268DJQJ8tkGEhw+HuYj50cJ
	 1R/QvjWsycN1TKCKi6fV7q+VpUk4HlZ0XV/h4+caeyhF425h+L/NlpBTrndYdxe1wVuKK
	 BMl7fqf5gUWPIVpt8vtAmEkRFY7bfEZEPC37L1aLfjazec6Wq8iwDkJV3Am9VmqB+bucq
	 Uifx/erk/fRyJBLrnzehZPOUd0l4zi90C3JHHjOeKDRQtZS/b4lBEVV5qLiutm+rgS6Xj
	 ioj/b4HZHFhFVBw50SUHAnjwSYaM5QPtY8S8IcZiGXSn3N2mSRQ8NPWlUQRfTccVoHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KjpTvGb/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A962606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KjpTvGb/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED971F00A0F
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794364529;
	bh=/TGkmkl5EXAQoGi2DbHL8eyxYqMYYgybSMdpzQ49ATc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KjpTvGb/4X9mKEH810dOhhaUHOo5iLr8WVxnxqmWYRpJuVVJU2ofYZVL93GJ5cgju
	 saSlTXA5okLlbwFk3Vx248sug+H1celxydL/n8VJ3zCmI6R1kESsERdAVMYN6P9/cq
	 im7CyIwzgDfu/3dZnhOlNWeBR6DVpOANkbo4m+ePKATjzCXWAgUTKachbkzbU/+OoL
	 bOrf4m24aoleTvqhKcsuJRDPbarAzEIKLzm3bkPj3ljzAtlxdUz/fvkF2Qdl3Tikb4
	 wHT23gf6FnFbm94HxmTH1LKmXDLJZvs0qMgaqrT6K+hY5Od4/rNrPoCp/NCo+/U/bZ
	 YjnjAbs9w8euA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acef9307c7so21947501fa.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 18:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFUVRWGyLWCdSO/iWNM0cvbp4Mtu2/y731JzdJMazhgH7+XLkmQXngk7Y5bj/8ZDDmffI7DvidmN1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1cenC9T079X7HGCqQQhKVF157nnpuRn1u9UazBbreyQ1kC37O
	OK1SQHadL/HrEOEkktbZUiqqoDsyIXEudSw4Zxzd4DMNj1X/pEv70qdtPEQOFPXhlUIMOeHMDn1
	qB7r/qAnG4ZlW7xHvGEd3Zwl3xqMNgl4=
X-Received: by 2002:a2e:bc03:0:b0:3a9:9a60:2c47 with SMTP id
 38308e7fff4ca-3ae126ed0f1mr1190701fa.29.1794364528033; Tue, 10 Nov 2026
 18:35:28 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com> <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
In-Reply-To: <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Nov 2026 11:35:15 +0900
X-Gmail-Original-Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
X-Gm-Features: AclHuK9N0O7U9-W_pxCYXlT-RQ5jch4QkX4b2hO5JJ4vf-cajfPSp8p0sSn_nO4
Message-ID: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: aiyengar1990@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> always reach the same host controller. On the Rockchip RK3588, the
> SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> which EHCI root hub port shares a connector with which SuperSpeed port.
>
> The USB core already reads a hub's OF graph, with one graph port per
> downstream port, and uses it for the port connect type. Allow the same
> "ports" node on EHCI controllers, so that a root hub port can be linked
> to its usb-connector node.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++++=
++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 908b02d9175e..9dcba539d60d 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -160,6 +160,19 @@ properties:
>        - host
>        - otg
>
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The root hub's downstream facing ports, linked to the connectors t=
hey
> +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> +      different host controller, which then pairs with the root hub port
> +      through the connector.
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]*$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Root hub port, numbered from 1.
> +

Would this patch covering all HCDs be better?

https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/

Also see Rob's comment about covering the port numbers.

ChenYu

>  required:
>    - compatible
>    - reg
>
> --
> 2.55.0
>
>
>
