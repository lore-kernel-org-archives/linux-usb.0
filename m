Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372680;
	b=VBKahCREu6gmlz1KYlnzR3ZN9u/ahNwmqw9Fy5JS3RgWKWLIm0t5UBnhTLBNEtD9hcqP
	 jDxgfsk/OLLS2ZDbIqBcdlnfrXW3cVdib0e69alYhZVuxpHXF4q9gzVemow5JUif/XtS/
	 yY8tGJxX96SJgDbJSTUGiUj0DBBq7vPUZTwVlEFpTpxxvBxOyh3Lv7GJZuNmwZSoMhhAU
	 T/EPOp58vII0z0mF26Pb7DZfhtgj1Vc3hMbU8XjqFTMhdrMILBEybKmQTEOYG+XgyBGiP
	 AdDIYhfW48aW+QfHl4YOpeVcn+SDacuLXXYtVMlRi0lMvrXRk+ffdnJaAbF3/1W0slA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372680;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FpRl2xEs1L075uzBSla8lvGnRfjSpHTa30lYePiaivY=;
	b=SrWiV4Frvub6TvJ8JYjZQR4noKwOo2bnojeNg+yPuBB5wZtw8f7835B3Y8V3nEHCvBuo
	 b8slfXlZ2J5k5Skn2n9hee5E3quVaH7zTPhbh1ThDr90IXtgeDvp1JvI2G1yxEUvqXLLk
	 0fHHlB58rEccNU1XY3kyl04XiOUD2p+e2pTBbJV/wOCQZlJYgEbi9vBRZux407OI8OK3Y
	 4/Y11NL1SNnV3jySNOPrcfGKlLzyj2Dup/ywsKeOHkOyYqX8xgsiWHgr6L9D6JY3HiU60
	 Y1KGfoskZfRcc5ONPvxVJtPT3kFP7qrwVJUsxGSgtxL/v2pJcJW/pjdzINWCho8zM6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceD5yTLO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B22606A32A;
	Fri, 30 Oct 2026 15:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ceD5yTLO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4771F00A16;
	Fri, 30 Oct 2026 15:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372680;
	bh=FpRl2xEs1L075uzBSla8lvGnRfjSpHTa30lYePiaivY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ceD5yTLOTmKrixJeFYAWUhrYQL3aFbsY//+Ci7PQbHrY4nurTIE3e6XQ/522D/8Q0
	 zVSc5ZePhnPU+nS8lAfLy60s1Cj4+HBSq1dLK0/ZXVtIU8+mJWwvgo3U6gOMJ9MXMm
	 YpeLc7N9j3LLrr+8onfiKyZAPFAqdbx2Z8ikki4P67ljpECtjCabZxfjRG4Fq8pDIa
	 1J8kT+DDVlKqAKOVwq5YF3Bt2+fSc/Nao4UGXi+trLKY/wVEeJlQICEYFu1rLQ6oyN
	 M9coUhAEnPZR4h/fzswYuNIEWYk1LbZQTxWkG0MPRzTqC+eor3UshkU89NiWC+oBxX
	 prgXELns7BHEg==
Date: Fri, 30 Oct 2026 10:04:35 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Message-ID: <20261030150435.GA3992442-robh@kernel.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
 <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>

On Wed, Oct 14, 2026 at 07:16:51PM +0900, Chen-Yu Tsai wrote:
> On Wed, Oct 14, 2026 at 5:31 PM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] dt-bindings: usb: port@0 schema constraint bypassed
> > --
> >
> > commit aaa6107663f4d524c266c3a18264c416a86a4bb4
> > Author: Chen-Yu Tsai <wenst@chromium.org>
> >
> > dt-bindings: usb: hcd: Add downstream USB ports
> >
> > This commit adds a "ports" child node to the USB HCD binding to support
> > connecting downstream USB connector nodes via OF graph. It attempts to enforce
> > that USB downstream port numbers start at 1, and updates the address matching
> > for hard-wired downstream devices.
> >
> > > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > index 45a19d4928afa..24df99dfb243c 100644
> > > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > > @@ -29,8 +29,16 @@ properties:
> > >    "#size-cells":
> > >      const: 0
> > >
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +    description: The downstream facing USB ports
> > > +
> > > +    patternProperties:
> > > +      "^port@[1-9a-f][0-9a-f]?$":
> > > +        $ref: /schemas/graph.yaml#/properties/port
> >
> > [Severity: Medium]
> > Does this local constraint actually prevent port@0 from passing validation?
> >
> > Since JSON schema patternProperties only restrict matching nodes, a
> > non-matching node like port@0 will fall back to the generic graph.yaml
> > reference.

This is a common issue we have in graph and ethernet-switch schemas...

> > Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
> > port@0 be evaluated as valid and silently pass, completely bypassing the
> > intent that downstream port numbers start at 1?
> 
> I suspect I need to write it as:
> 
>     ports:
>       properties:
>         port@0: false
>       patternProperties:
>         "^port@[1-9a-f][0-9a-f]?$": ...

You should just not restrict it here so schema is applied to any port 
node and instead restrict the 'reg' values allowed.

Rob
