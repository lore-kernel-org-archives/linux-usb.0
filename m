Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345322;
	b=MI326Ir1OJvOlMkCOHjdFnBNqgDfhNZltvsqy9moFVIBAwOzjcbnwyETuydmawsR3lix
	 y98PsRfcXhL4XoT/UdfBXSkAV3mXSoLGPCW+mfxijzrPTrd8vRXj3+8n+zg70oBBSQHxU
	 CKndvC6hiHki9D3UtmykkF0nfmREcGEVqXWqDZDR70ckX0kUi4wSlh62yxzbA7AGdaHf/
	 F/zxF5Twg7gmn/A4L3BZQWn+lxoKOfoRJJLbmCoLfnI9nLq9w75frxxt3ql0tk8L/Ult6
	 a0PR2oitJRkiGeAT3J3cNAUMYZsR7P0cvdI/zw0MagGxU0UjHTEca4YSiHkJcdLP1xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=eGQDuXJVilfIL/aPkC/r/69Soo/YKI4YUt+x6QHWMG86ZtrbDWoQIFk3XNPTVDYqBDb0
	 3J4+uNwdM3V+hDWCI+cORryCN7D3uYKdOioXAhhsRaZjkJ8XiuCHNs9Qp4wsvQ0AUQ6U/
	 uBO4DkMbayQHcgK6Qr6WUvgbjrZFwk4RVcVlU4hftmWCIq+3g2+D+Uk9LizRgprwJ861l
	 E6dpw59PZo/lB5gLqWRvzT747neNO0CMMda83KCNf2F63O8Hyx+EVsw8BZQodWhaIOxx+
	 8qIaIvD0bbfHoqOdvPnUrV/vPwrXvwBT3WK8dv4MNR2ZG41hjg94/f/avwi9TtWtPgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="IKy+T/qh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1D606A321
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IKy+T/qh
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10ac6ab7bso3310907b3.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=BiQSjUFpqPQ28QNuPGnB749+xaJ7sojDkG35a9BzaxZPxpXNQw0gFeGWLgYrB/GRZp
         f6NQciwG29O4NM8J7w81f/DA/HndlorLQJQeG8o6hqV5ZHTytNfj6PLIgxmkUhMWeNIr
         PWz6dS+2bzK+fXtsvNzPvUD1XGR33qWXUVNUgY5XlYwl66lAFaE4eOorGDIH/nfp7asQ
         rdX52QeIewy1bN3V6i0i6g5onas+mPYH+EOHgHuICP9jFtUvWHobTUaqLWcWWMg8Oxo7
         IULYyt0bkQC9jbs+GYvUjPZ0wDlbcHWtj6UY56N95EfowyutLDKswWDeVw+vajkoziAJ
         3Rhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=dH1xiykR18itI+dusUe0cILxwx3HdfBFQI2bJUuBIKQ=;
        b=XsBNvrCmThEbyMunfJdmU15/T/qkuP0fw4yF9QmScs6ycQJBEc5wOinKhVgXIoYSyW
         OywhF2MfQw6tTtQhrddY/GXkP/BQbyEunBCtEhjGnyBCZwSsypr61POi9G+0/LWcQFto
         /lGtJTDUqEk6l/DMyvfdni5f98+zqTOeDstJXPIw5/0oXUUZIU9m7E4VVlVCqd5t2u3V
         mMp/Idsvc8UlSa6Ajf6rPGMjkmRWko3CxIC2ClGMpj3QQ33nrvNaKJfeUQLVxcIRI0qy
         p9NbcFRTxC8I+EaWfyGFL8NBuRXC8to822Uj4BRuD3UzE6PEwaFFoLKXH4nspKwta9g1
         bslw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=IKy+T/qhhIrUOzchV2V4rsBprme/Hu+3Hl6zCa01nFTCsOY9pKmewlMrEn4BQLOwW9
         feJJmNQO23DQ3rGjEzuWcIeZR34xo5NfY4KNRYFVsQwIp9ColIO/GW+PGca/8KtFU+/f
         l1bdJasJc0Tz9mTRQCSooUk0FYHVl951kJDfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=KO/bKUxUiim94LMIEcmUpNfwCchsqu1J3cYAwfXz9bWcI4VQGbo66nBDgADh7ono0x
         mQ89c8T+ztp/uAPGhjzvm4bAkMOJgMgmFloxQeLknkfbnYmfPaHP47PFrcIUNtxApxr6
         WI6qTUgFi+spf5BU3tCCDKwRy1h69KKoS1B++HUGchq4N2GsQQ7dnlkj3pFbKA+R6SnO
         5w2Cb0cBHLqDGZI/KHMI7s4en7EiEn8sEGPvdobiAZQRGBwGgH9duvL+MjNObaac7TSO
         n2o07T9wL7wNcL25L+1nMKv9wUs5JjutGB6f8sRJZpXZUMgzjgW0jCanin+octU9u3dP
         YK1A==
X-Forwarded-Encrypted: i=1; AKwUvBx1IfWpcw/cgU16bQmoHJFkQcILVHTvhCYkeRSPIhcCqYhvSH9puoEUzLfs4xkdd83wi6eeYnNY3TA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIpbWxSgYM7Tliqev2YiPkV5UqKcE/vqMUWxn5hi0waC9Sg6HR
	1ADiUkfE8KtH9CWQ4hECAr3XaaPVQ4FHsWpEw9qQm/BPhBWjV8YgnldC2NdqsQC5MGKuN1rp+Ht
	d9YJEIYohnHnmaf5L4/si9814A6+yCY90Gw7tdNIU
X-Gm-Gg: AYBFou1xLpe0q60VWqp0FhvpwqMivqIthJrfdDvZp8s/7Ep38SGFWWXrGT15oZlsSv0
	YYrChv7ggghMrBocDJeDJkEtpMPoZ54oRN4Rcnx1I9Rjiw62be2tjHYlvn3VlIXl5LpNgCWIta0
	VYHkHQrcW5lVlx582n8IwIBZ3ZlZ7MSuRb90k2yA2uiD39ETliUtcSi22RUXJ1ovvWJ/IOYYesb
	8hBaSh/OIRsi8HjRpoErqUt7AbLfTuqnhEZ3tJvd++mgjJYIdPmvUh2VxOvJTGtANZfP9Pf4D3+
	Rd268sQkSz3+4p8bk19svILYSBmHFrBsobS/2zQBkrVcSc8UBfeINvfSKjMVR5Y22UF7BY2tJ4O
	/oOYiPqmzypwb2h7u453ixyZYRHmyaKhWdwldbzG4F5qpyYcLPv2Cz0NKmNG9cXlxnjw=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
