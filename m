Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AC3F1055
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923102; cv=pass; b=QaVAJ3wOpAF1D0SdqYJjmVLHpoKLJXXEn5ZZnC0ThjOyV3j0RhNIHQtH+S9woP3bXceIEpF6EsU7cw/n5C/inXIyIOsHd9i9XyavQaigjm0RbpVt91TKdxTbeL+ZdjyDAAvi/NiCZve4Eop62hbUbc/4GeDf0caIXsy9xAEbHDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923102; c=relaxed/simple;
	bh=yV3JE0Cnos9PoA68Fc4Q90Ws8HM+nw25XLSK+zxbXSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpLhaRz+w7tF/Ohl9bjkTlIkt/i9l+z5jwFaz6u/mO+7gDPYFQoRUNtY6My+u1snhe11WKCfNzEZrqQywGAKDKuVC5Zv95GXE/hhId9a46z4czPRDcFo3xXbcbJQBx3vV3Na922HW5kV3Viuo6gw14ZLU17c0qHGaAlYZzYquP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2529b3139fso127381666b.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 06:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923099; cv=none;
        d=google.com; s=arc-20260327;
        b=pvnULKzTAUHElfk0nJUEmi6OIqwpIZc/a0qpsw5mxa650kHDd7xiyiSa3byTv8U3nw
         Y1mUk8rC6BEuGcLfD4pkeI3L9JXlyyEks1lesX1PaOWAjNMPq4zEAGr9TivJMoTK9Tjp
         aTpkxSo6WD1/PsBJWO7rgmJC3Pwvl2TH09+fFtoyVyg+lSb1W2AW+0B5qHIcpMQcWxsK
         dHRmnO40FBCaidr64xVXCixaJv6912bObUMKqjAeZI6QBbkJ5i6UWKYN1biftcz6b2Vf
         11VJd9rDN9/WcZP23VH+x+zeF676m1HAV+XfhLTyLUOGnhJD5K6ZdqOIHpCtOgAWHgEg
         gCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        fh=js/QvitGpwsqKXqkAceKw2NRkk52mf+huVCPNgP6kZI=;
        b=pm3ZCPyixBZ1J/r8bKjudzJSNm9Xu99MYrdbVCSqmbBWv8c20ClHB10mODyteKQIT3
         N6Wt05nl25HQ+mZUw7KXPLvAvo3RrZjWpp8qB+oHlqfXuaOH42ckOHpJ8L2IXokq+6As
         Io9BRHYXP29dUQ8Lqe37/05FQybhxG0kscFp9TAd/Gomim/7vD/vm74C0gy947i2n8g0
         48o7f7LKyfwU6Se+8b60Qy5zYKGj88LzjUCL3dpehTGzmYPZiKlkitNeRaa717JKB6SX
         nhofj5heXsfATYpJKg8Fmyh3aXzjlI0ltZpNFRlAA7qTs/+Tt7DAg2OGH1gU8h/fc9zs
         r4OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923099; x=1788527899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFz56wB0GV+0hhESIdSd+taIVyxjjVHt3mnYzY55vbE=;
        b=IBZarJRLRJQfvDkUdBvZp6WDCmUMPr/YdH5GUmZ2q+UNGUCLvMAP1EwrHpeg2VmIWs
         voS1aZ+p1RLpCCrNJwmpD5LfOpWCijwPXfQrvGyq1DLn+cla1WvyJmTRiz5yNTcdDXJl
         uMRSlyYHRYIcpi4KlVgd97aDhnpDdnf4McUKl4GJ2hKRt/wnePJ0NXyYNPKE8SW2hIvL
         Zi5LJel2WDs2zhMD9fTeUJoX0SLWqxEKGrUQruLjfUXpy3i8EdIIXTxv80CwXkjXPAwz
         F14ZZ2GL4FOvgkYmhc8bm8JXLLDZ8kWG+1G5QEbaCJathPF+2LSFT0X7howSDyi3AR0G
         aJzg==
X-Forwarded-Encrypted: i=1; AHgh+Rqayg+AYRjxYpqx249KB3MYIbtI4ssRaz+wfmn985SVw8lUQa4GwbAuj5cfmVPl5Ti9sAQ1EbovFHY=@vger.kernel.org
X-Gm-Message-State: AFuF++lY47YsarkfVshNG9qjk4yoqmjUa8/AZGS2wtyNmkf27dfD3eMP
	/lKPhUb3OXz8PGATkihWe/zrewyQ9mVGzbI+U4ZvMMWlYIBtDDIyw6gkXgrzh/rbtJvfLc2sxk7
	c/C9NFmVm32znrU3BotAh/BqOlm6mHhmugH6hommG
X-Gm-Gg: AR+sD11AWagw8Chx49mHmrgZavpld6FKXG7H8qD6h6rw+zLHve6Z5dJ05g6nxc7+ro7
	5lf3erdWi08TlboMhamPNm3DS4ww/Fr3fpBLB3+3Qx4HwlWdt0aQzfjBVZ4X5Ex/nrVrJg/5Eks
	CI8h79hbdQ/zPlfeCTqwg7kRoih9y4D5Ye04eued+4DRnJWpjg6FBR+uPCr9mSordkNdINqhxqz
	Yq+OnjAUE0r4i849eiIxplQwx9LptWrGjOQivwQAQxqZVHeAR3x/NF+DRlwN2M8n7ZBwM2Ykw3N
	Tpn2MplwJ7D3SyYVCro0FNP6jMTck4vlkOc4M2SkYh/NhLH5/KaeS8S8oyb8LEPFJX3qoVQCcEj
	AZbg=
X-Received: by 2002:a17:907:1b07:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2556fe4518mr453938866b.8.1787923098863; Fri, 28 Aug 2026
 06:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com> <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
In-Reply-To: <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 15:18:07 +0200
X-Gm-Features: AcwNN1UdhBXMcVV342l5oAIhvqQEvxYxIlYwCOo4jCJdj3zhDYTey4YdaXTvReg
Message-ID: <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> > Document the xhci-no-soft-retry-quirk property, added in the
> > following patch.
> >
> > snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> > peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> > accepts it there.
>
> I do not understand how this sentence is relevant. Please describe the
> hardware needing this.

I came across this while porting the UniFi Travel Router (IPQ4018),
the stock Qualcomm kernel is 4.4.60 which predates the soft retry
code. The command ring hangs if you disconnect the device while it's
transmitting. Reproducible consistently when using USB to tether to a
phone.

> >
> > Signed-off-by: Matt Eaton <linux@divinehawk.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Docu=
mentation/devicetree/bindings/usb/usb-xhci.yaml
> > index 4238ae896ef6..5d67a41658f7 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      description: Set if the controller has broken port disable mechani=
sm
> >      type: boolean
> >
> > +  xhci-no-soft-retry-quirk:
> > +    description: Set if the controller cannot perform xHCI Soft Retry =
correctly
>
> Why isn't this implied by compatible? Looks like controller's property.

The xhci device is created by dwc3 core as a child device, and so
xhci_plat_probe() is used. I think a DT property is the right
approach, similar to quirk-broken-port-ped, but to set
XHCI_NO_SOFT_RETRY.

>
> Best regards,
> Krzysztof

Cheers,
Matt Eaton
