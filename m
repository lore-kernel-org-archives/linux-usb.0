Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505505;
	b=nSTJgrT6Y1Hj/Bjcsy3Q3vUwjVpEY4TD7sYZP1rA86C8uNypMwpsecpFJTPPhPo32GA+
	 H9QXJMvVO0tXQFsOZXGZJVIuUhy8ouO2U4QhpTqgAIN9NWKz6Sra+vBYgOEdMss2RMh4o
	 9tn8zKq+wyd8eUqY9cyA3EjURp7/ljst9QvGynxt1uXLF8v33OaG2Z86vwAmYMuiGi+oL
	 BQxr0ofHTedcHlQwL75FLm0xB6xZMnzCNRXTKUcsbWqC26zV4SfiEWHme5T7KEyQh9LDj
	 /pO5bYIWorUAt+gsgipWKzyEqsTP6lhvdfVr4FclTRrt4eyQRXIerO2AI6hIsGhnhPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
	b=ydp10Z4Y2ltXTxbkCqLXw004pXlPXFljrpLwK+jgmKojhENldJK9ZSqLiV7z3Jq36kvy
	 LPSVMy5zMajo3PHsZfciYF2yBmkkOapHSFKLntpoCR/JCnsAkNAjO9PWIs+v66kkRTGH5
	 suwrA/Yx9Zyt98JhYO5Ea3N/Z2Xh8MiuQZ63WKtjL49XqWUcbQndCLEtbILDK+eW/Xo6/
	 sYMmjQfkCqIMx2m2qo20QInfDqNX37dikOEvwEka8lIR73LVeO2AV/HKRPuwwo82zZ7Me
	 FT0CbVzrqM87p5SbvuN/qknJMotv+Oyv00FVimhzPkL8+eM5nnkv/twfXVdxtLH4KwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CQqZm4Qq;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2B60A4AFF
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE2B60A4AFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CQqZm4Qq
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f20b304c0so314301185a.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792505504; x=1793110304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
        b=CQqZm4QqzQBrGwRTNeTgjajTHWY5MaTuXaVA+ATI86hSLgiW1FB774vgWc3O4miO5t
         fu41DHQSSTmYMD85XbQQElBqDVXE7y1HvgWF2Jnyn9+tI8gPRSkb5b5emYx+EvwCQEkg
         EIUtsg7/v32JJRMZaanidELXfEvOYzZLx3LdxawrZ31IoABDmkiXrX14xkm2e4ZVZzN2
         10ce2wsbzecI0sAzpvZnMoBjlaIAUTWDQvssIUFvmK1nZgrPFZmue7SkHG2a0RSAdD6P
         bkHTA74GoHxzI2exBgb7i6elGN8KPdFaJ3ZAq1enl1BGDRTl21oSlZ6rGxb/3xY081Rw
         17UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505504; x=1793110304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
        b=hILQCmg9EzAweV+SQdNgQXDV581AJ3xZezOLqZ2nTh7Xn51IqTwobNQV4F5udRIopu
         e+yoFVydsdkaUnDm6nOcPcKo0uD4rafGTYkAtqO6sr/2QzVM4nZurXGXmY1OMF5tHbub
         80FlQxW5BjDXbs0BH7lML73oX/YOPj4xtywBzHxPl3JVQFVoeL/Z7+Oj8nh0fYtpI9hO
         lWmmik/l0Ca67eJflxPb4patltywKabA2ZYRh6Wis/EQlClE6H1B8vkHm12OT3IbvXfA
         owqIiVoCvz5e3WUZeAhKv8zk/8Pb3u59hujoNvUWFyrp+4qaYHAOTMvJaR2r0v0e/2Oh
         G9pQ==
X-Forwarded-Encrypted: i=1; AKwUvBysr4n5ZBlnyfn27EbaGa+uCezp1HzMnMxBr+VCqBb4PvofmAXOG+wazKlTpOgyWGVo31wNpl8OdUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxd1iLR4LBI7opJ5EoQkrd5gRT/O8h5Xq76LYsx0W9dYor/gLR
	AGqPseaAVBNjs1qvPccBEfURT/SjW/HCTTP3Wo07m9J8Uvw3f7IZhl/0YyzMTYPOEA==
X-Gm-Gg: AYBFou14uvmyZdy30X2jb7IBl7uy70BT+t8WYrBTuuom+5tn3HDyeme8u9gysT3+RAm
	HnK7TT4NMOg0fedHM6jlsw+VnYNffTSZNK7JuFEuGGSAxQuBNOQSRDRKkDYS+N0Pu+9InxD98kJ
	mIED1g9aCOQ2a4IcoKKvQIw60lJQIqv/zG5c4kd0dGNnezz+EvxVSDtGhEBwE4QdS/xvVMWM05m
	5m5uYTx8F3vNBJdeedSoaVyHrguwj3bNMmoXfV0Ha4gT+KuYVQW6hu4ixsGPqrVNgWiqvIBs1/O
	HfPoFjqTbq4vsSRdc3yMIql6wOUXGoXlrQ5eDHIB5us0ngBqWiG1QpKwzLelMzXQa+SOZwTFtAz
	emWGjgGeC/Hw72Ya99CfTO7O+53Ysy/rwTF8Q1mvlpiVS9N/+932qsxs+IOKN76ZPtP3WiZbKhO
	d6yfzLhOyfWs+iq6Qv0Y3EWAYhswkLKqWdVB3EKKLw4FVqEJ+LSIFsMaMcZ9kvMoVFUNuRlRI=
X-Received: by 2002:a05:620a:4042:b0:93e:920c:c012 with SMTP id af79cd13be357-93f29b7f9e9mr1754715285a.10.1792505503808;
        Tue, 20 Oct 2026 07:11:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b05e2f3sm228265585a.8.2026.10.20.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:11:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:11:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: take filesem in nofua
 store to fix backing-file UAF
Message-ID: <3f13c0d1-0e3a-4a62-a149-4c719ee3cab5@rowland.harvard.edu>
References: <20261018130519.65850-1-yuz08559@gmail.com>
 <20261020023050.87701-1-yuz08559@gmail.com>
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
In-Reply-To: <20261020023050.87701-1-yuz08559@gmail.com>

On Tue, Oct 20, 2026 at 12:30:50PM +1000, Yu Zhang wrote:
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
> 
> A concurrent close of the backing file runs under down_write(filesem) and
> does fput(curlun->filp) in fsg_lun_close() (fsg_store_file() with an empty
> path, the SCSI START_STOP eject in do_start_stop(), or forced_eject), so
> it can free the file while fsg_store_nofua() is dereferencing it:
> 
> 	BUG: KASAN: slab-use-after-free in vfs_fsync+0x20/0xe0
> 	 vfs_fsync+0x20/0xe0
> 	 fsg_lun_fsync_sub+0xa0/0xd0
> 	 fsg_store_nofua+0x138/0x160
> 	 configfs_write_iter+0x1a7/0x250
> 	 vfs_write+0x5df/0x940
> 	Allocated by task 3459:
> 	 fsg_store_file+0x150/0x1f0
> 	 configfs_write_iter+0x1a7/0x250
> 	Freed by task 3459:
> 	 __fput+0x456/0x6c0
> 	 __fput_deferred+0x10d/0x330
> 	 fsg_store_file+0x9e/0x1f0
> 	 configfs_write_iter+0x1a7/0x250
> 
> Hold filesem for read around the fsync in fsg_store_nofua() so the backing
> file cannot be closed underneath it. The lock is only needed when the
> fsync actually runs, so it is taken only in that branch.
> 
> Reproduced on a mass_storage gadget over dummy_hcd by writing lun.N/nofua
> (1 then 0) from one task while another task rewrites and clears lun.N/file.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
> v2:
>  - Use guard(rwsem_read) instead of a bare down_read()/up_read() pair
>    (Greg KH).
>  - Take filesem only inside the branch that actually calls
>    fsg_lun_fsync_sub(), not around the whole function / the
>    curlun->nofua assignment, since the lock is only needed for the sync
>    (Alan Stern).
> 
> v1: https://lore.kernel.org/all/20261018130519.65850-1-yuz08559@gmail.com/
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 8 ++++++--
>  drivers/usb/gadget/function/storage_common.c | 7 +++++--
>  drivers/usb/gadget/function/storage_common.h | 3 ++-
>  3 files changed, 13 insertions(+), 5 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index b7b06cb..6712566 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2663,8 +2663,9 @@ static ssize_t nofua_store(struct device *dev, struct device_attribute *attr,
>  			   const char *buf, size_t count)
>  {
>  	struct fsg_lun		*curlun = fsg_lun_from_dev(dev);
> +	struct rw_semaphore	*filesem = dev_get_drvdata(dev);
>  
> -	return fsg_store_nofua(curlun, buf, count);
> +	return fsg_store_nofua(curlun, filesem, buf, count);
>  }
>  
>  static ssize_t file_store(struct device *dev, struct device_attribute *attr,
> @@ -3239,7 +3240,10 @@ static ssize_t fsg_lun_opts_nofua_show(struct config_item *item, char *page)
>  static ssize_t fsg_lun_opts_nofua_store(struct config_item *item,
>  				       const char *page, size_t len)
>  {
> -	return fsg_store_nofua(to_fsg_lun_opts(item)->lun, page, len);
> +	struct fsg_lun_opts *opts = to_fsg_lun_opts(item);
> +	struct fsg_opts *fsg_opts = to_fsg_opts(opts->group.cg_item.ci_parent);
> +
> +	return fsg_store_nofua(opts->lun, &fsg_opts->common->filesem, page, len);
>  }
>  
>  CONFIGFS_ATTR(fsg_lun_opts_, nofua);
> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index 75831f2..51a70f2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -415,7 +415,8 @@ ssize_t fsg_store_ro(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  }
>  EXPORT_SYMBOL_GPL(fsg_store_ro);
>  
> -ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count)
> +ssize_t fsg_store_nofua(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> +			const char *buf, size_t count)
>  {
>  	bool		nofua;
>  	int		ret;
> @@ -425,8 +426,10 @@ ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count)
>  		return ret;
>  
>  	/* Sync data when switching from async mode to sync */
> -	if (!nofua && curlun->nofua)
> +	if (!nofua && curlun->nofua) {
> +		guard(rwsem_read)(filesem);
>  		fsg_lun_fsync_sub(curlun);
> +	}
>  
>  	curlun->nofua = nofua;
>  
> diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
> index 11ac785..347a86b 100644
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -210,7 +210,8 @@ ssize_t fsg_show_cdrom(struct fsg_lun *curlun, char *buf);
>  ssize_t fsg_show_removable(struct fsg_lun *curlun, char *buf);
>  ssize_t fsg_store_ro(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  		     const char *buf, size_t count);
> -ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count);
> +ssize_t fsg_store_nofua(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> +			const char *buf, size_t count);
>  ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  		       const char *buf, size_t count);
>  ssize_t fsg_store_cdrom(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> -- 
> 2.43.0
> 
