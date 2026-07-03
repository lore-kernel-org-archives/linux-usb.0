Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865DB33F5BC;
	Fri,  3 Jul 2026 07:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062771; cv=none; b=n1W3X0Ua/y6xAFlZKmvL/cn+Ig/nK1T7JHvuqufjbFilhfVVI8U+iT8rxxUvhdXv8TcXS1/pOdXPgVri35qLiEy34lmnmFdtiYHBGRaKxPrcm5H17X3GZ6TvcS33oq4NPT3y+tw5almLgMPNh2Xu0bzLNxssg6gqVh+z6054tgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062771; c=relaxed/simple;
	bh=2e2gy6t3h8InLd7/Umykwqmnob7l+8g+6OW5rQn2jCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv6D33OmBwB1TVC09n6r8N7rBoneB26SPxKQQcY0um+cKnBuVkQ8frlieesAtHMu+U/idQ7P4eNM2gER9PVCYNhXziijCvN98wXDFLAXaTYFSMTa9eevf8l/WFgvrAe/V3oBUkYjeWXqb9ue7VHqIvTahxmQaAMC3NQUBCiHrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKcHkRPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKcHkRPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1261F000E9;
	Fri,  3 Jul 2026 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783062770;
	bh=YORYUke2THDKvuv4PhUkgKEiNllKUp4Ijf16EqdaiFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cKcHkRPkWXtojkMTtb0k0ubuJF1cP35BhZA8hlO1Q6bF/A+mvW5HzUOrIoJ+5iBCb
	 9ZOm64ZzlWEDnwWIg26+4oXOO8FmjkXTQk91Kl7FEPgSowqK1sQpFI5ktb67PuM5Jf
	 Tk5SDFyaoUuk3O7kNXbeMMT2q37sNxHbF4YoqtH1JTVwgMazkDzk9F/0IniSfehJmJ
	 O7tU7PlRvZa/cYlTtKx3Gi1V7hUIvVQXxk0J4YxZFEggFYdmB6m2gjcaE41zm08UXD
	 6aEmqFX8N7wWRwTNiEDkpDAy0L3WKkRlq7EoE0ZCTB6s+XA/KrSEpp1Ly88DFHuIJX
	 Vp0GoK7z/ZjLA==
Date: Fri, 3 Jul 2026 09:12:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: ti,tps6598x: add TPS66993
 compatible
Message-ID: <20260703-hidden-otter-from-venus-cb8af7@quoll>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
 <20260702190527.1820671-2-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702190527.1820671-2-radhey.shyam.pandey@amd.com>

On Fri, Jul 03, 2026 at 12:35:25AM +0530, Radhey Shyam Pandey wrote:
> Add a ti,tps66993 compatible to explicitly identify TPS66993 devices.
> The TPS66993 is not host-interface compatible with TPS6598x, so a distinct
> compatible is required.
> 
> On the AMD/Xilinx VEK385 Evaluation Board, the Texas Instruments TPS66993
> acts as the USB Type-C/USB PD DRP controller for the MMI USB interface,
> handling CC signaling, connection detection, PD negotiation and power/data
> role swapping.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - Rename the compatible to match the exact device (ti,tps66993) and in
>   commit mention the usage of TPS66993 chip on VEK385 Evaluation Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

