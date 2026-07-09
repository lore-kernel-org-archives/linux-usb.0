Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D639B4BB;
	Thu,  9 Jul 2026 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783575281; cv=none; b=tNfRI94bkUaBXnRhML5Ybit5ysqUWLT5lWo1Jm3QuSitxMyxkloJ0YrX9412qIe43UGIKG4hU1lGQCMN6S8ux5TFsqfBdKYJB8krBas2b6fFaThDLxo07Eql2JIT3TP4lSgyb4TapryBxOqbdWhCUH4hTlLLspa9WWq34GPD+IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783575281; c=relaxed/simple;
	bh=GzP71OMvc18R3VEhUTwEhddp1rTippgSGNUYk7obif4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDTI/LvRZaT4Sn8sXMPF32TOkFgj119UDJ24g0DtLWCLLzNqJdH4dSMSEtQf0c91OVNOXcjl4Ce7/bH6rDo1z5VOyytqi3T2+lfdG7w2Ue9kiImyx6N2EwKfO3oIu5jKV/f45PRR0R6lYZ5EwUkGyK9ZBt5gfDjekLccnoVEomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zWSqzdvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zWSqzdvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFF31F000E9;
	Thu,  9 Jul 2026 05:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783575279;
	bh=Ds/08QqvEFzHQ0j+OYuOGcJzgn+30pGBQS5EC4FqNfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zWSqzdvn/1xzfOTsmgOOC+HkFS+Fo5JnjTattxSBPUbzGWPP5rIVAPwsuF3992DMB
	 A52H1RdH0DYO8gsUCyL4SSbPV1YGb1sWos5k33xbd0JXn2dvNqYTahqNgEFVf3oruJ
	 Xgo8sqsxlFU3aOTP1Uai+Ek6+0aAFI+9aXSBqMGw=
Date: Thu, 9 Jul 2026 07:34:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: function: rndis: add length check to
 response query
Message-ID: <2026070900-sudden-tapestry-195d@gregkh>
References: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
 <20260708-usb-gadget-rndis-v1-1-e77e026dcc6a@kroah.com>
 <232723a0-328f-4929-9525-d5f00d498636@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <232723a0-328f-4929-9525-d5f00d498636@suse.com>

On Wed, Jul 08, 2026 at 06:24:16PM +0200, Oliver Neukum wrote:
> Hi,
> 
> On 08.07.26 13:08, Griffin Kroah-Hartman wrote:
> > @@ -598,6 +599,13 @@ static int rndis_query_response(struct rndis_params *params,
> >   	if (!params->dev)
> >   		return -ENOTSUPP;
> > +	BufLength = le32_to_cpu(buf->InformationBufferLength);
> > +	BufOffset = le32_to_cpu(buf->InformationBufferOffset);
> > +	if ((BufLength > RNDIS_MAX_TOTAL_SIZE) ||
> > +	    (BufOffset > RNDIS_MAX_TOTAL_SIZE) ||
> > +	    (BufOffset + 8 >= RNDIS_MAX_TOTAL_SIZE))
> 
> Wouldn't those last two lines be more efficiently done with:
> 
> BufOffset >= RNDIS_MAX_TOTAL_SIZE - 8

Probably, but doesn't the compiler turn them into the same result?
Also, rndis_set_response() has this same check, so at least everything
is consistent :)

thanks,

greg k-h
