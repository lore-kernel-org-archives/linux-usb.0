Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958338B157
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 05:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994196; cv=none; b=GERsw5KjbYvoLOXcGhOhJSEuwFWccrKA2UqHaKIcrLK5gevuXE7l/VGmrtPo4T5jpbLid4LSNrL1Fd96Z2GZBGEneKSZ3PfI/+oGOcdJuw25R6cz0/5mjoe6nVbXdRTF4T7wWE39xdnKTQFWX5q8TgT9b8CT0xBBMOsDk+G2PuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994196; c=relaxed/simple;
	bh=dV/hlzAzKSQGeJw4RiojScJOR96/XMK8rEeRkw5hdAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRbHBpcP93NuQ2m9qhlT2npGp16ajwMy3bU3Y52wqFDpGZB85CWYxOVs+dgMTlmnDy6Pb7T9zB9FB7doCl45Mbr0ano/Vv772d8um8eDBFdFzE8pYqVjNjjpWnukKECEkIqWnkLWTeF6d8MqX68DCN+SqKg4bgmgWDrmsnOI0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=caTtJ0GO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="caTtJ0GO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756171F000E9;
	Thu,  6 Aug 2026 05:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785994195;
	bh=oUSx2FVjRVjuxVunePQkL4IDhTYi9m+YFw+jpjNorqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=caTtJ0GOet6INfON2O0NdNAPxYuSt9TF6v6q2RyJ4EhiFWyHmUOmUcDmMc1jcUp8u
	 KbbswNJBeqXnNai+yANAWDsrjepwrf5swJ2ipxlsrZ3b9KTgericRaq5Djo5MB20Hn
	 ZLKBQPKAfmvk70OkLsv9pnJzCe9XiXCOpKo1oiCo=
Date: Thu, 6 Aug 2026 07:29:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vegom Doster <vegomdoster@gmail.com>
Cc: linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH 0/6] usb: serial: ch341: small cleanups and fixes
Message-ID: <2026080617-cymbal-jaundice-44ee@gregkh>
References: <CACnaG5yaudR4O9m31CK4hiZFd1xpCuwCh6p+=r1yVYViBOSm-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACnaG5yaudR4O9m31CK4hiZFd1xpCuwCh6p+=r1yVYViBOSm-Q@mail.gmail.com>

On Thu, Aug 06, 2026 at 10:02:25AM +0500, Vegom Doster wrote:
> This series makes a few small cleanups and fixes to the CH341 serial
> driver:
> 
>   - migrate the control-out path to usb_control_msg_send() so both
>     directions use the modern interface
>   - check the return value of ch341_configure() in reset_resume()
>   - encode the inverted bit-7 hardware difference as a quirk flag set
>     at configure time instead of a version comparison in the baud-rate
>     setup path
>   - replace the obsolete speed_t typedef with unsigned int
>   - only update the cached baud rate when the register write succeeds,
>     keeping the software state consistent with the hardware
>   - annotate the break_end accesses with READ/WRITE_ONCE
> 
> All changes were tested on real hardware (1a86:7523): TX/RX echo at
> 9600 and 115200 baud, DTR/RTS toggling, and the divisor calculation was
> verified for a range of line speeds.
> 
> Signed-off-by: Mark Ivanov <vegomdoster@gmail.com>

Please slow down.  This needs to be sent as a patch series, not all in
one email, as the documentation asks.  Also, don't send patches more
than once a day at the most.

And finally, these are not in the correct style, and can not be applied.
Please take a look at the kernel documentation for how to do this in the
proper format.  If you have any questions, please let us know.

thanks,

greg k-h
