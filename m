Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097345;
	b=Gf5dhhc8fFoWwjuRtdYT4HoTg9M95SZ1R9hQ20kyHC1hIFBUwsHpI2GUqE61cbmjBAdP
	 JjtO7+S0S5aGG48k938dkSZhG1avq7l5ZJq83e3KGMrnuqyoVXs7fouTcDvRzSgXo2vsy
	 afQbi+gvJU8I5s5GM2wmBrM3S1BhlP3RGTwAmykvO+iKLEidBQwmuWF45pBqm7xhWHXvw
	 XTQUrj/2khRwDDDfQXDCkOT6h72piUoEJMRpOj7AgiSJOB/8J7g5nA62j/vA8fYeBZkt0
	 mq6mp4/+1+zWuEieYV63Vpt35HZazlGzjTttL9maExgJy6RPcmYER+2kR+AatnrII/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097345;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MSMA0cP67I40gEU9qKa1Whz+WBhSJVa8dWfD8DNo+OU=;
	b=UP87mXt6v9B0DR3hUXpf3NfCyZICF5d+G1FzNd/A8DQ6oR5fv9z9ObMN3rmW7D6NhdfD
	 fyqT47Fmuhz1f8UbRD0yYkkCgth/7sW6YaKBxsyFov5xCZpsWN4QGEshUPGIbb9L2G0m8
	 t1xqTaxIMlvi8L6M+u/7z75jDhmuMcIshxB2ac2nSDMLCKAhPuaBZNbNKa5kORo2M+6XT
	 q9EeiYYMqPVaw21GMJYQkG82Zr5i6OKvzJb6sWLHyPDFaVHbUjTPna3Nxf1qGiGCTMS0O
	 C5zozwYExvE9pBegIA58sWFHS2OO4EFi2IcnV8jNt4PheGBNCOPq3lKA3uJ6KBBo19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU3k7JsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EFB606A320;
	Thu, 19 Nov 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bU3k7JsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFBA1F000C4;
	Thu, 19 Nov 2026 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097345;
	bh=MSMA0cP67I40gEU9qKa1Whz+WBhSJVa8dWfD8DNo+OU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bU3k7JsJzmT8nDdybTYngbqBdGe2HuUcklIC1Jw+He+73LK/yaD1AwsFhxASw1hFt
	 ud+uKJpj05pnXDKnzfCazu/vTTitDssddtx9Zm1XjH9c3uhrAH/JdqyPESmk470sHr
	 XEYOeK/MbnP8SZvjLCZGs+xXmwLvSg7scChJC6YneaH+LN2trTo0SWZhNN4ypYdXnU
	 KQtDkFLgo/f/bh4LyShAFzghIEiDQhJo8T80YNYF+UuRP2IOMate0GZViDc2JcYRQw
	 6BpqJAOT2G3nGLRUt8/vGotDZjIzFvRfx6CJmUPTtg4QGQ13XfBTR67XmtyLajjbrM
	 Ev4xpSy/s/fpQ==
Message-ID: <9db379cc-0b07-4efc-a3eb-ebc07e7952c7@kernel.org>
Date: Thu, 19 Nov 2026 15:08:59 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
To: Junzhong Pan <panjunzhong@linux.spacemit.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 14:41, Junzhong Pan wrote:
> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
> has no internal OTG registers, this requires flags which disable
> related features set in platform data. Add a compatible string to match
> the platform data.
> 
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

Hm, I could not locate this tag. Where did it happen?

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 620b564914d4..5c2b7eb1a6ff 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -25,6 +25,7 @@ properties:
>            - nvidia,tegra124-udc
>            - nxp,s32g2-usb
>            - qcom,ci-hdrc
> +          - spacemit,k1-usb2
>        - items:
>            - enum:
>                - nvidia,tegra114-ehci
> @@ -113,6 +114,20 @@ allOf:
>            maxItems: 2
>          clock-names:
>            maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-usb2
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1

Were are the clock-names constraints?

> +        resets:
> +          minItems: 1

This is odd. Why do you need minItems? What are the constraints?

This looks just wrong...


> +      required:
> +        - clocks
> +        - resets
>  
>  unevaluatedProperties: false
>  
> 


Best regards,
Krzysztof
