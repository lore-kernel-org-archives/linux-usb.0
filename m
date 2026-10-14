Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4537416F
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004683; cv=none; b=Qbh1o1mLGE1qtwB6KqBgmC4f/PAmaZcNvkHnoJajF8yVRgVsEV1+vB9N9wHLD/hObEFDEv5OycXPQgsm7ifwQM4bS59gWxm3BcfeBEX8LfgN9FsoL/210t6+bm2WwkvFkcqOg2Kezohp+o+70t5WWft7I282iJFUaoTjYfCLQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004683; c=relaxed/simple;
	bh=u5CTew8kXdsyzzo6fLa27mJUfDvcfOLFhHmreIx5Zl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9mCXuPCzcfYyZgwQGL+pKIs/mbDqqKwRzzzaIuXu+Jkkd5vwQJgZWvQLvVN6pwtNva695DUlO8rpYUytFFDCI5hW5fLPHsKRDtwUsd77v6euSVpnRLMsPlXKqoLjnHmUfP3awEE9WjQ6QZh+91OJIoJGFnTo33fXxffjNp1bFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Bo9AwDx0; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Bo9AwDx0"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b63bd2030so54824796d6.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 12:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792004680; x=1792609480; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/lo4az5c0hYVqIHGO39N2bhHjZYD6GHlLfqek7EEwA=;
        b=Bo9AwDx02IHp1yK9mW73Ssg3v8R+LiLTMevfwQd/CJzi7mvG5OsDQpEF4enHFFNSZ+
         on8yWIZQ/he6SIgwq7W4yw04L7XQuac0MjdBoRASumrjjcuMlGY5zAhOOGtJkcs5KZOo
         qsGVKt6gxCRQd6IfVADU83CIG5+NGynsqMWGkvfAXZNLT26bT3v2lbTlcZ2nkqyU9o60
         TkVYsY1KPTsaIrA/OJqS3pDFGGaIf8Z1r7kScazmR8AdHfm4JbKTWQD7IXCZ3T0OEHl9
         tPPV9eYel7CQGr0Y90EBr8tXVwGP+36qyehiiC3qk1MEyoz2/aGLeSe03eU+eegqtB8x
         NlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004680; x=1792609480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a/lo4az5c0hYVqIHGO39N2bhHjZYD6GHlLfqek7EEwA=;
        b=lGf/XWb9Co+8N+F8gBYLy2WHpR4uRIjOX4xXnDOXnlRqCiPOMy65WvtTry95UnHk9/
         f8mIuCN7x/Y7yrlh3oq5lXF4pZ+sK1cv7zHKmEoO1KWGJloueCY5qKkygMGFp9U+moPk
         FU7hHDf7rqU9GdJm6A1/xYB0JVoFXfZyT7W6QiPWaYmWk/oWkKpkzHk/M/kM3ZHxO/aU
         twlHhvwZM5KyvLwsWV309my34icXq8XEi37E4EsF5tM+aPmELN9mbGUC/F0oa4jtByqN
         K+POPpLfVzUvcmY/l0uZWbPWCJRO98My1j2Ukp+nUT+A+dCt88Q+kWbcp9RrTEItk+E5
         kiXA==
X-Gm-Message-State: AFq9FYKgsulY7/8F/etkdA89++P2+faAkC6kcojgh2aXnhlkkRvF1h8D
	iiObnj0OqWJT76uFJu3GYt1emenjlFkpFyj0klIIrwx+/PLOhBIzSeoZVoDBmLy9O488N9WR3dr
	BPV1vGQ==
X-Gm-Gg: AYBFou0mHX7tA71m1Qs9bgdQZXaQXHss0lryck0tLDQwOaGw2+B10dsimGqWQWwGMV+
	fBqVRDHIRPzROTYBRbgX7IJxiOUdDa2Z9+0sHknIV8izvRoQamY03s91mxEvHEJMyh1htfI8I0u
	+zCcb5HnoJHuQQAui4ugf5sykrHPZpVI178LPxJ5tAUM755lQL0PynC6AenUQArYoZabJ/euglJ
	SDxQ8J7z4Ih6B3mrVHvprCPlOi8y+mKUt6MYGZ4sXsgfP0dG4Z0mKABR40iq4YnmjWeh+8ei2ai
	iQm6LweyL4xLBGxI4Cd+y3Sdg8OQ4qEbOgaXCjT2sMO/LMnghhTyYTHnMB+KfwxRop6I0cmG8Xy
	l2KnPi/EC8HPC8OqUDppWvZ1SF2fSX3pXa6L6T9Cu09OjsTzm0ybv1Bj0q/UmB841H+CYKZgjLC
	tXJVIEMAG7r5BbYqlaaf61e++lvfMxFe4OKDTA4PXRYGxVkmNjqaKFwzzHXkKMF7WkREyMsYy4r
	YU/TWJZORGKi3KUFFM/iL/SN+wXot5gEG0QzQ8OTg==
X-Received: by 2002:a05:620a:1a1c:b0:93b:d7a0:d9e4 with SMTP id af79cd13be357-93ebd263d45mr2808747585a.62.1792004680297;
        Wed, 14 Oct 2026 12:04:40 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5086fe3sm561206385a.37.2026.10.14.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:04:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:04:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [usb-storage] [PATCH v3] usb: uas: ignore UAS for ASMT135x
 bridges (174c:55aa)
Message-ID: <52ae4772-3f60-40be-8ea0-6f902e865424@rowland.harvard.edu>
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
 <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>

On Wed, Oct 14, 2026 at 06:57:41PM +0200, Olivier Kaloudoff wrote:
> The ASMedia chip detection in uas_use_uas_driver() assumes that every
> device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
> config.MaxPower of 0 is an ASM1153 with working UAS.
> 
> ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa id and
> also report MaxPower == 0, so they take the "ASM1153, do nothing"
> path — but their UAS implementation is broken:
> 
> - The first READ(16) issued by sd probing times out after 30 s;
>   enumeration only completes after a uas_eh_abort_handler plus a full
>   uas_eh_host_reset_handler cycle:
> 
>     scsi 3:0:0:0: Direct-Access  ASMT  ASMT135x  0  PQ: 0 ANSI: 6
>     sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
>     sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
>     scsi host3: uas_eh_host_reset_handler start
>     usb 6-2: reset SuperSpeed USB device number 2 using xhci_hcd
>     scsi host3: uas_eh_host_reset_handler success
> 
> - Under concurrent load the bridge stalls: all inflight commands (20+
>   UAS tags in the captured incident, mixed READ(16)/WRITE(16)) hit the
>   30 s UAS timeout in the same event, forcing repeated abort/reset
>   cycles and eventually a USB disconnect.  Writes dropped mid-flight
>   during these resets returned zeros to the filesystem (observed as
>   XFS metadata corruption on the mounted volume).
> 
> - Sequential-write throughput is ~45 MiB/s under UAS versus ~136 MiB/s
>   after disabling UAS (usb-storage BOT mode), which is fully stable:
>   several tens of GiB written without a single error.
> 
> - Bulk reads of healthy LBA ranges do work under UAS (~190 MiB/s, no
>   errors); the failure pattern is command-timeout at enumeration and
>   under queue depth / write load, not a broken transfer path.
> 
> Since 174c:55aa is shared across several ASMedia bridges and enclosure
> rebrandings, distinguish the ASMT135x by its product string — the same
> approach used for the HIKSEMI MD202 check a few lines below.  The
> product strings of working bridges using the same id ("ASM1053E",
> "ASM1153", "ASM1153E", "ASM1351", vendor rebrands such as "YZWY_TECH")
> do not contain "ASMT135", so the match is safe.
> 
> Verified on an ORICO enclosure (iManufacturer "ASMT", iProduct
> "ASMT135x", bcdDevice 1.00) attached through an Alpine Ridge TB3 dock:
> with the equivalent usb-storage quirks parameter (174c:55aa:u) the
> device is completely stable.
> 
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
> ---
> v3: add braces around the if-body (per Greg KH).
> v2: fix the comment block: added lines were missing the leading
>     tab, breaking the *-alignment with the rest of the block.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/uas-detect.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
> index 4d3b49e5b..523a17cf0 100644
> --- a/drivers/usb/storage/uas-detect.h
> +++ b/drivers/usb/storage/uas-detect.h
> @@ -78,6 +78,8 @@ static int uas_use_uas_driver(struct usb_interface *intf,
>  	 * ASM1051 - with broken (*) uas support
>  	 * ASM1053 - with working uas support, but problems with large xfers
>  	 * ASM1153 - with working uas support
> +	 * ASMT135x - broken uas support, shares the ASM1153 MaxPower == 0
> +	 *            signature, identify it by its product string
>  	 *
>  	 * Devices with these chips re-use a number of device-ids over the
>  	 * entire line, so the device-id is useless to determine if we're
> @@ -99,7 +101,11 @@ static int uas_use_uas_driver(struct usb_interface *intf,
>  			(le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
>  			 le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
>  		if (udev->actconfig->desc.bMaxPower == 0) {
> -			/* ASM1153, do nothing */
> +			if (udev->product && strstr(udev->product, "ASMT135")) {
> +				/* ASMT135x, broken uas */
> +				flags |= US_FL_IGNORE_UAS;
> +			}
> +			/* else ASM1153, do nothing */
>  		} else if (udev->speed < USB_SPEED_SUPER) {
>  			/* No streams info, assume ASM1051 */
>  			flags |= US_FL_IGNORE_UAS;
> -- 
> 2.47.3
> 
> -- 
> You received this message because you are subscribed to the Google Groups "USB Mass Storage on Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to usb-storage+unsubscribe@lists.one-eyed-alien.net.
> To view this discussion visit https://groups.google.com/a/lists.one-eyed-alien.net/d/msgid/usb-storage/20261014165741.35758-1-olivier.kaloudoff%40gmail.com.
