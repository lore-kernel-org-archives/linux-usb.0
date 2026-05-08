Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3322E1B6527;
	Fri,  8 May 2026 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778217409; cv=none; b=b6C9LgudG2oGHHrebb7/YNxuCePVUeiDKCHiBXn2vIta5ZHR7jX11xP3dq5o1e6uGTkunD3SiduXiE/arJNSygpjJT1LveaYUlxup3b69dcy3A++HmixQkxyZwvG4LYV4pwbOpg9+LyG7pUkNjD71lL6Z8aG1CYqJsL9T3GkQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778217409; c=relaxed/simple;
	bh=9B21U1VNDQLZFI7gZwPE7PpT+Rwih/U+F7t4Ioz2aEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hehHXX0/trFibijNM2o0/NrffQL4wXyDKfssd5vYJiAd/G1BVd7UAX5aXaD/b67kZ+HzRMPzEQRbot0UI7xW9ekldOcznfYZIOmzKOy5GDADCgMnr5JJA4aYmEjx1yJLFYM1B97tis/Ruhzp8I7N1/d8gDQH0PNoviPIwWmCVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2a5K4LV2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2a5K4LV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85812C2BCB0;
	Fri,  8 May 2026 05:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778217408;
	bh=9B21U1VNDQLZFI7gZwPE7PpT+Rwih/U+F7t4Ioz2aEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2a5K4LV2vZVE2l7++Z6D0fAQSqeupNaNhlswQ3Nsg+c0c9wSsW6xx4y3cWJGJUjwQ
	 S0tSSBE3JeRg6eKeBZNHZPf9ISmUDizGeF0xsZ2DUMx/gOkwGzxfKD3vJdY2phdkCW
	 +nfRUDwkQ1ePID2yOvR5AKol7UOrOi/Gcp+u8sEA=
Date: Fri, 8 May 2026 07:16:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Crescent Hsieh <crescentcy.hsieh@moxa.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mxuport: update number-of-ports encoding
Message-ID: <2026050839-spry-ogle-5ddd@gregkh>
References: <20260507141114.284470-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507141114.284470-1-johan@kernel.org>

On Thu, May 07, 2026 at 04:11:14PM +0200, Johan Hovold wrote:
> In preparation for adding support for 3, 5, 6 and 7 port devices, replace
> the current one-bit-per-type encoding of the number of ports with a more
> compact four bit encoding (2..16 ports or undefined).
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/mxuport.c | 38 +++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 22 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
