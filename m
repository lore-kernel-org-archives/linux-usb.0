Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095601;
	b=PbiYKQYn/VtNHHEIqsvEGyin21piB0ocfCfwzhYpuIsXRScphtSKlXDR4A3Nps9a65DI
	 kGAe+bDaztbn63xUYyMfpyq2obVhIK4Ipc/jsRG+ch7IEDoBxzhceDKt40OXG1mt5jJS2
	 CfmJH/rqjYIDAhhM/uqeF2MX2gKoJ6W8v1rnF5DfPO5XKtNAl5BofJ8qGar71+5jRcyKZ
	 jtWWKA/lTeihUy6l7BfmjIWC56Qsimwf50vocTe73BMOXF7YBUnw27geYw2kVHO2jpMu2
	 SbEFICMIpDz7hXLA/wyyY5J2FW24aIEufg4a+BsjZDbLyig3wKvavsKMJCCHKXsJOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095601;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BTy58CI235BOpxJ6pfHU71EFz0mw9uHArXMAsUbTzDY=;
	b=nyl2PA+suAQBMuc6DOsRlBnUBSniZow+jVEzRXzf7v84r/xbrlU92LmOv6VBkAggamNt
	 weaNyO565UoHc6IMRvFegs8U9QfZmN3DPVl1fG1wHQmXlsTNr/JS2kFXCJV1rqbJe/4eg
	 9awV1Kw2MeddzL4dfgpOzkTBNreJhH4PU1ZFQBU17KqS3jCUok7vHDmBnBFFavfDa9BB9
	 4Jfi4MOLvDb11v8xCOut2Eyy/2dPKcyG7U8Ls7XyFTSkXuOn1K+wRJUWGUhpulriyGS0s
	 /jM9Df9YzouI3B7aXP5TJTNOXxN+ARqZtAwxRBkYYUksdWT/mW8fAAoYYUVywlYdb2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mu/lHTgV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EC606A320;
	Thu, 19 Nov 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mu/lHTgV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104771F000C4;
	Thu, 19 Nov 2026 13:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095601;
	bh=BTy58CI235BOpxJ6pfHU71EFz0mw9uHArXMAsUbTzDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mu/lHTgVB/oWGvFcRqxmEVXLTJBen/gJctOYSQrvcX7Uy1EwGPhUyohO6kZmHncVd
	 3ybMPxb8UZfahZLlJ0zSDNcO1UxlSHGcKg8ZziOZOqez2pnKlM/XMf7mE8CakVsthd
	 8RAygp1nwC6Du6tjc6XkvK1uiNDv4EpclUKdlrR70RMW7RYtsEccxb3vLFbBgkEzYy
	 XjGNIJaH1+eJ5ILdjhDmy4EOkE/jf8H+Ia+Ug1iCqSfZEro9XSHBzZZnaeF5CMTbQS
	 j5Yn3yk/bnAsv8Rd2E0NWAey9R3sbaX46Nu/YvZAi88AmWx5Llu/NNL2hfeyAELwpc
	 AVYk2T+I1wEww==
Date: Thu, 19 Nov 2026 19:09:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 3/9] phy: broadcom: ns-usb3: Coordinate NSP USB2 and USB3
 initialization
Message-ID: <av78LMnP2ck168mC@parshuram>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-4-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021172819.668120-4-florian.fainelli@broadcom.com>

Hi,

On 21-10-26, 10:28, Florian Fainelli wrote:
> The iProc SDK holds both USB2 and USB3 cores in reset while programming
> the USB3 PLL, then releases USB2 before USB3. It also enables the USB2
> IDM interface clock. The Northstar Bx initialization used by NSP does
> not perform the USB2 setup or retain the SDK settling intervals.
> 
> Implement an NSP variant with the coordinated reset sequence and
> interface clock enable. Sharing one PHY between the HCDs lets the PHY
> core serialize and reference-count initialization, preventing a later
> host probe from resetting an already active USB2 controller.
> 
> Retain the downstream delays around reset and MDIO operations, and
> leave both NSP cores reset if programming fails. Keep existing
> Northstar Ax and Bx reset behavior unchanged.

This fails to apply for me on phy/next. can you please rebase the phy
parts and send

-- 
~Vinod
