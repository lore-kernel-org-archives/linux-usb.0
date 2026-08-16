Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A333D6ED;
	Sun, 16 Aug 2026 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887849; cv=none; b=ZZvforiR6lnGkEawZt3t70OU72GXKYvXISye7yeUJZMfKkUl8AHDJ8dgnz/S/zBbyHS3TuQIyzt+bj5sPcW5H8tuuuQrwwu0Xciq+dXpuHzeDbfXu58WolNkt3g7OCVLzzegvKQXlfm/53eth9ACT8a/12qzkDtS17GIHWu+MB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887849; c=relaxed/simple;
	bh=8A72cVi742LH7B2tGx7/9tALN32SJtPy83JCLmt9Rxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgwSKckTrkH9Gm5/4jNTTnOLRwSjo4OH7PLShjiQQSG4m5TRYWA0pCAvytH2NVZdeVqrljiPr4UUDIZPp+aYbEN3b4e780p5NAW0mFcvCP8F/QqlkaVZqhBODcVVp9RlhOutSeoSWXxiFKP+Od/eGdm8OYf6TM7zbmp4iKEFlrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id BDD6D140155; Sun, 16 Aug 2026 15:35:59 +0200 (CEST)
Date: Sun, 16 Aug 2026 15:35:59 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: William Bright <william.bright@imd-tec.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Handle connectors already attached at
 init
Message-ID: <aoG8vy8upZhuLsQV@cae.in-ulm.de>
References: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>


Hi William,

On Thu, Aug 13, 2026 at 10:38:40AM +0100, William Bright wrote:
> After a cold boot the PPM may already have a partner attached without a
> pending connector change to report. On a CYPD6125 the CCI register reads
> back 0 in ucsi_init(), so ucsi_connector_change() is never called and the
> Type-C mux is left unconfigured for the already-attached port.
> 
> Fix this by additionally checking the connector status of every
> connector and call ucsi_connector_change() for connectors that are
> already attached. Whilst also continuing to call ucsi_connector_change()
> for connectors that report a change via the CCI register.

I'm not sure if this is the right thing to do.

First, there is code in ucsi_register_port() that is supposed to
handle the case where a connection is already present. I wonder
why that does not work for you?

> Fixes: ce4c8d21054a ("usb: typec: ucsi: Fix connector check on init")
> Signed-off-by: William Bright <william.bright@imd-tec.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ecbda2a3783c..740ae4a14f7f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2136,8 +2136,11 @@ static int ucsi_init(struct ucsi *ucsi)
>  	mutex_unlock(&ucsi->ppm_lock);
>  	if (ret)
>  		return ret;
> -	if (UCSI_CCI_CONNECTOR(cci))
> -		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		if (UCSI_CONSTAT(&connector[i], CONNECTED) ||
> +		    UCSI_CCI_CONNECTOR(cci) == i + 1)
> +			ucsi_connector_change(ucsi, i + 1);

ucsi_connector_change() really is supposed to handle an actual event.
The second call to the function will be a NOP because EVENT_PENDING
is already set. So your fix only works for one established connection.

Additionally, calling ucsi_connector_change() will set
EVENT_PENDING which in turn will cause the next ACK to include
UCSI_ACK_CONNECTOR_CHANGE which acks a connector change event
that never happend. That is, unless such an event did happen in the
mean time. In this case you will ACK the event without handling
it.

Also, I seem to recall that some backends don't like it when you
ACK something that did not happen.

Best regards,
Christian

>  	return 0;
>  
> 
> ---
> base-commit: 55431f6adac42f818a0c76594ce2c6c02fe1034d
> change-id: 20260813-ucsi-cold-b35e11991b7c
> 
> Best regards,
> -- 
> William Bright <william.bright@imd-tec.com>
> 
> 
