Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BC3BE161;
	Thu,  9 Jul 2026 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599275; cv=none; b=lyFZi5mUJBViENHjnTvPYtPMuTIyBUjv3ifWaFdJwnWy5EtDN7W6UiAWUihf0fMEZCvo+yMqPH94PNAlJAqKzf/dq4FPbCyAQ/SHAYzJwZ/0eZ6ZeHMzmvA+rftDgtDBaTl5+hfPyQGXBqld9eNaKx4DqvK5wUALXOqSzYob40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599275; c=relaxed/simple;
	bh=0BUO7HSUyXZHya3ZDwDZTPOJCWm4IMuPlEHjmyFnvGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zkrd3Mb7azd1nLQy+A3P6zBh0uemEu4qxrIsUOo3K0RpoxLqgKD9+Nhssax/j881WtKOy7Jl/g1jzg2EHIEVfB6RnUUDLysYJmxdZutONdFxbT26+ODiHJZz4cPS3xtXX7AVHUVqGP0cL5ApKOF1VAoshv6xCz7PSL8wyrq4ix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mq5TcMCH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq5TcMCH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902721F000E9;
	Thu,  9 Jul 2026 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599273;
	bh=nVORFCL6CNiHKh74SYn46d3zLuWsmQs7QLWTxIm0GWc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Mq5TcMCH4bH5+VnDeCl0hxlH3M8xzo07koGO+Xft9Q2fKYsFUlK9/h9C4/tL/NnCO
	 nThDMFBmb6+PcrQoKWcP3beU1gkp+H7J/nLNCi6+PwTaZEAJqvSu+awdqDY6XXEcKu
	 sEAXCYBuHreiSAHttpxn/zM60EfwzAjepRxZatCYEYFc+9Ovge3YDAga83m9NDzO3x
	 nMC92+AkiQ4+eqQnQ/JkNL8ssrPNFoqDLQ9qDLq3SuqOlORInx6ii6exez2Od77cx9
	 +B8bnQBtgq5eNgZND+mtN/MU26l9iQeiHeoS6BRwenZI+LGch71BWokGojGrwkvy9v
	 OhCc0d7A/4MIQ==
Message-ID: <bfc0dbc8-4f92-436d-86bd-dd6dc8a193fc@kernel.org>
Date: Thu, 9 Jul 2026 14:14:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add ITE IT885x support
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
 Yaode Fang <Yaode.Fang@ite.com.tw>, Bling Chiang <Bling.Chiang@ite.com.tw>,
 Doreen Lin <doreen.lin@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw>
 <20260710-ucsi-itepd-feature-v3-1-8523e1e1c47a@ite.com.tw>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260710-ucsi-itepd-feature-v3-1-8523e1e1c47a@ite.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/07/2026 21:25, Amber Kao wrote:
> Add device tree binding documentation for the ITE IT885x. The ITE
> IT885x is an I2C-based USB Type-C Power Delivery (PD) controller.
> 
> v2 -> v3: No changes, resent alongside the driver patch which needed
> another revision.
> 
> v1 -> v2:
> - Per Conor/Sashiko: dropped the redundant `gpios` property, the
>   interrupt line is already described via `interrupts`
> - Per Conor: renamed example node from `itepd@40` to `typec@40`

None of these go to commit msgm but changelog (---).

Please fix your timezone, so you do not send email from the future (7
hours in the future). It messes with mailboxes.

You also keep sending way too often this patchset. Please read
submitting patches.

> 
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>

...

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..1b03fa3aa060 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13720,6 +13720,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
>  F:	drivers/gpu/drm/bridge/ite-it66121.c
>  
> +ITE IT885x TYPE-C PD CONTROLLER DRIVER
> +M:	Jeson Yang <jeson.yang@ite.com.tw>
> +M:	Amber Kao <amber.kao@ite.com.tw>
> +R:	Yaode Fang <Yaode.Fang@ite.com.tw>
> +R:	Bling Chiang <Bling.Chiang@ite.com.tw>
> +R:	Doreen Lin <doreen.lin@ite.com.tw>
> +R:	Eric Su <Eric.Su@ite.com.tw>

Are all these people going to provide reviews?

> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
> +
>  IVTV VIDEO4LINUX DRIVER
>  M:	Andy Walls <awalls@md.metrocast.net>
>  L:	linux-media@vger.kernel.org
> 


Best regards,
Krzysztof
