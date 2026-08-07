Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9137E2E9
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119698; cv=none; b=kuJ6wFO5I7LVU0CEHH1DKVgb4rg3HgVGVDIEcxXi+ZSzPS/D0wavbajPD0y2V2xjqbeAXsWghQ5ie7pIos0eGkl/7ngp0Puw8soUkLBd1FduA80wtI7dp3ds+fV3shbYt/g714HgO3KO7htyNcJ7bKLxv5W+eSL36NuecBrMnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119698; c=relaxed/simple;
	bh=Io9nEBiYNAgPehPuzIZ1iLBEWl25huq0b6ItTnxt37k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d99iE4zwAXem6eTJGPWzx+YNxYInPhZa5mlqZDbtSu0pEE+hG5IKu31xoqxCCszYJqAuby/mLPTnap8CqwZ1ExLkh2yG/U8BQVQXVdGZWtF/SkgLzcB8Ql8b/AaRkIaF15tYQYEOjMTyMElEHE0wBrbqPclVKgFjrcS6oiTdQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rMDyMOZc; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rMDyMOZc"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c8e2e39easo33570261cf.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786119694; x=1786724494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hltjk0wr4AeS5Y2IBg/OdnaDgDeYebSALpYuvExL1Yc=;
        b=rMDyMOZcMDs1Yxha25kbY9tbmbr23f+FKMl+UZesyIW+b0nKYsb3zW2TN10T1dm0BE
         ByanyZam48WKt8cosGksTbCqsMmugrsjevsoYTMix6ftq4+apHRhsVZJJ77zFzUL9bEc
         Z+27+LMHC2e0jmIhnbs44dlC1oLL8bmnNnsZZcyAngNHxVS6vpR3UT+U70dUgKUhz9Yq
         qSNb/hn4ai4XHgItvIHO6xz83tIqsN8DhrLh2JTtaniJ4VMOmvxdzNPadoqurzcOg3hw
         5Qd+cjDGs9J13aHdbAMhMq4lv0LuuE3vaSYXTrORvH4M75ugCU9pIMMX9VL4TLy2dMif
         2b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119694; x=1786724494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hltjk0wr4AeS5Y2IBg/OdnaDgDeYebSALpYuvExL1Yc=;
        b=HjDCZUtrQt9rzZpKW9TxK+i2wZb7nKN/iJnvlEYiUKHve9aIqrmEFpAltdrpiH5NUt
         dPG6Yc0+594T/Kev54VBx+rF02vuohOHBUs8oWYCcTETTMMaJQkGBTH/uH4ZBjuIrty2
         vjPDTpvRbq+Z+UD1EU/8RNYNgWc0afXA//7vM6PUZSwseV3Q5Nr+ric/9vRXn3sMyRey
         VRLM1tQp8b3KTfKLQuFUlKzlx+NiaQvi2vRmK9V4obep9dBE+FKBE3Havmy/2VjpD49N
         3d4S3zpfc24ak5mq5pfHtceoPPwVoQ+wdHtwRio3u4FLXsPJglP8RL0LimTLmuMASQFl
         U/KA==
X-Forwarded-Encrypted: i=1; AHgh+Rpx7QkzOHqWE+JG/pV3nK9O8GZwzb7D79B9riYOnzqQl66JWSX3ZUWsJfUwG07ftMmBf6IyTZDLP6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeRv3URa/uvCio6hrYMOmo7cEC4u4ToK7SVFBkpQN76zYnMwQ/
	NA7ADsPNry6+19GBMLbV6BS1u8YBF9JHa3nsfHRqYdG7wsgD33eNfmS/j0fEZWZxdA==
X-Gm-Gg: AR+sD12JG3M1P0pmr491XTXO1yE3cmFjOPjF7FdWIPj76DOBwq2pSDXPKeJiX3iX06c
	b8BYujpQ7+zceovH4Y6EMej1SjdgDXkCtJCibEtvUP2EftWlPkrAv+B7KdvLjHPipGOkhp9tK1k
	3OaldocPHwGWpzC5JKx49wv45Jf2jQHhAXJp9NW4zMhb6cr78ZklgKPIKR4mIsWlMyLGb7M6NTy
	7M8wGciE7A1Ewgttz9F+VZeFFGaPDVO18GO5YZ1btLH27z0nCxXwYDP/aVW08klUpfefa7R3JxD
	Pjh7/TZuvjqwkkf4Ue4Baov3Ha3VsHgeBDkeeCAV/HRDWDBUC2X9nobw/+5C4ptAHe7gfxNIfG2
	ZZcyZ4CopIywMpNryLD7zWUCPkHMfN40/mCBOiYi0zcYw53E+ay+MyjHf4HmtLd7pIu5CAvbZd0
	A7oiXOWSRZIiA7t5nPhWWk1pk0Nlgq26+IwvqUwqIJkXrjHi+Jqi/jxMtTOTxoyHu70l1tWR9WP
	A==
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr22416781cf.43.1786119694513;
        Fri, 07 Aug 2026 09:21:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a9329510sm12100206d6.35.2026.08.07.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:21:33 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:21:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] USB: pci-quirks: Release EHCI device reference
Message-ID: <482c065a-15d9-4f32-b898-d02c9878cf45@rowland.harvard.edu>
References: <20260807024304.928708-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807024304.928708-1-dbgh9129@gmail.com>

On Thu, Aug 06, 2026 at 10:43:04PM -0400, Yuho Choi wrote:
> for_each_pci_dev() holds a reference to the current device.  The Intel
> EHCI lookup breaks as soon as it finds a match, so the iterator does not
> get a chance to drop that reference on its next iteration.
> 
> Release the reference before leaving the loop.
> 
> Fixes: 26b76798e050 ("Intel xhci: refactor EHCI/xHCI port switching")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/pci-quirks.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index 0404489c2f6a..ba158d63bb8b 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c
> @@ -1073,6 +1073,7 @@ void usb_enable_intel_xhci_ports(struct pci_dev *xhci_pdev)
>  		if (companion->class == PCI_CLASS_SERIAL_USB_EHCI &&
>  		    companion->vendor == PCI_VENDOR_ID_INTEL) {
>  			ehci_found = true;
> +			pci_dev_put(companion);
>  			break;
>  		}
>  	}
> -- 
> 2.43.0
> 
> 
