Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782905;
	b=lzc/lU6S9Sl0La1tH5gyZZbF7xr173zMe4G3K+0+PKp/V7HxnnHLTUzqI5dYSgu9gLlp
	 PtOzgUPz4FHJshxnhv/UKJ+W2DhqPfMpz7GqXS9TrDP3TSjPln5LyX467qapI4rDBGaAe
	 7kdOGc6k/Eh6Ae6n4u0uzqa0uPpXGqtutpa5/a8BBAhqJ+p14xra7//jEjPrl1z9Wb0cw
	 27NJ3X8g4bSpABGAL1MYcPn3Wjq7fWkw6N0xfnK39mJNF0q63+53QHEyVbHLDcCl1ExMm
	 gw3tvunRaaE6BfO6mNUKTrVqq+OKrtgrK5hErpMWe+JSdG4HhncLnsVjd+qZLOFVcnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
	b=d3ALt0CkaKwDiS9WiEb1atndcgL0GG8BdeWoKvLW+hXwBM2/6cjIVhF14ici3h0zQv9E
	 Zre4a2nDXX3fAoGIdMtRy5bUFLWwqkf5t7bbXAOiizXNYb9I7rBlj3vYhqYP2ZiEvevek
	 wmXCcEC94BVf5TLf1ovcUk9PHKKTLKaHM+KjTtYD9hFpDNcJkRE6xDL0x9d1ww7Jk8t7y
	 chGzi+1ViKH6fkXaFJJifjbc4r42Xf68G8TFjNainWZur0k5BCBl4Wlxymk1d127jo0G8
	 BHh6cUxh0fH2QLsjpWjttKlmSZy0T4wBYFPDtxPBIY+6PASZc/lwEhIScftbf3yokmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=syjqtj6f;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C945606A326
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 19:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C945606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=syjqtj6f
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e515769d3so111439785a.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792782904; x=1793387704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
        b=syjqtj6feIG5AFFf7XsgD5piN6XF2532Bj5zlfb4nzUPljy+bmkRWUkXg1dinX+yOZ
         jcv82rXH2puWYPvWiIvfzdl0WLMMtLmGDBPbvLh0kJI1Fqcz1Z5QDRcM6E4GVhhGbnaa
         9b0OXcpAfew56ijeNQ9zPxYOuRG1tcHwm5876MnoFzA+OMXCXLgomYbmygPbNAhjGk7O
         Zho+OAbQFnyIt9i4UjG1mv7yyCTMO9XEIBFodHObxq/u/Cj4OwAn9FlkxUvFaA3A0JZX
         W985Ip4/rYLFkOr31rQEBf+ikjWqPSHFWup4IAik3mt9CRODLCvLSTuhraAngsP0Zxrq
         /xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782904; x=1793387704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
        b=Gvr1NA7wWfCcM+8rWzTZR86A4i/j5Gtv0b2qXxcHQjwrQ2Oez4sFd/TrdOSXxDlbuS
         WE0SkQiZtA/E4s1h+d4VTv7HEXKGcpF0xYTkGBTgOSWVOVe5OraHm3RbTzl73ux4aEE1
         akyg6MPFwsCV80ak/3eTc40GwdVAMkpuKG4FPvG4/p+Z8TAyFFirRP004m6/I+CTAloa
         VNfbX8TMGoRN7EoFbU+amiobyldTVy5gbN4sp9wC8xidcyY1NXzJzfOGDf7yetcRuJDh
         YFmZMaSdZixgnRnycHN8UYdYF4TeOPxHpAulWi7pOKzscyAOzrDIELjiEWpaGpVtJhw/
         2cyg==
X-Forwarded-Encrypted: i=1; AKwUvBxS/krT197RIqSoqNM3DLqLogI5eayBd0smy7T1V0w10JE1eGUrIewtcxH6Y3QFrV9DQc25+TEyxmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVre3LuPuQ8+PSBTn6ig0HqZ26LKcERqnXA6WPbhbn81JTKp9H
	PpWAkkq7uSFL4nulWCwi+OlyFP4OGeK4y4QcCGdBSXQlm7eQSqkwV1M/a46kI6jpkw==
X-Gm-Gg: AYBFou19P2976/kBL1JX+RpizHpujdHQDqACKw0Qwd3pcCDFz3guzG+2GyxEL49vS7H
	jzbrOLLptn6M3+ddxpkCPZzBDjNPuSTbC19C6knhIwP+FDOeLAL9e69yIHJPIIyLD5rrP+8zzjs
	yvZ3bfKVwovb2Jwvrdj35HbOZ5y+Up/Ae5MbdnXkLC0MgpHeUcxpSwTH45ogmnm5vT4b6kXaT4W
	/U85NQtD9cac2djsKUE7O/JyNEtWxbvf36XE/vAA00b8wqF6snUH6C4DMitTzqwCZzoLfyvGZYU
	J/1GJJpSBA4Xn/mXYJlIQSAHsjAJRgBinGZMxds9D8OFjR35lNo6QCIYWPV9az11A4XgEw5V+gy
	e/BipmrdDHZlbSXEP5Vq0hZC3R8qokPW/P3YmASOJBZswXV2Ct9aVn6aLZ4OLv5N/ol7OWe9+PS
	v5Iu2IA4UMECpb5ZLYeSuRGWEMho3s9xebgoJ1UiM6ycNWk2peCFWKk1iTa67ZsGz4HM/J1uJwT
	znshwSqke2ZgZ+glSyiiHeOBEY/xx2NRqCF0idcVpQYmCMz0S2ALS2v
X-Received: by 2002:a05:620a:439e:b0:939:7683:33d5 with SMTP id af79cd13be357-93f6f79bc6emr542030585a.19.1792782904116;
        Fri, 23 Oct 2026 12:15:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722eee0sm92440885a.14.2026.10.23.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:15:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:15:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on
 stop
Message-ID: <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
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
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>

On Fri, Oct 23, 2026 at 08:40:15PM +0300, Igor Putko wrote:
> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() finishes.
> 
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure after it has been freed,
> triggering a slab-use-after-free write detected by KASAN.
> 
> Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd()
> by calling cancel_work_sync() on both high and low priority BHs.

Sashiko's criticism has a point.  If there are any URBs still pending on 
either of the BH lists when usb_stop_hcd() returns, something is already 
badly wrong -- that's never supposed to happen.  Whatever it is, it 
needs to be fixed in the driver that submitted the pending URB, not here 
in usb_stop_hcd().

Alan Stern
