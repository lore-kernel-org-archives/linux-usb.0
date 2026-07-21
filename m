Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2985314B96;
	Tue, 21 Jul 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638322; cv=none; b=i2n/e8L3c9z08SIEGC6+aV9cIK4cf3kxdh+GZDgqe1evrYLJnMMM4PoF4dvp1vfqfmgWnGnfXhsK0uH8Z+EboO+0mBRJZ4s1Tr3CW2FdE4JwvEdlc2bsNXehS3FObx0nBRoYwOCWiKBqhBDsJl804Fn6+IT95O06cGZ0g8H9Ksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638322; c=relaxed/simple;
	bh=/WBXsmxPEQhihXBkNjWyKrr/NDVq9B8H92LownLm6VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJjtbf/5lQFoB14Vb1b+ydgbU3pCs42Oia4bGtavvfqfXpDM4cEDzVXMKqGUu1zj/s3v1zkZYuv6kUxNlN91yVMS4c53sqzJdh3Tcj8QGeFP/OZ10vpZ4ros7r2Uoh7oXXzgucBU15IWLcK/jb+8RsMgOwrJ4nF6EzL1cieFphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezeC6XfM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezeC6XfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8FD1F000E9;
	Tue, 21 Jul 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784638321;
	bh=E3KLFyHSkEcnBiEnanNxln+JZM5R+9tjKkKtlFE6K60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ezeC6XfMxj9AfI+7UVkG5wIEyTPuVm/GoVDPHZTOaMwZIqueoeVKQj62ZkcbTu1tV
	 H2lKIbmOoAXvFyW5SJNWeeqbj9YuLEY/F0OUqF5wol3YVgb8EepxTGGUTBNt5xyfWq
	 0v5X7l/vy1GhR99MqwDsSFWQXUqK4kq++PEMg5CDIM15LorK/sQx5evZAqflR8XMpt
	 wDj0Mo6Ra05/4HmTan6mi29bs07iSpMs6wnXmeY3/615IjCB1wtxEf/TpktQfgPRTr
	 xFrObL2dqI52H3a5z8e1IuzIEmUiKzqUuuy27IRINVCXORrN/NUv/rJ0zFFOtra0PQ
	 3E4YuZCTjC3Rg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wm9x0-000000090Np-3dS2;
	Tue, 21 Jul 2026 14:51:58 +0200
Date: Tue, 21 Jul 2026 14:51:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add TDTECH MT5710-CN
Message-ID: <al9rbrmvNNbp0Ebt@hovoldconsulting.com>
References: <al4tjkfe3b9C9xSQ@hovoldconsulting.com>
 <20260721103000.3721570-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721103000.3721570-1-amadeus@jmu.edu.cn>

On Tue, Jul 21, 2026 at 06:30:00PM +0800, Chukun Pan wrote:

> It is based on the Huawei HiSilicon Balong chip.

Thanks. I'll add that to commit message.

> > Do all interfaces need (and accept) the
> > USB_CDC_REQ_SET_CONTROL_LINE_STATE request sent on open
> > (unless suppressed with NCTRL())?
> 
> Sorry, I don't know. Is there any way to verify this?

There are some device that time out when sending that request on open()
and then you end up with a five second delay. That's likely not the case
here and we don't currently log any errors if the device just rejects
these calls.

If you have the time it would be interesting to know what that
usb_control_msg() in usb_wwan_send_setup() returns for each of the
ports. Just add a dev_info() in there and log it.

But either way, we already have other Huawei devices in the option
driver using similar configurations so I'll just go ahead and merge your
patch.

Johan
