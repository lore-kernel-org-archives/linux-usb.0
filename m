Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B173FF1;
	Mon,  2 Mar 2026 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436583; cv=none; b=JEniiMaHziQp0SwDTsmND9owX86ZOzcDh68e/PkhVsXQc+gO0UhzeLO8Ojd0u3xUMtwQM6wq9anQXfCdLKwKGek/LATk0vBMPVKC+fBc2W+66GkPXeFui9fbuHwWha1nZxWR87qqVLO4iUJBB/+LArB8pdHG6l4/bv9tMqcT04g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436583; c=relaxed/simple;
	bh=1JA2Y6VA1bubYohn9WR5eAOogCvsSeNjHkd/a8RxVj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sxp2FS+5VtE+/5ED6A6wMTmnxMVHecbO4AJ+6cDYmelw9Ley/29fTXZU7o7skDGu1NHY5Earnw4VpksVT/XWImCeRcvuJ9oHcC+ttV27Pz3GNEzPyarTmMYiZs+TkDTSaO3p2w/FMjn6xanWKEq3g6tZsTvQLLu9/2+iwsaaqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcogL3KL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcogL3KL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35523C19423;
	Mon,  2 Mar 2026 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772436582;
	bh=1JA2Y6VA1bubYohn9WR5eAOogCvsSeNjHkd/a8RxVj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcogL3KLD9dAlYDf3vZ16Z84wyrGU0E+HjJs8ujRk6O132RcwaI6u1p03OVryVOy+
	 oqa7+4eKUvXBtFJQipIBZ2ZHvjIiQyndIMomUJ6yXxHLcnqs4BS4ey7vlhglUdlPiN
	 dNVypKCx9a+SGewPlQU9CLBdUXjSM2XQRxAPbi+RQo7k1RSCi1lj2K4qslcCgt5KAs
	 m5j92S7SdUB2YkJhPfB204zxH3IIIMwUObBqMDhMo4VQ+e/QnSubXvdwMZDirKQtv4
	 f2mnkbTlWm5tpchCfvBmMwjzo439XYyM7iYtCuq9amOdmgL3lMmgY0uslmPknXbB9y
	 0bO807deV0tLQ==
Date: Mon, 2 Mar 2026 08:29:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: cdns,usb3: Add support for USBSSP
Message-ID: <20260302-sly-shrewd-wasp-fbda1d@quoll>
References: <20260302030339.324196-1-peter.chen@cixtech.com>
 <20260302030339.324196-3-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302030339.324196-3-peter.chen@cixtech.com>

On Mon, Mar 02, 2026 at 11:03:34AM +0800, Peter Chen wrote:
> Extend the Cadence USBSS DRD binding to also cover the USBSSP
> controller by adding "cdns,usbssp" to the compatible enum.

So here you explan what you did

> 
> The USBSSP is the next-generation Cadence USB controller IP. It adds
> SuperSpeed Plus (USB 3.1 gen2x1, 10 Gbps) support and uses an
> XHCI-based device controller. The register layout and resource model
> (otg/xhci/dev memory regions; host/peripheral/otg interrupts) are
> identical to the USBSS, so both controllers share the same binding

Heh, identical but completely incompatible. If you are using Claude then
at least read its feedback - what does it say when devices are 100%
compatible?

> and the same platform driver (cdns3-plat.c).
> 
> Changes to the binding:

And here. How many times more?

> - compatible: const -> enum with cdns,usb3 and cdns,usbssp
> - maximum-speed: add super-speed-plus
> - Add USBSSP example

Pointless. Explain WHY are you doing this, why do we even want this
generic compatible, not paste here Claude microslop output.

Best regards,
Krzysztof

