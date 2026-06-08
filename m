Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D53AFD1C
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956032; cv=none; b=PU3ErC0AHbzvbK07g9RZvFfhDUg6Y3ZBhypxn8LrmOi4YxMCPmd4Vu1JA0WWEjYwfwTC5+VZBG4A0VOMGxZq5Ueqvwpta3XU+3qzJ3fhzN7SBeBCL3ekKND+RXThyUMsjBsHgAHIp6H5A8IZ3M7b6Ur3Axm/SYOH/jQiWSNjbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956032; c=relaxed/simple;
	bh=IzESvFnhCYn97aXY6nqphhFiilo3F8St0OslnhgQSoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps26VdY7i6wicP7yIiyd60ut6k4ZPVmnRFFiuWFUm7IEVHhtkYeoDa9NfH/NI5+coofIjiCqdTh5K1zTwG3FrfRlND1Xah8GxgPUb0e7wfSv5cURq4YlhYDdWIfWyW5k1SovOAeTshRHGgylMeDDDbw9d49kqSzknYocyeahbHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLwywX4r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLwywX4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA241F00899
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956031;
	bh=jb7RV/qk2bTsC6/KakieWWnU8OYtdu6KJXXSiPsfc+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dLwywX4rpCBTvp/kTBUlFWQpI3TNqkkZGe1n61/yD5xKgJKZqxukIVI4kP3dnCM2g
	 tTwWu55SLH7owV942hstnkIKUTBM63iKWsqYJg1xWeu5QXZI3HiefpP4TcgRH+HinE
	 8qiW724eM4o74Dk0lPmeTV/tiZE9yNIuzn069zb6G4vJqgpCPJebugOhlOWi73GtLC
	 h26QluQG3T5iFfyi3FfLVu6JvXHpr9BAR1q5cFm373jBmWzf0cx0bcVk2tvm8e+0tW
	 cxJB4LsqSYrbdFiiuDKQ86fb2e7hjZA6OK+/zPUtHfN+V2iHoZZL3zbEBf/8oaP31P
	 9t4r0DEoaPQ4g==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bec3f69d343so713736466b.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 15:00:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9gMiBeI7+w8cNOh5zL8M3dYKbi9amZ6Y6hs4Mc56EHLfWMdZZlcra0p76ZBdZGvz74j1S/TLR+ous=@vger.kernel.org
X-Gm-Message-State: AOJu0YynhQJpVfCpWmxREG0x+N69VBEFZxXgK8uH1NOB4YmMuXhfeonQ
	9dktfMAXFFDBCIxEMHvgHDRxD1mO/apnujsVuW78JtOj8LH3TSHYerahOQz65qsxuEfGk9WmN9I
	Dj5iVoXoyZ5N3uEIOAv6SB2wEjWXKlQ==
X-Received: by 2002:a17:906:8a48:b0:bed:6e53:bb25 with SMTP id
 a640c23a62f3a-bf37301d00amr623870466b.40.1780956029611; Mon, 08 Jun 2026
 15:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com> <20260605190638.GA4188454-robh@kernel.org>
 <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
In-Reply-To: <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Jun 2026 17:00:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
X-Gm-Features: AVVi8Cf5LYdQ8Kl5n6k9ZX1XB4T4brKT1oyPdYS4ZmEjCDlhTBk9v9YwV1HuM0Q
Message-ID: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oliver White <oliverjwhite07@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 6:21=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
> > On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
> > > Add the documentation for the 'snps,reinit-phy-on-resume' boolean
> > > property. When set, the DWC3 core will perform a full phy_exit() +
> > > phy_init() cycle on each USB2 PHY during the host-mode fast resume
> > > path. This is needed on platforms where the USB2 PHY power domain
> > > is gated during deep sleep even when device_may_wakeup is true.
> > >
> > > Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> > > ---
> > >  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++=
++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.y=
aml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > index 6c0b8b653824..d12f6ae81ab8 100644
> > > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > > @@ -212,6 +212,16 @@ properties:
> > >        When set, run the SOF/ITP counter based on ref_clk.
> > >      type: boolean
> > >
> > > +  snps,reinit-phy-on-resume:
> > > +    description:
> > > +      When set, the DWC3 will re-initialize the USB2 PHYs during the
> > > +      host-mode fast resume path (device_may_wakeup). Some platforms
> > > +      cut PHY power during deep sleep even when USB wake is enabled,
> > > +      and the standard PHY runtime PM resume is insufficient to rest=
ore
> > > +      the PHY register state. This quirk forces a full phy_exit() +
> > > +      phy_init() cycle on each USB2 PHY.
> > > +    type: boolean
> >
> > This should be implied from a platform specific compatible string.
>
> Platform as in the "root node compatible"?

No, the SoC specific one in the node you are trying to add this property to=
.

Rob
