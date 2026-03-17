Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C93E5588
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757687; cv=none; b=UFGYNbcVaFJsxDJRL+NXY+9i+gJQ/ZuFQ1jXMIStXnlc1oaMrQL60GZbam4SA/BBTkLvHE8XC39A75PW4c8pce5ldtddgzl9mtMg4AHPlp3TAAV70KqT+4F0W9GVDEqsgPWN/piMKY4Ax9hnqTc5eMxgdxB/XPlJjqlDAtn33LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757687; c=relaxed/simple;
	bh=X8l8tV9gNe5UBXHH1CVF1Cvf16clAhFHnZ012jaoBTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgpvW8rseo24QCWuIcxPBgq9wtmwTIAZWKYQa/fM90P3F+yJMhrB1Vlnp1P96BOP9pKNH7L/Pz7O3ask5Xlo50/+jYoIUwHYmBoS5MvLQWu3wPh/FiR3P0FlXg3OOts1bL5nksKrFANJIv6EhDlM6/OoE3vKpYG1qZdYJzpFX/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7jzjukU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7jzjukU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEB3C4CEF7;
	Tue, 17 Mar 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773757687;
	bh=X8l8tV9gNe5UBXHH1CVF1Cvf16clAhFHnZ012jaoBTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7jzjukUdGscqIBmFWo2UDLuWaO8nEoIzz2ZHD60oC9bo2tpBat2kXHarYe5F51i2
	 u4ARNFaz11whaB1MOiIQj28fHHmw24s2RfbtdL0kv6Ajwsnnn2n8wroCCDMMOq9TN/
	 LzZ2HrnAuwKVFXNRwZ8TevWI91yi2LaIzTw4juPr2QDDUUHFJ42nZwHlV9uOfUC2zc
	 9oeWaRtzeijbyvMnkbZ28Lz1fR39OQL2WCEG/AS+wkPBANlTe8Z569Sx7a1dqq2TKa
	 Bk8LFyRiZ/GNAsPf/h7P3eI9CgPASHPNDfj4KlVzLNT/Gxt7o1ps3zemUEJwZd3BQR
	 l+X7ObFs63WLw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2VOv-000000003yH-05xM;
	Tue, 17 Mar 2026 15:28:05 +0100
Date: Tue, 17 Mar 2026 15:28:05 +0100
From: Johan Hovold <johan@kernel.org>
To: frej@stacken.kth.se
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Add support for Blackbox IC135A to Edgeport
 driver
Message-ID: <ablk9ZIbJs3IGhUv@hovoldconsulting.com>
References: <20260222170042.353042-1-frej@stacken.kth.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222170042.353042-1-frej@stacken.kth.se>

On Sun, Feb 22, 2026 at 06:00:42PM +0100, frej@stacken.kth.se wrote:
> From: Frej Drejhammar <frej@stacken.kth.se>
> 
> The Blackbox 724-746-5500 USB Director USB-RS-232 HUB, part number
> IC135A, is a rebadged Edgeport/4 with its own USB device id.
> 
> Signed-off-by: Frej Drejhammar <frej@stacken.kth.se>

Now applied, thanks.

Johan
