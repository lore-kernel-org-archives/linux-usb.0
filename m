Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20E4C92
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zKJyl52D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D79C433BD;
	Thu,  5 Oct 2023 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696491060;
	bh=WVfiU7BruikWI3XcN56P/mqbj3DADK2Gn6CjpPDCchQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zKJyl52DIQyaBgu99Sxqf45lI5oy9ucDTOAzIqXezxtoGC2Gk+LFRydeak+UXAL1a
	 a0khUO+eVAmQ9iTAsT6bY0DDHIQciNBx10vdCB8SAjuo8+uk9Pj6y2k3ILaY/Avf+b
	 6kvAsfn8TOrC4r29I28pIQNaiaChghp5pChHZLgk=
Date: Thu, 5 Oct 2023 09:30:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiazi Li <jqqlijiazi@gmail.com>
Cc: Jiazi Li <jiazi.li@transsion.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: increase eps_revmap length
Message-ID: <2023100536-backfield-surplus-7ebe@gregkh>
References: <20230914103058.29385-1-jiazi.li@transsion.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914103058.29385-1-jiazi.li@transsion.com>

On Thu, Sep 14, 2023 at 06:30:58PM +0800, Jiazi Li wrote:
> Commit 41dc9ac163e7 ("usb: gadget: f_fs: Accept up to 30 endpoints.")
> increase eps_addrmap length to 31, eps_revmap also need to increase.
> Increase it's length to 31.
> 
> For same-address, opposite-direction endpoints, will use same idx in
> eps_revmap, use ffs_ep_revmap_index to calculate idx for endpoints.
> 
> Signed-off-by: Jiazi Li <jiazi.li@transsion.com>

Please see my comments here:
	https://lore.kernel.org/r/2023100506-veteran-foil-cec0@gregkh
for much the same patch, but you picked a different size.

thanks,

greg k-h
