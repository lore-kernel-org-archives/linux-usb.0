Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470408;
	b=nRwPffSTf3xEyGUPblCS7Kgkr5Z3KrI2x9FypgspY1rSiNt19CJ6hIwxFd7Ku+bwjfmz
	 3LCXaripYys1aBA6YnXdHVNuxGvITaK4j9Lw9tbia638QH9YpddZ5eBHeOitywxQZShRQ
	 bl1CHMvgpcOnct1z3t2Kgn+1oFtJZ0U1hvoe21ji1F1EnXDteBCH6pQX3DyLhxHU1s+MH
	 X0kYgnyejUfAyjRc1b4kTHSikEC9XVDITOSZEaCZnJOiiHr2O6lDLKE2BBD4lu8mM2ynJ
	 815AcPlQt34+VYsxjjmh2NwaFZ/JAqnv+PJq5NQhC2p7qHz23ZZx1Gx/kAhLmjPzphA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
	b=gQHfhthvINU8mQJp+kfLk8IlHpRICDyR1xnxl2/9+5ctp1LQO8cNzjcpGqM2RRZSIdgb
	 DfJsWNKVghwYPm4u8bjinJ4hu9oJeZsnNlqB7bYgs7+PXmAKy5KkmdM72ZTcHAxQbRrvz
	 1AdH+mTRaqtvtuKXp17CVsgdknJ9ungOBLUYZVSVlPK4YfHdicYmLyTVEoRZeLWius/g/
	 JB6U0RrFVbX8ezjYrnLEo97//1NISy7FaDBe89JxXa6jZO7SAXlRHsb+2/Z6BS86TqMS2
	 XeV0fg9ax9V1SbQXDCPwVipxgUih/g6aYCog5dazTfTVZmuNu0PstjHT5yvYEvtOeUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D28606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIQVWYj8
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso1621851fa.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470406; cv=none;
        d=google.com; s=arc-20260327;
        b=KQAeSMBGGBczWyKrIMF+Vr/Jaz2aRpnKRL7+CD9Id5zjRhG15LLJY0uGHbrSBliIZk
         QSbqeJ+Hw8+EHQJOaITZ0Hukk1d5/hkBP2OnCmde4n/VSdg2jsHNIkAHv4oHUC2kFj58
         cHKPDwPvWRTLfcLefMYl0R0gSFaF+XfeoQF4k9DwSydSHBvKeuAJYiTeYOxeighT40uh
         hCVDj+aHr9v/jr0dlunf0Fgts4KfelB/uZG3HWN2P4wX1FqSxccftXPFcYaxhA9iBgbs
         zIJb90VIcM2QtkrsbKZDfpUnfaPopbb5GuCnmfWnPIZ41S5Xkmh60tWplH00XUVkTK0x
         sN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        fh=kXf3k4zNrfXWkVYMfGOO0Q4npLFxf0aRDL5wOxnLT0M=;
        b=M3f3X1lf9AOKbLUCNqSGNQXv3OYLsQtxOKWnufbNArTyRIOoNmHG1LYzSln2U9p+FD
         KWkp364TlOsglxDwdAqfJWUXd86RdoMkfa5+2+USNA7QAVF09L+tJl0Qq3vvnB1Llkjc
         IUS8ZnR/CA70SZ+DVsNnfyc+v/q0b8uOWF/+r+Pb51Er03U1TS3Qb8Ynn369or3CDsjT
         zmi10rHwgAj0/8SK9RkRSNvoA/PoD6Zb+1ui1dEYhnyAZizZsYp0/M0m1HUTg25ov/BP
         fKMGFplhfAI9IdZHp/sl73DqomcGXW45q98RsWOvsZaGzSg4cHtUPoim8md4GKeo7Lm/
         cxYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794470406; x=1795075206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=GIQVWYj8ZnSahGOCoPVd+jjkA2EUwTBSx8VikobH1zTBEohOrcSWHGBkOfHFsmVLqn
         lL6NTPpr3p5XAMWWnezU8yX+YeaYl2Vy8ylOlqj9Y6r61tntidyK1n1KZTjlCBgkfT0N
         BqLuOCoieu8CjECxn8HCttTDyoyctZ+FqCA958QArwTFRd9gS3+BuW0cr+HV3wDwpoLZ
         OGb2AZcQi2nBlwbOgaV5DQGZsw0+uyMqx1AZs9DUOhZX+Vr+Bj4Tq4m+0TOgabmVRK1v
         pLYBvpSsjNxAASwCn1utxnfQM965iro+s+trIIQv7WFI3v28PbmHbks8VQpVnliK39H/
         nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470406; x=1795075206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjS6O/6wPytjumUu5o8Aw/uVJLfMkPnSofGe6KzvM0o=;
        b=WMnfEL66kbHaZ1p/oA8zhWhDMfLlxqXbpsqYkY0jFWmB8tKw8oEe3/DWEEWJHO23B0
         F4wG2lj1HNVyfv6mFUP0s8N76E23aTfP5ourskDuX2TnjOmCnXFZRsNs9pv+q3vHO2/I
         VmcPs4LDgXrnIhvDRUHbEPD+Hb+ve8JJQ4k/3fQBSo0chvnUMxLAES0+TE71AhKE2B2V
         MD/tjjbGZjOIXawHsHpZVwsRWFydfk5d7XSWy+LCA6QMCZKviD3KHeIkd6Fi1rjnZGJd
         zVAjqP6Q2eldiqKDsgbYxFEbIHHFYoPARoScM682B5/AJ8ox+lua2GuzNDbDi6sEa9f2
         VkVA==
X-Forwarded-Encrypted: i=1; AL+hErG4nQ4jiOJp4aG42AHvRVMkkV7PCb8LebiquuiJMKlFIMTGxmMNgftnVD2tqG3ISYyiNfMAVzsKy6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vKI0wWd8yhaI9A0tCXYybUaEtNca5Q7bHS2eSLq/kDhXWMLUf
	D31hOhVM4zP2+6ypM1ULg/jvxF5Nb2WcF6EbqrOurhpjI2y5E12Ec61llWs6S+LTBtUwsC4vl50
	blf+LTo7upXLhKhk2vdTNWTjviyXDhXw=
X-Gm-Gg: AYBFou3ngJmjrKCO/Dm+NHw9l2cZUC3oV+iolzYMaCP5nFhTWIw4g8B2VR9ZzCauBok
	+g6gm+IYixsaETryHYyx0LAoKXYXJ0uF8WUJn6yO/RsU/Ffl92N0SJ7oxHfA2vNW5eqqu1LH2Ut
	OJ47A/nbRomVlalRvUAtq6p8fIl5TKLjSIv+hRx98su5xiLkZX06u86yshZGOTmfHcWTKnxONO4
	ds6XpfMGhxzXLknraq6rgyVOmzo944uYosQ7HWvNu8+pq6GnrkHh4iNGHZosSNMwrGoiv7MV9Fb
	zwXvW4YYqffVNBTWGGkDNHSUO1I5npo3lpEi3Ltqe3S1kgpU2C021agg77uwPS5JN2tiqbXsccq
	rv/nZ4lHe4hp5PkFYIVxupFQYBcFTivhzuQ819ZA/FE+S6IoqCmmdhmkL9swBGLHwbrQUgpM=
X-Received: by 2002:a05:6512:32ce:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c15d61a7d2mr1922231e87.3.1794470406245; Thu, 12 Nov 2026
 00:00:06 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-1-9307e29d2ed2@gmail.com> <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
In-Reply-To: <CAGb2v65goAuKgYu-849171FGeCxZ8Cq3GUxQLDLaHLbhRTMmqA@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 23:59:55 -0800
X-Gm-Features: AclHuK-RZu7t5oXW3B0hgGonN3UAbxzfPc39DI6ekhiu8UyR_6arhmtUrw5yX_k
Message-ID: <CAEy9hNV9saBWyKxuMR5unmLjzBM2+S7u+FewEevuLV-6yo1ztw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: generic-ehci: Allow describing the
 root hub ports
To: wens@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 11, 2026 at 02:35 UTC, Chen-Yu Tsai wrote:
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.

Yes, yours is better: it covers every host controller, and
generic-ehci.yaml gets it through usb-hcd.yaml. Rob's point about the
port numbers applies to my patch too.

v2 drops this patch and builds on your patch 1 instead. Only the
Orange Pi 5/5B DT patch, which now goes to the Rockchip tree on its
own, needs it; that DT passes dtbs_check with your patch applied, and
also with 'reg' limited to 1 and up as Rob suggested.

The v2 cover has one question for you: patch 1 there looks the graph
ports up by root hub port number, while you have said root hub graph
ports should use the raw xHCI port number. Which one do you want?

Thanks,
Arun

On Tue, Nov 10, 2026 at 6:35=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Nov 10, 2026 at 4:20=E2=80=AFPM Arun Iyengar via B4 Relay
> <devnull+aiyengar1990.gmail.com@kernel.org> wrote:
> >
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The USB 2.0 lines and the SuperSpeed lanes of a USB 3 connector don't
> > always reach the same host controller. On the Rockchip RK3588, the
> > SuperSpeed-only USB 3.0 host 2 (xHCI) is paired on the board with one
> > of the separate USB 2.0 hosts (EHCI/OHCI). Only the device tree knows
> > which EHCI root hub port shares a connector with which SuperSpeed port.
> >
> > The USB core already reads a hub's OF graph, with one graph port per
> > downstream port, and uses it for the port connect type. Allow the same
> > "ports" node on EHCI controllers, so that a root hub port can be linked
> > to its usb-connector node.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 13 +++++++++=
++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/=
Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > index 908b02d9175e..9dcba539d60d 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> > @@ -160,6 +160,19 @@ properties:
> >        - host
> >        - otg
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description:
> > +      The root hub's downstream facing ports, linked to the connectors=
 they
> > +      are wired to. Needed when a connector's SuperSpeed lanes go to a
> > +      different host controller, which then pairs with the root hub po=
rt
> > +      through the connector.
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]*$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Root hub port, numbered from 1.
> > +
>
> Would this patch covering all HCDs be better?
>
> https://lore.kernel.org/all/20261014082037.1774672-2-wenst@chromium.org/
>
> Also see Rob's comment about covering the port numbers.
>
> ChenYu
>
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.55.0
> >
> >
> >
