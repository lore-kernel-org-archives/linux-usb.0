Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B851A6800
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787425019; cv=none; b=Yykn6ldCI7gfwQhLFKbzcxQEQwjCV4SPBI+WJKPeozqqeZ7lTwf9hio23ekiQo0z+MgloWd+2UDA/joQg+h7PDCLO5+x5N2Q72IBJBYVJN/9XoOtJnZAH9/gfW0kdaRvuFC8QpQapxgkkFc+HxMwFuA2wFQEmgMOh1wICz4hnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787425019; c=relaxed/simple;
	bh=OTbgWP2M75pSB6GIeAgyZBFrJQXqOoYxWhQqOl2bHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSbxLe7hYcBeThdhUuKTfpSuP6LwMF/ygn2U06WLxhKTtX9eFDVxKwmWGecmM3TEsj3lrNZG9P8FueMo/Srqm8nK196ZqfozVx/NGaTngW0Gfm1q6fa1ISNYIRNVb2hpqdVkAimWJ4ztoh/Zoj9mfLEC3G4TYtd0JGG1/GxSgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rifgcjAY; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rifgcjAY"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e55b62640so100152685a.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787425016; x=1788029816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=smkrzl7ozY5l2VwKJB6Y7nX8lLqncIOpy+cHfZxKdmg=;
        b=rifgcjAYkRHueV0QGoqygRy5qU9SDJM5o7Hd9m7GoKVdzM+eHjJEmgboW+0hc3EJJO
         Z6n5A6K2oiPuwuzqyr2/fRG3rNSD0J9vCRc7Hk5xHvkl+KHnQ6ukNDgJ6wJ0ok3B4DIr
         LaHDZAW4BJvJ0LcmA76xGZo+MjGmyg8he0X226rJUcieK+flhVZ7LxgPDItoVROyOnM4
         K918ca2Tj5JOI1ftRianU24LGlQu6E912QV3iWtWSs2uFCUkHG8wTyBLR+ZF9aLue3Gd
         91f828N8LHKGLZ9m9V2erNYegjfcyEyiuNJHwJmfoqvuT5WzuVJjUbsWV+/JNtFwJvkQ
         tLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787425016; x=1788029816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smkrzl7ozY5l2VwKJB6Y7nX8lLqncIOpy+cHfZxKdmg=;
        b=eeoXrLzGhpdGVOJlHPtNzz1PdJPOLRqyrpZD5+FxmcjoeXIEQODaNShthKG7oXdoo7
         9B9T3drnp76X9FV/1aM2bhx6wyic9mXHY87qZV4ZgWIaF8Vgk4DYD8KTXSiPaptiOHvf
         44J7ERni3yPWMoEEIgH6gOgHkEeszNIV9xpgeqP7qgDXknS6KrbXrtZOjWMiYYllJeIv
         CF1zaUNuK1Pr7pSHPwL8A1WPbhUOUjVInkDxmocVnysGdxt2BlXo3AaBKrrhPchPoSE+
         PGNaZ7X58SEpql1M5tD5uobdDKGb03CXdM0HMYRC4kf8SpdH+gXsWNswboHlAuXdPD6o
         bzzw==
X-Forwarded-Encrypted: i=1; AHgh+RpcEz29finOc+hNLnaWvn9iboKNk7GtXpLGRcgSb1OVmB9A2siSFMgvg4ruDmI+o8RwUcQ/A3M9Ugc=@vger.kernel.org
X-Gm-Message-State: AFuF++mir3mg6rpcogouePYk54PApAceG88VyRMmVwwz+lof7F8TOFcq
	C66nrcvw0q7hlfGer9jgLbJtCzhfywrwGPgWLv1cc/PbzI/yC0REW8hsCgKP7L2WMA==
X-Gm-Gg: AR+sD11YT1+7mpJglBOZ0V8ebj2jbn9b3I70tzYOBeqtsV8EK7jjTrNg4b7V8Iop1dY
	DKwbQzfVMRCZ42eww0cV+km+edRIWumPUwugLn/7L+KwYNBPi2harIIwqKRteSmIwaI+o8nvq2U
	/zH/9lxUa0XfTlnvP/qXdNxs27EFJ61BoO7ZghedBuRtuTBcZfBtkrHhmm/iPWAitzpQzjwXOBa
	HcGqEtFnQbpdjNUltLq53PM7exOxTNoUqRmPd8YJTlZiwcsn+ub6ImQogNgM+7CqBWJ1fEKpBa0
	zn9VqQoi7O5qcaoBBDcVQv37VreEq+oEtrsNXxwF2OxuPAPciHm0lzmQoolSgztmws4yKKPMUDY
	l1j0bDMEGFhEiaK1OjZIN/NyUTBUY1b+wjHY8xDs69u/5iHe8fqOrMglMUHcfLr76e9lnsrbVck
	nEc64bISIbAg9bCzTYTa7UzY+4bOrqBr0hkQWnaPddWYNabRRb4kx3kyQBtlUTTgYn2MXlv9Z5
X-Received: by 2002:a05:620a:2b94:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93746948d8bmr681389485a.28.1787425015657;
        Sat, 22 Aug 2026 11:56:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749adeee6sm166269585a.15.2026.08.22.11.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 11:56:54 -0700 (PDT)
Date: Sat, 22 Aug 2026 14:56:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	13266079573@163.com
Subject: Re: [usb-storage] [PATCH v2] usb: storage: sddr09: fix OOB access in
 sddr09_read_map
Message-ID: <aac40fcc-9721-491e-8517-3288d34a6c73@rowland.harvard.edu>
References: <05948dc6-b5f7-4916-8923-017f58fde4a2@rowland.harvard.edu>
 <20260821180116.3490884-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821180116.3490884-1-lihaofeng@kylinos.cn>

On Sat, Aug 22, 2026 at 02:01:16AM +0800, Haofeng Li wrote:
> sddr09_read_map() builds the LBA <-> PBA translation tables while
> servicing READ_CAPACITY.  The logical block address assigned to each
> physical block is decoded from device-controlled redundancy data:
> 
> 	lba = short_pack(ptr[7], ptr[6]);	/* 16-bit device value */
> 	lba = (lba & 0x07FF) >> 1;		/* 0..1023 */
> 
> 	if (lba >= 1000)
> 		goto possibly_erase;
> 
> 	lba += 1000*(i/0x400);
> 
> 	if (info->lba_to_pba[lba] != UNDEF)	/* heap OOB read */
> 		...
> 	info->pba_to_lba[i] = lba;
> 	info->lba_to_pba[lba] = i;		/* heap OOB write */
> 
> The tables are allocated with numblocks entries each, where numblocks
> is derived from the device-reported NAND chip geometry.  For the
> smallest chip in nand_flash_ids[] (1 MB: chipshift=20, pageshift=8,
> blockshift=4):
> 
> 	numblocks = (1 << 20) >> (8 + 4) = 256
> 
> so info->lba_to_pba[] only has indexes 0..255, while a hostile device
> may report any LBA up to 999 - the "lba >= 1000" check is the only
> limit on the value, and there is no check that lba < numblocks.  On a
> 1 MB card indexes 256..999 (744 of them) index the table out of
> bounds, up to ~3 KB (744 * 4 bytes) past the end of the allocation.
> 
> Attack chain (malicious USB storage device):
> 
>   1. An attacker presents a USB Mass Storage device spoofing a unit
>      matched in sddr09_usb_ids, e.g. 0x04e6:0x0003 (SanDisk
>      ImageMate SDDR09) or 0x0781:0x0200, on the victim USB bus; the
>      device is enumerated as a normal storage device.
>   2. ums-sddr09 binds (sddr09_probe -> us->transport =
>      sddr09_transport) and the SCSI layer issues READ_CAPACITY, which
>      is handled via sddr09_get_cardinfo() (chip geometry from the
>      device ID, choosing numblocks) and sddr09_read_map().
>   3. The device reports a 1 MB chip (numblocks = 256) and fills the
>      per-block redundancy data with LBA values in the 256..999 range,
>      driving info->lba_to_pba[lba] and info->pba_to_lba[i] accesses
>      out of bounds: a heap OOB read used in the map-building
>      conditionals plus a heap OOB write of the loop index i (the
>      physical block number, 0..255) at an offset the attacker controls
>      via the reported LBA, corrupting adjacent heap memory.
> 
> The device-controlled inputs, the missing bound check and the OOB
> indexing are confirmed by end-to-end reproduction with a FunctionFS
> based malicious device emulator; the driver logged out-of-bounds
> indexes such as:
> 
> 	sddr09: LBA 256 seen for PBA -858993460 and 201
> 	sddr09: LBA 258 seen for PBA 4513 and 203
> 
> Add the missing bounds check: since lba is unsigned it can only be
> too large, so bail out with "lba >= numblocks" and mark the physical
> block UNUSABLE instead of indexing the tables.  This mirrors the
> max_lba bounds checks already applied to the SCSI-address-derived LBA
> in sddr09_read_data()/sddr09_write_data() and in the related sddr55
> and alauda drivers.
> 
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Assisted-by: opencode:deepseek-v4-flash-free
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - Shorten the overly verbose comment.
> - Replace printk(KERN_WARNING ...) with dev_warn_ratelimited().
> - Add an Assisted-by: tag.
> 
>  drivers/usb/storage/sddr09.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
> index 3d45e1b54c66..313313508bde 100644
> --- a/drivers/usb/storage/sddr09.c
> +++ b/drivers/usb/storage/sddr09.c
> @@ -1339,6 +1339,15 @@ sddr09_read_map(struct us_data *us) {
>  
>  		lba += 1000*(i/0x400);
>  
> +		/* The LBA comes from the card and may exceed the table size */
> +		if (lba >= numblocks) {
> +			dev_warn_ratelimited(&us->pusb_dev->dev,
> +					"sddr09: Bad LBA %d for block %d exceeds the translation table size %d\n",
> +					lba, i, numblocks);
> +			info->pba_to_lba[i] = UNUSABLE;
> +			continue;
> +		}
> +
>  		if (info->lba_to_pba[lba] != UNDEF) {
>  			printk(KERN_WARNING
>  			       "sddr09: LBA %d seen for PBA %d and %d\n",
> -- 
> 2.25.1
