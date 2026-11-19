Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124896;
	b=yTJwj13/ztkpmdN1y/VpQCVhS0WGbPaKW2QaeHt1Mq+1C4qdOLXWLwlW9kjJsJLNOA9k
	 1Rgzb1f/F7hEPoD+kSo5LywXSt02ltpN9v5Tl8kpRneTsjxHQgi7Toql05nkHfeCAdBK5
	 +b8o+VvNscGRu9krCpk0+AUrOkRh0kwgMudLDWKvZh2MIWBR9jEeOKS0uX/c2q+DLhjFJ
	 OqivK14py1IdarNL6Odz9bk3Q/bgJ2OPW3YabRIMO28y9Tj04xuwGL3ypv4AxqhP1rUnz
	 lfdD/LOa6d3TPX4K4MRNWNWd7uaIWz9iZgfSLvIRiic8EPALjZ5JqI3/6ls9Oe/oRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124896;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ALv/Gl1K0L3J/MW30eO15kPOplYXDnO0GyOy+uO6ClA=;
	b=2eAz5dOUFLQpEB4/fJfnLE0GDS2WOnvXJ4cFuFow2XyaWR7uY5Wz3cZHG55q2qTfdbWq
	 npos0M/2j3TXzpDp0Me7VU2Y4R+SDNFOyEU7bM1whZ1Oj3ol5Mj6FyQwNYUyrWH4rnNmy
	 u9ruHksZsBUnTCt29sOirF3xTv4l/Ibz/ZH0zI42PLR83ZwcJAtdGZGAoBpw2/40Qz6YE
	 sL51BkK11IyPA0LzFXzwlKdcZ0pmh9Qgf2sp4XBI25oTa0nJVQkfnVaPFep9F26DHkktu
	 2X3u3ph7D3XBeSIk4hRRCEPWgEKEGGXy1AzqqbA7tam6EDVakw2NK2kk7WqC5+USxRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8AYtWgc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589A606A320;
	Thu, 19 Nov 2026 21:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8AYtWgc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445281F000C4;
	Thu, 19 Nov 2026 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124895;
	bh=ALv/Gl1K0L3J/MW30eO15kPOplYXDnO0GyOy+uO6ClA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8AYtWgcDfVk8i/Ji4EgVkjtwE7ovjDD8ketRCCxz3RXr/0bXReoo7sr4npvN5dbd
	 jwyfuZVqnOcCUm403ULIQyQl4EtUqdMoTR0UgNPMjWbV3Gjg/ld4q5QWRpvGGLyj5h
	 uB2yUjtlUjCNONpictcAM/Hh1aKao4VqWNW5+umGh0Dq/7qrVur9RvhWJ6pOWGE7AT
	 OpN9thJd+iCC/fZIXH6jw5Gr5CqFmokrzYrK2p34ZrMXzQZQXh/ggZvRgyOGjiIPQk
	 gdkOKQEdeLQc/smFs54Y+vkXsYB5iomEUEDAfs5YzGApm5+zHY07O0IkRxxrlsTHbW
	 +F/RnvdKXWQBQ==
Date: Thu, 19 Nov 2026 15:48:12 -0600
From: Rob Herring <robh@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	romain.gantois@bootlin.com, heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: ti,tusb1046: document HPD_IN
 override
Message-ID: <20261119214812.GA768347-robh@kernel.org>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
 <20261104074202.76712-2-blfizzyy@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104074202.76712-2-blfizzyy@gmail.com>

On Wed, Nov 04, 2026 at 01:12:01PM +0530, Ajit Singh wrote:
> For boards where HPD_IN is not asserted by hardware, the TUSB1046
> can force it high over I2C using the HPDIN_OVERRIDE bit in the
> General register (0x0A).
> 
> Document the optional ti,hpd-in-override property to force HPD_IN
> high when DisplayPort mode is selected.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
> index e1501ea6b50b..58e9fde3ca71 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
> @@ -20,6 +20,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  ti,hpd-in-override:
> +    type: boolean
> +    description: |
> +      Force the HPD_IN signal high through the HPDIN_OVERRIDE bit in the
> +      General register while DisplayPort Alt Mode is active. This is useful
> +      on boards where HPD_IN is not driven by the downstream DisplayPort
> +      sink.

The existing no-hpd property doesn't work here?

Rob
