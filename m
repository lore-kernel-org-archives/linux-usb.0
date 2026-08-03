Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC24E39CCF0
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740480; cv=none; b=e1NA+0n2S1d+XdV2LccWT9gdVg5a0HyyCebvLbtPAyQgFivdE+bnMflvIYQOk97T1Ztf7pLxpi5CXlLhYk+Oq5sZuBBsk/ESexqZniwWtNtxLak/NRo9zk1QIcDdQD2Iz8aDMXD8o0A5XHLpvV80ynX8ct/0WAg2NFVnbU08bWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740480; c=relaxed/simple;
	bh=KYchIHArZsKzpTfs8Lqfi3g/Cq7u7a/h6rAXD5nWPZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gf6X0podQIz6XGPGPPggxCk4/Yqd7G5WP4Ah5rw8cKk71m15UKAxZZ9nhe2xFSIsecroi2RiYhgcvOXsImCYc+fKK7SvAaP+nERfSzTX4jU0bhjNUlLOpMPj8Q5csCGyUCyUvGwWzycys12yY8b/jt2t7gPyG/kAT1EKZSc3JoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXR4yGqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXR4yGqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A318E1F000E9;
	Mon,  3 Aug 2026 07:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785740479;
	bh=/UBvDvrxyB9HEmxe6qyo6oWHvdRltSwyGYv7EV0liyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXR4yGqBrM+oy+2jn1AfJY6xB+0Olf/TDCnhD9l+VlXHqvCLV2CUzJm5aS9Y848V5
	 TKfZsvQWL6fjsSCU2bzJJbrWJjDtFDmlOM2YeCZsCXacUhrZTxlDAKFGlyY30V54e9
	 nR5ZlTa77e/8ncz0xxTaK8ZBwaLDC58RPvVsngXZhRVguGWamMQvk2+ER1xQY4bxPw
	 F2S5G6DDr7L/CE5tesrataMwp3gDCmhAsEuczV1ea9nx+8aSEqMa+47N95FH8nHHK0
	 2NxvwEeEmv+EaR487MNEmYf2iYyk0tbRg3Cdhe+lTRjEaR2vCwu+3h9A2aFYtI3zgo
	 cgI0u2gJMSFSA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wqmfl-00000002aBI-10hT;
	Mon, 03 Aug 2026 09:01:17 +0200
Date: Mon, 3 Aug 2026 09:01:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw
Subject: Re: [PATCH v3] USB: serial: pl2303: add support for PL256X
 multi-port devices
Message-ID: <anA8vXRbP_S2jPUV@hovoldconsulting.com>
References: <20260721112440.1816-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721112440.1816-1-charlesyeh522@gmail.com>

On Tue, Jul 21, 2026 at 07:24:40PM +0800, Charles Yeh wrote:
> Prolific PL256X devices are multi-port USB-to-UART controllers,
> including the PL2533, PL2543 and PL2565 variants.
> 
> These devices use vendor requests that differ from those used by the
> existing TYPE_HX and TYPE_HXN devices. They also require a separate UART
> reset request and use a port-specific register for configuring flow
> control.
> 
> Add a new TYPE_MP device type and select the appropriate vendor requests,
> reset operation and flow-control register for PL256X devices. Store the
> USB interface number so that requests can be directed to the corresponding
> UART port.
> 
> Detect the supported PL256X variants using bcdDevice before issuing any
> legacy vendor requests, as PL256X devices do not accept those requests.
> 
> PL256X devices support baud rates up to 24 Mbps and do not use divisor
> encoding.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> v3:
> * update the patch subject to describe PL256X multi-port support
> * add device variant comments to the bcdDevice table
> * use lowercase hexadecimal constants
> * simplify pl256x_uart_reset() by removing unnecessary arguments
> * improve the UART reset error message
> * fix continuation-line indentation
> * preserve reverse Christmas tree declaration order
> * add a default error case for unsupported interface numbers
> * remove the redundant flow-control configuration from startup

Thanks for the update. Now applied.

Johan
