Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854389;
	b=T12lbiS52IzHv5As3HdZzqO90dYq9MoYxjoMlFUhIXIbq1/HWiskbAOLQj2mHLInnCfS
	 nPizKoJ+hWO9D3qsForR161Nay3+I1LJrR0LpozdvXyIP2ZNdtO/Wdsbn9gmI+3fCsecQ
	 P9NAQHifT69AoUL0K9GF4RBYnm76gaZBAKI/wW+44N4cgLBGWfiiN/Wzjex+qEMk2u+zH
	 01mRr5HfNiUWenCi6vOLK2/J5Yxk0idmyDygCfsq43YK7zIxSHwQUxO3jRoT4rcTu7g2a
	 fizmfUrXBlCtdGAH3jJq/Pcodu6GTUOBp9aeP9t3D/a26pDNpl7ACY9+W2vEqnjXi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
	b=D24zecm3MKxy0yOZY3GClxmhh7RaAubyKZSZz1qrNSImOrthcKES0Zzx58tobAIffNG6
	 jb9T3vE/75yt6WovutEWOOVhrb7oJ+zWMO3A8vhS7qIGJ7QgHWod7zL8ceFFM6p/oweKf
	 Ub8f/Jt5hX6KD5eEKDuRAhjgPhnPB6ZtfhTAZxU+Rat9xuuMZZbYIs/2muXZJsaqApsbb
	 q0G9ulfUZUMZ79hUDeShe8io67Jg7bruiEP0dGXuwt4Vs2FTGlSQI7/GQcbUrKBoZCZyy
	 PhYq44D49jaZQ0RGCtMwFpkJN9Dna9e/NTQZ2xdVS7XmWxpvXta2ue7R9K0WeCXHEdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=TH1m0vuJ;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01141606A33F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01141606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=TH1m0vuJ
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-945e6d9ceeaso399716185a.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794854388; x=1795459188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
        b=TH1m0vuJccTqmdU3PT3n1mdfI7HFuF62hxpy0vA2BsVWNZetFtshwN6jrDZg1Yl6mI
         1rvTUutxNaLtBV44vEH0YXMpZ3xaUmIN2MzVHqlrj7kgA9xnAxiyeQpK2QqYTc2UrmhW
         jpmzbzG8mN6nSfdH9uCRyTWn0/Y7PJLjKjOobvMDHfVN0x7iQKk8OGNp27jekWN6Ve3B
         pE2+DYe8PBGloVou5x0p5rKrpHyLpTuOViqnUFn8gL1vLQdmcmDbJnE54Hh+Zx2CtQlR
         4ux9HA8rvZeZ39MILQcajDRSUjTksAqxEJo1/YYmJ3N2D058dfPeX6n5SHnxUPRjyCnS
         GFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854388; x=1795459188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEJ8Vsur5VkO8QT2c30olgm3N6esX9fQIbded5RAIic=;
        b=TkgBHAMmWTlZ2yyvwHw5pE4R/0uSJOc3UrJBE0oBlurFitFfG50DKY6v6QyiJ5FqYK
         uPk4txyGWNMxJmHnS3nPcFL5vPE+UnYJzV2lg0w31lg87if01V+RE4UIuyu/RjFv+eqv
         /Xf+Rl04XL0f/UO3jEZxeoLXC6zp8rDxQEJef25ZYKiXdG5jPk3LlAUJ6+yPwuOEqeHS
         rDhVpj5HX+QqIjar2OJ+gqSv87CieTAasfkYQ9HeGmxwjBUn/Bae8ePXn5+JDxIJZ9q3
         /9oo2qkXJaZqaVVi9GaDOKgSvBVPBER7tHoqo2Fgg922Phfe6Eob4NFXusdTnE6JHaW4
         9IOg==
X-Forwarded-Encrypted: i=1; AL+hErHPeRrwepwlzbNMOfIYCge0Fy5D5z1hA8sTJn/8uXrbc3Ie7KaY25aTpNQchiJuqYW1AOPkATpcs5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Cv3Rajm6u+UVxWqb64UQw/ESrmfzQ1M433J87L8r6k7SNLsP
	r7bsQ1TlLTLzDoyE5jaP6X9ljXqu4cQ03oV2+mh3xeFjkSVl+VLsL16SW6H6w8y4Xg==
X-Gm-Gg: AYBFou0XlEyDfuaCsC7hMRBhA6wbh4omnCpdqp7+OYZbfooRGnvPv1APHYt/iX2XmM7
	FVwGMH6koLW9CdQ4oWZ9K1vXnNkSsCIfbDBaGGV/Q9JIWT4R7BUCBBKhKpxSMBaPEXM1mCH+z95
	KBLqSwv/BOIaMIvVFb7R0x+VHXN31K+9IvPKHBvrlevzz57ubUjWpl+GBhvgNdsGft5wI3kjOLw
	PeaqTTwJoDjOEOxYLUhFxlcd3ITNNy3W8mlc9hz20CmWjeaXlbhOjSsRFsWlHCR9ipBJf6fPtpD
	aO78DPzxOhuIMOGsY8YSx7h3RuRyhkR2Pv+coLbid6NLwXlytPzaos8Y89woCPbeT+jV7+y0hNK
	ZLUebVMik4di1mjzqXOAmcekUtNWelQ+jeEuM+wgaM9vso7DTCO0vl83ZQJ8ZMWD1BDFuDnvV1a
	8DktCbO/BSsU0fPTg9iwRi3NMjYk4WVIbDcozY2F9AQMRRMvV04G6/8qBcIOcqnHrcUkvwSS0LQ
	g7AUcfjVnRQ7jxK5015FRsHx+OidyywcmgzpQt2qE+O+pJhf2LLhWNDB0FXZG/ec9d35wUGdn4K
	WtYryOrtUwgtM8k8CHjUmptXuVcD/gipQujQFQ0y/a5eFMGCUuU=
X-Received: by 2002:a05:620a:2b99:b0:93e:e376:9b1d with SMTP id af79cd13be357-9494ba53a16mr1920666185a.9.1794854387842;
        Mon, 16 Nov 2026 10:39:47 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803b15sm906677185a.14.2026.11.16.10.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:39:45 -0800 (PST)
Date: Mon, 16 Nov 2026 13:39:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [usb-storage] [PATCH v2] usb-storage: reject too small values in
 max_sectors_store()
Message-ID: <5a202c7e-f7c2-44cb-8bf4-0673ba7ee9a1@rowland.harvard.edu>
References: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>

On Tue, Nov 17, 2026 at 12:39:46AM +0800, 'YuanZhe Liu' via USB Mass Storage on Linux wrote:
> Writing a value that is smaller than a page worth of sectors, or
> smaller than one logical block, to
> /sys/class/scsi_device/.../device/max_sectors passes an invalid
> max_hw_sectors to queue_limits_commit_update_frozen().  The block layer
> requires max_hw_sectors to cover at least one page and at least one
> logical block, and treats a smaller value as a driver bug:
> 
>  WARNING: block/blk-settings.c:389 at blk_validate_limits+0xeb9/0x14b0
>  Call Trace:
>   queue_limits_commit_update
>   queue_limits_commit_update_frozen
>   max_sectors_store
>   dev_attr_store
>   sysfs_kf_write
> 
> Before commit 70a7949335e5 ("scsi: usb-storage: Switch to using
> ->device_configure") the store called blk_queue_max_hw_sectors(), which
> silently raised values below PAGE_SECTORS to that minimum.  The
> conversion to the queue_limits API lost the clamping, so a single sysfs
> write from user space can now trigger the warning.
> 
> Reject such values with -EINVAL on the limits snapshot returned by
> queue_limits_start_update(), cancelling the update.  This keeps the
> return value for values below a page unchanged, as the block layer
> already returned -EINVAL for them, and also rejects zero, which
> blk_validate_limits() would otherwise replace with BLK_SAFE_MAX_SECTORS
> without the user asking for it.  Checking the logical block size as
> well covers devices that report a block size larger than a page, where
> a value above PAGE_SECTORS can still be smaller than one logical block.
> 
> Fixes: 70a7949335e5 ("scsi: usb-storage: Switch to using ->device_configure")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
> Changes in v2:
>  - Also reject values below one logical block and cancel the limits
>    update; with a device reporting a logical block size larger than a
>    page, such a value reaches the second WARN_ON_ONCE() in
>    blk_validate_limits().
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/scsiglue.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index 97de28e85562..7a55cfc18236 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -593,6 +593,10 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
>  		return -EINVAL;
>  
>  	lim = queue_limits_start_update(sdev->request_queue);
> +	if (ms < PAGE_SECTORS || ms < lim.logical_block_size >> SECTOR_SHIFT) {
> +		queue_limits_cancel_update(sdev->request_queue);
> +		return -EINVAL;
> +	}
>  	lim.max_hw_sectors = ms;
>  	ret = queue_limits_commit_update_frozen(sdev->request_queue, &lim);
>  	if (ret)
> -- 
> 2.34.1
