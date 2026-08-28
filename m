Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747332E737E
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933268; cv=pass; b=XDiqBv10vbk5ihqxZXY7TcIurR1e11FjgpMjAC20kAipE1W8hEaS+ym3m+TNQzVZoxeXA8QzHE1xc1Xiuw8DbuXtgrZctzOXGgQ+KFlBnmVli4c3e1mfMsGIs3p3K9mlsb+pUKb1/tFCVeGQmcfhcePgL83NtICUPmgj/JuzZbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933268; c=relaxed/simple;
	bh=2x+UF8n18sT4+9jyjBtfMLA3LNRKOdoX1PP1AnaWW3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txzDTyuwGkuVlZDuAtI0sYe2sTDCJgx4wJr6mhobwMkMYCbVme1+cBPr+y7348yB0EV/YYjDnS27vKH5dLEtmVPLIHgzulcBolF/GgoQTJVbHIDbOcrf+808csiVIhCzFf/n6V2hRolBJYRMBvicAAloZq5OQBeiZx5WWewGF1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2569aa5116so69652666b.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 09:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787933265; cv=none;
        d=google.com; s=arc-20260327;
        b=TPPovAkCOCulvUcS12N9t8+FR6OtAAQjA+7d8E9WzeQZrZuQmxKccU+eQpGH3nMZtb
         zQApUFlkzzgmpbgyepLBzdb88qQ3S41epyc/t4Tqti+LPEwJw2cahI2bgTRaW866AFHJ
         m6P3I49UQyyR6IwnmVf8gPZrPtptwHnM9xPq3L8EPJqyMBNw8JTJd4KgbeVXWtp0BhgJ
         FcXGk0q4OLUpiZ3EJAxDD8oL35nCFNiYK4is5MLyyqP/cywGI6rxPAGnl4GFx3/wl1sR
         9aO/yLiDGlu7v3mtpwc/KxU8Opo1QMcQF6ILkYVoedKDOlVP4bz9stdt9G++z7NXASNN
         IR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        fh=kzT/b9isiKPt86xSxyabgw9Emd0FttkCE8bm2mYQ8Ho=;
        b=Hz/yOR2nKGj3Vcos0/2Srj+2pbYnicWeQyGarvhmUjZwTcMd/WCqiuX+vYkTHpn+S2
         9O7MgFKtLC7nDR+bm0TlzlySSMQXFqdYzhmBR6/uTWmkPPb02fesCgXjssV5+s/ORbkD
         1Nm1rZ3vd7iSD5Fxaw2tJct/ZNdOOLBA3MB9mqQt5YTl+qYfkYCHQpWlT6aoqNL4YdCP
         c2EbVVtfB3tW8wA0CP34vjwKNnltWzWlkeDL+mq+uqRnKXqcaleWWeRiGZ4YOFfMfqJf
         Yn+PZEXvjlrfRQ+gLEqAB5musGv9YkYyte1mX18TNsSeYWRi4YbpjjeH3xDZNH8oDsLe
         PdhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933265; x=1788538065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sRHrsFM0ReOg77NeIRd8xGTZ74lCBqKLjN6+GHojJo=;
        b=ANApXX4eatTjaeV0o2RqUf+j0fsBljwoHdfK6ndYMAANqycWQgolxsLl8Ar1rMccfe
         wqL8TVOwILlOkrsDPQqV4OUR/RnhKCT1TsbFrMGSBINrtIDcz8Z23iXH5bS/ujBN2zL6
         rCyhHpct9W4fCjp87Dzymb5HcDs/Vk/H/bJE1+4dXFfTSE0NLdm7nBb/cGrQeEJTH+oE
         QFWwD1i50XIVphEkA+B9WTiy3JjY1XrofnFvNLL/WFtr4IL5S8/A4g7O8+4BnxQ/5Dki
         8TyKWm/sWrILDDFubZ1j41rYSjU2HALZQThoxZji+RNsuKKBmw1CC8TFDQahzIx3zGXw
         kskA==
X-Forwarded-Encrypted: i=1; AHgh+Rryw1akgLL/nSeNOG1C5DOGDWRWeiOdIJYBu8pcWEpN2JhfdpZlqkslE89tqTFfO5hH/3uZvRUq4H8=@vger.kernel.org
X-Gm-Message-State: AFuF++k1VUqchZ2XJ3GfDIUK3udu3+vdEESPJGCogSyZKfF3wjgMA0p5
	1MCUnaYh2IbkDpdJsC87HHnnf2mg/nAmPFZSUI+VVv3tHlfjMxCP3MxsPMM+TH15g3vmEyZ9Lhy
	brgaeWHsHJ6eHmSTI5th/T+biwj4+TtZtmrezo2RRz/JQLfzOJjWF4niknt22CQ==
X-Gm-Gg: AR+sD10BDikseFm2ZkSdQpPf1BmDnU4QmpthA4MnlVICcmb299wKpGA1x4qRnQTSMCr
	4i9ed9dyGslqwd02UIDV1KrGKkQQNwhj+W+dX+G4A/DcB6XEIyrBKlclAp+QGPqOPCeCpCcndto
	gHvDNkNcrHQhvWNVLsvEuJxjaIAed4mcyqOQJDKeNGtCDHLpfK2OI/9a6Ss1fpWll66Yziu4aVD
	sKX9OvDf1Q2JNnT5E5Vn5jYphNG8KuGm/H0je85vIl658h1WWsGXgKUxSudPLscC6fCNTOHyE6B
	rmO+lnNUU3nFbScBZssctlVHeatCqDbbjHl96dAOX1+FtdDRQ2tJqJ3rRz4DLOQCqFvNljnUd8m
	4nC4=
X-Received: by 2002:a17:907:3d44:b0:c25:5faf:b216 with SMTP id
 a640c23a62f3a-c256dbc488dmr75904866b.4.1787933264392; Fri, 28 Aug 2026
 09:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org> <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
In-Reply-To: <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
From: Matt Eaton <linux@divinehawk.com>
Date: Fri, 28 Aug 2026 18:07:32 +0200
X-Gm-Features: AcwNN1X_eUImfA2GusjfdVKVq99gGElh74I2ER8bxKyHTDCnL8d6gf7e81RmkvY
Message-ID: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/08/2026 15:18, Matt Eaton wrote:
> > On Fri, Aug 28, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
> >>> From: Matt Eaton <linux@divinehawk.com>
> >>>
> >>> Document the xhci-no-soft-retry-quirk property, added in the
> >>> following patch.
> >>>
> >>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
> >>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
> >>> accepts it there.
> >>
> >> I do not understand how this sentence is relevant. Please describe the
> >> hardware needing this.
> >
> > I came across this while porting the UniFi Travel Router (IPQ4018),
> > the stock Qualcomm kernel is 4.4.60 which predates the soft retry
> > code. The command ring hangs if you disconnect the device while it's
> > transmitting. Reproducible consistently when using USB to tether to a
> > phone.
> >
> >>>
> >>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Do=
cumentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> index 4238ae896ef6..5d67a41658f7 100644
> >>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> >>> @@ -25,6 +25,10 @@ properties:
> >>>      description: Set if the controller has broken port disable mecha=
nism
> >>>      type: boolean
> >>>
> >>> +  xhci-no-soft-retry-quirk:
> >>> +    description: Set if the controller cannot perform xHCI Soft Retr=
y correctly
> >>
> >> Why isn't this implied by compatible? Looks like controller's property=
.
> >
> > The xhci device is created by dwc3 core as a child device, and so
> > xhci_plat_probe() is used. I think a DT property is the right
> > approach, similar to quirk-broken-port-ped, but to set
> > XHCI_NO_SOFT_RETRY.
>
> Linux driver behavior should not matter here. DT property for telling
> Linux what to do is not the right approach. As I said, it's implied by
> compatible unless you bring hardware reasons why it is not. Driver
> reasons don't matter.

Will rework without DT property. Appreciate the feedback!

Best,
Matt
