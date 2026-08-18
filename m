Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F041DDF8;
	Tue, 18 Aug 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041045; cv=none; b=lG873nU+u7NJ0bg5W/P6qDjLekO6T+Zu9T0fEXWPX85e3TL5ryXUWl4+idStSwiHQQiuMv+IkrTJjpjgAfdzIdtl8TeTntFoQqkumAsgoU7pe25I3mUV9+QbDXmzeM2XMg96bMt2oa6D80Mb9nv169E49VKfyASHrSP/5FtHnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041045; c=relaxed/simple;
	bh=80l5LFHIi6LPsGjgqXo5PSUa6M/3lxdT3ecnJuvoH74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGPQPvO1+q9S8kEq4LkseFXnBoAWfcSvH7NMxMmdJYH8QyH7DocDXsCMmCYLdc5YYj8LnFVVhMvWIEo6lW3Pi+CG5R5ppMN1V2YKwUPMhJQG9hCe9GcYgeL/Jyob4ShIwvYaO7TVZ6PRyzU7GYOOes7KPjh/YkcYqahA9aiOfeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGN5ysaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGN5ysaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2194B1F000E9;
	Tue, 18 Aug 2026 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041043;
	bh=KZSKrxuvSb2g2oQATWSJsSRJf9/TbYkoewirwHMisTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGN5ysaQDWk7Gj6FVonn2bTKesUpxyuwDNWIhmhjkO/EbWtg8ux8kLKf3gHzuYo3r
	 OlhXVtVopwPiQ4bpAFrf+eZtbxvKlbY5bi4GXqXQNDSW8fyPLzTG8k4f9nuhdf5rNe
	 ubwD8zU5238tFTnL2kJDMB8Pcmmzzb9E54M9/4Go/9jjCOO+xNt0+a14zKxvXu2E+R
	 infv3nJU6aG7GIMEEqqa8Krd/GzSxPQAkVncP/iSaN1a8KvQ3IU6nN9u9sbCm1QK/Y
	 tPnuU8cyFZinFmRoXuMtW9GrTQuWNgVP/loQ9tQN3F1dH9JkP81hrHDAtraDz7InEX
	 eXH4Ccg1KNAVw==
Date: Tue, 18 Aug 2026 10:17:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel <christian.bruel@foss.st.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch
 st,stm32mp23/25-syscfg into simple-mfd
Message-ID: <20260818-invisible-polar-cow-fb2a93@quoll>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-8-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816213849.1044073-8-marex@nabladev.com>

On Sun, Aug 16, 2026 at 11:37:09PM +0200, Marek Vasut wrote:
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
> PHYs would get populated by the OS.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: New patch
> ---
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..ef640443dd239 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -22,11 +22,12 @@ properties:
>                - st,stm32mp151-pwr-mcu
>                - st,stm32mp157-syscfg
>                - st,stm32mp21-syscfg
> -              - st,stm32mp23-syscfg
> -              - st,stm32mp25-syscfg
>            - const: syscon
>        - items:
> -          - const: st,stm32-tamp
> +          - enum:
> +              - st,stm32-tamp
> +              - st,stm32mp23-syscfg
> +              - st,stm32mp25-syscfg

You never tested your code - DTS in this case. This clearly generates
warnings.

Best regards,
Krzysztof

