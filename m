Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3857432BD6;
	Wed,  8 Jul 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507695; cv=none; b=HXuud7bmGfHE41GuRE3mJXlmRCb8i/Y7Px+gV6iSiUcuuFPO7zGJy5pejJwdeZpUpl+r0Rip8gCo9cDC3zGHm6tnYFNuDayciuk3EFweoMxrwIViX4sGxmuTAYrLz63C4zZfUgYkffEgoC8xD7W+XY+VY1UCaaZsxxFiQm6kl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507695; c=relaxed/simple;
	bh=kcB9ft0VwEspbtyxrte6AcFl4onLeRTJa1eN8Urg6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOltVItw8k5qre4ElOTFOnqbTXPAPHAXfk262IOhBaEJ34qXQM2ObfXxOE1bZTdM6ThWyfv/czumIx99te9MtlytssczfUEG+D5LrzC40E3niMv/e3RQTUbKmdba3vV3o3Bg4L8fRNoCLK9QkEcecgv97kE1mqfxUr8za5K1oo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFGEJMBq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFGEJMBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E1D1F000E9;
	Wed,  8 Jul 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507683;
	bh=UnkgHBD26F/8kXqiFVoT59yFz6TX2aNaiI+Qen/RktQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KFGEJMBqQe+PjrBWqjLmjnWV/JsYzB172brSP6VwoHXDx7xS1ZcLCbVgtMXZufrTW
	 9fYrMj6at+MD4WpHch8E9OcjYOFKZ00/LVyYUTTTys/2rkXqJcTS2PcI1Ne6swd7qY
	 XNDdlddJfFCUqjhGtq2n+UD/JstJBmUye+lM3MRgmXIsdbq91QM8rf86qAEwofPVjy
	 eKBOhffTbvdrIWmxVU0k77Artkj8kd3ORRo48Kl1pjc2tlIV1E9kmYiVm1XWu0iU/I
	 XoynEpx7w6VlPa0M62hCCsbaGJV13MAAkYsuolH6YW85A2jqKW0L8p3/MNuBMeImir
	 i+4N+Uy/hIMXQ==
Date: Wed, 8 Jul 2026 12:48:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Message-ID: <20260708-crafty-copperhead-of-whirlwind-1d89e9@quoll>
References: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com>

On Tue, Jul 07, 2026 at 02:12:04PM +0800, Ryan Chen wrote:
> The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
> no vendor glue logic: it is functionally compatible with snps,dwc3, uses
> the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
> that is handled by a separate driver.
> 
> Add a dedicated binding document rather than adding the compatible and a
> conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
> convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
> the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
> the generic schema.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---

Why are clocks unconstrained?

Best regards,
Krzysztof

