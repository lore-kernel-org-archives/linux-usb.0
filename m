Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805542FA0DF;
	Thu, 19 Feb 2026 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487929; cv=none; b=cguBzsFj+58wD9bpZ+H8mbzfxUpN8kqXj6Pyv1cDb6Q+R6c5otny2uC0uJhJqnxQ5SnPz/0oi46LMoW9rAs+3bptZ7vVQMFpeQOXXSHvMKHEu4aFs/myxD76du4d1XVTiNL5f/n4GM5nGKoX+MgA5QxhzUcsAouuICOKve9yqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487929; c=relaxed/simple;
	bh=IJyKvZKdfb0AqK6ban/D28XSEn47/gC4xben8WHxGNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiR/eE19kSQSCKg91Kzz5TjtdS1UEKdSyDptk+Ky1H78DKpbmHQaBM+l6dfOBPQEPuvZZEmG/Oi2aNz7zaCIgHFINSOA9lGlt4+fPFqBmOxdR5pyP/tzFf1wXG/y+VFheNeSfOb7rQ6zEEO00CVIfRThhVVzS6yxyEqYEnRQZ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxlMuqqC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxlMuqqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A06C4CEF7;
	Thu, 19 Feb 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771487929;
	bh=IJyKvZKdfb0AqK6ban/D28XSEn47/gC4xben8WHxGNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxlMuqqCQhlUQzuuAluYu6vMFHWw9u3n5grZG9sHdQfjVgJS5fOwcgbw4uYYr7mhO
	 9hDY3XA1qcbT+o2aYUl+6UZLVaZ9gqsV6/qBdfBs3+J8ID0sJOUUGXzYc+V8SJMr8Z
	 NNAcOeLYDa6oLe/CKHYnMfbzBAapAUKYEKA7DvzBHXdQw6RNryuqYMYisDB3UCLUCg
	 zMNC9/3piqFv/0QFTePz5z8O6+jZkVQ7X8GYYlY4fRMpwKqDQgJn9vOi7u0C1/LWN9
	 uIvkokXqit88eRMMpNGa2igs95O5mGYgy46F3kgcRcdH5bXh6kIOBJi3vfrzqPLRFd
	 9lWh6Uylohifg==
Date: Thu, 19 Feb 2026 08:58:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanshen Cao <alex.caoys@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: document the Etek ET7304 USB
Message-ID: <20260219-bald-sophisticated-wasp-eca31b@quoll>
References: <20260219-et7304-v2-0-b2e268494ae8@gmail.com>
 <20260219-et7304-v2-1-b2e268494ae8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-et7304-v2-1-b2e268494ae8@gmail.com>

On Thu, Feb 19, 2026 at 03:02:51AM +0000, Yuanshen Cao wrote:
> Type-C Port Controller
> 
> Document the ETEK ET7304 USB Type-C Port Controller with USB-PD.
> 
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 3 ++-
>  Documentation/devicetree/bindings/vendor-prefixes.yaml     | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> index ae611f7e57ca..ed0802112eb9 100644
> --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> @@ -21,8 +21,9 @@ properties:
>      enum:
>        - richtek,rt1711h
>        - richtek,rt1715
> +      - etek,et7304

e < r

>      description:
> -      RT1711H support PD20, RT1715 support PD30 except Fast Role Swap.
> +      RT1711H support PD20, RT1715 and ET7304 support PD30 except Fast Role Swap.
>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ee7fd3cfe203..80a5362f1c08 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -541,6 +541,8 @@ patternProperties:
>      description: ESTeem Wireless Modems
>    "^eswin,.*":
>      description: Beijing ESWIN Technology Group Co. Ltd.
> +  "^etek,.*":
> +    description: Wuxi ETEK Micro-Electronics Co.,Ltd.

Domain is etekmicro.com, so use etekmicro as prefix.

Best regards,
Krzysztof

