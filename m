Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F35390C86;
	Wed, 10 Jun 2026 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087226; cv=none; b=hLKNDfTquOPY7L+Mq+g+uEyka/TGy3UeqrWwiT4EkdvMjEZ/2oiaRYRycI78qjwQVMSL3QfulGVS6T6S4Oslby+BumIHYVeGEJCfh5ouZAX3Kprbg4YbJH5S4O9U+zUqyltFGSF/X96VlvZlWl9C++OIOb/1knwEQ3+M7pnDxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087226; c=relaxed/simple;
	bh=LhZZu59gEyIUy+4nCtvK2zDokI/+58m7VOlnHUYb2b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTGQOIVB3ThTjthMmqLkoHkanM04aKTNbMPtKgb3g3aw9xR/MBIHc39bxYcyBk9TBGAYKQ5wGFitErVaFfe7SxxZpODqRYVJnNUrmq4mh6i0CQj5hCW6A3raIdVlXi5TiGTBNzTOxRSAuHEPeA3EMad/cdZnQlaqDNN2JFKB/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eu/rpg7u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eu/rpg7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76911F00893;
	Wed, 10 Jun 2026 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781087225;
	bh=Kmxs9R/H+rBBzD3BIvxyuoF1lc3Ncr3qitnpeNtK9iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eu/rpg7uV78BtIjxYEfkU16LroMi6ixJcYuumNIZWL2+zd7rXYKX5n1hE9pQXzc9a
	 zM6/VnULf2KottJdD/38bDycf74xfxf988raVii6XBv6OFhpBXM+VHGKydW43jb5yK
	 20zKIn26ZUsvqeSnBAv19DcYSVjK/D9MWJPnxEY0=
Date: Wed, 10 Jun 2026 12:26:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.1-rc8
Message-ID: <2026061059-snowshoe-untold-acad@gregkh>
References: <aikXWygu9EdJce5m@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikXWygu9EdJce5m@hovoldconsulting.com>

On Wed, Jun 10, 2026 at 09:50:51AM +0200, Johan Hovold wrote:
> The following changes since commit 1938fb9fe38c4f04a3f30bea44f8071c80a63be4:
> 
>   USB: serial: option: add usb-id for Dell Wireless DW5826e-m (2026-06-04 09:05:58 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc8

Pulled and pushed out, thanks.

greg k-h
