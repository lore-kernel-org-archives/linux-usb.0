Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259837BE9C
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326666; cv=none; b=GwsUJ7XST37pJPbNlDyCoGahpq9sRW+CBDd11ZjyKv7g8fC755/VCa0tcTWTd1shM7ZvFcvQyfBHzx2IqaIjaMVvHKpOiYx6rd6oFRJ8nJ7VbRtwNUeVa1XDpk5uLgEwqoG8w5JOESXIRODi4xVIOHz4opW8pzvMKukVZa65ZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326666; c=relaxed/simple;
	bh=fLAu3m0sn1yFEWYwY3zek8PXk7W3ZTEsDcyIP49VoPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y75BQPWkHbTi8SfA4WYCh8wDArHMH81Iom4nXbJ3bIaUPdGBd3lp4G3Kx8/2s7okufNPlu6JOCE5QLNsMb8FIQwuNmlO0URUAbbYMyWwfzZCU8YRxl7lHd4rTcGG1shVJEeUHd/t3deHEjNI23kgixthqDD/YSJA/jAHEVMExao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QgnfQ7e3; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QgnfQ7e3"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-908a2ca5becso9773396d6.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787326662; x=1787931462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGCj7pwJY8iGo2RC8L2IizuEV+4MYDwmhGy0P4GJMkA=;
        b=QgnfQ7e3nepAvcpA8h4Jyw+BUFAjweTu0KnFxetMYRSF+ihbsaX6vr8TD44mhZOrpB
         R28dMZo05l++B+jFJ7JSSXiOOTGQbg0Gxzp6Ixz3UNUmGseqhC+fo/okNmfMwDW+THcJ
         iyCsI492bRHCgTDLaJrkatci+bxx2la+dT0h5N4KMUU6X5DlBFgQUCtAgg2HbqETJC6A
         pLdn5QIIeSOa1s+SkW17c18o1bLNWAo4ZLdqIRAbC1Ey4eZh4DBFfs/tqTO31+jxlEvu
         D+n3I1UW/ycpvw4odEWWe+islrBDcpyI7GPFhhDXyTXR7yOz4Z8A1zMle79cqZZFsJl2
         Shiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326662; x=1787931462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGCj7pwJY8iGo2RC8L2IizuEV+4MYDwmhGy0P4GJMkA=;
        b=R1VrpEWsQMZwFfdTXk2IhrSvOplEVyuhQWuy5tJHpEtfYe1iW2AGQc+5Fxoawf/NOI
         bFhG3tdcnb0ZcOznvc0kJ5Z4E85tvfVUXFKnxOBu383HGGN5NL7+Aa8ZQG2bPJCB5uPa
         zRtdrvF1tnIo9Ec8JkqRmAmcaP1YFUEfnKzfOFKpCgAnb7wMMMvEsvn0ZaptkJFdToPk
         G5oK4nAzbCnE9GxYqSYNzIcDknjUaPb0cyAMK8p+d81c7GpGC2Ot1YkRHy3mlQ6B2Axh
         bImqkcSG+tTci5XvsGHxpZpTsAohYFOEp8kRQwJeoyohXzAHohRijNWb0/7CJ8OSJ8Uj
         NEsA==
X-Forwarded-Encrypted: i=1; AHgh+RodXeVTRJyNX7nA8S237JO7ig3IoQf3GNeN0k8Ga+55FgoZ+dRNzDF3MmMBI2DMlYSqt40ykBOWD8o=@vger.kernel.org
X-Gm-Message-State: AFuF++lfMxhvL7VgpGbU9QENa8sZ1+zFO81/5vsARQRk7pjoD7pMZMse
	hurY+yNst1v40eEIN7Qn9k2ly85N8Fex8vhMqxqfm75ciQ8LF9VyzSnP2tRWa22YIQ==
X-Gm-Gg: AR+sD12NYAM6jFkoZF0ydz65OFRzNxhURzhXBTsKQFcB3NnK3xWkfn4NO/sOcc2CgGH
	+isYSOv7ZPrXtBTmwB1dwAcVVqDZmFOoTnTYtjLLkuEXWrn70dgy7wijeHJshj+Vv6V1BmqqiiH
	BtC0Vy8yddPPSqUlMwBCNwp+NkJiscD8YnNEUqpdykSG0CTjjhvCn1a64EDxDxssiMA9uQ1N3Ds
	3kR6KCcw3mRSB3fMtMcuAKBd7GEMTVIHgMGMKbhkMxudoZIrEdx/ZtC4M68ODdgQMaIbXAxgCgn
	BE56oJCE0OOLvXQtrP3J5ZtUPwATcR2obxl0GkykDojPU5UY55HUfYeySQkc9lVsUoFTDet4H1f
	VyNK4P088fxorP6fDl/kabQ9YMrbegjvmJzJcZJQQOJCWBY8iTC/y6Hhm2mF/V7vL0MXEBGVXIz
	btT/GSYhdrtKSzVjRkKB3f7Ka5HHcI5De5W5Hyi7LrGOUDZ3AbYhPrkjOONs+t+w==
X-Received: by 2002:a05:6214:54c5:b0:90c:4e96:9bc3 with SMTP id 6a1803df08f44-90c80e22e2dmr75367266d6.27.1787326661302;
        Fri, 21 Aug 2026 08:37:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b4ad5sm65443546d6.42.2026.08.21.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:37:40 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:37:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>
Subject: Re: [PATCH] usb: storage: sddr09: fix OOB access in sddr09_read_map
Message-ID: <05948dc6-b5f7-4916-8923-017f58fde4a2@rowland.harvard.edu>
References: <20260821070120.3183236-1-lihaofeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821070120.3183236-1-lihaofeng@kylinos.cn>

On Fri, Aug 21, 2026 at 03:01:20PM +0800, Haofeng Li wrote:
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

This patch has all the signs of being written by an AI.  If it was, you 
need to include an Assisted-by: tag.

> ---
>  drivers/usb/storage/sddr09.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
> index 3d45e1b54c66..2d1ad10bd4cc 100644
> --- a/drivers/usb/storage/sddr09.c
> +++ b/drivers/usb/storage/sddr09.c
> @@ -1339,6 +1339,26 @@ sddr09_read_map(struct us_data *us) {
>  
>  		lba += 1000*(i/0x400);
>  
> +		/*
> +		 * The LBA is taken from device-controlled redundancy data
> +		 * and is only checked against the 1000-per-zone limit
> +		 * above.  Nothing prevents it from exceeding the size of
> +		 * the translation table, which for a 1 MB card has only
> +		 * numblocks = 256 entries while a device may report an LBA
> +		 * up to 999.  Bounds-check it before indexing
> +		 * info->lba_to_pba[]/info->pba_to_lba[], otherwise a
> +		 * hostile or corrupted card makes the driver read and
> +		 * write past the end of the table.
> +		 */

AI-generated comments are notoriously verbose.  Try to shrink this down 
to something a lot shorter.

> +		if (lba >= numblocks) {
> +			printk(KERN_WARNING
> +			       "sddr09: Bad LBA %d for block %d exceeds "
> +			       "the translation table size %d\n",
> +			       lba, i, numblocks);

Nowadays we have dev_warn() for this sort of thing.  And since the error 
is likely to crop up multiple times in a row, you might even want to use 
dev_warn_ratelimited().

Alan Stern

> +			info->pba_to_lba[i] = UNUSABLE;
> +			continue;
> +		}
> +
>  		if (info->lba_to_pba[lba] != UNDEF) {
>  			printk(KERN_WARNING
>  			       "sddr09: LBA %d seen for PBA %d and %d\n",
> -- 
> 2.25.1
> 
