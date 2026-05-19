Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259B3403F4;
	Tue, 19 May 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198876; cv=none; b=YD7xYBb8IxBG1alnxSjVLjuEDpVPx5ipG37cP7SDm5BPT8pcMz6BR2MWng9Vvhme2gF7eyV1xze5m856TarxkRKMrAi5AM0/+WTSl9hIyDGczpzY4tzMRb3c2FaNwZ7sX0Drs1UPb0fxeUW9hf7e2UemIbeKOcoKORH6uA6NUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198876; c=relaxed/simple;
	bh=r3xYKF7PqPDMdlx8TGpqKyXbVranVJ5DsjQngJZXKMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIVxfekW00JzueXMXIzowhqzt6xJtscvQuXsvCqMXXD102yLRCaIfMLT/FHI6Gs38Lmaw+MNSUaM9v6fercESPgUdTstBmUeVHCmwaJEMiMUvMlSwtDa15HCIhZpcD0sIJ8xtvDdkxDtE3GrDw6juvjJ2mipUaZVi9ZuAorXMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8xas68O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8xas68O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779198874; x=1810734874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=r3xYKF7PqPDMdlx8TGpqKyXbVranVJ5DsjQngJZXKMc=;
  b=O8xas68Ou6XIP8197LcWCUEEgECdq9lRvDckTRJGKgGnPFFLBCjHCnLv
   LpeE5aQGU+ATrsg2O4h4DPCaioon743zaEZCr9o275AiCj8DlanHGmQ0V
   1vq5bLn7yMvON2Fyjeb637iY0B02drhJqiRAADUg6PzXSFY4OVPyII2jx
   lUZH3jFzrv9LmjK1fB+YIwG/MFdB/4balfnoARlRbP8CjgPaKFSVZvtWG
   pbB2PM8n18/xVxjgBFBjKRYa9CKf7BejLLZbp4k8SQW4LUww9jU0r09EI
   3CScibx2WD4kTxtGdjFF4Ikoz9m8sSSoROGzeQftBmNLvEFPR6Gnwz3Ut
   g==;
X-CSE-ConnectionGUID: p/i3X21gQw2b3MFvViUGqQ==
X-CSE-MsgGUID: mRoKJYxjStqXoBlzq2L+FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91471062"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91471062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:54:34 -0700
X-CSE-ConnectionGUID: 1LoVpnT+S2Stq1nl6GXCEA==
X-CSE-MsgGUID: cpLpgt2GT9ejS3XbR1LqCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="233410209"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2026 06:54:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5280D95; Tue, 19 May 2026 15:54:31 +0200 (CEST)
Date: Tue, 19 May 2026 16:54:19 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Pandey, Radhey Shyam" <radheys@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 1/3] usb: typec: tipd: add error message for vendor ID
 read failure
Message-ID: <agxri7tZMHA1gyqz@kuha>
References: <20260513182850.165349-1-radhey.shyam.pandey@amd.com>
 <20260513182850.165349-2-radhey.shyam.pandey@amd.com>
 <agrnlRSyW7_A0AiS@kuha>
 <a80587a6-7833-4af0-a882-1748cd6cad7e@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a80587a6-7833-4af0-a882-1748cd6cad7e@amd.com>

On Mon, May 18, 2026 at 09:23:58PM +0530, Pandey, Radhey Shyam wrote:
> On 5/18/2026 3:49 PM, Heikki Krogerus wrote:
> > On Wed, May 13, 2026 at 11:58:48PM +0530, Radhey Shyam Pandey wrote:
> > > Log when the vendor ID read fails or returns zero, including the I2C error
> > > code and register value, to ease probe diagnostics.
> > > 
> > > Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> > > ---
> > >   drivers/usb/typec/tipd/core.c | 7 +++++--
> > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> > > index 43faec794b95..b282366b5326 100644
> > > --- a/drivers/usb/typec/tipd/core.c
> > > +++ b/drivers/usb/typec/tipd/core.c
> > > @@ -1744,7 +1744,7 @@ static int tps6598x_probe(struct i2c_client *client)
> > >   	struct tps6598x *tps;
> > >   	struct fwnode_handle *fwnode;
> > >   	u32 status;
> > > -	u32 vid;
> > > +	u32 vid = 0;
> > 
> > Why is this necessary?
> 
> Thanks for the review.
> 
> When ret < 0, tps6598x_read32() → tps6598x_block_read() returns on
> error before writing *val. So vid is never set; passing it to
> dev_err with %#x would read an uninitialized u32(random log noise).
> 
> ret captures if I2C/regmap path reported an error and vid tells what
> came back when the transport layer did not fail. Hope that clarifies.

Okay, got it.

Thanks,

> Thanks,
> Radhey
> > 
> > >   	int ret;
> > >   	data = i2c_get_match_data(client);
> > > @@ -1772,8 +1772,11 @@ static int tps6598x_probe(struct i2c_client *client)
> > >   	if (!device_is_compatible(tps->dev, "ti,tps25750")) {
> > >   		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> > > -		if (ret < 0 || !vid)
> > > +		if (ret < 0 || !vid) {
> > > +			dev_err(tps->dev, "failed to read vendor ID: %d, vid: %#x\n",
> > > +				ret, vid);
> > >   			return -ENODEV;
> > > +		}
> > >   	}
> > >   	/*
> > > -- 
> > > 2.44.4
> > 

-- 
heikki
