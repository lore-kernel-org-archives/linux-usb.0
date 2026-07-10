Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068F740DFC1;
	Fri, 10 Jul 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688120; cv=none; b=G2mnZVQAWtW65CKtHtmf6RwT6yYOg5MDT+MdR/R9KtmKGmhDZ3+QFgnjSHUm1o+p+CoR/xAB02DnJQZiWk1kj2U6Zx6prAt9URojfTc43uHo28fGbUP+pCcFTHv38XoxAdbVhnyScvTkUywbs2XG/5Do2fmIeJ1q7B1UBTd9PsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688120; c=relaxed/simple;
	bh=8Jb59YdVDRBgJJvdDv30QSDckQLEFTnungjW5MTMuh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmxfSkpeaNPKBWdMBaS73p45burcJ7aLLVS8ZtQOT0UXJTBKq38P6eMprSitcGTz7Kf8XrcwnqWQBTEhTDRDfPmy5wqd6SmXcG4O6yfony5ecK7wgJe7R4FHcIH4DP7jNVXKqiu0om2OZfLIWcmzzgYFpxI/FrPYoZdvKJhGkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FV+Bi1Kp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FV+Bi1Kp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424B11F000E9;
	Fri, 10 Jul 2026 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688118;
	bh=22RptkH7Blrq7tTJIRL/CX1MwIdHu+AYtkdf0DTF4ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FV+Bi1Kp1CVA6Q9VcITUFe/WV3QgbWs+w3C8N8fAbwDpB45Pp+mJ9XBxe7UpkVgwX
	 9mCIhv74bYu4H5DB4pATbPPy3mgOx1x3ySDh19n7lNmckwF0v19DJ6OnY4gCYmRH9p
	 cVxJ1QgFT3pR1pnvz0aNPPIIdC5p1RzaBsw/50Do=
Date: Fri, 10 Jul 2026 14:55:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com, naveen.v@harman.com
Subject: Re: [PATCH v4 0/3] driver core: add enumeration failure uevent helper
Message-ID: <2026071012-hesitancy-doornail-3dab@gregkh>
References: <20260526182318.9798-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526182318.9798-1-Akshay.Gujar@harman.com>

On Tue, May 26, 2026 at 06:23:15PM +0000, Akshay Gujar wrote:
> Hotpluggable buses can detect that a device is physically present, but
> enumeration may still fail early due to protocol-level errors. Today,
> such failures are only reported via kernel log messages, with no
> structured userspace notification.
>  
> This series introduces a small, generic helper in the driver core that
> emits a KOBJ_CHANGE uevent when enumeration fails, and wires it into the
> USB hub enumeration failure path as an initial user.
>  
> The USB change is intentionally minimal and serves as an initial user of
> the generic helper. Other subsystems may use the helper independently if
> needed.

These seem to have never made it to the public lore.kernel.org site,
which means the email was never seen by the lists.  Any ideas what went
wrong on your side?

If you resend this, and it makes it to the public lists, I can take it
as it looks good (nit, change patch 2 to reflect the 7.3 kernel release)

thanks,

greg k-h
