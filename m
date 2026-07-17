Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57981F936
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303133; cv=none; b=Pk6TavjFU3xgGaXfqIs2qi9JupQ9MuixEcMMAKaD8/THkOXlfwgU4ntGbvfAA/hVR0Rjfo7/VhATUfUnwn7nAYCuQzocnE6R19ZAavW2SUhwKdAMHNs67vWPDpxS4+S755S+40dP9zMLlkcNu3Lq2eE8KaqeDRGtwwHJG/d50Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303133; c=relaxed/simple;
	bh=hkdjjgfOmkIA4l6ExGwaCTS7sdXHEhbk5kh7kTnnmtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcGS9tYlmC2TQdnSIL07Gi2VxZ3xDFZJEx8oqPhBcBMM+6xTjxYaK13Rj+5gdQx/UOrERvfokH/2MmsgADcjNu0i0mo7lBAC0FbUqrmvasloBnYilE02iITOfywV/EO06nMLqLOokZwlIja1+hFCGvv7GGIt6qO7AyMXpJu1lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kyvFIDt9; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kyvFIDt9"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c16ac21acso31551361cf.0
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784303130; x=1784907930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfxgHjwXQJwL6VSIEWWu+C1UvQGeRN1CKjS9L8cjWCE=;
        b=kyvFIDt9p+Es8YXsc8Tsi8LS17an5A1eErJgLAmAKx8FNUArspgnUHJH4tvdbbodLg
         DELJgf0TJ6FhsBLuzPVbkLdDOVanpz2iwMWyktnJuqc6zk5LzUAG1wVbpwuxQyNYh6Kq
         8Y6zFxYkC44WIN2Nbpt2xJTmFqJbIJkYstGB6NpUlwtv7taZBnpkbnMIFS4VrkH5wgVf
         KMIjayusBTQhgs3RG2PYax6wc0vFHcRNOfOWkHq/Kj1Dk0FKP3GxBqBiGz3ZeJ5ioWAq
         nyxgbk1+/f4VqmlVf1iQw5EomWT0X9JaLIYbv/+jOpVY37RQHQKgSTETlyb2s1Lrp4bV
         Ek3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303130; x=1784907930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfxgHjwXQJwL6VSIEWWu+C1UvQGeRN1CKjS9L8cjWCE=;
        b=dgmzF3LCK9wZLjbMNXmsg7mhpj00EdpP+NQ+NcUXoWkhaCbdGf5ZlaKxBaRdmUx15U
         Bi7YAg3BtzVI497MHzpAqBsQoV4mTssmKSCMWBrMRmImQdkod6DyhM+XgikI7ScQWf/v
         TkrKNNYRN3wr5bfBRkeT6OPRUTF5kBHulJE5tGp44fW6+0bv0DOKh5LCnQxA3zktNNQq
         SxJ4KHZ5ssWyn+Pa7LANbE3Ol+r0MxlyVg/Ci+qgSWPThVjNEP70vid+b8usTyqcu2ML
         5ObX6wz/JTINVXJdlanX93pobCEb/OBhuNxOdFAhYVR9+gALLPd8895QKOG3s5L6c4kx
         X+xA==
X-Forwarded-Encrypted: i=1; AHgh+RqZqbc8Z+wZFblQM3LVjgp//S5AozA/kMYtPhqPmJLdqsITaaCOFjDevYYLq5bb1eacoYP8HnBJUKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62DWbfgecqEHqa6B3xx9bsMguuK1iD2DJnHgZAhx+d7O1DImj
	GngNVJQwwzfmDFpnPnXKl6ZZCMrIqhMxlqMftn2uEnAvQ4lZTr6/nMA74jFE7rzS7XOMc81ArYb
	mwZCbhQ==
X-Gm-Gg: AfdE7cm7Xhqmv4LM/C4pTmCzrNneOCi9N4CUOlN1rJO4orHqiSSaasJoZ6oKj+YfzZG
	JREMyETX9Y+902hjJd36eQ38wmzTKrHtBprLMEbyy6RQmZd93vT9Bs6j7FFLKfJbQcRDSF2pmOp
	70ezlo0y9DtXPTfWMTXRza8jp3VYano802o9/cOmvwacRWWrmGJw6vBwDfvWky73OCYf+HY0lED
	bbH5dEMaqmhoaez/DDf7VOSCW1maASq89Xf5oaenw2bLb0Mdg5cWlyZri+N8JZsVOrNBcX8rIN7
	GI6wMByf4C9oPzK6mpOXYHgmTO59NQ4veHipksw3MjKghNOSVgBI8ZrSX7fOIQ1xYJFJtMbQVVY
	IiSE/cjvRg2owxD3g4YlYwHzM8Xp+cbEZYW7f9VO1DQ9DHYcy6IKXY6UdSIKctvjfRof4UTSPiM
	ItHKyMGtDoe3Preg==
X-Received: by 2002:ac8:5a43:0:b0:51c:25da:903f with SMTP id d75a77b69052e-5213eb784bdmr28353611cf.59.1784303130298;
        Fri, 17 Jul 2026 08:45:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9077871dec5sm19100736d6.44.2026.07.17.08.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:45:29 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:45:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
Message-ID: <8fbe8ab9-011c-48d6-91b2-b0d73b23d8b7@rowland.harvard.edu>
References: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
 <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
 <2026071717-richness-opossum-b855@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071717-richness-opossum-b855@gregkh>

On Fri, Jul 17, 2026 at 11:48:46AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 14, 2026 at 12:32:06PM -0400, Alan Stern wrote:
> > On Tue, Jul 14, 2026 at 11:04:33AM +0200, Griffin Kroah-Hartman wrote:
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > index 5262e11c12cd..0d2166b8923a 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
> > >  
> > >  	mutex_lock(&hub->status_mutex);
> > >  	ret = get_hub_status(hub->hdev, &hub->status->hub);
> > > -	if (ret < 0) {
> > > +	if (ret < sizeof(hub->status->hub)) {
> > >  		if (ret != -ENODEV)
> > >  			dev_err(hub->intfdev,
> > >  				"%s failed (err = %d)\n", __func__, ret);
> > > +		if (ret >= 0)
> > > +			ret = -EIO;
> > 
> > It would be better to put these two lines above the preceding test.  
> > That way it won't print confusing things like "hub_hub_status failed 
> > (err = 2)".
> 
> It is confusing, but it matches the other check for this same error in
> hub_ext_port_status() as it's the same error condition.  How about this
> patch happens first int he series, which "unifies" them, and then fix up
> both of the patterns at the same time to be more clear in a later patch
> in the series?

That would be fine with me.

Alan Stern
