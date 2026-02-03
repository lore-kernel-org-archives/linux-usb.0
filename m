Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75327FD6D;
	Tue,  3 Feb 2026 18:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142114; cv=none; b=szzPb3FO1SZvXAi/DU1RHqD1y6pBBJTqZo6HY19Vcx80APVVVJelUYAhpfNN2Li+uJocHtW3Nljeu6B4KlWi8u7E5Sp8KZZYWLJelGxRX/ymNsUlmNQw6YOryQUVspPpSy/CZVQcFW4VtwR3hqR3jTp4OWqTPa1BIoZyELrPUoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142114; c=relaxed/simple;
	bh=0LJ3ad+aUYP4TBmiQsQWSAjbrdSr9GVEvOVf9dah7X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr+TlJcD2x9xpnF2Li326Ow/gYf50gkiC9DUpBLzpSPSAk5KZluk3197DiKSCr/w/Rliwr9C+aigAOc+nPg9sf0QdQl70nUq6nvp92nHoGSb9DIGmFSFfKAbAQyWhAceHYLKmOdH5owkTJK2UFIFKvt8jad+yqTQqGozlckkXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U77tsGEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U77tsGEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18DDC116D0;
	Tue,  3 Feb 2026 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770142113;
	bh=0LJ3ad+aUYP4TBmiQsQWSAjbrdSr9GVEvOVf9dah7X8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U77tsGEo6UdMz0EMWdCnPFmrW5af75bt1JRDMYp/NVztkU1/XVmwaJ7KylnzZwc7D
	 GZhgqRiztsmLhMH5sG0kgZ0CoRnoCCKEvpmlPSMY8N7ZasyWL5eh7pi2wMRmLLSmmP
	 SWSa5jkjcp/zKrIiHzUkiaXEHHMh90bYlZ5n6GZHE9xKRG1+TJ1qi7WKku0CoYl+yC
	 HljPPPt0Q3fxrSCjUnhy/MSJ4Urrs5pd9u6U98fp3aEZU36bTEWrqd9PFTo78Vcdwj
	 oHZr1m3U0qP1XqnYK1IL5wN+VX5FUFjCrIUURLOhkusnqD4mYZY+rVsdFd3s/9GoCq
	 9f8b8o9Hi1sOw==
Date: Tue, 3 Feb 2026 12:08:32 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	Herve Codina <herve.codina@bootlin.com>, linux-usb@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
Message-ID: <20260203180832.GA3217395-robh@kernel.org>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
 <176994942956.410099.10343293169382130437.robh@kernel.org>
 <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>

On Mon, Feb 02, 2026 at 04:32:54PM +0530, Charan Pedumuru wrote:
> 
> 
> On 01-02-2026 18:07, Rob Herring (Arm) wrote:
> > 
> > On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
> >> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
> >> binding to DT schema.
> >> Changes during conversion:
> >> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
> >>   driver matching.
> >>
> >> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> >> ---
> >>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
> >>  1 file changed, 71 insertions(+)
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
> > 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> > 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> > Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
> > 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> > 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
> > 	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
> 
> Hi Rob,
> Isn't it pointing to the other schema ID which was not defined by me? 

You can't have the same compatible defined in 2 places.

> Can I have your suggestion on changing the compatible name to other 
> name to resolve this error? 

Why are you converting this? It's already covered by generic-ehci.yaml. 
Though I seem to recall there were some warnings for Atmel.

> I ran dt_check in my machine on the 
> latest version and I don't see any error there.

Please read the last paragraph below for why.

> 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your schema.

^^^^^^^

Rob
