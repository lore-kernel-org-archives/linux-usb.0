Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CDE33E35C;
	Mon, 13 Jul 2026 07:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783926530; cv=none; b=bpXH/gK8h2wf+XV5auPnmDLh9abOvXkA1G9tTijd3ft5JPm/fg7hORgwGuRFC+9CYX9aTjVLaF0hKQ2T13Ue4eaOflXBzlfbZzfIhMlWxmY98s4ukWkYq5SZpKXmLnOqvkaxzaa00+kGr9eYvZIfFpNLlGm2Kl9WNQpB7TMWC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783926530; c=relaxed/simple;
	bh=Xr6Hh7MQb+rIbPR5CneK61qTFYtyU+KfFzkQFGzrT/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaFfDrZfqJlqSIOnLb30PlTJhQ+aeht2mq5Brq20nkwba7Tvv1gvdmHmZw/x89+WFYXTYj+kGOxsLerFX/8pHBy+ol5NY1k9tdyP+Ho/qh0eSM+apuFgF3slnmjSqoRKT/YkWWCA7q5+dSNGqrmWLFbGjv82kRODv8eUZVKwsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpWanYjG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpWanYjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FAC1F00A3A;
	Mon, 13 Jul 2026 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783926529;
	bh=McdvidCR7TQEjAKv3Qut/R/RNS5+oe9QxMO4j5MP8sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpWanYjGj8VyzgBqDaEEHyFNlminBsoo33C+aS6o4//ty4qE+Mw+mropG2qLwcBtb
	 07XPwGYCbnU1DWk2ewh/xriCEKiEoku6Qn/a8chJLayYh773QQ0Yq9HkED36R7M1eZ
	 KuCZokrNQrzH2dW9D0deUOu3gBuGBsVYqVXZkmJ9+hTsYT36m/WEpFkUWAJIR43l2P
	 z42aLkZNdpmAH9SojCbzO08iBkN3nh6VZSQfoORWVzTO4VTbNjo2/2A81k7+NA9jTW
	 pDzwgj+EVTxHJe766RqWYNj8EGK3JpZVjv/U1QrczWKQFggIfP2yDaStIjawy+7wtu
	 PGdjZQ3dodRpQ==
Date: Mon, 13 Jul 2026 09:08:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Message-ID: <20260713-comical-kickass-anaconda-bfb0ca@quoll>
References: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>

On Fri, Jul 10, 2026 at 10:51:35AM +0800, Ryan Chen wrote:
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

