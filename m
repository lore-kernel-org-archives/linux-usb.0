Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C348435EE9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950913; cv=none; b=nJj8lT6wXBrIo8lk6fTIyULDHPncTRlay9j0SuuuLDImp95Tr5OEGtJ50mhK3J32tpnI7g4ffBicDe2X84+G1059wXmaEvXBNb43sbd84ljdzT5VwK10JWWT0v6iFoJy4N9gBXTlxzqxNYQ/+0FRHYygmRzuxGolumh2QBmqXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950913; c=relaxed/simple;
	bh=qwRX8Ss83nTs/+1rjDtVYRjreEsIPM01iSpr8aBh798=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwpH9/LHOv3lCeOep9G8+tvzBNWTGZUR/jFlNSF8QLhJmxN02PxAfy0gpWOBpbHtVvfbBU4dpg3CZOhzM81Eva6xDgJWjNqjfHeMtNs4JB96v0XD74u/4U/ynZ3H97Botd9aPTJC3VRCp5OZSe6z01KZm+tV5RmYRqdsxgJcgCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwdaIqJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwdaIqJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DA01F00A3D;
	Mon, 13 Jul 2026 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950912;
	bh=4NfPzBrg6q/ypnr890JX8Ce7YfJXk0omZpJ+8DE+7Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hwdaIqJohB68qJ05HxbyvEVywsoYr+53CxiCBJebIdeL/jBoYt87+KPV3uO6vboYt
	 5NnruRqqPsClNhEIgwmCQeGTRzN7djlew/BUMNS6AT+WyWW6AdZTRFANwofE3lys3G
	 Zf8iFAa1zaEsIAgaUZKXdWECe+Vd+BVZlf/ZtkLu3P+xZn5Za8HFVvc9Ud2HOLR//m
	 +TbS6tosEsFiB/0yaN4vILGSl8cWYpu7KhqmzXduOYROm9eL3Bu3UtX+9hB77XSttl
	 Z4/13qSE8YSwWs2vUg4wcmV8RXX2W+ISSHZ1dVVYyKtwm9gwY3ZLWfJTYG9HidVCsH
	 jzqrb3tJ9B6Yg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wjH7m-0000000526G-1LXj;
	Mon, 13 Jul 2026 15:55:10 +0200
Date: Mon, 13 Jul 2026 15:55:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jiale Yao <yaojiale02@163.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: fix slab out-of-bounds read in interrupt
 URB callback
Message-ID: <alTuPh7hs1X-9lcA@hovoldconsulting.com>
References: <20260712170012.3503601-1-yaojiale02@163.com>
 <2026071325-onward-sabotage-13e8@gregkh>
 <alS3pmrV-FwEsVvA@hovoldconsulting.com>
 <b775e3e1-af60-4291-a875-7185dc29769d@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b775e3e1-af60-4291-a875-7185dc29769d@suse.com>

On Mon, Jul 13, 2026 at 12:44:17PM +0200, Oliver Neukum wrote:
> On 13.07.26 12:02, Johan Hovold wrote:
> 
> > But looking at this again, the check should be split in two: one for the
> > struct usb_ctrlrequest header and one for the modem signal state (inside
> > the conditional).
> 
> Not just should be. It must be.

Yeah, I meant "should" in the natural language sense of the word (not
"SHOULD" as in rfc2119).

> Doing the same check for both cases means that any of the, presumably
> allowed, messages the driver does not care about will terminate communication.

Indeed.

Johan
