Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BDC3EC6AE;
	Wed,  5 Aug 2026 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919062; cv=none; b=XXhJs1U7FXsRo4EsDGFyKbebDvQbeXpAlYBR3PNzKB6Vb2B20sU/P1T4bjTCQjRH6T6tra6amRB4WNptN8TkgEB1EtPk5Q2QjHO+37QLoffmA8KLzXhVIUPyW1eKHCxEWvsKGJV8oh4WMHTKb2Kgmd10/ddAbJltjAAdK0JH9Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919062; c=relaxed/simple;
	bh=6aYu6kCucosc7MK3ygxisXLIKyZl8j2TVDWizlVTMXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTUzSOtgY63E9fNDpZsDe71Mr37+skntoa9MjhZuWbnwgZbQCBfdKuN28QUPI/Ocv34oAAi11VtKD9FKLszZ8z4GSw3hlxvNWqNwLKBxZPImeRBciJ5Ii7iddo4vcy3Ar+a4OPK8wKCr+TyrwLi0JsSQucBQLulrz9rwlCPuEA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p9EirEOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p9EirEOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706911F000E9;
	Wed,  5 Aug 2026 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785919061;
	bh=CJt6uz2ke2J7dp0n9U2EMchWlL2SySk93nI01T1NbAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p9EirEOYBZcguoU/prvWwb70vbUGV5YBP3LWd+jiBbb9gfEwSS6b6UNOGGaL4gP/7
	 Rme0nZeIVmcImDXSl0C8DPSPqv2mQuIrXwzdvBoQfQbX3p8TQ967lSbjYT5QRkyttz
	 ze50u+5z0SiWdnC5wwZdsaKWcl5OP9LLi7JBT2hM=
Date: Wed, 5 Aug 2026 10:37:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_phonet: fix use-after-free in pn_bind
Message-ID: <2026080532-reverb-freewill-9228@gregkh>
References: <2026080509-scouts-nimbly-66a6@gregkh>
 <20260805082402.3265730-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805082402.3265730-1-khiemtranzo532001@gmail.com>

On Wed, Aug 05, 2026 at 04:24:02PM +0800, Nguyen Quang Le Kien wrote:
> On Wed, Aug 05, 2026 at XX:XX, Greg KH wrote:
> > I do not know, but step back, why are you trying to fix this issue at
> > all if you can not reproduce it and you do not have the hardware to test
> > it for?
> 
> The race is clear from reading the code - the old comment was just
> wrong. syzbot hit it 13 times so I figured the fix was worth sending
> even without a local reproducer.

Great, but what drew you to wanting to fix this specific syzbot issue?
Do you have this hardware that you need to see this issue resolved for?

thanks,

greg k-h
