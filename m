Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F4408017
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 13:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099705; cv=none; b=shpUucdEtlsrKqvVQpwHmve4eftaxmknPFVBv6wqJ8LNpCFkjlJ9/uLZEjMLDwhhkBPvBN+rFS2Xgxw6m1LhckEq4MUeFl4VmAaMjSKQk5AAmRHBcnRIDyTY2Rhi2dnjyHHIJA20H56CV7tfqy1mdlm8WT0RFWVl6NmyLUkcEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099705; c=relaxed/simple;
	bh=iFX1u099Cp95RRWd+WxFF+aB8EueyE+7mY+rhOAFDbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eugVnDYiJncbECP/CnRru26LB5Wu0PVWNjIGFLnfvN0c/9KOPMNV2QShk9TAiXb9tbuKlN+Vpbuvf7oHhUev+eJLZdb15z4Zsz3csf6muxcmAbQx7LSiFA3UfjZjfyO/tpGKqpGcrSjiZRNQ+oHEdKZUf/w2dfkCQrzTgqU5vCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vl/oQJA2; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vl/oQJA2"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-517760dc3c2so41228251cf.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1781099702; x=1781704502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9UaplOGpYhiXdV+tZern+iswxcB3oyFIybrOKhcHCY=;
        b=vl/oQJA22aLTCy5K49IIq9y9gWV3wnGVIgkoQ7O8rkuJ1issAoJu8jXX2rigbwiYcD
         xgk8JVUsUCmQfCqPZhL1JpVX24PcX9MuQuBIy0P8oOQImdqfuLyl690sjRKgSPL+xqtr
         6uLFyg4XUrp81eNz4WvWJWCt5iLjUh+6hnri3chpKFWS0hYD4L9kGexnaVs3u+AU8tx9
         Y4ga+ow35738iuKWRzlhK8oBa8JS54QhJPnazTm1AjHB/8TrWC5Jzig7ojtPxcV14xh7
         kpxUIrGYJhQDFmFr4RlM9PfD/1fUuc+gqeaFEREt2/tSEC8uq8MWty6ez6sLHlLHzq2u
         ye2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099702; x=1781704502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9UaplOGpYhiXdV+tZern+iswxcB3oyFIybrOKhcHCY=;
        b=Hh1PM22MDJDitvg9Wb8g4JHsLf/QFByOg56gpLTSbkGj5NYt4CYojzzOeB5mWZeDZD
         bow5+WiRp0jl3crvAK/nL3gE87PMWRY4wpbAsIAPd4NGT1iU3uO+gauv+waS1ZPVv/4i
         r3kgjW9Drydj6OrqVsgQj9LwCLj1NoZffBZ/BE351I4VZ9P+zHbttSXbShg4nySbH3Os
         vn1qrImOOO/7hvpqkswVZtT0tG8V89tbbyMWrUlHsIJw0NhDsMdpG/U1hzrZGqNpH5c5
         XtAv1/mVgRBNqDkbVBSjBXUt4Kvxh+R47pWlOiMrCZJLXVd+fEbSApObGDg62wd3D+uY
         zlwg==
X-Forwarded-Encrypted: i=1; AFNElJ+5VynLn1XCqBbaR++ePvxgT0llB71HEZocyKSHcB5qEo/ZqUDahDLBIQZUd8Y12PH0v1e3H/DoqXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzibaJ1BE2v3qN14SS+BWTz/YBl6dMF5Pl5FkSomlhg74m+TsvA
	Iy/NFdTvFQR5n6t6jFfhZm62ilLfdXluMI+d8KgZsjDg0ZVLuyijPcjHW69o+Mf1Pg==
X-Gm-Gg: Acq92OGxLw9M9C0buvZ4ZkMvRBonoRD4tznG3Fd7k05G5m1TZAIBIiT11qRcesxwkPZ
	uIIWi+81zBlc+ooMqxuR6zdI1LtVcrJHw5UWM55pvYI2kFU8FZOqiGsvwz+oclelrWws16YsZ7b
	Uaz9QOxenYhc/3G5RENsvAP5wlzfZ9WRm9ZVwx625TUuXT6Rdx8gKhdDI5DoZZoNMLAkBwTQukI
	2WhvEP6DXZ7OfFcBvuPwK+fzHiIrOHz9k4zRk1K2G8fBoi8+JXkGyxzQaB7lasKAR/zXzKmx91B
	JwMG0ESl8JhIbkcD9l+glu3Wj8g86eNnIZ9/1WZPRUttdb9zaJJoRIY7lqesPMst7OPKsJgLF34
	9GQRqjOvNV0EUPQSy5xtggB3RP7wAshwk0mMs9+aYhiXLKbQ5Kms2zvAmbNG8bO/6VV3wzetZoW
	rcSQG/DJWQPOCcEeCC4q026aFcUfQk+NwOqKi0qtMUV8sIVCAIDU5a
X-Received: by 2002:a05:622a:5592:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51795b5741cmr329196731cf.27.1781099701559;
        Wed, 10 Jun 2026 06:55:01 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm235468361cf.12.2026.06.10.06.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:55:01 -0700 (PDT)
Date: Wed, 10 Jun 2026 09:54:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johan Hovold <johan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Shuangpeng <shuangpeng.kernel@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, keithp@keithp.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: chaoskey: Fix slab-use-after-free in
 chaoskey_release()
Message-ID: <c5df986a-3067-4fb7-83ef-ed6cf3b2cf1c@rowland.harvard.edu>
References: <bb5b1dc6-eb59-43e1-8d26-51e658e88bbe@rowland.harvard.edu>
 <aikUQKaMqpocakgG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikUQKaMqpocakgG@hovoldconsulting.com>

On Wed, Jun 10, 2026 at 09:37:36AM +0200, Johan Hovold wrote:
> > The driver's last reference to the interface structure is dropped in
> > the chaoskey_free() routine, so the code must not use the interface --
> > even in a debugging statement -- after that routine returns.
> > (Exception: If we know that another reference is held by someone else,
> > such as the device core while the disconnect routine runs, there's no
> > problem.  Thanks to Johan Hovold for pointing this out.)
> > 
> > Since the bad access is part of an unimportant debugging statement,
> > we can fix the problem simply by removing the whole statement.
> > 
> > Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> > Closes: https://lore.kernel.org/linux-usb/20EC9664-054E-438B-B411-2145D347F97B@gmail.com/
> > Tested-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Fixes: 66e3e591891d ("usb: Add driver for Altus Metrum ChaosKey device (v2)")
> > Cc: <stable@vger.kernel.org>
> 
> Apparently I overlooked this debug statement when adding the missing
> refcounting in commit 93ddb1f56ae1 ("USB: chaoskey: fix use-after-free
> on release").
> 
> Reviewed-by: Johan Hovold <johan@kernel.org>

Thanks.  I should have checked more carefully; evidently your commit is 
the one that should be mentioned in the Fixes: tag.  Oh well.

Alan Stern
