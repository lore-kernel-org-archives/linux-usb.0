Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DC2EEE86
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788070967; cv=none; b=OjQAx0ZjfpXxUpgVcYmLEPU+SbeEANqtmr2BAPFiUDNIiGzxePmA3iYL/4+RKVFmFN38RnbxMUuaX0bpcR/cxcoRgTuf2J4gPXW4JJrTM6KaTJ8td2ISkheXFqhtBxT22tTSifAvSZ3xwfJl9gN5Qqlm6/J8+YMOtN7UvUf5T0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788070967; c=relaxed/simple;
	bh=WZhm+hwrxw/b88pBpr3j5oRsmASYZ7fvQb97FqiKwO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsM0okmgF7B8HI1VKwrUgNov1ABmqw9ju66q1jOB87vPFSORkfVqfEoUgUphPZJWwEX034HhdVjUak9JxwypkXqN+oXqLsPFMAhn6An4fHKy+pKbSbFLhFHksnsDEUSsnNysvhmJqGuOb4afK026jIi/+DCuooud8OxVsN2qsbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VMTXdCc/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VMTXdCc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2721F000E9;
	Sun, 30 Aug 2026 06:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788070965;
	bh=KW7z7NtrHMIq3cvRtfxV4cuN0vR/3EarCILxVI68yV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VMTXdCc/zeVTEfhdg3/hVhc/lCxpQjDnEHRamHFoezcDxzFQXFB+eVP1wz8NRZN1t
	 /yt6JkvibZaiFogB0ecKUl+rGEsrKFXXbdA1gRujvy3e5FD0G6vi5Mf7Ru6kRyzbKX
	 kBAA/BlIRMvq/Dd2nAO7qd9iPT2N/J5IGdiwd0bE=
Date: Sun, 30 Aug 2026 08:21:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Rys <martin@archlinux.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: Improve "New device found" printout message
Message-ID: <2026083045-antitrust-sacrifice-ffa9@gregkh>
References: <6323ed34-7954-4f0b-b6c5-8e1b1ffc1648@archlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6323ed34-7954-4f0b-b6c5-8e1b1ffc1648@archlinux.org>

On Sat, Aug 29, 2026 at 08:38:04PM +0200, Martin Rys wrote:
> >From c5b92273e0b7e2f095cab876603d37a1f4530175 Mon Sep 17 00:00:00 2001
> From: Martin Rys <martin@archlinux.org>
> Date: Sat, 29 Aug 2026 20:26:44 +0200
> Subject: [PATCH v2] USB: Improve "New device found" printout message

Nit, why is this in the body of the email?

> 
> Use a colon instead of a comma, like the debug message after this one does.
> 
> Do not print a space after `bcdDevice=` - this was introduced as the formatting was copied from `lsusb -v` printout, but lsusb output has preceding spaces, this message does not, so it ends up looking odd.

Please wrap your changelog text at 72 columns.  I thought checkpatch.pl
would warn about this, did it not?

thanks,

greg k-h
