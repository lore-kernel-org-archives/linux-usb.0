Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B068F49;
	Thu, 18 Jun 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788822; cv=none; b=JVM9IUeqBsSOeYczjcrE4xndc7NDUXTmYy+D85IBfpRycIMMfrt1QiM5CzCqv4Yp2/44fZGkcYiDbNVLBd3schwgXeLaAt2ArLuKwrfqUr4DVegqSfl+dUZ0K1rpyUYAROeyjOYnpHMrf7VHkwUT4FZqTQ/6NvPXd+ASL2gg4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788822; c=relaxed/simple;
	bh=rA8Wvpl1phU719o8mdN0B35BZ/uBN0rC+ZNH3SPTroM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsBSWcXlXb5QXVI6NzerNjJXsGz2JoAVUnDHWUPwhIOB5LINOC5aNwsLKCzdVcVrZCmOCvrUCTzZoX2a3/rwze2KKqXdROvOjudPkTjpXspcnK+W95101pn31ae9PKestFqmgMrLpk6EQdaOqqfcoBf0fbrbJ7Z34vZmzXzzlSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONTunRL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONTunRL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46901F000E9;
	Thu, 18 Jun 2026 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781788820;
	bh=IlcVuY5UhoN8pO+7F9B4UX/XdBZaOk+Vc4OQIBl1EZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONTunRL6HZNbH/Z26tEomZImHauB4H2LnpfIFmhi1czdveIadEH6sl39ZuLGor6A+
	 zddYSOx7iLP62pL8FZCoZfp3SCni4Q5N4LkQOakjSlaaIvcdOYCHSHFEl2BqlLFRgU
	 BKeDWZaxyDzP+CHuVks2FAro4Sbma9RLZAm0rN10zlN0jXHN/L0pBYcb1aZHRzFTSd
	 Hb1cYzqxTfMnPBNttHXrYYMSfYzidmwMqA+bDggJ+ilmlzi46UFkctnRhZKBTO7WyV
	 f/wHrmaCUY7P7uyOMquRbLcWd+D53wZMnvxG2cWSTIpfePc49xyomfqK++ZG+EAqG3
	 5BIpvZPZhGXTw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1waCfK-00000001ECJ-2fDF;
	Thu, 18 Jun 2026 15:20:18 +0200
Date: Thu, 18 Jun 2026 15:20:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Cen Zhang <zzzccc427@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH] USB: iowarrior: kill async writes before freeing on
 disconnect
Message-ID: <ajPwkpRByTav6VOp@hovoldconsulting.com>
References: <20260618104126.3392136-1-zzzccc427@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618104126.3392136-1-zzzccc427@gmail.com>

On Thu, Jun 18, 2026 at 06:41:26PM +0800, Cen Zhang wrote:
> IOWarrior write() uses anchored interrupt URBs for async-capable
> devices and passes struct iowarrior as the completion context.
> release() can close the file while those URBs are still outstanding; it
> only stops the interrupt-in URB when the device is still present.

I believe I fixed this here:

	https://lore.kernel.org/lkml/20260523170523.1074563-1-johan@kernel.org/

but there may have been some confusion about who was going to apply it
so the fix is not yet in Greg's tree.

Johan
