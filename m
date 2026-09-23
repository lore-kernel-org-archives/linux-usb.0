Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC6534450
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171939; cv=none; b=G0D9MUlvWPr0oZWX4n2BljLlCYrSMoLxTASZHBRp3YUsXLLO8eJr2hMjsdhjl26OXpGHlTcYVCPLG8TySiU2RAz+iZhzjkDc/owPDX6/CiRC07dhw31hb+TmnT7c9kYAq3SLOBV7PkKTCX9iq8zG8QRB9cZEn/MJYovV9Lc6YGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171939; c=relaxed/simple;
	bh=D5uY5lU0TQnsX62y8ulBEqbE+gTXPNZdgicYOq6NV2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvJ1IiR+WHPRpX7VJt73YzEVOMlqxGpEYJeB9qX8zcDj65d34KO7jsJEvL4GYkkTTP4jaY2f5Z/CZN355IpnDmj2F+rg601wX/sPC5Q+eU2ZqCurNjMLfYQndj4NZquFIt4Apw2zxjPhn33jiWlUFyaYNCxCVIWfjC8yKUxNCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Vv15EoHB; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Vv15EoHB"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb767cc7fso8947291cf.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790171936; x=1790776736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwxWOeqFsaBhrr7abuLxYB8tbQMZW7QAK5YjA6fv2Oc=;
        b=Vv15EoHB16RWYrWO3TqB+YpL8aXi9+Qd3KXNkohQX+kHIKnQ/XuoJLSRvw2MIQjaJN
         ad3HvfgduYhszVx0N0WTZ/Z8FI847kLU//u2C9gSvdMHwEESykmxvIq7JIHGdz63PiWh
         be8vPeUd2/YW3BKdSCFly/Tbjm7+zFELf/fGfdJU+gBjkzZMac9PcsJf29/q21EYGf6t
         CsDPlC+xbsLSs8TzJfKdXJMQsIeCyJAb/0Rg2DSnGGga/DYDI/aOOri+VlLBIoLpXfPR
         1rbJiVSCtuPlQ+kQuuICSa0QiUXzXWHeHa8EJvyETKkpj1E+e2ptQCk2hPyrTSo2Ry/V
         vupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171936; x=1790776736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwxWOeqFsaBhrr7abuLxYB8tbQMZW7QAK5YjA6fv2Oc=;
        b=DkPTXiV3ObxdFCTFduu5ZG7t+hkiO0RKJoqZGSQ8hzQzpJjuVMVftFNo372qs7PCGQ
         2AnAChM0JE0BSVVU5mfIrqIcCOPs3eZJM7swBUlGiQIM+pLKtMqYep9ncsu3KoAaIdog
         m2sXSZKAnEFnQFl7CaYM3YirU8KC37UMFOFZhKT9mMdc6+K10QCWj1+noAW3E1vpi/iX
         0sRTy53kW9ohvBObgSLVJuve/0xQe4EprOF1WGM03yPLowHnEav1GEL8Z5L+9Xpyq+vV
         McQfnqCxkawSMpfbmIqwYO+DneC7r5KzNWJKHY1XGDa79tsAhydnzyNoqXuSA4TSi9Mw
         ZvwA==
X-Forwarded-Encrypted: i=1; AKwUvBxFxuuy5QJElyL8k2PB+HNpJ0t4H5QxX0iY8lLlZfHxLNXDxvZnKRzp1P3kGRnA9ej4QohOYZwAbsE=@vger.kernel.org
X-Gm-Message-State: AFuF++lqYsXCfzvSLAHozCMGede1ARGIINEGFaciG0NXS2IkfKoPWgsJ
	Uxp8Iuq3YJBDM4OdPa/hEo5VVeGEKEFhctRm+zAS2pwqM3p/yB3aWiUCw1+gxNKk5A==
X-Gm-Gg: AYBFou2Si116NJhWW3Da7OiDa0x4mUmepcXhpN5snjYlHjdV5HpeuOo9CYwfWKsNA5b
	JImNj+P78B4YolV7CEEE/D067Wu0SpUExG4UzOX2hGHBVEkD0BLNl1pro1QELDYIp5JL0h3MJUC
	OiCNs2BuouDHa+lYOG/vFMEndJ4SwPEYkBT8IhCD2zAkVOT+SaNfN46PiTLN8hQJDoNLyO6Slvc
	AkWVkWBOH7QXVn8hRJKRMWgOc/4jAKyLrlgr4KSFmKrXJZY4lKEBd53c/I9D157dKLBQH2+QaNn
	rkjLgk86zT60cyf1V4yGcis02qSCB6kejA+H0oE614tPpytXnN7JfNbuc/0r8BiFkwPsTRyjGsH
	t9Peun8HWdXpoxp8YzB7EPMA3tQ8diLp/liaNlcnQTdCoIHrdLcBxTnkJ626XRPUVqtAlajnUDh
	DEniqzu+1H6qXutuaFlmlYGe9s0CkwC+zFbLgRs2BGB6KggIutKsg/okZGcP2zIKgAnaqa23SHA
	TRBnpMfV5tEglKa
X-Received: by 2002:a05:622a:58cd:b0:530:d95b:ea36 with SMTP id d75a77b69052e-532eabdbc61mr46572181cf.8.1790171936111;
        Wed, 23 Sep 2026 06:58:56 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb1e29a8sm20015791cf.7.2026.09.23.06.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:58:55 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:58:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rohinthan P <rokinthanp03@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: storage: alauda: check return value of
 alauda_ensure_map_for_zone()
Message-ID: <52e64df5-e10e-4424-b252-64e6f3074d78@rowland.harvard.edu>
References: <20260923063008.19570-1-rokinthanp03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923063008.19570-1-rokinthanp03@gmail.com>

On Wed, Sep 23, 2026 at 12:00:08PM +0530, Rohinthan P wrote:
> In alauda_read_data() and alauda_write_lba(), the driver calls
> alauda_ensure_map_for_zone() to initialize the LBA-to-PBA block mapping
> for a zone before accessing MEDIA_INFO(us).lba_to_pba[zone][lba_offset].
> 
> However, alauda_ensure_map_for_zone() returns void and ignores the
> return value of alauda_read_map(). If reading the block map fails (e.g.
> due to I/O error or device disconnection),
> MEDIA_INFO(us).lba_to_pba[zone] remains NULL. The caller then
> dereferences MEDIA_INFO(us).lba_to_pba[zone], causing a general
> protection fault / NULL pointer dereference:
> 
>     Oops: general protection fault
>     KASAN: null-ptr-deref in range
>     [0x0000000000000000-0x0000000000000007]
>     RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:972
> 
> In addition, alauda_read_data() checked lba >= max_lba after calling
> alauda_ensure_map_for_zone(), which could compute an out-of-bounds zone
> index.
> 
> Make alauda_ensure_map_for_zone() return an error code and verify that
> the zone mapping pointers are non-NULL. Check its return value in both
> alauda_read_data() and alauda_write_lba(), and move the capacity
> overflow check in alauda_read_data() before calling
> alauda_ensure_map_for_zone().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+ccc9a7cb39fa1af827ea@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ccc9a7cb39fa1af827ea
> Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
> ---

Doesn't this do essentially the same thing as

https://lore.kernel.org/linux-usb/20260901065831.43567-3-arka@arkamondal.net/

which was posted three weeks ago?

Alan Stern

>  drivers/usb/storage/alauda.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
> index 691fe47..da4964e 100644
> --- a/drivers/usb/storage/alauda.c
> +++ b/drivers/usb/storage/alauda.c
> @@ -689,11 +689,25 @@ static int alauda_read_map(struct us_data *us, unsigned int zone)
>   * Checks to see whether we have already mapped a certain zone
>   * If we haven't, the map is generated
>   */
> -static void alauda_ensure_map_for_zone(struct us_data *us, unsigned int zone)
> +static int alauda_ensure_map_for_zone(struct us_data *us, unsigned int zone)
>  {
> +	int rc = USB_STOR_TRANSPORT_GOOD;
> +
> +	if (!MEDIA_INFO(us).lba_to_pba || !MEDIA_INFO(us).pba_to_lba)
> +		return USB_STOR_TRANSPORT_ERROR;
> +
> +	if (MEDIA_INFO(us).lba_to_pba[zone] == NULL
> +		|| MEDIA_INFO(us).pba_to_lba[zone] == NULL) {
> +		rc = alauda_read_map(us, zone);
> +		if (rc != USB_STOR_TRANSPORT_GOOD)
> +			return rc;
> +	}
> +
>  	if (MEDIA_INFO(us).lba_to_pba[zone] == NULL
>  		|| MEDIA_INFO(us).pba_to_lba[zone] == NULL)
> -		alauda_read_map(us, zone);
> +		return USB_STOR_TRANSPORT_ERROR;
> +
> +	return USB_STOR_TRANSPORT_GOOD;
>  }
>  
>  /*
> @@ -823,7 +837,9 @@ static int alauda_write_lba(struct us_data *us, u16 lba,
>  	unsigned int new_pba_offset;
>  	unsigned int zone = lba / uzonesize;
>  
> -	alauda_ensure_map_for_zone(us, zone);
> +	result = alauda_ensure_map_for_zone(us, zone);
> +	if (result != USB_STOR_TRANSPORT_GOOD)
> +		return result;
>  
>  	pba = MEDIA_INFO(us).lba_to_pba[zone][lba_offset];
>  	if (pba == 1) {
> @@ -954,8 +970,6 @@ static int alauda_read_data(struct us_data *us, unsigned long address,
>  		unsigned int lba_offset = lba - (zone * uzonesize);
>  		unsigned int pages;
>  		u16 pba;
> -		alauda_ensure_map_for_zone(us, zone);
> -
>  		/* Not overflowing capacity? */
>  		if (lba >= max_lba) {
>  			usb_stor_dbg(us, "Error: Requested lba %u exceeds maximum %u\n",
> @@ -964,6 +978,10 @@ static int alauda_read_data(struct us_data *us, unsigned long address,
>  			break;
>  		}
>  
> +		result = alauda_ensure_map_for_zone(us, zone);
> +		if (result != USB_STOR_TRANSPORT_GOOD)
> +			break;
> +
>  		/* Find number of pages we can read in this block */
>  		pages = min(sectors, blocksize - page);
>  		len = pages << pageshift;
> -- 
> 2.53.0
> 
