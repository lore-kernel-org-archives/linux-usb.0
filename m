Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0BB390C81
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792338640; cv=none; b=hCfieHs6AEehKDKUfyMUuz8Le8dTIOZyS4uswnyrr0Yb53xcI+nskbSoEIJPMrGsGuupneyNwYVOB5gsUHRywbSJPdI+3aGW9JRQvLariWvvhGy37Kw+4nyt8TfV0APIWAWF+c2xoyROJbfnl6xhzMXWyCZycvcW6CQjw7zfFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792338640; c=relaxed/simple;
	bh=X+1zrtXejRrfQMhuaglFGS2WuOgDy+lVe5hYeklGYC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo3z1C9caEg+8gDVvVWyMxqA0oJoq6dxFrEfdkOEKP0rUmMobI/c4lpRG9QM8TytjJM2FkDkDJLpON9xmySEUiW5wj8OBdNhECmAOt8zvlK+PTKthe+ITIg9C46Xk1E/wxcxwto02BCg2sRE7dW0U8BK9P7w7sDNoyNIiW+twJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kHxC1lV0; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kHxC1lV0"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53512cd2f85so15583121cf.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 08:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792338638; x=1792943438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wDrGfc+QmDUG23Iv3Y5ooeIfcPWkkBSGjgdvWGkt54U=;
        b=kHxC1lV0/lOkHeSP2hpxlyHtjyZuw31r7Bv4Va0TtkxTLqoGYok6LeWyH8YWtbvENi
         czhOXtS7hZZ1uXHhO1oE3qQ/zGWo/IIW/cQI0ZrmomNSjAP5QDujGfZUYJBRT4rz5YUb
         2ZXVlIm0HPnZUnWJpEHCFQeUyPgdDIY/HAk3UyJv65vD7kEW3oq//Q46wHPBrNqCbQYD
         AtReC4kO18K85DWVXKDRWxSFN136Ag/ylrGM9a74c3CWoMnC2OZUgj08be4uCJVy+acB
         JKZbUetPlCnrx4nvI/s6gGH6VOsSZcp5K5VRzjXiU2AJ1ErTQOuobceY+Fys/X5UiR9E
         gSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792338638; x=1792943438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDrGfc+QmDUG23Iv3Y5ooeIfcPWkkBSGjgdvWGkt54U=;
        b=zBrXgl9RY99EkpKBS8IXneXRnCLroz8UIf2B0OK1GpessOgRSFQeETwAmdkrGIlVrO
         bFri0qFrD2239iNlwe3adplh+RM/lc9WcbHkVDgbzjQPGlUJOycIzua1z8HZ6JeNCNoB
         EfTphEyAqugRGVVdbn+BQwR9KPwfmTaf+gqg2NW3190dkj1lyZaklS1xlCJMbZVhLDn6
         QGGmDkLXrRzqKKohFmwE6YzO5YVQFxf/yk3V2YE64JbBWY/KxQtrd/LOhyL6KylN6Ufn
         EEdKRQcu4HWT1Olc5ZMTxoSyOGjFXpiVZvC/VhztY3Y1LXlp+lY7WJVpL7f2qfdm5Fhi
         U/ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR6nUKgHQtF+kMfsCy1HLRLKpt5qK/fEoWTi2aydYlpmhwtGIX51ZiK166ae3jnNF+NhFQ80v3nuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR9i4RsdwZO3zaxn+I9mvB9SSdwQBckBYELK/Wp9Q982LogNCg
	3E56199vPjNtC+xwk59cDZH0gozV4feYHzG/djB5Yt/Gt1uAqUBuIA5kgap6gWACDw==
X-Gm-Gg: AYBFou24rjnr67s9+gm+yCOBSSgMJqUBZZngVYtactNVif5WKDpHy7iNr6Sqqm8mRk4
	rtMIQxzfIK4rH3/mlKmS8wjxiYydWQWaFi+ynKYPhrlmNpgI//8Vn1yl5d5fz+31iIMRv7yQWva
	Vkw8pS7xTkFJ+yAPP2sNVfUB+S0LEpC5CZKaFDpvjLl10E5mCMc5RFFEzxXAuUBk0Zy2lxHg/xy
	wFBsKb9fRzTxGubz5qIUvS5sV+JwbWHfUrWAkIDgI+JWyefMqtbs6slk4mvJ3V1JbOSlScl0Rnp
	GnpJGdEpiuFSr+zXhTXJCWfaSXXTeI+cJlGSNs1UWo91mrY+ZF4+hzvbcEW90h54ldrKU/0nV+N
	DP5L9OWhxarRa1nOZUIvif5PPq8vuu0nkHjU2vvbbfmw+R/YWXUeuDkJMHU4Z/y5ey3uAcFwCKk
	LPZUJdnqovBi82SGPqq3F5QrVyyy7cGgCwWaEm3zJl2FUsU2fWQzQvzdrCl8qHFrtTDxI5+s8=
X-Received: by 2002:a05:622a:2b09:b0:535:1368:4582 with SMTP id d75a77b69052e-536460097bamr72026991cf.46.1792338637925;
        Sun, 18 Oct 2026 08:50:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm32924451cf.14.2026.10.18.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:50:37 -0700 (PDT)
Date: Sun, 18 Oct 2026 11:50:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: take filesem in nofua store
 to fix backing-file UAF
Message-ID: <17102759-8b97-4b5b-b130-c01ef0f90980@rowland.harvard.edu>
References: <20261018130519.65850-1-yuz08559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018130519.65850-1-yuz08559@gmail.com>

On Sun, Oct 18, 2026 at 11:05:19PM +1000, Yu Zhang wrote:
> fsg_store_nofua() syncs the LUN's backing file when switching from async
> to sync mode:
> 
> 	if (!nofua && curlun->nofua)
> 		fsg_lun_fsync_sub(curlun);
> 
> fsg_lun_fsync_sub() dereferences curlun->filp (vfs_fsync(filp)). Unlike
> every other store that touches the backing file -- fsg_store_ro() and
> fsg_store_cdrom() (down_read), fsg_store_file() (down_write) --
> fsg_store_nofua() holds no filesem while doing so.

> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index 0000003..0000004 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -415,7 +415,8 @@
>  }
>  EXPORT_SYMBOL_GPL(fsg_store_ro);
>  
> -ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count)
> +ssize_t fsg_store_nofua(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> +			const char *buf, size_t count)
>  {
>  	bool		nofua;
>  	int		ret;
> @@ -424,11 +425,13 @@
>  	if (ret)
>  		return ret;
>  
> +	down_read(filesem);
>  	/* Sync data when switching from async mode to sync */
>  	if (!nofua && curlun->nofua)
>  		fsg_lun_fsync_sub(curlun);
>  
>  	curlun->nofua = nofua;
> +	up_read(filesem);

Shouldn't filesem be held only within the body of the conditional?  
There's no reason to take it if fsg_lun_fsync_sub() isn't going to be 
called.

Alan Stern
