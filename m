Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413714;
	b=REfzbzo3vWESNksb3M5w17ldGltW8sDv0ielIZMUIqx+PQrQmfCl7hyuVXplXh1PhnJn
	 XSoxznqGYNmXtC/YD1qZSOLMYJlPE1G0x68k8aErNYM/Qt+pb7f0BmGneArLNnTEUy4FX
	 ZM5Ml3aFRb6QMClUe+ZlYviV8/jmlDxs4wR6YCz1u08xu/6uZ2vW0y9sz6rl0w+C1GIcn
	 ct7tYN8uvHxcrnxGlFZfd4Oo9mrBoW2cb1AWgiaPhCyviW6JhbufAmQMhkfniawVV8t2j
	 qKCx9yGNBSz0piJ314WLIkA0MP239r5UvK+UFngwb505BzHfDs3MsDsaB1PmsqOzByg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413714;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bsIU9PQH86pS+XrOOB0Y5EeShrf9S3J6yJs+xOkUDvs=;
	b=U6q1ZBfmNBm0GK3wVcmjegdGUT+NwjSr2xjJRMwDxN5d8TizTvO8jRIuFntck8USpug5
	 a/2do+1EJ6gSS8QKG7VN+vCYdhPj5kzyf595+95XHtdD3TMIGvaqvD7L/erEYSiWm1+Sa
	 PcDAZUcjVEdRx5kpy/rMozCEZ+ULgV8C/vDE1cV0r4HM/O2PbX21pHpbV1JkzBnKvui64
	 vcBS5l5BXCpjNZUw/cTSGDesq/vsGdHJTrkaqMx7L0sruuUZXey/aKeHT5+n1HesB6Aej
	 bjkMFuFNpaw8+G3Gl7yq4TYWXJvOz/v7BVPQ6ezi9H8ElE5T0dyyTljDj/XrZhbSFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nbGuZOiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BC606A31A;
	Mon, 23 Nov 2026 06:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nbGuZOiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577421F000C0;
	Mon, 23 Nov 2026 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795413713;
	bh=bsIU9PQH86pS+XrOOB0Y5EeShrf9S3J6yJs+xOkUDvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nbGuZOiz7dELQmo6okMI8o1AE+EYe6IWeUR2V4e2WOClVpnYOI6NvPMTjImg0X4hQ
	 JuHMvF3Hn1e5eWpPX7vzp3UwYk9SicgV7+UuAqhlOcrll2kGUxApP97UhTULglqdfE
	 KRqt2qtBMNDhiB8P3kbVAhZOHN6EFm9j9Gph3bXI=
Date: Mon, 23 Nov 2026 07:01:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Message-ID: <2026112349-gala-unrobed-637d@gregkh>
References: <2026112338-pummel-hyperlink-2957@gregkh>
 <20261123055757.11283-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123055757.11283-1-atharvatiwarilinuxdev@gmail.com>

On Mon, Nov 23, 2026 at 12:57:57AM -0500, Atharva Tiwari wrote:
> > Local static variables are usually not a good idea.  Why is this needed
> > as it's only referenced once?
> 
> is_apple_location signifies that SSD methods are available in the ACPI bus,
> if we dont check this there might be a situation like:
> 
> Is internal USB Controller = true
> x86_apple_machine = true
> is_apple_machine (Are there any SSD methods in the hub) = false
> 
> So all USB2.0 ports will get a error, and all USB3.0 ports will succeed and
> provide wrong info.

Sure, but again, you only check it once, why not just do the logic there
then and not have any local variables?

> And btw the SSD methods are only used in new intel macs (2016+), so this becomes necessary.

So how have these old systems been working so far with Linux?

greg k-h
