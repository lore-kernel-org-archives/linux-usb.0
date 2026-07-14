Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDFF4A2E01
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046731; cv=none; b=X5z2lCfVJ/jzYYU2QUGzswHwARLZGyNhCsB91I72A6QtLqDViyub++lXrcBSvJrzIosA5u7qrLhq7c0y28PwCzvQ3CpqVv1uP/JSAwqg0hACbHeNgGmCSRf8OLY2ieCIBsMtP3WdVWnH4lNoScI5HPybmx1F9PtLbekmWRMP6BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046731; c=relaxed/simple;
	bh=U9U/wUyzylQO+cqrrDIOM2GHgbFIChuc1wNZRhGhmog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl3JqStdmkaqyPvIzQYjPWGPqVA2r3nDWZTud7NA4ZWN24XHjoEIrqGgcXmtq48WBJxa4xMrjUVsK6eB+V4fTEy18c75NvL+ln/cqUJt356Guhst0LWVqJCJuZCJ1cx8iworpcQ4r/GKwf6d69uozdoMEsnINlotDvPfgeIM0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=leX+MC/P; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="leX+MC/P"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2c8f43aaso41092641cf.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 09:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784046729; x=1784651529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjRXliiSXyB/2/4A2Atdug2h/CJ8eoQ9ukMLGeBcJ3k=;
        b=leX+MC/PwGrUOF7BaNgN5XH0367t7BRzzbDz0/kWPbPaWHVhKUqZ4z/AmsI2fGpJgV
         5NOrZg2ajKPa3/NdrmRDBkXVqelunqvG2C3g0pG7F4uS7k4mhNp/F0gN7+IbwesLnxzB
         HKtTyv1MRajxQdUOXA3O899bIZBzx6lthp57LxtH4AYhT53DQyVEtVVDUJ1DMyKEEOwc
         n1dp0CxPfFbmVbwmU73uPi5JwxfUGTw5myvTuIlJddRiFb1PO2y8wQsZ5hq+39sPPkfI
         kdh2sMp0HD2k7v5q/3TQ6fpb5WQqw5QDeiDZGWuGPCM5IU9yEtq/xrw/5GzDhVIrFI5s
         gyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046729; x=1784651529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjRXliiSXyB/2/4A2Atdug2h/CJ8eoQ9ukMLGeBcJ3k=;
        b=OY2/xPHXrmR3L9ZER9rtCoRRQlQRMGGugHP3WUtHyo6bSMdKoJDUK/WIJDyQMjZRBz
         QOxSRmypZGuj2uRWW3OoOUbSr3PbRGpriX88JUN9A8v/UxlKqz4PoNPIeYbslNgwM2uN
         /g2/PCZP7fdgYnxDEb3vIJ65renpbzNnVE+VFg8dTTtRCofDd9jgSAsAH+hulrvFgKAq
         +SyYctMMBjgtQ4X3tk+trYmT6xRDvXdlQ9hbfZMvW7GimFbTF5uwMl1cVp12FoyElNfL
         0TqzZkXb+jnYEdYH0cPncTD+3leGcQJWT5qv8/2uLRWx1ja25+qQAnlmq14DQ/nXPOkb
         e12Q==
X-Forwarded-Encrypted: i=1; AHgh+RoXKNiIbC+mVnmsfUgLR5FOJWM+R2OXdlBnutLNWsTFB/cjEf8se4aBZKtM786DtLxydOxLjvHrlWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxixusoZ/xLrURHx+5/tZgOhQHBYHHSzxr4TCFkkGNW1q00yshK
	h1zG/XMXyVCBJyhkUCY2CYuOzaWrYU6KvaRB8ZbHba03xP2PlQcIs/AREgF5IaxeDBmchqUt4i8
	08qi1+A==
X-Gm-Gg: AfdE7cnl47VYZHM5PTMGN+OmJm+7W5ufsKAix+cAUBmA5pIMvWgtkMCwgSYhmy3xpDt
	EWPvQwbIu2QDXxyMkC0sqKZy8ON+WpoaKEb+Wi5F7zpWT2nZCr0yYDwvAMZo4McPEHqEoU3T17j
	1a68IJMHyD+sQt1wjmRuGlZSj/ojEtFvyeTMhaLcEZ/7DRjbgGyG26VSEG+FOoee759W+DHwV+4
	YziQJiXJs1Z2d7MrctvqTCfIlyaQw+Te/43TvRCbuGXnyslRIhNi8/Pgs16xPkrT3Ii9pU6iCyP
	/6DQWRCOjbPInx2u2zbDPn8UahPGo2SoOJSABqmF9Z48PkUKJ555ZooVJlTpCX0hbwcgEgozXqy
	qoXF8jWa8CpY5wEOKLTT0p8F2CUgpsYlKJRUEgBAlYxRjWtw4tmwwyBLWhi4ruPRTnvwfJ7gYkh
	oC8u/ITqcHJFvCmRIrpl/G31BC
X-Received: by 2002:a05:622a:411:b0:51a:8c97:9383 with SMTP id d75a77b69052e-51cbf2618bbmr136783981cf.58.1784046729138;
        Tue, 14 Jul 2026 09:32:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caafd8b44sm115751111cf.30.2026.07.14.09.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:32:08 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:32:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
Message-ID: <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
References: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>

On Tue, Jul 14, 2026 at 11:04:33AM +0200, Griffin Kroah-Hartman wrote:
> Add additional error handling after the call to get_hub_status() in
> hub_hub_status().
> 
> get_hub_status() uses usb_control_msg() which does not verify that the
> message is the correct length, substituting it for
> usb_control_msg_recv() would also solve this issue but increase memory
> allocations.
> 
> Instead, error handling is copied from the method used in
> hub_ext_port_status(), which shares the same flow of logic as
> hub_hub_status().
> 
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---
>  drivers/usb/core/hub.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 5262e11c12cd..0d2166b8923a 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
>  
>  	mutex_lock(&hub->status_mutex);
>  	ret = get_hub_status(hub->hdev, &hub->status->hub);
> -	if (ret < 0) {
> +	if (ret < sizeof(hub->status->hub)) {
>  		if (ret != -ENODEV)
>  			dev_err(hub->intfdev,
>  				"%s failed (err = %d)\n", __func__, ret);
> +		if (ret >= 0)
> +			ret = -EIO;

It would be better to put these two lines above the preceding test.  
That way it won't print confusing things like "hub_hub_status failed 
(err = 2)".

Alan Stern

>  	} else {
>  		*status = le16_to_cpu(hub->status->hub.wHubStatus);
>  		*change = le16_to_cpu(hub->status->hub.wHubChange);
> 
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260714-usb_core_patches_2-a3eb9d1b7b9e
> 
> Best regards,
> --  
> Griffin Kroah-Hartman <griffin@kroah.com>
