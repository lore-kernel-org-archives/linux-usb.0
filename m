Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58444B8DD8
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334331; cv=none; b=m3wmJhwXLUgFIaNX4R4SeU+MmpSbCnESUt/3UQk69BlbkilSnTkQnRzQ+8Oanqok7bUkPIT/rMoOct6PfaklzAdybhz6Obq8Yy0j4Z/PNS5t7/ruN7pugvTTNY0C1OUdCBBHulL3tjDB2EW8Fh7Gk2SaachgfgUmLh9oY+i9ebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334331; c=relaxed/simple;
	bh=T9by4kRg+HcXaT9fvSv2FJ/TvpklmdEpn34reGATAJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6cnzxUVLPcmeXPcLBEED7FKyAnl46nSNs1EXPLL+udwcnsME46kRukYpkHPGjY+JOpCZUQgW0Xr7BPPGpProNggTJGKa7IF9pXMNOvu/pcn/Y/S3Pf/Ambs6PZvCUzb0xdeYsWZ+toYYqzmM3rCNqnEyzIew52Nvrb/VF6sKJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YxQpfUal; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YxQpfUal"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e622cc874so56564885a.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785334327; x=1785939127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9nH7C12AAMTnsrKtngI4gHKic+dxofm32Qf5T6pdLgY=;
        b=YxQpfUaleV6qjW7v49SwJl0Slp/96RbVJRzEYyawqGkDU8kJcrFZuOLUijIRWd6ojk
         gaQKe1sN8hGVuG4S07teXy4MsLTtolI4BCWLe8TJRaJh8jW4J5HgbhA7u/3JeRa24cLg
         Cug/cn1X+XjiWPdLrKZMiBTAUl3TtiOC9zvpI2souy0om8T8DzKztSivJ8uyXuGoynD4
         R9hmm2zj+YlR5eSLl55ZM5jed3IpJ+6O1kUu3bbVv4nS41KWeaPjoV2XoIU1pyJK84Vg
         cGJAGWyRFGiUTEhTI0u7lZrjyVR6PnB3Nc++/SQ7qEuOxGbYO1O1qGJAPTr5vbZ9w5xX
         20eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334327; x=1785939127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nH7C12AAMTnsrKtngI4gHKic+dxofm32Qf5T6pdLgY=;
        b=c0ugzHModtugslMHKrhRIJVm008VIJZaUlAuGwZQcyrJgFnDQSq3fq8d/4cHVso9a/
         3YJsTYDWvndI35HrIoiMsofrjTX5eDhRAmW9h7T6Fo/lWQnxJavhvMCnY00AFKBF8Aq7
         Ohz1J9oHAa0ej+7ytNCwjCPZRsqX92ZehZXs+3UyOyfOKJ0wAcHEEBIk+HqK8SB0oWDj
         IEFX+WNtX7Snusmnk4F1tZWdP4htDSozX5aFVxPz4m6dc2bki8V9glKQzuESg4e+3Tyj
         7UOOA3abs+PxIyoO0A8vgPKcW5UR3LPUuqy7/BkoSLb40Pp9EVrCSwEIpdkYSRhWxyvz
         OaSg==
X-Forwarded-Encrypted: i=1; AHgh+RpGHQGuCLaFK2AVp/odJKTqxeo9+HuN6mRB0EpYrRoZhiQiiYPplkMbT929fYMP8Kvpecukll0XIo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVvNI7+xxPCEklZMo8Bw/i0Q2cOFAJZtRezG/KZ3zxonFLzXDV
	rcoVHL0EYFV2OI5TyDQY1PRwE98AOorTe1TlemkuLEuqb4tLvaTC+pQFvbPlKKAUD32MWhS/pcp
	JVjxcJw==
X-Gm-Gg: AR+sD1064G+1C+vzTyysRBMOcKaMkkLXe/CsK75O9vLCP74kT6gKmXKSDGIpQrIOD22
	9phyhSpBk0NnxelbsFgGmkCjAOgezZMJtu0C26FgQlHbBAWZBe3RH6qIkjjmZpWtHhCxoh/zAnm
	qN7ifYJXgY5+lMjTg5qeD/eYjT6puDK4EOIoKHKwskq5sBKHO7yZwkDnp0xkX+0MrbsyzOX7X31
	qeEr0HGlG1iUrPgUeuSc5wNEYGhnB4xGoH3fvUUbIMEnBE61Z9IH6ZvK2fmdHsyVkF6o1zAi2c5
	WG3vuI7vtJlRs2vVp9pRuviEpFxR2hklzEtkImZp9wqYMU4B2FEZWPB7jfouJJ4/dzOj4VNmvWS
	/1D9yaoV1gMAOsAVIop72uMQD3RwWMnDZBOpK3PJ7HEVTNeSSMfo6olXZumErpVHwluzzQLAHds
	7fhlGLYe39XBp1nQtKkVhL9fYG2SE2QVP+KpoAonJn1VtCGiFHK0/AD+X9AXZPLQQBm0Kbyml19
	zsAIQAV0cQNMBO9XQ==
X-Received: by 2002:a05:620a:2b9c:b0:92e:535b:e08b with SMTP id af79cd13be357-933025a4b2cmr725634285a.33.1785334326405;
        Wed, 29 Jul 2026 07:12:06 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e736a9ffsm173899485a.47.2026.07.29.07.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:05 -0700 (PDT)
Date: Wed, 29 Jul 2026 10:12:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xue Lei <Xue.Lei@windriver.com>
Cc: gregkh@linuxfoundation.org, kyungmin.park@samsung.com,
	andrzej.p@samsung.com, balbi@ti.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: reject relative paths to
 fix sb_writers deadlock
Message-ID: <d1cd4b2b-6389-40af-8637-1d3fa46c2491@rowland.harvard.edu>
References: <20260729103245.3744500-1-Xue.Lei@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729103245.3744500-1-Xue.Lei@windriver.com>

On Wed, Jul 29, 2026 at 06:32:45PM +0800, Xue Lei wrote:
> A deadlock can occur when writing a relative path to the mass_storage
> lun file attribute while the process's CWD is on the same configfs
> mount:
> 
>   write(configfs_fd, "relative_path", ...)
>     -> vfs_write()
>       -> file_start_write()          -- acquires sb_writers (configfs sb)
>         -> configfs_write_iter()
>           -> fsg_store_file()
>             -> fsg_lun_open()
>               -> filp_open("relative_path", O_RDWR, ...)
>                 -> path_openat()
>                   -> open_last_lookups()
>                     -> mnt_want_write() -- tries to acquire same sb_writers
>                        *** DEADLOCK ***
> 
> This happens because filp_open() resolves relative paths against the
> task's CWD. If the CWD is on the same configfs superblock, path_openat()
> calls mnt_want_write() which calls sb_start_write() on the same
> superblock, causing a recursive lock acquisition that can deadlock
> during filesystem freeze.
> 
> Backing file paths for mass_storage LUNs should always be absolute
> paths pointing to block devices or regular files. Reject relative
> paths early in fsg_store_file() to prevent this deadlock.

What happens if the user gives an absolute path that just happens to be 
below the configfs mount point?

What happens if the user gives a relative path of the form 
"../filename"?

Alan Stern

> 
> Reported-by: syzbot+4c9318af45f0bf2af153@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4c9318af45f0bf2af153
> Fixes: ef0aa4b92cf1 ("usb: gadget: f_mass_storage: add configfs support")
> Signed-off-by: Xue Lei <Xue.Lei@windriver.com>
> ---
>  drivers/usb/gadget/function/storage_common.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..d45c7a34df99 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -448,6 +448,12 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  	if (count > 0 && buf[count-1] == '\n')
>  		((char *) buf)[count-1] = 0;		/* Ugh! */
>  
> +	/* Reject relative paths to prevent sb_writers deadlock when
> +	 * CWD is on the same filesystem (e.g., configfs).
> +	 */
> +	if (count > 0 && buf[0] && buf[0] != '/')
> +		return -EINVAL;
> +
>  	/* Load new medium */
>  	down_write(filesem);
>  	if (count > 0 && buf[0]) {
> -- 
> 2.49.1
> 
> 
