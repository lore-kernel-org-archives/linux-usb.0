Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901116;
	b=KepsO5F3xq4uSmSfn7XAxfZwO8DyGeptZeytI7MqN1+8l+hTXlyh9t4iNzHn3DCyn1CD
	 Jli634hrd6zjvpmiEN40hXTxl+le3ZPt1dMm7GzdCa9FhLRGtg641hKWALA1cm9nHFlLU
	 oGd+YxzHSWKQX9Qq1S4JyiDQckBjNIc9Ag4g/q2+k8yM/dog8AjhEd9y9yPmKh3altPMr
	 kUk/VPtUNLMSGECuXk9E91fdx/tyZoK9Yj2skRmdVY2BYV6z/I9tFvI/vBF7Ubj6KfoxE
	 9Od5t3tPZhXmQajX9aMshprP3csR8QORkmXo+0FqiZLmHRF40hIcNavLoiTfrf3Cq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901116;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tI3crzvxmeyuwIBLnuWaI3RyAsjvr66RtDdh09zJ3+0=;
	b=FHhz0KwyS7PD275a3wYA/lmd6BYJD0Svo0TEDH3WtTcbKMHHAcyg65wwV3HM7Y8j0eqX
	 77eof638iZ5kLj4VxFywN0jtPtqcN5JzEb1/L8pz3aoSyE5sOcx5RXp27UK5ZUo9SQ4+4
	 Sd3AYKA48wC6qzY2p5yc0P5Y/GYgVTohixSpTsgU3ZxNFIzPHYOmnQAfWnN4v1T1lTg+8
	 5uWoTqRIXzEzWagLTVbL+FQSDydaZUx78vQAZLgIaF15ButnUKao+rSGXccUCIfAZcT3Z
	 Eir8m+52OdxNGrLhTLkGhiL718aY6+i4hPXS2T73HpyIs3fHcz0iLOI0eyk5BIRasvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=h9ErFkz1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769F606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=h9ErFkz1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FE01F000C5;
	Tue, 17 Nov 2026 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794901115;
	bh=tI3crzvxmeyuwIBLnuWaI3RyAsjvr66RtDdh09zJ3+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9ErFkz1c4GoF98TCYG0QhE3jwx3JtcaBA9z8DmMrOfMrFdXycAGenQFImclY6Muo
	 UvyVdyCXfTFJ1eziZuLu29PvXgDcsq53U3jQtTw/wtaAuQzuaiO2+P/vwY8EiQuIFv
	 kWz7EHtPXK0x0f8qya6xN9j5gMaAmmemUOfRSovQ=
Date: Tue, 17 Nov 2026 08:38:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: kaf@nwlink.com
Cc: Neill Kapron <nkapron@google.com>, pavel.hofman@ivitera.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac2: prevent invalid bInterval
 auto-selection
Message-ID: <2026111718-curliness-hastiness-2c94@gregkh>
References: <20261028222800.782988-1-kaf@nwlink.com>
 <179485828707.2938203.11219663125374064721.b4-review@b4>
 <e7a09da6d72d3d03a025adcab089c4b6@nwlink.com>
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
In-Reply-To: <e7a09da6d72d3d03a025adcab089c4b6@nwlink.com>

On Mon, Nov 16, 2026 at 12:58:57PM -0800, kaf@nwlink.com wrote:
> On 2026-11-16 11:44, Neill Kapron wrote:
> > > When p_hs_bint or c_hs_bint is 0, the driver selects the largest
> > > bInterval from 4 down to 1 for which the required bandwidth fits the
> > > maximum packet size. The original implementation intends to keep
> > > bInterval at 1 when required bandwidth exceeds the single-packet
> > > maximum,
> > > but the search loop instead decrements bInterval to 0 in that case.
> > > 
> > > A bInterval of 0 is invalid for an isochronous endpoint. A Linux host
> > > reports it and substitutes a default:
> > > 
> > >   usb 3-8: ... endpoint 0x1 has an invalid bInterval 0, changing to 7
> > > 
> > > Stop the search at bInterval=1. Maintain existing clamping of
> > > wMaxPacketSize and warning about possible data loss when the required
> > > bandwidth cannot be accommodated.
> > > 
> > > Fixes: 355a05dc8367 ("usb: gadget: f_uac2: Optionally determine
> > > bInterval for HS and SS")
> > 
> > The change looks good to me but you're missing Cc:
> > stable@vger.kernel.org
> > 
> > Reviewed-by: Neill Kapron <nkapron@google.com>
> 
> Thanks Neill. I'll make sure to include the stable Cc on applicable fixes
> going forward.
> Could I ask that you add the trailer when applying the patch?
> 
> Cc: stable@vger.kernel.org

I can do so, thanks.

