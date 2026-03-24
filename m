Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19723EAB0;
	Tue, 24 Mar 2026 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314417; cv=none; b=GAVTyBKeszDKPJHXeO5jRzrTj58q1JiBP87b+zKhWXU5IqivC9kzwyOLZhioBgqNNm3NmkVOxdpVJbporQja8x9phhNuFE9pHAd+tcC1y0ukNnunL3k1Yl6VDDono0fcAfK1LCv4yDvlY6RpyiUBIVqH/RfaTQ/ldOfiap7mRJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314417; c=relaxed/simple;
	bh=hFETtntIhCuIt/MiuBe6rDfiOZBg/AhtFjio/+FUTzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4kcKH2+r0MNojzXaDBbdRz4Qxla1/Xt3Kv6ghwDj7DWAPSEFyyweBX/vJ+Rzt5YAPHCqZFE9UqtEKw4EJ/slTw1WFQz4pGlCn0UD8bYZITtPxl/rqxX0meG3CMDLoeTzRvmpZm28Y3F+zCZ6ijhgMmBoos5bfxYo6If752PDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDMLrINU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDMLrINU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50945C2BCB1;
	Tue, 24 Mar 2026 01:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314416;
	bh=hFETtntIhCuIt/MiuBe6rDfiOZBg/AhtFjio/+FUTzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDMLrINUyxHL7uQMwRsHDBrClgV7H20tOJMgEvGMUxY8i13SNhuoO6bMm6kU4n4/s
	 gp9TKFt/a1ZjmGXHfjx8IFShlfNrwasxB2xlwnaCx7g7E/TbOMhi6B/n/EKUoKqKQH
	 wV7UNe+56y5VyfxD/XGi4QkDjfUUq2lBAQXm/A4b1Y5rSMd8G7aGl65C4WKiwoVO5n
	 SZZZkjVYEH7037qwxeIYiX7wsHSIUaHY6Cu1E7ACPnVa0RGUySwKWpWBwLRoaOGHBt
	 HPLVq/If+hn+fhd6jz0ogPVrzh/yRrg4FUP3xb/QDKLGjOnW5fjPhKjCSk+4Zraubz
	 g/Dh6lTJ8PKKw==
Date: Mon, 23 Mar 2026 20:06:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: rogerq@kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, conor+dt@kernel.org,
	pawell@cadence.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, krzk+dt@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cdns,usb3: document USBSSP
 controller support
Message-ID: <177431441475.1865084.10202415521295202897.robh@kernel.org>
References: <20260316064831.274865-1-peter.chen@cixtech.com>
 <20260316064831.274865-2-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316064831.274865-2-peter.chen@cixtech.com>


On Mon, 16 Mar 2026 14:48:30 +0800, Peter Chen wrote:
> Update the Cadence USBSS DRD binding to document that it also covers
> the USBSSP (SuperSpeed Plus, USB 3.1 gen2x1) controller. Both USBSS
> and USBSSP share the same DRD/OTG register interface, so the driver
> auto-detects the controller version at runtime — no additional
> compatible string is needed.
> 
> Changes to the binding:
> - Update title and add description
> - maximum-speed: add super-speed-plus
> 
> This patch is Assisted-by: Cursor:claude-4.6-opus
> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

