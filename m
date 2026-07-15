Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82335E1B1
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124538; cv=none; b=a/+TRr/Ks4Hajn9f9wr7keAEMhHhyvSIvl1H6CuHqKdASRAMEM076ABcjMqYqGfuXb0RJkIvhRVOD+PsK0q3JUgkszr3EMNsQCjFRh9SGE7kUPGzIylyAS2woYjAoziUlia1QKdTSU3h4jdGjFFPYus39v0tyCwz7hP+/yiz6mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124538; c=relaxed/simple;
	bh=hSrIL8+lNY/4KD5mtJFwazvIfq5l4ujPKmcJYdtksXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPVV52w4BGSJbk6lfFn76fgq87sLOrB+NH5wqVBScRAcQGJA+1zQJYaxGQGMUVQLXWpEYobHO74cE+07BAtJYhoXHCrLoTdkIEX6lD5hflHcxayrDIr01yLvn+4s6Dh2ZNpDFSAeg9wZbVztJq+IHmUxWB1PRQ/W9TDwh8LgvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TWRs5eW2; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TWRs5eW2"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5d50b0dbso151957285a.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784124534; x=1784729334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fm9zVnT/HaOn6qwGl6UkfHJH+1hbjrQLInoKlkRDo7M=;
        b=TWRs5eW22LpoO4Ev6HGe6pAce4O5QalJfXeLmtxYIwHoiEqmzz765LByEnKEhzuPGe
         oMYIL+Y0elAmsH8VE664pjSBWjt3sNnQSXoAtJNiH+7ix9FmqGxu1GDT8yGRPYRtKW6h
         hcckazwLfr3+yP7tHwBq+CwGp8s/9Z+Hr5D6PmwCqg7Mb08GwGGRZ3eEJdejGH5OS1Tx
         s+D51e93adtA00ZHnV8SXWsYMm+6kpOHhANJNqZPSqnBloar60wm1wcxHcqaNMw84YRi
         XFH8a38RufIyv/Qe+Uk5CtCABtL4V9ljCyRX1MLZMHZe3fwyQL4grgbdDaIHHqHPuRPy
         nBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124534; x=1784729334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm9zVnT/HaOn6qwGl6UkfHJH+1hbjrQLInoKlkRDo7M=;
        b=JHVNR20mYqHtpBxRDyqaJFzLSb+G8fE2f1xcV+uppwyelEUEGAC/h/5B4G9Cf1gOkb
         BtnaoT7QRUrkhJnuT3tUVi5xlTzGl6tdAZG3IIU5nwPDSvTbnVmoddBGmiHUbyV9CQA+
         iYTgOIPyBetxZTanSSIqQLDwGQ8DNu0pDV8zE5uDezENas9ouIhGU+9XbTN6HP665NAv
         DaSd/22hZSzcEItrQEq4z4WRlOV1jEcFsG8/1rv6IKhm2+pA6zFDsSrRPNWggImt8VUp
         hgHmr75ZL2TXT+AFYFQm55n3F+GNQHvBGYU1s26dImlK0RYO3C6lXo98iaetQFS9dB3L
         AGNA==
X-Forwarded-Encrypted: i=1; AHgh+RqLkzQFiRwSgXtT+E55BmIfTh/2xGdpS7mp+LGCqkui7OBNYucXDT7qDitJ12pooDslEWvLP5aqShY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtcWHtlFtwS3F2WqtOBZeaRPfvDX1d2Y6vXmBZYCLTwu4NmPH
	nTlXNoVLQL4IjItw5Z+WbagxMFEydpJapBW4bBdWIfFKzv06u/ViL9rJTs6VdkJ8zQ==
X-Gm-Gg: AfdE7ckSTsUFWIKWo0IMfp0D6XaP3BTT2oDd/RcV/cWTN+DicNNDIgFjhwxOWgolKSs
	KSlSa4icruCU7tqYgpQtW+lJOVhiNroKQ//No2zSn1r9Sdqj0a9cOWHtdThAUMNtnz2/x/R9FZs
	NH28UYh7G1boQi4dwveqSKG6h9jeXf7gHuhI1JWlpbPXZSC7aWESUZe42VsbBILQB9IC31fIRk0
	SSvD4TyOrFBn2lYGcGYLyvg3JMhh3bYBpyf4o5b9uXYixRRnzviCtuNuCCCjCG+zCUr1AO64D7J
	fZ8/z9sO6Zp8PgSD7H1iJoZg5crjh+3ZKwsSGBQF6Ap4oy7JUcw6rvVEQF5j4bN1Bc8cCnKAi44
	8nQimPmYNhn3m0bMTrXp03fD2a1g4pB3YZwdp6cEOupyFAx3xAgxeE21jmooWOLDFheACQTJnDy
	gqenV9QbqFC5yFfFaG4K6THiszjv1oH9g=
X-Received: by 2002:a05:620a:ac05:b0:930:9fdd:bb63 with SMTP id af79cd13be357-9309fddd6camr50852985a.51.1784124534003;
        Wed, 15 Jul 2026 07:08:54 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d30f38sm1668042485a.34.2026.07.15.07.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:08:53 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:08:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huang Wei <huangwei@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: Re: [PATCH] USB: storage: add NO_ATA_1X quirk for Longmai USB Key
Message-ID: <8e249b49-1fcb-49ec-95b1-c569b0b90437@rowland.harvard.edu>
References: <20260715084530.2375253-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715084530.2375253-1-huangwei@kylinos.cn>

On Wed, Jul 15, 2026 at 04:45:30PM +0800, Huang Wei wrote:
> The Longmai Technologies USB Key (0x04b4:0xb708) advertises itself as a
> SCSI/Bulk-only mass storage device but does not correctly handle ATA
> pass-through commands. When such a command (ATA_12 or ATA_16) is sent to
> the device it fails to respond and the transfer eventually times out,
> leaving the device unusable.
> 
> Add an unusual_devs entry for this device that sets the US_FL_NO_ATA_1X
> flag, so usb-storage short-circuits ATA pass-through commands and returns
> INVALID COMMAND OPERATION CODE (0x20 0x05 0x24 0x00) instead of forwarding
> them to the device.
> 
> Information about the device in /sys/kernel/debug/usb/devices:
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 12 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=06 Prot=50 MxPS=64 #Cfgs=  1
> P:  Vendor=04b4 ProdID=b708 Rev= 1.00
> S:  Manufacturer=Longmai Technologies
> S:  Product=USB Key
> C:* #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Reported-by: Ai Chao <aichao@kylinos.cn>
> Signed-off-by: Huang Wei <huangwei@kylinos.cn>
> ---
>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index cb03d3615614..ef77ab6fd42f 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2379,6 +2379,13 @@ UNUSUAL_DEV( 0xed10, 0x7636, 0x0001, 0x0001,
>  		"Digital MP3 Audio Player",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL, US_FL_NOT_LOCKABLE ),
>  
> +/* Reported by Ai Chao <aichao@kylinos.cn> */
> +UNUSUAL_DEV(  0x04b4, 0xb708, 0x0000, 0xffff,
> +		"Longmai Technologies",
> +		"USB Key",
> +		USB_SC_SCSI, USB_PR_BULK, NULL,
> +		US_FL_NO_ATA_1X),
> +

According to the comments at the start of the file, entries should be 
sorted by VendorID, then ProductID.

Alan Stern

>  /* Unusual uas devices */
>  #if IS_ENABLED(CONFIG_USB_UAS)
>  #include "unusual_uas.h"
> -- 
> 2.25.1
