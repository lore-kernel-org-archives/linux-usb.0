Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31221B9DA;
	Mon,  6 Apr 2026 01:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775439007; cv=none; b=JxT9g698YWq3YaVDM3E6eNZ6YhmBgyBY3R/aLPqUC3w1qBaTJt0BB+LltD+nkCgV1AukvrvPFdEo7QRnX72GkRwp5j0iSG3h1CDWRd/RVSdFhGSUR88NCpGysVkoJsE+S8zvXLqlQ5LgDwax7NBdvicXT+WwZohctADxO6TRBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775439007; c=relaxed/simple;
	bh=T1klGs8lM/VYwKg8uS9wJ3HfBhUM4sSVg46v0Pk4X04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8Jpbkxcl1CmmXD1aGYN3ORnfNrvNUv/OhFau7CV0AOSZskHd7Qm6eUKAC28LZNzIYXhvJTeTYSfJrf4uld/dUc512ChqSYMSZ1/KPKgUHgBbJoyrh61vNXLWDUoVC9BnWEhIPBiLKvkKInbsnkVXyoXBgdsU/As+Pt5WW+YgyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJLB+xz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJLB+xz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C664C116C6;
	Mon,  6 Apr 2026 01:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775439007;
	bh=T1klGs8lM/VYwKg8uS9wJ3HfBhUM4sSVg46v0Pk4X04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJLB+xz73AK6B1Vdocq6pSiEx5D44M1lIwXXPZmWToLGqKI7qqfkaZ6pR3/8JBPFZ
	 d8UMJ4J6VmYLhHYeBVScLA+iH7CNT5U4qLzg/4eHrtMoG9+xyYBaNunPXUIbOEooSS
	 0pl0hglb5daAEy7U7ZG+T7NzGtVncmW53IQsXvaekRVjIXsqJjIkIpykgGLx8GLp0M
	 OvH2oQ8NlKZehCLu462iH8LiNds/jEntflqb9auHyDfp5a0WNnXAPep+oqKbnaFbNO
	 bJUgcy4sgCakKW/v/a8gk/3fCDBvHRMJapPwudIBTGlmkjkbRaheSBRiXaGFUYNkqZ
	 1oMwJUw1SH0dg==
Date: Mon, 6 Apr 2026 09:30:03 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: attempt to fix Kconfig dependencies
Message-ID: <adMMm5kS3PR5CHFB@nchen-desktop>
References: <20260402141008.2691819-1-arnd@kernel.org>
 <ac9xVUVB/BKfBUmE@nchen-desktop>
 <26779a33-135a-4881-8614-9987c5e90380@app.fastmail.com>
 <ac+H2dzj5t1JJJd5@nchen-desktop>
 <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e650e6c7-bd19-4c35-bcd2-0c53178feb8e@app.fastmail.com>

On 26-04-03 20:50:52, Arnd Bergmann wrote:
> 
> > @@ -13,11 +13,13 @@ config USB_CDNS_HOST
> >  	bool
> >  	depends on USB=y || USB=USB_CDNS_SUPPORT
> > 
> > -config CONFIG_USB_CDNS_PLATFORM
> > +config USB_CDNS_PLATFORM
> >  	tristate "Cadence USB3 generic platform support"
> >  	depends on USB_CDNSP || USB_CDNS3
> >  	depends on USB_CDNSP || !USB_CDNSP
> >  	depends on USB_CDNS3 || !USB_CDNS3
> > +	depends on USB_CDNS3_GADGET || !USB_CDNS3_GADGET
> > +	depends on USB_CDNSP_GADGET || !USB_CDNSP_GADGET
> >  	help
> >  	  The platform driver support is needed on any SoC integrating
> >  	  a variant of the Cadence USB3 or USBSSP dual-role controllers,
> 
> The dependencies here are rather unwieldy, but it does look like
> this is the minimum set we need with the current code.
> 
> The only other alternative I see would be to split up the
> platform driver support into separate modules for cdns3 and
> cdnsp as well, which would make the dependencies trivial but
> require reworking of the actual in a way that I haven't
> been able to figure out yet. If you are already integrating
> other changes for the next attempt, maybe you can try to
> come up with a solution for this as well.

Thanks for your suggestion, creating different platform driver
between cdns3 and cdnsp is the way we used at downstream, but
when I try to upstream cdsnp platform driver support, I find
the two platforms driver are 95% identical in content, so I
would like to keep one platform driver and one binding doc.

By the way, are there any randconfigs I could run to avoid
the similar break, of course, I will pass my local USB
randconfigs tests?

-- 

Best regards,
Peter
