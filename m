Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F93439321;
	Wed,  8 Jul 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523559; cv=none; b=XCLQRaNV68e4Yc2VTg2rKwl7NRBZhFdNynlG27E1whbG43a0yEPRotwoKtObCNeRS3t8J1QqhK9Xw0WKxneeVOjp2Ff5qlnw3J1c7WWSP1Oj/qUnAQwUCp1e5JceEdAecBmrHwQDMdEiQ64apQGL7JDajeS4taDNBymx41Q65c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523559; c=relaxed/simple;
	bh=R/xaIK0g1oiUgaKVuuu6csMkRDvX0qKASjd3lUAxaU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU0+IU4rapAqqcWqQnZuPzdZQxFgy34HfwLZt+eG6BKhQjZPuVQ7ZE3YzlNWhmBzjZszGbm6Q4DRsV95CHDD15W1OY1xMyFwE2c8fi6FI9izRykKZ8xJLsq9Oy2hhj76xumK+/8FTwStENR7WeMlaOs6c/xCk1a19rQDoKOC240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dn6sKyRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dn6sKyRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3871F000E9;
	Wed,  8 Jul 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783523558;
	bh=Sm3r/3+DLhEPgKEZI/6VAOv5Yr6poZjRj7MnVHQ2Hqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dn6sKyRs8zlJFZBBCksq6qdDJPcQiPZsJ0T8dI5BX307NKMcHpVKPYi2lYQ4pVle+
	 bZ90P8+D5TNeQjmHSA/9D9UBL15g/VhYbPq+y63glKNWPiGnkLqbyWDkoN/cMwB0xo
	 0hAJk7R5KIInOjPp0SGSK2fJa0GxGzDH6KcP5orE=
Date: Wed, 8 Jul 2026 17:12:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: cytherm: replace deprecated simple_strtoul
 with kstrtoint
Message-ID: <2026070803-capable-economic-d54c@gregkh>
References: <20260622123124.2380612-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622123124.2380612-1-inasj268@gmail.com>

On Mon, Jun 22, 2026 at 01:31:24PM +0100, Jad Keskes wrote:
> simple_strtoul() is deprecated in favor of kstrtoint(). The old
> function silently accepts garbage input. kstrtoint() returns -EINVAL
> so the driver can actually tell the user they typed something stupid
> instead of accepting 0 and wondering why the thermometer isn't
> responding.
> 
> The 0-255 clamping stays the same, just with proper error handling
> in front of it now.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/usb/misc/cytherm.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
> index b183df9826bc..81de3fecf3da 100644
> --- a/drivers/usb/misc/cytherm.c
> +++ b/drivers/usb/misc/cytherm.c
> @@ -85,7 +85,9 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *att
>  	if (!buffer)
>  		return 0;
>  
> -	cytherm->brightness = simple_strtoul(buf, NULL, 10);
> +	retval = kstrtoint(buf, 10, &cytherm->brightness);
> +	if (retval < 0)
> +		return retval;

This changes the user/kernel functionality, are you sure it is safe to
do so?

What is wrong with leaving the current calls?

thanks,

greg k-h
