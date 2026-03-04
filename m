Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704C63914FA;
	Wed,  4 Mar 2026 08:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613237; cv=none; b=AD11c/kmt7OZW7ewGnzfAICTfmh5SqgfhJn6MFHU84fWsqgQ8VNvrzVAbxrU5V32jYYH2ZkUqqm4DGrSeA9Azja9v8rnysTV8s3tPBq9bXQCCbAiieG1fcUdEUoHsZ0v6elR6LzfHIK4x24kPAdRCtxOXia5Dm31KI2jpGjwrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613237; c=relaxed/simple;
	bh=cp63Ur8HU7ilJqcOuhYKGlclOHDeaOci4wiN9pi4SOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDKVbEV53otq8a+3/Rf2fvNpYkR3S2P4hfSx1FUbMW4bhRt/yV7YG3xPryW/AsDhnVVae4hGI0NEm4UWBctpzy7QDFoKRzXc6/gr2walMyttTv/txmclmh+zrfsudbR1H88ZX3Xmw+Kd22ASJfs0cysLi8LaZmZJud+dBUtgDpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Icu8Pkor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Icu8Pkor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1581C19425;
	Wed,  4 Mar 2026 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772613237;
	bh=cp63Ur8HU7ilJqcOuhYKGlclOHDeaOci4wiN9pi4SOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Icu8PkorEMNEeclCCIQjLqWCLTo4vgW7AO+ITcc35IIfqCT01AMBu3bcvUtgK820g
	 ABFfBni8aKVb5ViycrjzBn2OnbANKPL+VFYzjIxmx4rzAVvoGNrfUj8k5tLG0tmiej
	 k4TW4JACYBJUuaJq9kg8OAC7sQwlJnTRdx88sOW4AJSnVro2NE6C0Gw7OP4mvQmfxq
	 nMBhw9J4DjfhGKeeUzucxpApmWZvtF7zQOW7Q9/jRRL8Smy4w+PVK1+lTZfpHrmN+e
	 WmfxlBkS7bQYqk0KLfUzWhPx/YoAHqIuGeLmOr1IK4qiTTJIybbRejYF/t/6K3C+kz
	 Y39xmW+67Dy9A==
Date: Wed, 4 Mar 2026 09:33:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: usb: mpfs-musb: permit resets
Message-ID: <20260304-majestic-bumblebee-of-rain-1ec92f@quoll>
References: <20260303-backspace-unhearing-c6cc8cbddbba@spud>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303-backspace-unhearing-c6cc8cbddbba@spud>

On Tue, Mar 03, 2026 at 04:37:39PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The musb IP on mpfs and pic64gx has a reset pin, but until now this has
> been undocumented because platform firmware takes the block out of reset
> on first-party boards (or those using modified versions of the vendor
> firmware), but not all boards may take this approach. Permit providing a
> reset in devicetree for Linux, or other devicetree-consuming software,
> to use.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

