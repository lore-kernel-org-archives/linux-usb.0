Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8F434E50;
	Wed,  8 Jul 2026 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511294; cv=none; b=mmV2bSEoHgJSA+l1Is5bMQimBDBoMp111k1yVrFZRiZzSWrJgjdzkiH3NapTab2VRi0BIfdqnPLxUEfeug9cou+ZM9k9Aaxgjrk3JPAtMzlcMMOztFmZSnXD77UWmcmb2LLv3P+MubVwEE3jM90Ql+236pafOWi5u7nPsqD0ivA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511294; c=relaxed/simple;
	bh=MtJYLT6ITNcZY+In++QxrDWRejjPscEyrXLXjXVqs4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXinXiRhOtJPNNFHD0l0MGoQxYJaCq0BaThlHBJeU2iesYPOIn5ZRMaTa3Zl9qkIrQi6CBjg71oC4EUSpwmTnmk15dI4wZn1ajl31mRqsH/sdoWsvxXVe+mlw2hnkJGmYbrmCOixN/lGwBzXjleQX7RnLM9DWBRHkNYEuUJdbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AlVJVX/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AlVJVX/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37741F000E9;
	Wed,  8 Jul 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783511291;
	bh=Q92fouhYrZepZT6Dfwi/Tsjnr8tmCRGF/LasNUnc0ZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AlVJVX/1EWSbuUm1afiYlYWwW7C+IPZr0zprhY0qw9Vh2RIzK7NKrr7ifYvplUxW9
	 5qIKhdGQv6N1EtoxUzmSAW/FnI2Jcsd5wOAwtKVwXlAnCT+dH2Fau51fDHftu8pI5M
	 9jtNO9D5Z4CqLKkwyYW/0EIbr4gOzkDg++wskVB8=
Date: Wed, 8 Jul 2026 13:46:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	johan@kernel.org, akpm@linux-foundation.org,
	andriy.shevchenko@intel.com, pooja.katiyar@intel.com
Subject: Re: [PATCH] usb: typec: ucsi: ccg: Log firmware version and hardware
 info at probe
Message-ID: <2026070844-placate-routine-593a@gregkh>
References: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 03:01:47PM +0200, Loic Poulain wrote:
> The CCG firmware version and silicon ID are read during probe but never
> logged, making it difficult to identify the hardware and the firmware
> running on the device.
> 
> Add dev_info messages to display the firmware version and silicon ID:
> 
>   ucsi_ccg 2-0008: CCG FW version: 3.9.0 build 0x0000
>   ucsi_ccg 2-0008: CCG silicon_id:0x1234 mode:1

When drivers work properly, they are quiet.

thanks,

greg k-h
