Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDF3D3339
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974476; cv=none; b=au8horhfqg54y6cwLO3vVliO0x1nEiUZpV+cHukB5I4UwTl8d/yp8LFSNv6Sn1NJYHIdxibtVfWEMcpgd724gxOoCex87XpqMP9dRTwLAttE7KIwiHO4/Tao//V9Ty2F4vUrKOW1o0FMY/6hhZsXpa6qaLsptWvaSRfkpkUqUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974476; c=relaxed/simple;
	bh=HYSkadIxfpprlI4mzPC4DdLx7RC2DW3C8xdieELRFXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3TgIhZIg8RYYh+vNmKjYPFG1HIAAQH5teEm+GzvdCy62D5bUEH2VCfL+kptPevlt1sxIPO1dKkTwgRvK7uuxUgqId7i17x0h2bkeLyZSQgM0Bq000yVBUV4GZ8FS+b7Z4qR3OjWeAjf9vnawLZLqQZePpIB1ZVhJals8hVxfyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=srtSSCTc; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="srtSSCTc"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-936ea476db3so136041985a.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786974468; x=1787579268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxMusu65AdSSwszpaWr6OP5O8vIYQL78CVGuBd1AIao=;
        b=srtSSCTcdPRrMDYoBELFkkbNhgZD29N+2BlGZQi65FA07PJvQOwI1CIZArZQ8oKZ5N
         DksVhHBIMavl/hgPFIRB2qfiPoqgbhS1/9MLX3biH5yxdJwOEZz3yB76kbLv+kUGyMs/
         belnxly1SHo7uj1OrZY5qayuAlVhKStQjQs4P3pNHagltUp8w+8zunYqcZ+NELdqxZsO
         u9++sdaETj52DGovrH3lA838P8OovNqweyRcX6KpeGc8RNzJVxeBim88W88EMEj3OMu3
         EIc8L9hUzwzntuVzssmI0gC53NKoEF9fhYOd/CbpVqBpy2gRmon5krdo1HsLul26eQiu
         x/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974468; x=1787579268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BxMusu65AdSSwszpaWr6OP5O8vIYQL78CVGuBd1AIao=;
        b=aUk0mkZRnsqDsKuEmMWd2JmFgxelviyCLo7SaaU2wIFRGhawgpjilWlkJ1agN0N8dJ
         JJotHsVuvN1eGeI6MxHgwt2jdlpB3OjvosRY+m/AQtKSoUMQSHvSItjOtazc1Tdwpd6G
         oud50v0b801oxe9H2qerHQYBNYbb2ekWNCDd1NvrHTEMNUR87j6dnbrYyhrS2gxRQ1P0
         XszdWgoZ8ED2GW8KQsXvlPwN/AuE0Pi5mhReQxgh69OFRkxs9p3+mgBgujf8ySqOQk8o
         GKX4V8Ree6KaSOJKAatfl03aqw5lXlHul/9Rnr+0VHjceipqqJcmHxIQKH4h6w7nanw2
         Knuw==
X-Gm-Message-State: AOJu0YzOmRZjv5MBCBcdgTJaQAvyVm9MmJPredIehhq8XfJkuLxa0rTd
	pd77Hshsc+71L5zQvQydw2qSLn8Pq+WrU6VI2WFVH7yqTUiFujKJ+XyB9qIOoF0o7g==
X-Gm-Gg: AR+sD12D0y1dWvwmbb1hRSa4/tf275Nl7F/DbdRx4uncETn/NJb4Q3LxJu91+hwbN+K
	PHdiZ+nrvpbnACzT2ptDNEkMlZhMyiKw+eSnwHymJ0ALt83efVBJUcgrYbl/oZA4LiSitvkaJzs
	GaT+5+aZIeNbSPdPwtKOcA1gBevRncpL0Xa7Y9tfmJdtjr5fCicROuaGi4rGzN0wS5G/ZWZudjZ
	GpPyc0beqUhVRd9ar/8DQGjFVrHO6WEGXNDb2cnD/k785/n+RrhX+wOKMeAguQplyl4Et9J1L0G
	qgqBA6GFQ0ZvlXHM4RVZ61F2xt2sP1+UhQW3/WfI6c9wddQ+miTa6EhYx8lJnOct7jYHbkRkPX/
	HNn/03DrUEqBa/ENFP7PzhRZMB8GzVSDaHAvfh671pI/osREyIqZg0q/G+cQgCNnslTpEF/03Zk
	eKyy+spEJQ5JJFvHOLJlUDmuouZ/A3KHq1ifqfd7tsEwpieFkX7inVvRywLWXT2U0AmWN2zp6k3
	zzN1k4=
X-Received: by 2002:a05:620a:ac18:b0:936:bcd6:269d with SMTP id af79cd13be357-936d21427c8mr2394544585a.6.1786974468111;
        Mon, 17 Aug 2026 06:47:48 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9370342b063sm49290385a.45.2026.08.17.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:47:47 -0700 (PDT)
Date: Mon, 17 Aug 2026 09:47:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] usb: f_mass_storage: Bump local buffer size in
 fsg_common_create_luns()
Message-ID: <fd2a7c76-c900-4ccd-92bc-d1205fe16d87@rowland.harvard.edu>
References: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817104734.1031300-1-andriy.shevchenko@linux.intel.com>

On Mon, Aug 17, 2026 at 12:47:34PM +0200, Andy Shevchenko wrote:
> GCC is not happy about the buffer size:
> 
> drivers/usb/gadget/function/f_mass_storage.c:2970:48: error: ‘%d’ directive output may be truncated writing between 1 and 9 bytes into a region of size 5 [-Werror=format-truncation=]
> 
> Bump the size to get it enough for all possible values.
> 
> Note, the existing comment is wrong as size 8 for the whole buffer doesn't
> cover 100 mil numbers, hence drop it altogether.

It seems highly unlikely that anyone would ever want to create 100 
million LUNs.  Why not limit the number of LUNs to some more reasonable 
value, like 1000?

Alan Stern

> Fixes: b27c08c953e9 ("usb: gadget: f_mass_storage: create lun creation helpers for use in fsg_common_init")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index b7b06cb79ff5..3d1823b74cd3 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2961,7 +2961,7 @@ EXPORT_SYMBOL_GPL(fsg_common_create_lun);
>  
>  int fsg_common_create_luns(struct fsg_common *common, struct fsg_config *cfg)
>  {
> -	char buf[8]; /* enough for 100000000 different numbers, decimal */
> +	char buf[14];
>  	int i, rc;
>  
>  	fsg_common_remove_luns(common);
> -- 
> 2.50.1
> 
> 
