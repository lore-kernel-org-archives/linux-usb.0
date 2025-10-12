Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66032AD32
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760249258; cv=none; b=HnhRwVi6lnhCIh24HrcJfG5etgSkgmzYDhobPjJ/h+rV+TSZUcYoChc7V3X+0BVSfmKo/1/QmC8wxggiCSNUcGKz4NXTBoGXCZTucLmV4w6RYSwDmfjJXX2X/LsrzLlL7gmwzBpJGcIPN3IdiWkuCQ/e2i0sJ0iMl7PPSFTmZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760249258; c=relaxed/simple;
	bh=yqi39mHMtwO4L+BcrOv6Hon8yY7DGmHMmbg6PXrrAbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOdXQ74duehsMTk7pyDOAA2JhqWgNn0f6DkGHrjd4rAkgIRBgrXiKiJQOt01FdrPEkDMOD3197l5/SsL+a+2AiR54PITnPXt3XxrBTvKBuNVeedG5PvljB/V+ZJEEECJNLJOw4WZYqRqpq88PmmLkbsexjmK0d8M8p8VXU467kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JYWHLLBL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JYWHLLBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB39C4CEE7;
	Sun, 12 Oct 2025 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760249258;
	bh=yqi39mHMtwO4L+BcrOv6Hon8yY7DGmHMmbg6PXrrAbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYWHLLBL8/tsADZdd55IkkhJ/HXTdBgh4XDeawgKo3igLEGj8rz5lnO920WcO56xo
	 wphS5pS4T7WMYGKa+AVKtWszA/cZ/o8RXqk8CajB71f+WMqZQftCmn0ZjMEOFFEDDU
	 zpSv+owwBGBzEEJudZ8m8AaulpnPJQzsA7weolyg=
Date: Sun, 12 Oct 2025 08:07:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-usb@vger.kernel.org, oneukum@suse.com,
	Johan Hovold <johan@kernel.org>, vojtech@suse.cz
Subject: Re: ttyACM versus ttyUSB
Message-ID: <2025101243-ongoing-truce-3aa5@gregkh>
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>

On Sat, Oct 11, 2025 at 11:00:00PM -0600, Alex Henrie wrote:
> Dear kernel developers,
> 
> I am very curious and I haven't been able to find a definitive answer
> anywhere: Why is the cdc-acm driver separate from the general
> usbserial driver? There are lots of drivers that use usbserial, each
> with its own unique protocol. What makes ACM so special that it needs
> to be separated out as /dev/ttyACM* instead of going with everything
> else in /dev/ttyUSB*?
> 
> I can think of several possible reasons, but I'd really like to know
> what reasons matter to the kernel architects/maintainers.

cdc-acm implements the USB specification for that protocol, which is
defined by the USB group.  All of the usb-serial drivers do NOT follow
that protocol and use their own vendor-specific ways of talking to the
device.

Hope this helps,

greg k-h
