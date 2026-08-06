Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7532B112
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025008; cv=none; b=PDUY+8qNqYRrRZx3TQbZMXlCqROgeJJftwxva8rU6G8T32rDQGoZ8xUVaMYm+H8g7mw5vxvwuvpt+cQPaALA8wcjmSr5ZytAtdNLSDwUBBiYGTjac/foWr6Auen724M31eMRKkG0lxr/UYAh3iyIyZAnX97sgaDyaYzRG8pvxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025008; c=relaxed/simple;
	bh=u9JXtChqtSTFhuchRR/PFpP8rF2xeWwYEzQp7qZv3B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iICk6GwzYWG3sr6YjwIprnWggl6lNOCKOENRH1bfytxogUiph7tmT2sgvXMYYA54s2OROdN4icp85L1hNRCy1WhACtxCw26jVDsc1gY59H6QdBmYHG/I1vjS8KseXaAxAUP8s7FDZydMXyq1PZcJoGfHXMYtXDRueV0bU5dkYTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gPqD2k9O; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gPqD2k9O"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6acc88b9c5fso1137980eaf.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786025005; x=1786629805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=maS3uLyNRyEULsURKlLuk7EGSwI/vQHszwdGmzJIEQs=;
        b=gPqD2k9OUFEYxVykHiAMyrpp/DhR5xgJrkCw5+QxNTOUtGaeuPM3dqT2oI9Zb0r85W
         KWe1cWBZsFzeDYWgXdVgdgv8e9HnXZMwko+MTq1729ev4uOka1POl3gmsh33WjQc5mSY
         ScHr9CSPNygf2D9yN21oIaPpdHbNES1VPtJKyQUpGhin5oCO5hQQqhiHlcyfn2zplTjH
         R/A9gHcem08cRxM4DQvBl+K02Xnn8eeKxdCrTbNhi0J5ZB3s3Z7XjZoD+Jo0haVhTNUY
         xp3P0hOp4Ys5b9kwRCVCvcg2nICnPSaKL70kg3LAeRoKgV7BMQ7Gs1QAtqVy72WNyedG
         0LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025005; x=1786629805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maS3uLyNRyEULsURKlLuk7EGSwI/vQHszwdGmzJIEQs=;
        b=enaG5NywQG4n5u0Ta+Gsn9Eg4yiVDUMYPY2w2aNNKRS+PBKcFQplpePWwwAWovxje2
         EqcrCLFmuCWERfbc927+9aL7Yt2CZ37nGYQKxUZEMwiWVDM8LdzldG89Eq9HEWKLhgrq
         E4RuFfuQuMatw5AHH8jXG8Q4MaHFzlKAlJqJj+I3W+BkocvehyCYEemUIvoAlfJuow2P
         pqZJL05W6ZikVjI2NWSkDyPpM6XQNRoZ1pbXxXrRlcHBNYpaurOwFkUuXenZ42eD57K/
         SE/hH8wY+sxh1nDl59+RezDzokaKXMo4fk3O7U0VcY8H9rnNrfZLl0GEfb7FZXTdP4Xo
         bDrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqkv7eV7VzZdAtJ0vaVAIoEs9mONUsQ1TDiNhgWLcf2pajrK6+RtWDzC3fOhNf8uXJs+wurJUUmrwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxspJJYJk5dn8rsMEAB7wS7hWiZngsZ/4/yOU/roojj34VPKTNC
	rIwR2rwi5MJSPn2kF3zZzW1nDVRTJawBS9qcOPAfsiNjREkvzDjhHzbFbYm9G1jVOQ==
X-Gm-Gg: AR+sD11q3xLkLb8Fptmg+vXHGByi+zaPYFYmINsHw6oHBAJLKxMmFAjiWNbhKG16cAU
	xG6c7gqqM7Z07wTI5lOXclxcmAToVBniP98uUI3rbK2TW9sbWXJHzD9c2tM3oZZXSq2qpBbCbc8
	aHyUpmOKX8cgqiu0wGo5VGZGG0pASkbsFGV6GsrOGJ9esmmLmb3eDCkDG3Kxza2EXyGAO0U0DAa
	b8cIKVu2CdC4pArc72M1fV1BFFw3ZEhYTTAumEBK9w2MccndMn8ezF3A5txLrmHO79osiIWVeTF
	7nUvh4Vy11B5Xlb+iQdf5dI7tbY8qMRuzYnMkAVBytaRfWVV/x0ag8X8YkpqGFOsTxiXyQXF9mi
	Ls6Es4PNT1zZPv/eh6ZDzkVtzmlrtXTwTnLeBYPhi6zSAPg4dFyhmuiq+mNUr1eAcIdKO2zYWHx
	2zEHCqtQ6sn0YavdjFrJj88liaVJe6sXrsXnAFpyy8QyUU4kUxBgYjgPLz2CZszpBoLTSzkex4K
	ZcZxcU=
X-Received: by 2002:a05:6820:1905:b0:6aa:e524:fd7f with SMTP id 006d021491bc7-6ae970b941bmr7785497eaf.34.1786025005248;
        Thu, 06 Aug 2026 07:03:25 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffe09f0sm52927166d6.22.2026.08.06.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:03:24 -0700 (PDT)
Date: Thu, 6 Aug 2026 10:03:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] usb: misc: usbio: fix bulk receive overread
Message-ID: <5c4f8b7a-4047-4c15-ae13-3844790317ef@rowland.harvard.edu>
References: <20260806-usb_drivers_usbio-v1-1-04879d13b46e@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-usb_drivers_usbio-v1-1-04879d13b46e@kroah.com>

On Thu, Aug 06, 2026 at 03:43:11PM +0200, Griffin Kroah-Hartman wrote:
> Add a check for bpkt_len being more than what was actually sent from the
> device in usbio_bulk_msg().
> 
> A malicious device could use this vulnerability to claim that more data
> was sent, when in reality it was not, leading to an OOB read later on
> with the memcpy at the end of the function.
> 
> Cc: stable@kernel.org
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---
>  drivers/usb/misc/usbio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/usbio.c b/drivers/usb/misc/usbio.c
> index 3c2474dca810..794322ff09fd 100644
> --- a/drivers/usb/misc/usbio.c
> +++ b/drivers/usb/misc/usbio.c
> @@ -341,6 +341,9 @@ int usbio_bulk_msg(struct auxiliary_device *adev, u8 type, u8 cmd, bool last,
>  	if (bpkt->header.flags & USBIO_PKTFLAG_ERR)
>  		return -EREMOTEIO;
>  
> +	if (bpkt_len > act - sizeof(*bpkt))
> +		return -EPROTO;
> +

Isn't this just a repeat of the code sitting 4 lines below?

Alan Stern

>  	if (ibuf_len < bpkt_len)
>  		return -ENOSPC;
>  
> 
> ---
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> change-id: 20260806-usb_drivers_usbio-55ac8cc2e572
> 
> Best regards,
> --  
> Griffin Kroah-Hartman <griffin@kroah.com>
