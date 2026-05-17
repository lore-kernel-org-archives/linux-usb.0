Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B23405C25
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778980547; cv=none; b=QjCQFrvUFOl7gnu7fA+aQ0gM8T8zqlDKh0ibFerFsQzYcwaO9KWuVtE6lFt2bgzsQO6yTRpwPQhvJrEq6dwHlXgw27qd+ry7tcOBcw2P4V0rno5+5YFFzJtV4aC1BaVBY0svu8zH0cgRttJTz1LeF1hDOYeI+IwSmUJFrPlnfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778980547; c=relaxed/simple;
	bh=Msxny4dERMUew+DiiLX66Dw/7a8VMLkTGHAFTEmJYYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcDulC7MKKgONjhFY+VsZn0r+DWSooiKRPb39a28zrfBRUKOS0Bzfnkt3pc2lPyQo7oYyySasHx54FgnozeIphTLf9LFFw7ZSt4z7S6lNBuGq/B3NocpGsxiDdyTzsz6qwz11v9m2qzfh/fj6WbEOCPk8U5upKzgnolecEZVL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DHholxwS; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DHholxwS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8c7154725easo17577156d6.0
        for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 18:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778980545; x=1779585345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BVxoUH0e1ggwyAs6J1dstPEWmubAQqOWhQQqMFjFtQ=;
        b=DHholxwS4qGpX0U1I1I2tP93XVsGvWU5xHd6ST+irdWl5hRV32lZdZIYLH5XrAwz72
         sSZouCQfjp76ZRUa417ES42riUqEcQXGQHOTxw81L7GH7SQs8ndgDmHpsXy7vmAJXAPY
         QfejJRHPS0qCO+QiXYx6Q6qSs1AKZxq+uCXmlHaEON+d8VQbvuu6Z/5gNe/prqMCkqYV
         OejUM1rn0WFhDdVzmUNS70RB5vndmEfOmPYubk2febDm26IvgM+VdBwkHU0+4KMHZ1O3
         6LHmrNvNNANkbFjo1uvES2YHHb15fDLuUeDMzaEcb3vgr87GJcm+mtj72hWjscNdOgvO
         BJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778980545; x=1779585345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BVxoUH0e1ggwyAs6J1dstPEWmubAQqOWhQQqMFjFtQ=;
        b=kKiO4ygzZQJFWS+EQsuRxbZV4NpAgNx9Uk1I/N/d1o8Cr/imIKvfcYx4GXIMzq1Hmd
         y/24W8UxL7nMxkJGr9dOH7kuGGNYUUSTZFD6L4qNcb+vdeDzk1caIvvstQYVHJt7xYW7
         ya+bAVMzxtw7MsAqVE5jhZCxTTeHhQPt6M94uAWQn6776RGzw6HjZupyseqAKZ4gEmtz
         f5G9UygoKrW02uViN9QbJc0yO58WU2M0tb5RX6Kb/96BNfbPvqCxdXrG612gLG1xIJwF
         h98r9DIHjxihIjYBUqgQYScOwRkBc7XE67ji96UwDvof9JBVfxtT+D+rD6nO0dMbSsEZ
         zFaw==
X-Forwarded-Encrypted: i=1; AFNElJ9YKH3osVVE6YuQHD9ddbDhW9Z9v9HgMn4Aoa4zV7QUVTZyhISb0/Oe0nEWs2pIx9ULmjf2/T93aoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zly6ND+tWaN+xGCzGcHyo/k8QxbmoW9GqaZse+s/4xFgU+Ag
	xQBJJHLuZb2tAkHbo9IeatiK4fl/7E0z5ZJtgCVe+tuRtnjWXMw5sFW3dZXeJCB0ug==
X-Gm-Gg: Acq92OGOlnLssJYu3vHlB6d1FaUvLoJ+dCEUnJlgdZFC/XFkQbK3wv9MWO5x4d/SSkH
	/Z+NvybBSNBPMqghOb3TNXMQc44IdYY5wnBEhcUBgFNT48StQghm35I/qU39mEivbshcXWt7dl+
	dmryLIYJr4jB0tUlJyCPXS4WowDgQOzcLmnnAXpfONANHh/rTnabU2bbWBcUTGX37MACiDlyjam
	WeV2UaDa5bKlOx/xxJw0AFaVOwOS1NMlwFZkN7Qp5BZSuy58SYTd5Jj2mR/+uYRf1F1KD3cS5Y3
	/pRVgAffTsD9O3l48ewuXc8dxh0fjOb14fAR8xEMqeL9VrIIlVdnXTSVXEAASwKGK3Zm6WNcEFi
	oGh4+I/Mti9hyQd+XNPrCedDM0GbdVROJAbF1BlG4jUi/dYzXfSbMr8rkEyO4R67LC6Zvv2dz/D
	Io1lOkOjA9dV7YvlE5zXQxLKnZLEmg/OOOyNre+y7XIiCZT48rP27mSw==
X-Received: by 2002:a05:6214:5182:b0:8ca:1eb5:eaa3 with SMTP id 6a1803df08f44-8ca1eb5edb6mr98736766d6.27.1778980544751;
        Sat, 16 May 2026 18:15:44 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca3618fe0bsm4842086d6.25.2026.05.16.18.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 18:15:44 -0700 (PDT)
Date: Sat, 16 May 2026 21:15:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: host: max3421: Fix shift-out-of-bounds in
 max3421_hub_control()
Message-ID: <772a57d4-039e-40f6-9b3e-1423a6e014e9@rowland.harvard.edu>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
 <20260517000731.1869133-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517000731.1869133-2-eeodqql09@gmail.com>

On Sat, May 16, 2026 at 08:07:31PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `max3421_hub_control()` function handles USB hub class requests
> to the virtual root hub. In the `default` branches of both the
> `ClearPortFeature` and `SetPortFeature` switch statements, it modifies
> `max3421_hcd->port_status` by left shifting 1 by the request's `value`
> parameter. However, it does not validate whether this shift will exceed
> the width of `port_status`.
> 
> So if a malicious userspace task with access to the root hub via
> /dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
> greater than or equal to 32, the left shift operation invokes
> shift-out-of-bounds undefined behavior. This results in arbitrary
> bit corruption of `port_status`, including the normally-immutable
> change bits, which can bypass internal state checks and confuse the
> hub status.
> 
> Fix this by rejecting requests whose `value` exceeds the shift width
> before performing the shift.

Another problem is that the root hub is supposed to reject requests to 
clear or set a feature for a non-existent port.  Just as in the 
GetPortStatus case, the ClearPortFeature and SetPortFeature cases should 
check for index != 1.

Alan Stern
