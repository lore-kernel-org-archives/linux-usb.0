Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854933;
	b=aCNzLIrKgJyLtC6GqRpp0owVPHoLdz56jyBfdcJlD/AuBlFDFTRnjfrUJ3Kj4OOBQnTx
	 UPDyiWYKCI7n3DwmbwrmQP17zKulO1GK67NARxQRy7T2PuGKztdDN589S41R+4HEqg10u
	 GBIAwCkRMAnsr0rudAFlJaR35L9FlGQZXrFO1APAmhvjIPjdl4CS8agsE/1O4bCVuH0zW
	 VXFFn1KOCm0SNS5ul5cbJRBmCRwHJmwBkUxpk7bLF4SDjsN37zdr7gF/XcIuePgsTlcd9
	 dvOyFjgng98Xpn8nw4bXe77ZT5Bz66fUFy3CHtkekrCD/XA9Mw6u08DTLdeNrFffPvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
	b=2Pz37WmwhftlvXBykNZToy8b4szgkHaqHILArEDFxwIGRpl40uATN5/6NzBvehA5+YT8
	 jf9mnRJXl/T3gJL87KwEYJZlmYvXzr7zHng4M4VBa3S5KL/Uje21HDyRSv3xDZXEG3EQc
	 2gtUftCPkU6Thxy+ax1oDLGT+7Zvq2ddil1vcaUiknlnzVlb1eY9I953HbP49ASRG3GEC
	 6zQUlxyD5cL+5/i5DgHXWmznL2ve8nwMjrOvK8Q4gF9IQmXkpGFQ7oFqmuaZXhkvswJEA
	 sE2e4ZJxh/Ba58nQCXRRdLCQurUx8OORr4Buz7jgU7sI8O5yGUxWFrXyexv21F5TmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uDwykJCq;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820A0606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820A0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uDwykJCq
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53644b28706so31551891cf.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794854932; x=1795459732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
        b=uDwykJCq016wgWS9+N00CG0siwXmgb74LhIACY+w8NCUk+FjaapQLWwCx3dvOl7ZJG
         4vvKZ+jybce3lfK0RDcTgwHMlsE/3Fcug+ERDZ6zpzKU19fCP9z0kvrO958T0yG54wXN
         MlG+5htTrhcdMaNa+leNCiQsA+U6IraxMULe2iaW1bbkQH9sh36WuUr7zcD6AabqYBWR
         9n3wuepS9iCXPTy/wp+q2a5FnScUtQgKQDqIDIk9kzlFeoyYCGPc/6BEOwm+36kRvDZf
         v+lBQ1SHZefJFAS5avpNnThvM9n8OU+PWs1uocbxC9IhXM6E5GL+k4Q6ZNXpDibxplzn
         xnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854932; x=1795459732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
        b=IWgOqLPfTmh9HvGiea9HhhP/bp0bK78gRRTD9nkzyMMUA/OE0HZmXPMGmHKpRUnzSq
         nSIiBgHrDpnsVcKPmJd9qdfF4rUTdteKt0qJii31GvB38tY4AghmJ2BYBrj2lXYNUfhC
         Ci5971FCdADFla0XfY9WSRJ/GEpCIGhPeTyrRZw0bQFpZ/C2U/OCNTUiOY+aStH99Fwb
         FMzqmOi6F1UKJc0+rkC0XwoDYB9PYziq1N/INZ0mXVCzvD/TER3TPQIERZGzojoEtTPO
         +hvPz+xWl1n8yOx4S28xkA157vgKM/bWJsMWgU8BajD6uwSPc2u4F8Ee91jLg19eIxzC
         EpCw==
X-Forwarded-Encrypted: i=1; AL+hErFFb8kgcA3d+vrCSrJvSRssHM3N0Nf3yLUJ8MznErq9WuHyn3NVR6t4nOw+JdqoC4gSwsoF0Q2erLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ED1iJCgHhGWArOjcrNX4JCDaoIoyiN6q7TYa9ZiTm3ER4X5aL
	u1rck2wHkah6I1ZuEtBkWpG9lUvKzN66uTno2e7Z/DZKKAZ68N+09EJh0mC4X/1t2g==
X-Gm-Gg: AYBFou1ckguehXh36KkumuqJYBVWwUAwsOsTWCvg+lPhWCo/v55vEjtTn9A9LJ94rRl
	J4zvztf5BkQSqxQZzpf4HrVb1Taa5RP5v/ToN2VU2nDsFF51E04gL7mbqvW4AnTKOekixEQzYHB
	l/vLNhBSXjNGAi14HaUljiGFtsKHt1jKKDmIAwYu222zJVSEzfUaoAJcfzv/bSX5TUOP8FGkW3j
	P+DVKS4F1fVRjzJ4vLuYprEWT46Ny9xLNZBAJVU+t1iHS3iURLIsRKV6gguPy8yjmcjQHo4VUix
	1hNn/HE5aTQpOxie/M0lKvcMcCWouYpzK7TW9m9o/wvglRKwBQfv6qKfL4rcdinIjGXwxKvgPN+
	BWiW0vqHB55wAFd95aUPQ0aUzoOd8fscDIQLaKmEFxWXnaKDuFcdANhVKII2CwhPKKdMaSl2ZVe
	I4lCsUQ/OvOWRaz+ir1aGObXvTkff04QOApc9ZApnRhqKq+Pzk6XcO5MiN5ATie6t6HndWjPQDz
	o7Y2lJzrAIM3/zMfGm85BGVsjQiZl0rqLkXY+ZF+1VufYBswKREdL0CLxvCwXIssEUnlT5zxHSL
	GQdAVKtgV0V5PN7uPIt5ilC+nxP7IWynC5He/NHFDNj8lgzpLQM=
X-Received: by 2002:a05:622a:e341:10b0:55b:fd16:a2b0 with SMTP id d75a77b69052e-55bfd16a9b9mr104088641cf.70.1794854932273;
        Mon, 16 Nov 2026 10:48:52 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm93181656d6.16.2026.11.16.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:48:51 -0800 (PST)
Date: Mon, 16 Nov 2026 13:48:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: storage: shuttle_usbat: do not divide by an unknown
 sector size
Message-ID: <a36c4b9f-29e9-4750-8a89-38a57fe7bfb8@rowland.harvard.edu>
References: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>

On Mon, Nov 16, 2026 at 05:34:52PM +0800, YuanZhe Liu wrote:
> usbat_flash_read_data() and usbat_flash_write_data() divide the transfer
> length by info->ssize to turn it into an ATA sector count.  info->ssize is
> only assigned when a READ CAPACITY command has completed successfully, so
> it is still zero when a read request arrives earlier.
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
> Reject read and write requests while the sector size is unknown, the same
> way the driver already rejects an out of range LBA.

How about initializing info->ssize to 512 (it's currently hard-coded in 
usbat_flash_transport()) earlier on, so the value is always available?

Alan Stern

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
>  drivers/usb/storage/shuttle_usbat.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
> index 7e5424268c73..faea2c77c5aa 100644
> --- a/drivers/usb/storage/shuttle_usbat.c
> +++ b/drivers/usb/storage/shuttle_usbat.c
> @@ -1130,6 +1130,13 @@ static int usbat_flash_read_data(struct us_data *us,
>  	if (result != USB_STOR_TRANSPORT_GOOD)
>  		return result;
>  
> +	/*
> +	 * The sector size is only known once a READ CAPACITY command has
> +	 * succeeded; a request can arrive before that.
> +	 */
> +	if (!info->ssize)
> +		return USB_STOR_TRANSPORT_ERROR;
> +
>  	/*
>  	 * we're working in LBA mode.  according to the ATA spec,
>  	 * we can support up to 28-bit addressing.  I don't know if Jumpshot
> @@ -1221,6 +1228,13 @@ static int usbat_flash_write_data(struct us_data *us,
>  	if (result != USB_STOR_TRANSPORT_GOOD)
>  		return result;
>  
> +	/*
> +	 * The sector size is only known once a READ CAPACITY command has
> +	 * succeeded; a request can arrive before that.
> +	 */
> +	if (!info->ssize)
> +		return USB_STOR_TRANSPORT_ERROR;
> +
>  	/*
>  	 * we're working in LBA mode.  according to the ATA spec,
>  	 * we can support up to 28-bit addressing.  I don't know if the device
> -- 
> 2.34.1
> 
