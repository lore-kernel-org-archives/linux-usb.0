Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6151514F8;
	Sun, 12 Apr 2026 05:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775970342; cv=none; b=F3f+2ThfXy7l0uY7gcfxxE1J8ZZ0Zl44HCSLENNBHeizNgaYOYMhsCNq9JiFNQ11op/SHWkJs8jpdYYGsDLzCwa+vPdXDw0sY29xK2bUiqZ8JJFM86MFKCYaRdmKUhkper0gUheTVzhEoV7gPUm3ol3hCIylXKcTqDLta9qX0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775970342; c=relaxed/simple;
	bh=je9Ga57D0+4x29jYylGg79PsMExeTZ6iunGQDBzl0Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usornB1tTKOPZydxiiiERbq8zKjU9h73Sy5QRfPFVwJfCodQnB1YMrk/s/OGafAPyUrI/EXj9wNhjbqgAk0JD3AmuR2/nYnlzlpYekFwwPAn85gc/9B0f1zxdty52i8BpuIgb+zLwEKXApnVMtFkT9T/92HY+mW/QD78Q4dWV4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BfSqAwy+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BfSqAwy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74A9C19424;
	Sun, 12 Apr 2026 05:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775970342;
	bh=je9Ga57D0+4x29jYylGg79PsMExeTZ6iunGQDBzl0Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfSqAwy+c3TRygrAAnwiUos0vWdKEVdQichPdPlupfcmjAFQdtjb8GIoIIj/oFgMc
	 9ORaQ63dIekPe4jtaTE1seH8FzwIzEgV5ZB46GEbir5zJMgEMXSDO6iandKzB+aIc4
	 bkHEQLdhRXak/t0wTAbZLPYTilIL7Z71VEPIIT7Y=
Date: Sun, 12 Apr 2026 07:05:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavitra Jha <jhapavitra98@gmail.com>
Cc: linux-usb@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: MAX3420 UDC: out-of-bounds read/write via unvalidated wIndex in
 USB SETUP packet
Message-ID: <2026041211-prevalent-busload-0453@gregkh>
References: <CALFbBidSiJTD2zdczQ1_mxv8Xm9Pqspnz8LDppHp2hudkLSoxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALFbBidSiJTD2zdczQ1_mxv8Xm9Pqspnz8LDppHp2hudkLSoxw@mail.gmail.com>

On Sat, Apr 11, 2026 at 11:28:08PM +0530, Pavitra Jha wrote:
> Hello,
> 
> I am reporting an out-of-bounds read and write in the MAX3420 USB
> Device Controller driver. The issue arises from using a
> host-controlled wIndex field from a USB SETUP packet as a direct index
> into a fixed-size endpoint array without validating that the index is
> within bounds.
> 
> The driver handles USB control requests originating from an external
> USB host and therefore must treat all request fields as untrusted.

Did you look in the mailing list archives for this driver?  This has
been discussed in the past, most recently:
	https://lore.kernel.org/r/20260121203944.1898-2-qikeyu2017@gmail.com

Please get this hardware and validate that this even actually can
happen, as last time around, it was stated that it could not due to how
the hardware worked.  If that is incorrect, we'll be glad to take the
change, but that needs to actually be tested, not just attempted with a
fake device in qemu.

thanks,

greg k-h
