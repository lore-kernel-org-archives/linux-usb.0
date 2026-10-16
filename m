Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA247DD64
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162188; cv=none; b=Pf1TgzpSbWl4UpcN25py/Tu9AyC2XBKsKB3QAEZgDioIaM8/jwhZcMQrHWebz1aonkoi7Xlp27q/aXO6o8B6rgHvNP/kRJyzuukrymzbrmzb5WNSluqzDRed/T14b2RFkvQPS86jqmFCBgUQjrLB2TQrJ8elKjXso634hcoBNQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162188; c=relaxed/simple;
	bh=b52lKLezX/Zp+plRq3rbGqftDCBHkAneH75XPmt0u/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv8KTmtXl2QW0CTijpSOy9UzQsSlP35eYgVAYOGhvNvbOdtB92CBeahj+QsSvAuSs/tuyb05joP9tYHpsguM5lmEgJhZyfu7Za3mvz3GmEXdOTMaV95RKM1y8wmQ0bmFFqH2AxWAa/CQFmNu3lbEO5iVWJGpFmj/OkIKz+rfkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B6tao+SJ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B6tao+SJ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b89c6caffso522006d6.2
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792162186; x=1792766986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4e4Pu8vnMw2JP4CMxHxRT8SmsDfn4YfgSedzqtk2/s=;
        b=B6tao+SJX52vzYZX5k9Na05K4jyu+YmFBw6B0qN2plv5LKsqeGcr/lhE3C9quRU+Gg
         GKU5B+EEAZ+rEy6D+C4jrqAK6R9MXHkPMC8cYEr8rkYD57EmRlQgLIfovjn2eYMs/LkE
         vnRj4cJhvabTb2z3ndMRujQZgcA5stPs0htqdHolBL5XfLWz+RgCSpSNQceFhSPPC5Lu
         hF/YI62KUCzaXUDzoc2AnDh7HOzuu7RsVirc+cy85wzOAp1dzd4xufQcVPNk0Ni6sICl
         Ju76yQpPAsssKfa3mM2ClrWqB2RBP2O1qVIx8lBs1OOGuKvZq/dbcoWPE8ONL5yfsSIa
         l9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162186; x=1792766986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4e4Pu8vnMw2JP4CMxHxRT8SmsDfn4YfgSedzqtk2/s=;
        b=wfEftJQDaXc6ppn18WZK0F3cUIVUuQGNHWyEGzZKg2GRpKoMKjj4kQKpIOUi7BTfvy
         Fmlx5dyIxIMZaPaUtWo0nb2bZEHjdgO6Jqehfbpze3sg8DH9tJHyuYfAGvDf1Dbu1s12
         Hy4V38XtO4bARVWoLoYDirXqSLb01wXntNmjW/8Nf26mXnydHxAef5TIRLv7AexA6A6P
         5wB892CdlAK6NHVLuvVqNp5M3WBrYltS487+0mERlSSN0b7glL8RmfgxxjkGif3/37Nj
         F2MOAULOf4gszC9YxmAGsU22IcQQD1Tmuf2HScSMC0dntxA9DPsFq5nnUW1LePK0ru0i
         Rkvg==
X-Forwarded-Encrypted: i=1; AKwUvByWf/gZlcG0jYW5phj1rX6VdIn11cOReZ0kxcFHU6I3CXv5gXPATD6fJuk6hVTYkMZeNuUpf+9EnfM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDixn9G5l63C8SMoUBCMEut5CksPW2g/ml41BP4jVSlGElQ1dS
	5ytCkatm9VtA7H7PLgWoENn6GC++0/erOpLLJ4/ALDgw9J3kwaTZLX7BgrWwbj15wUY/qTL7TeU
	i/2Rzaw==
X-Gm-Gg: AYBFou1i9fLBp6fM0OX746H7o9d4aJRu6OoBVg+EDUNF+/uL+pGlUISpqM9F+kIjeOu
	70w7j65fMGwJtQhn/zybDhnIdXHHAvFuSFuaZ2pZOs+7FLZCQXxMYjW1D3ayDtKaGdCFt3crxb/
	klwvgfy0PSsf8Fq7zB1OeN511sP+/Dn8r49Py0pGcD6JYQOVUia01eS6uEH9SJPlgaTG6iJj4qF
	GBqDJ0A/sg3slr3S28JPTtRwYoer2l+DRpril48v18Bta9dELw2zLBg2trinKRk2EH1CM5Kc1D0
	pXatlyQ13Q905I2G7Id4Vf8NEYqg4iCad+Y9o5zuu2ZzNsNEuM/uGRuDhRblbecuYN9KS5HyNO2
	EY9AqYOc4D+KVk/+RBoiFrgD70JoSemE473uUvykibplwgT3OAZf6uzlcrB+SazvkUGWPZz8M5/
	Huso1jLoBCB8ArTG2fRG22oJjUg7wKQeL+xUVRLmkksGsNWcOi/Gq1HinhhRwIIk+Lr8jDivk=
X-Received: by 2002:a05:620a:371f:b0:93a:2221:5460 with SMTP id af79cd13be357-93f29d392edmr8466485a.40.1792162185942;
        Fri, 16 Oct 2026 07:49:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f19f911e6sm231598685a.0.2026.10.16.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:49:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: usbtest: prevent divide by zero in simple_io() with
 zero length
Message-ID: <5287f274-2130-445f-a67b-d12bd7ee3a2e@rowland.harvard.edu>
References: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>

On Fri, Oct 16, 2026 at 03:27:50PM +0800, YuanZhe Liu wrote:
> A divide error oops was observed in simple_io():
> 
> 	usbtest 1-1:1.0: TEST 3:  write/1 0..0 bytes 16307 times
> 	Oops: divide error: 0000 [#1] SMP KASAN
> 	RIP: 0010:simple_io+0x2c4/0x540 drivers/usb/misc/usbtest.c:497
> 
> The variable-length tests (test 3 and test 4) compute the next URB
> size with "len %= max", where max is the original
> urb->transfer_buffer_length. However, when a zero-length transfer is
> requested (param->length == 0), simple_alloc_urb() still returns a valid
> URB with transfer_buffer_length set to 0. On the first vary update,
> "len %= max" divides by zero and the kernel oopses.
> 
> Commit 564e69893c63 ("USB: usbtest: prevent a divide by zero bug") added
> the equivalent zero check to alloc_sglist(), which covers the
> scatterlist tests (test 7/8), but the single-URB variable-length path in
> simple_io() was left unprotected.
> 
> Fix this by returning -EINVAL early from simple_io() when vary is
> requested but max is zero, so the divide by zero never occurs.
> Zero-length transfers without vary remain valid for the other callers of
> simple_io().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/misc/usbtest.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8759df49be28..e2f5e6be353a 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -466,6 +466,9 @@ static int simple_io(
>  	int			retval = 0;
>  	unsigned long		expire;
>  
> +	if (vary && !max)
> +		return -EINVAL;
> +
>  	urb->context = &completion;
>  	while (retval == 0 && iterations-- > 0) {
>  		init_completion(&completion);
> -- 
> 2.34.1
