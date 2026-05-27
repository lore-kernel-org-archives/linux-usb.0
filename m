Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739A2C11F9;
	Wed, 27 May 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869058; cv=none; b=DK9UMEJANkjYhEhk/KyEbdJ6eb4HD3x5Fghfsb0dEQVsMDRcuXBl1Qn1rt83YZ7g3ogkuw2hauPQklZ082kaBu7kxY3zTMbqs6MdHlzZ+/U3uAzu8EqfGViJgGeFCIAUbmcaT9NLwSOoCjTgCpWzkPIHiWpYvie8TBQG1ZllaFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869058; c=relaxed/simple;
	bh=CEK0plCXA91yv8H4ANbOIxv1m5VgNFJPoZ/MatvIPu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMJn81E56zHaex8GnadbuYbJPNqCJteTC3LjMOEb1oc4yZrWJDqyyFip4JB7Bt+KF9NbX+qP/pUuUJ62iFaT+C7F0JXo+jZZXEUae6Tg69PHObOr2WOphLICsBnit3y9ZCKaaMT9ETZIwonNspqaGi2taO/8H0pVTPm3cLyxeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NOgiJmWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NOgiJmWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBCB1F000E9;
	Wed, 27 May 2026 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779869057;
	bh=mL5wpWyCBu/4Ut5vtPyH7R/tK4LwW/MfE1On0kmJn3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOgiJmWcwhkISUu2cEXlK76J0b3knq6f0vw8Hn49hiW0JI1SSD4E5P+WahzS0vqi/
	 wfaABVVTvza04IiwhUW8aUCpksk0SpdEUt5nL8695J6R1pgfyrjNmnV6PWE4mrRata
	 gPJrI3NhtCYiaK+UBYeefWvbqpAhF9BtSqWAp3nE=
Date: Wed, 27 May 2026 10:03:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: khtsai@google.com, sashal@kernel.org,
	Merlijn Wajer <merlijn@wizzup.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after
 gether_detach_gadget
Message-ID: <2026052726-vagrancy-lilac-bf72@gregkh>
References: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>

On Tue, May 26, 2026 at 08:56:15AM +0300, Ivaylo Dimitrov wrote:
> on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS gadget
> teardown.

Does this also happen on the latest 7.1-rc release?

> I suspect the reason is commit:
> 
>   usb: gadget: f_ncm: Fix net_device lifecycle with device_move

Do you have a proposed fix for this issue?

thanks,

greg k-h
