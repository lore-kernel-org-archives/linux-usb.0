Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E31FDA61
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973036; cv=pass; b=lbzIXBZCpCciYScmNm9V9aseLZ3JZFCtKLO9B1/g4CEIOyMSefQ5Miuz/OvdyLB9A9Gxo8N4uelVgJHWchAFU4Rqf44L6aYW0UEj4sZ6fzZ/xvZPeeMOWZijmtKGAuq3aGQndzdl3O852oh6VmRkCU7bCjBx5ZQYSnYpYf9eGco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973036; c=relaxed/simple;
	bh=LTP7G2+FpL1LCEYiFsbQFD9nCHZqmwYYze7/kvg9fxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCUJX/Mto1GreaeK+IOUvvW+XdjcRkrpBJqU5dGrUNw2OslqWPf5+sG4XUnM1HWNkkIWIoqmW2CT4Eyf0GFuk+fZPe+xU58YA1IKpOnayYeTbU/n8vi9NhOcN0qPc1cEuAirGUIR5T/BNkFZRDsLJWygqlAVggf2iQcQs+z29Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g1f4pkaZ; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g1f4pkaZ"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679334baa1fso3278262d50.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 03:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973024; cv=none;
        d=google.com; s=arc-20260327;
        b=WCXCy+FipdtPxVMiU7QPcUG+YcCvVssY5Y8Z/lJ7mrWeblRT2p0NUokBkrLRz/AajR
         4KzlhqDhSfmVx2NusQwMl6OgNawQe9CDRWlyqckdNItUt8zx/9+8tZOeisxSE5z8PbFt
         1TaDGhuFRTBJ7MFof7bHxp2ilo3GQA0CAl3AqdCdKmZKvMEMKZK/xS7HR1T3+ti2kGwT
         IQbuMrRIRO+PgrsoPUOUQLRNm3dcOVQxqKuXbhujCKHI1aMYIWc1hNRlD1og6r3Qt8U6
         3zmt6e1CbXmM+vgV3nkSQ6MZvOuQAUeq9tfD53O97YRcArEgjP86Zi4dGwfAK6/ADIzK
         AlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        fh=N8Tpi1ukL8J9LVlCdKWGGueHCM/+j8ChwXkOgpbbsUM=;
        b=Og1lY6n3zYei9Gxi1Ubi4NJlkSUrbVOQLkN3ouwVSMQ1HkO6tn/YWsKKoB0nYvUP3p
         csFwd9W6m5DwyuUf0+9l5x/VPauchoofqCVgNLrz2RAiK4099WUC8TodntRzlSQtr2Mi
         dAArm81pOMKnkewvG/OS56AyADGRLSZjBmj0PDonwQk253t6z2NueB55akQIxQsCSaeF
         7LP5AevamCore+fp4oyxa6KCZIj6ek8xBSRfS04IPICQZvOvwBRqegxW1uFcqnpNyLW1
         5L5rR3cyp7vxGIasKIyO+6BsPWPOQuVkZtPJHISn2WL3KPQ2LZDHiOpf8Xvpb6VhQQmv
         PKTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791973024; x=1792577824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=g1f4pkaZh+JEZvwq0tiPI9MbQey3315XMqT+q25Zf+R4c5TFaJTQus2pwUhWXzJ3me
         vRdPmK+w2hAYfVRjSsjT9OW8VRCGttUoXdjSFuM8sX3Mvoa6qhWZoqx5JEDvz6fCN6Y7
         U8dipcs8q5DfZDpk9h77sL31yTHy29FYp+eC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973024; x=1792577824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=FfXtLc5wI92mmN/984U6tMJXiH3dzN5aQy0B2Px9+MlM0NTuOJs7haV3XrZNN7aymL
         mRUjkKa+NvFm9/TTBzSnWJEYdZ9i/ZmitX19OhMRWp6oTDhNM80ta1p8kmhBTyrRs+nE
         FR8SSw+Je9W/SUSyWfAfRxWFOlh3w3qGB3uNKWbcDuZravsQOtzHm+COEBGrIbL/eynS
         QNglPlXloY2AQUc/Wu3ImV8hefI9RI5HQui2pVZHwBKZBDFq1wW5ECppRS7bKsIKMglS
         2T839+QX4OuYStXexCBiy0gHfc46NKeKb1bS4XcXoGf/j5G2swxPYNP1DytCIZH1GE8N
         tm/Q==
X-Gm-Message-State: AFq9FYLGsWR4gLq3TaoJ6tkllqxfvaS8bPL2bZ4XoTyoZuUkc3JaTYiw
	E65K15XdbxSEJwsCIm5zlWZ3cvfWeskHZptpXolBPmPie8CY/DrRziwIVZU7TLZGzpDtaMu9UEV
	8j6xvSioQJlE3XqJYX0wxBRUyEVzyEUIxAbP/3Az96e/weoEpL/PIuWzC
X-Gm-Gg: AYBFou0zi7D3hxdK7kn/I9WWFoDsogrqeLK3k+iecuGbjegg3LkSKUYfuOZ4NRFx3We
	ja0XZUViWzHeLsNfHqrkxE/1Exozif63zYuBFhOy7h5TIHHNDvpKUuEQN6WcMInP8NlUmqI4M8L
	juliQBV2ZyIdOj/YR9t5v1AVNsOE4gs7zfwCGc4XibD97sL457EOut8A9VAOr169/xeHQYyOXzj
	EDnROrNIV3ThIeQFJE/1UJ9KNv2TGAQBUG77CEa3wvffXoJgRcTdT+Or82XV2W6Wr5mmG9WDFs+
	QoXfTC8i4DSxuA2ALGinYu/NeEnsdJkIcbhzJwny8jcn+R/IbCTG3jVr
X-Received: by 2002:a05:690e:b49:b0:679:8dd7:1d19 with SMTP id
 956f58d0204a3-6798dd71ef4mr307524d50.74.1791973024101; Wed, 14 Oct 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
In-Reply-To: <sashiko-outbox-171010@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:16:51 +0900
X-Gm-Features: AclHuK8vB58kVrwUvnG_FV1Bk2KZp5BcyBdkPIRhgzNfIxk2PQPvWDXOfCqkhAM
Message-ID: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: usb: port@0 schema constraint bypassed
> --
>
> commit aaa6107663f4d524c266c3a18264c416a86a4bb4
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: usb: hcd: Add downstream USB ports
>
> This commit adds a "ports" child node to the USB HCD binding to support
> connecting downstream USB connector nodes via OF graph. It attempts to en=
force
> that USB downstream port numbers start at 1, and updates the address matc=
hing
> for hard-wired downstream devices.
>
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Docum=
entation/devicetree/bindings/usb/usb-hcd.yaml
> > index 45a19d4928afa..24df99dfb243c 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -29,8 +29,16 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: The downstream facing USB ports
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]?$":
> > +        $ref: /schemas/graph.yaml#/properties/port
>
> [Severity: Medium]
> Does this local constraint actually prevent port@0 from passing validatio=
n?
>
> Since JSON schema patternProperties only restrict matching nodes, a
> non-matching node like port@0 will fall back to the generic graph.yaml
> reference.
>
> Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
> port@0 be evaluated as valid and silently pass, completely bypassing the
> intent that downstream port numbers start at 1?

I suspect I need to write it as:

    ports:
      properties:
        port@0: false
      patternProperties:
        "^port@[1-9a-f][0-9a-f]?$": ...
