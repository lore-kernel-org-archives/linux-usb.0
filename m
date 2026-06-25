Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0093171CD;
	Thu, 25 Jun 2026 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373620; cv=none; b=e8e0XfSqtkRv/gMu0HiuFnCUbFDWF785l3q4JHmub7kHgoL+hQYYFOZ434HRhYGWyfIA8hTh+VcoNdP3ENhLaFiGTZ0FNRJqAo22bhtjZpEGePXMFvqhENpsYq64M6xI83OFMI+spOL6RYd5D5vZ/cJ7W7TvJwM5doXvnElnVDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373620; c=relaxed/simple;
	bh=ghZLxqGmHA8zKrV4nVE22cu7cCa9FkBRxJOzFURfMwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY6Tbv41CSVUnMp5O2btsDCvNQ5GfCFbC0NxOpyaiB7PTn2sVEuLbADcvIjVpNTFi9++QFYekIrgOM0rlI4IZoyPRl8Y9Ivj/noelRdrm4g60S/us90X3nxUj02yuzGp6dp5c78cNUW+dqERzbBYXrouvmdbbXR3/Wbk1LO4mpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euU89ZS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euU89ZS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2C41F00A3A;
	Thu, 25 Jun 2026 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782373618;
	bh=0aI9wxuGKnbMvNl58qFdzMKLZ8nilpFIGpTQF1yLvJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=euU89ZS/Uej3WNn+mAK8by30KuxAIW5caVo5xUmeAUal8lqQ6MedvJ5BKWgTFjYpn
	 5E8zQWM6/KHOW1H8jtCf8lMXfiDKw2zT0gRbCVzM2dkGyor88Fl0a9NDMOpdz8ASZV
	 MapuD5aSvtASL/sD4jHD6sFKou1pCQtj4uHDKy7FWwD6dmavic0oJavxOQNyZyubsj
	 0th0tf4iTu5msvTuS3xIbW0QLilMYvidsc/fcB8JxDWHSGNswrEW5keWBgsBnclPY/
	 l1g/DS9ZCwHD98ynwAaf1O6ZgHpZWLodumWGNKceaX6gRg7gC0RmWhPtRj20OTJaAh
	 OWqFgv2VjbEvQ==
Date: Thu, 25 Jun 2026 09:46:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Diederik de Haas <diederik@cknow-tech.com>, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible
 for EHCI and OHCI
Message-ID: <20260625-rare-kiwi-from-hyperborea-8f080c@quoll>
References: <20260624192726.781864-1-jonas@kwiboo.se>
 <20260624192726.781864-2-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624192726.781864-2-jonas@kwiboo.se>

On Wed, Jun 24, 2026 at 07:27:24PM +0000, Jonas Karlman wrote:
> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
> being enabled, or the system may freeze when registers are accessed.
> 
> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
> constraint as RK3588, also extend the EHCI constraint to include RK3588
> to match similar requirements of RK3588.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
> next patch make use of these new compatibles and adds the missing
> clk_usbphy1_480m clock references.
> 
> Existing DTs for RK3588 have contained the required four clocks since
> the initial addition of the EHCI/OHCI nodes.
> 
> Changes in v2:
> - Include rockchip,rk3588-ehci in the EHCI constraint
> - Make clocks prop required for EHCI and OHCI
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml      | 14 ++++++++++++++
>  .../devicetree/bindings/usb/generic-ohci.yaml      |  7 ++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54..a39f01e740b1 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -52,6 +52,7 @@ properties:
>                - ibm,476gtr-ehci
>                - nxp,lpc1850-ehci
>                - qca,ar7100-ehci
> +              - rockchip,rk3568-ehci
>                - rockchip,rk3588-ehci
>                - snps,hsdk-v1.0-ehci
>                - socionext,uniphier-ehci
> @@ -186,6 +187,19 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3568-ehci
> +              - rockchip,rk3588-ehci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +      required:
> +        - clocks

This is ABI break for RK3588, so your commit msg should also mention
that RK3588 is not working for example. Otherwise you provided rationale
only for breaking RK3568 ABI.

Same for OHCI part.

Best regards,
Krzysztof

