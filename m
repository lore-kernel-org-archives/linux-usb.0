Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947732;
	b=pBKre3tXzzdZHCdsHkNitCndA6XypFHzYESpGd3DmH+z3KndzuWdGR263QcVMU8Ekpj3
	 KT4CSFg9VZ7D6QdsEDz7oh03jkXiYwq/Kzzfbr3Re33QDucGyBophiM/c+QXNDKmGt0lx
	 BkFrZ/c6jSYN9/6SmMQjAg2xKXI9FQBcJHkrXS04uMRqv4Gj/xsAUZdsOzDsezZjjWTEt
	 RxLsjgYDSgAbE8wI2cfgV4fu/C3x8atBkFP/Tj1wdhblPyVsjOi2YATxgzwXi5bcSsZp1
	 X8//oZqymlscLTNYj4hXrd/YHtvUXMlYkXuL/qzHtZIzNGTHCXlFtTn8Z976vjWL+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TzMM5bA4AAtZ9jPcoRbrwj8417a0tkHya/xigSdckEM=;
	b=Pl3a7ju6OsQgazLSst+xedsrD66/6/YmjA1cdMT10S1dox7HwY+wGPuFpL9ojGCCwLMy
	 BoBixE5XaQeq+R8IONwMB+taogXS0YV3OgqdYPxeAzowvqCUutrGUsHkuxa0vThUNFdzh
	 EHOFwDCzeNdxHj0UHrcjXjfjLMVkennPJA1+6lvXNPx9ti7WtgPznzWd2TWFmA5jQJ2rI
	 E0NKsIzpRszEWbzCF1oSYLxxQYk2iUuM9HlgEWrO57U+jzprKMzQhVwGRF6JO7wBHjb2B
	 fccC4mskJN5if0HN3PLxcEicPaLE6NjGEG45i3CktSTHhNvRTeqfZ+p38QMyWyjurqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZJmoAzpF;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1499606A32F
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 20:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1499606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZJmoAzpF
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55bd96affd2so15525511cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794947731; x=1795552531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TzMM5bA4AAtZ9jPcoRbrwj8417a0tkHya/xigSdckEM=;
        b=ZJmoAzpFjZwIBxesqfkMU8pE9gdzg7f5MXBRTGOG6sZCb747LGbO6UQ+4E7ujS7aso
         A9hU0ZeEvo6yoifT1LrHx2ztyu88+m54SdljwFtz0N2ygvRAd9kmDInVQZ7AxGN57yyK
         tsrHQHoLqZnt5zBGCvjUoQDaZCI3HXSp1dC0QbxI9Dswaco+JKbnd5jXV5AhawF24Ll6
         Uwq4hNopG1JqNbpINowUV2zL335IFqfz0egFNtsVwRsDoqzJ4qXdJrbFIomlFb5fpvn/
         3w1e5VcHt0bpyV9RTOliqY3ekha/U3+SSXS7JqsEzn31dgDwdz4orSHsRANB61WTsb3F
         6Ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947731; x=1795552531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzMM5bA4AAtZ9jPcoRbrwj8417a0tkHya/xigSdckEM=;
        b=RIjDvI9q84bcIbLktdq6SRIxW44UJMUKzi3yK76fgk88ccMmjtKWjvpTbQ0RHuG0SG
         FfjtWjunkthOPusHZITIeF42BhqEuFYig+aWyDN2undgm3cEDoy2YUwU//QgOnx+Zh+T
         CQl6+MCjuaTakThqD+LgusivtVgA5H+JMawsvMZNSxq3CABAllQJASCh3I7gUhiZDZY3
         yMfL6k0IGSKJytf17l1vWX56GLshp85KREORpD15yy8Bj3QeAXkMDSbXI/ZO7b/dDd6U
         IPgTLTDqjhPUQdKBudUU8f5sSQwyfizFboxy8f6Cb4/Dwz+/ug+dW2+D6gug/fD2OcRQ
         jzgQ==
X-Forwarded-Encrypted: i=1; AL+hErHjgvoNfIVb2UP1kHMN69O3easIN2KoRgMKCzkowkKs2KAK1QPfMyQJ/nGlBo/Dlan/KdPAX2RBdpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bTntURy0rPfjO2X712u2FmwS9sQl2eC67m6cXhDqoOIgDAtVo
	ZJq2aJf/QoQqni4T+dzJKd24YtYxQ0Y+8OthsjRKBDudKFn+HtikFvAH9hgUAfufrA==
X-Gm-Gg: AYBFou0zT0eCUY5D7/kfsuZmiLWq9/QRFXlFO3oIrz8t2mxaIqalkkiIlSOCLzfrLQe
	Aiov3YkZ5/w98XHc6Ii4LAVlJPDy0M+NdIDForTkS7du+l5mvkT6Nf8uw9+kbBbiewfIDDdOX1I
	Jf+sTAMCloXjUwGEzaP79QzpW/tj7Vv7VmJpkA4fW4M/QBRTbZhC3LMqS3BjjXECofR50Emw3rF
	FI5qxGOdDPeN5pd6eL9cZRzmkn68oo9dw00upClzelRWFEHYHTc53+RlYmE90fGH68bDWQt1C+s
	NAMzVN3Ff8cMJPML9fjtXYpnt/QrkmrOMIlhsAell482RQeFJR5yGlXqipgVgVa9yFzjN8TeX0F
	d4s12avw/Ciu6mqawMT3bnOhHpGCNZAKjnsfsmWPhOHoQ96oq7BsKdJUfq7rt8vHK/qC2ofGzaD
	TEWVNPLiNcEkZiPVHRtCD0E/1E54l7yd9ovdFyCKvJxU2LDCTsrYNjtPIglTThXjH6WDxBJuz2v
	Q/LIIjUPe2aSfweLe0fbaCUmIWnr3aQPGqYZXwr8CawcnbQcQp/slNNXoTsqfd/SOnUmwgbFpfc
	eCmCr9986/nlZZD5/CscXxMa3aZ63g==
X-Received: by 2002:ac8:598f:0:b0:535:16c4:7304 with SMTP id d75a77b69052e-55d5a5483f1mr6952961cf.12.1794947730584;
        Tue, 17 Nov 2026 12:35:30 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d590c524esm5414651cf.26.2026.11.17.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:35:30 -0800 (PST)
Date: Tue, 17 Nov 2026 15:35:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [usb-storage] [PATCH v2] usb: storage: shuttle_usbat: set the
 ATA sector size at device init
Message-ID: <ad26ac08-7a23-4b31-8fd1-30b0dfa48aa9@rowland.harvard.edu>
References: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
 <20261117012707.5858-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261117012707.5858-1-25031212351@stu.xidian.edu.cn>

On Tue, Nov 17, 2026 at 09:27:07AM +0800, 'YuanZhe Liu' via USB Mass Storage on Linux wrote:
> usbat_flash_read_data() and usbat_flash_write_data() divide the transfer
> length by info->ssize to turn it into an ATA sector count.  info->ssize is
> only assigned in the READ CAPACITY handler, so it is still zero when a
> read request arrives earlier.
> 
> Such a request is sent during device scan: sd_probe() starts with
> media_present set and usb-storage sets read_before_ms for every device, so
> sd_revalidate_disk() calls sd_read_block_zero() right after
> sd_read_capacity(), even when READ CAPACITY failed, because
> read_capacity_error() deliberately keeps media_present set for drives that
> fail it with media loaded.  A CompactFlash reader that does not complete
> the READ CAPACITY sequence, for example because a register access is
> stalled, therefore reaches usbat_flash_read_data() with info->ssize == 0:
> 
>   Oops: divide error
>   RIP: 0010:usbat_flash_read_data+0x2a4/0x5c0
> 
> The ATA sector size of these readers is fixed at 512 bytes, so record it
> when the USBAT flash transport is selected, instead of waiting for a READ
> CAPACITY command to succeed.  The datafab and jumpshot drivers, which
> share this code, already set it during device identification for the same
> reason.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
> Changes in v2:
>  - Set info->ssize when the flash transport is selected, as suggested by
>    Alan Stern, so the value is always available.
>  - Drop the assignment from the READ CAPACITY handler, now redundant.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/shuttle_usbat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
> index 7e5424268c73..267c82381465 100644
> --- a/drivers/usb/storage/shuttle_usbat.c
> +++ b/drivers/usb/storage/shuttle_usbat.c
> @@ -1038,6 +1038,8 @@ static int usbat_set_transport(struct us_data *us,
>  		break;
>  
>  	case USBAT_DEV_FLASH:
> +		/* The ATA sector size of these readers is fixed at 512 bytes */
> +		info->ssize = 0x200;
>  		us->transport = usbat_flash_transport;
>  		break;
>  	}
> @@ -1703,8 +1705,6 @@ static int usbat_flash_transport(struct scsi_cmnd * srb, struct us_data *us)
>  		if (rc != USB_STOR_TRANSPORT_GOOD)
>  			return rc;
>  
> -		/* hard coded 512 byte sectors as per ATA spec */
> -		info->ssize = 0x200;
>  		usb_stor_dbg(us, "READ_CAPACITY: %ld sectors, %ld bytes per sector\n",
>  			     info->sectors, info->ssize);
>  
> -- 
> 2.34.1
