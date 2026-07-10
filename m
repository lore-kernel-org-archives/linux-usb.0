Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090024336D;
	Fri, 10 Jul 2026 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661054; cv=none; b=LYtKzIQz2wKLzlgz793WfAT5fX0upaJa0UIGo0xUEMpUuEwXqnq6mvb5/s6NcRT1sI9GOr6FyKycHIEWTKsfKAN3mHEBjE/quxLuz1mH/rNmA6B0RDdKmMeY4JGO6A4ce2PA1q5kYWxZMoYb6rnSh3dHwlmF/93cKhNUiNriDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661054; c=relaxed/simple;
	bh=aCXN97QRbdSHoJI0yeJGXdmXP10nXPdc/Tk7IngpY+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMX2nY5WvSVI1oO58wupeQHHYVEsLF4vu4urycz/vawYvBOmhHGvptDGUx2iN2pt+t0OOH0/G5oDtMiymrqYX9lZjdGqOxhlHVWWJF9pAd00a5cu9niD7jfzlaXYRZFdl/V/o0Ulh2hHJ3gacY4A+UBDKCoKxclMExFGJZVgogQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YtCCifd9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YtCCifd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB27D1F000E9;
	Fri, 10 Jul 2026 05:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783661053;
	bh=nTWEX7lbHV770jyy35YKXpoatu3qRmX1y9eWySToEEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtCCifd9YTtx15ktq0qNZDPKXIvpxydG8E2JkU2zB7NpQB2/cpcq3ym6LaqzItJ6u
	 4CehtjyXrrHd9rOcntRZqv1aPcv+R9MrPCn03sVSSRbIHfPwmmqVKyJFXcwXkM6ZGR
	 uyt/eJxdBn2VxUe2z/0DYuy+pDQeA0fV1lyofj6E=
Date: Fri, 10 Jul 2026 07:24:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Keshav Verma <iganschel@gmail.com>, bock@tfh-berlin.de
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	johan@kernel.org
Subject: Re: Stale maintainer information in cypress_cy7c63 driver
Message-ID: <2026071033-squishy-satisfied-065a@gregkh>
References: <CAPE_3zK=BneOTJUXnpTXxt5_Gna_xy0f0o+gsTG9+twxckc7yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPE_3zK=BneOTJUXnpTXxt5_Gna_xy0f0o+gsTG9+twxckc7yQ@mail.gmail.com>

On Fri, Jul 10, 2026 at 05:11:16AM +0530, Keshav Verma wrote:
> Hey,
> 
> I was looking at drivers/usb/misc/cypress_cy7c63.c and noticed that
> the maintainer information appears to be stale. The original author's
> contact information in the source comments was changed in commit
> d09d6a351498fcd6195f05c3964320ae6fbeadb1, but the MAINTAINERS entry
> still points to the old email address, which causes emails to bounce.
> 
> I was wondering if the MAINTAINERS entry should be updated.

Perhaps, but that was in 2007, almost 20 years ago.  Why not cc: both
addresses here when asking this?

thanks,

greg k-h
