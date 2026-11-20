Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161815;
	b=wQe1ihVBE3TmxjU1Yu3FdpGMpEgk6y/e10ojq0IxhTkv/TMaOwyxGNJWu9dIaYU3TLzz
	 jfT5P241BsTlYuVPcUQYJFt8mufcrZI+F5cq2uKjlSDiMkrWICD0E+bAeBP9vADW/wVWv
	 5OPBVAKPaBhfJjEHT7Tqed1GnN8WqW1tGRkKwGISaYyeNfgYo9zo5yhs2wrHRnpfIO2YJ
	 24gaIiBZCQkB6K0mDZMYpmolS533s8e3YcZ3ytAL8Djd9o5nhQk6qE0hxpz/nMSGbsxoa
	 YpmL/6aGfwA4tUyq6MePk49LOcu+xCfQdQAF1h8Dl6eL354xcHXzVpGutG+A73nvmlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kXGgl14AJdaegP8J/8I9WGQCY+bZ7zO/miEb097+IeQ=;
	b=sQNsgJgu4pTOpKCpNJRydvNqVVDqsdkUXpnkwg32CqqZpXqaxrBlvOoLNJQ9xW3b9WUD
	 hWhGbz11TKVxMB5uc/6wxrMMfmymhkLg89ak1HAmdgKWvpW9AxkgU8k8XzqDZDs6fe1cm
	 WN+8TZu0gFWHH9/uNJ/4GesXhvaP5xJgS5d35O2pdSK0MTMPq1rVbKv34qzp+MqS+osQl
	 csHUpUEH/wYVEsHLKJtoEauXnGK2CkWDqz0JEnrIlyi+gnOdWqFaf1dlrH58Bx6OsJ9QN
	 ev4FzSsvGHfudrbBtUsu5tBrGKu6kKDjAqC2yIy3Jy4a6t1adEkaHQMh5/4SvhffdHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0YG7CNEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8DA606A325;
	Fri, 20 Nov 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0YG7CNEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C461F000CA;
	Fri, 20 Nov 2026 08:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795161814;
	bh=kXGgl14AJdaegP8J/8I9WGQCY+bZ7zO/miEb097+IeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0YG7CNEwAIykmjk5oplimQUWKsu4jit7nf+waRep/pRGE0RCYBqTLDDArH6QxGtHF
	 Wfs8EqxxWIsRDssv8JjjaA5LEmeOQTzrjgE9ftUZgnHiYvOjLa4+pSnH6MQNfyIRyc
	 Eu4qZ0k16AL5RzCJvwflL1mkf90ArKJvezDeDrX4=
Date: Fri, 20 Nov 2026 09:03:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: usbfs: clamp the copied length to
 transfer_buffer_length
Message-ID: <2026112017-gala-enchanted-bf40@gregkh>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.8187049654053191605@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179328314074.648427.8187049654053191605@gmail.com>

On Thu, Oct 29, 2026 at 07:12:20AM -0700, Cheng Yongkang wrote:
> copy_urb_data_to_user() uses urb->actual_length as the number of bytes to
> copy to userspace for non-isochronous URBs.  The usbfs contract is that a
> driver must not report more data than the transfer buffer holds, but
> usbfs cannot rely on every HCD or device implementation to honor it; a
> malicious usbip peer can already set actual_length beyond
> transfer_buffer_length and trigger an out-of-bounds read:

No, every HCD must honor this.

thanks,

greg k-h
