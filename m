Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855189;
	b=S3ggqK9KIjvDnBupRxhd4oWTU/Ig+wWa+Zdt0zXtkKzGL4y7GHzchGsQXXTE2RbDkV3M
	 5hVYr2/zhn/LfVshuyBt074QzLMX/kGSBXKD+r7iNrh0DgUFjm/GprbIH0HMRVF7+du61
	 Mm+q2sZpSdovChZw7JH1BWkluEw6I38IcVy/p0j63AIox5HcjlluCmnUAPH25Trz5Ykdk
	 aHAqZPRdAllJw/IPGvNkf3iLI/EoAn29NZwsWsgogYczZID1K2hR03djaqjW9D6a/u47S
	 ot23eO2YU3sSxBbdWomo2eMunlZVsIxWpljFpWPAM1/OJCB4ljklNVUO+PbuDJdcePg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
	b=J+WqMJQd2kaTlTgWeS4419qkBKiInCr+JdI/KaYtaGTjgSbSh6WjZMa96XrwdmTHVuFv
	 fOiH/tla3PA1yDTFcCb7zNnULuIAajATSAkeVKZz3y3FmowMuR0dSFQEMxWtRHl4Kk/ZZ
	 6go9BVj9uhcTQHJCIS2X+sAw4RR5z7kp82Hm2mSvVUFINp5ABoIJC6YbmrDtPSHFR/7RJ
	 yWT3yBGKLPNKNXe8T+aUirkAHLZLHK4QQOu1Lvz0aYm7Crk77XdKbtT3NgdZ676gZsfCH
	 wE5R3y5rdTL/8KYNeIW/xoIcwVGdb9YW/Dg082I7xZl3QjJ6SIPiUeErBPXUEDTXTKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=u1vps6FB;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B5606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 05:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 271B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=u1vps6FB
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b8306b9f8so22852326d6.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 21:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793855188; x=1794459988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
        b=u1vps6FB9frxf/5wIeIkT79W6+qKBcnHUXgZFA3lxyIcYMxWBSmuscItg+LvtzCPt4
         wBr1/mtJY/KdPwSIYKiqNB7nr/GC5kN1g6ESuFk5sivSG+oM1NZS9EzeiYbFdXLDLnJg
         R2P4a9eqHvR/8bAAY7C/e8ag0fUqd68EswHYUgY5F3qh8yTG09z43B71PnaptvlwZjQi
         zS69FjHsGpaGz/m6gfwNcRf1iwYvtxvw3HKv+CwvysJR2kNza/Q5lGXCV1+6fI4TEX0t
         h79lQrcPeWwS7dFc+ta2AHIO9VxrEiNfI34Egr3aWtmJCvctnWKRi/7MqfEHpYhsm2qP
         bjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855188; x=1794459988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJXyrXeadAPpp1EgKOr4nzDbu8SHuoj6JH23Y/l65FE=;
        b=Q9Xs3Ljo+Y8yY89/nfyRhi9m9D8qSaReNaWA5FCt8Jjw4N+KhPrHPOBXGxjG9GnHLe
         oeKgt2ZwKtMVjgugCQtt/zVdb41n1fncF8fZMpGTk8UInyqAEenCS55w5x/fhpm7E2fy
         sGpKJJLm+V8nFuG83KtLdCowCK1cUDj+HxQKCp6bYij1h8ZUK1rsCbTUn146uazAwuYy
         tklnnPoWqdAbs/qDlRhjGNw49ECoM9eaeTGz1lfODL7AXURubEkkzaimyBTq1W+oMFjO
         bgknRC1jGUYHIk9UfUWk3YirCMf9EvRQKlw7VKZNAH4iTpCtR+j7z3thYfPUKmD/T1/t
         hw0w==
X-Forwarded-Encrypted: i=1; AKwUvBxW5jge2TGKvB1yaTJ0PtrIpUfQ0pC+9BW2bB5fTCKcY6PjrhfuWrshySQ8LSwIiRpkVS5qiX10fTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xy5T/8aUB+QcLSUAFV8jmBW6KQpYx+mJH5TBw3nYK4dTfF/fB
	/VQR5gP0Z2vUtkj1zdH73C9Lx59JCTETPJI+SO9j25g1jCuizdk+08jNGi/CFUsDcQ==
X-Gm-Gg: AYBFou2CuNXlSWbLOTFjFzys7ieufFcS5DqwPcqmLU8PISK466pDKHzIOxt3H9zREnJ
	TnBnTja3R92sZ/AtmdVmlgx5DeaxohqN6mb+9kCc5P/dVWpPpodcd40KENXEvVi/94vLrNjm+Qk
	fMOph9nRBmLgRHIxd/C5EI0YUaP7uvytt+/PNiIPL6XfUUdz5nqnHZ/CZVzEqZ9vAl4fUGTXa/e
	8ShPC80etDIW5f6epnoYbA9h3/8zEo9RI5DZ5bPGvz2JvtTofxI9XC7GuLy8+Qu8lGXNM6D0ru+
	ftbFtqlJMq6ST1HNIEht81MzyPoQkoKfwjV3nM6TtwFnPu5XAN9kOHSSKrYwM0KXgB0hp3SpjK8
	p11HMygAmKxVQ7Foa3xX+7mUnPEWMXvabib9RoK1N2DqWqJ1IOWrgXp+kHT/njChVtGDW/Sj08h
	AScHiybHr7nAw3RqiMftP5/Q1rSa/4zo2xRpwyEH3cI/BeAJTD/LQsnPVk4ZOv871CSV7/DRaUA
	FqrKe3N4VZo1FyywxpwUw9bGg6xVbFM/zEbXyndSArc4UcAKu1Q6+lrh5TzEqzgxqp/SAu/mkn3
	SkA/FHwVozlYI2Ao+2iHCGv8VaNp
X-Received: by 2002:a05:6214:2263:b0:91c:7a7c:4491 with SMTP id 6a1803df08f44-91ca4bbd308mr298429816d6.43.1793855187833;
        Wed, 04 Nov 2026 21:06:27 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e01a3f5sm38061886d6.30.2026.11.04.21.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:06:27 -0800 (PST)
Date: Thu, 5 Nov 2026 00:06:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
 <b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
 <20261104183603.17d663ce.michal.pecio@gmail.com>
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
In-Reply-To: <20261104183603.17d663ce.michal.pecio@gmail.com>

On Wed, Nov 04, 2026 at 06:36:03PM +0100, Michal Pecio wrote:
> On Wed, 4 Nov 2026 09:59:24 -0500, Alan Stern wrote:
> > On Wed, Nov 04, 2026 at 08:44:02PM +0800, Pengfei Lv wrote:
> > > When the subsequent re-enumeration then uses the "new scheme" and
> > > issues a 64-byte GET_DESCRIPTOR (get_bMaxPacketSize0 with size=64),
> > > xhci_check_maxpacket() sees hw==sw==8 and does not issue an Evaluate
> > > Context command.  The xHC queues a Data TRB of length 64 but applies
> > > ep0 max_packet=8 for short-packet detection.  
> > 
> > That's exactly what we want it to do.
> 
> Should we want it, though?
> 
> Were there known devices with bMaxPacketSize0 <= 16 which required the
> whole transfer to complete before they are reset?
> 
> That's not what happens in the initial iteration, so it seems any such
> devices would always take two iterations to begin working.
> 
> Is this what the only correct Proprietary Operating System does?

I don't know offhand of any positive or negative examples.  But if a 
device was going to hang if it was asked for the remaining part of 
the device descriptor after a non-initial reset, how would it ever get 
through initialization?  The procedure does two resets, and after the 
second reset the device has to send the full descriptor.

I don't know what other OSes do about this.

Alan Stern
