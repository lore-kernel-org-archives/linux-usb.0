Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C9C145
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771570408; cv=none; b=V+WlnZiayNJBPEvlspEeJV1N9UFRha6qABX49Dop7Z/nvuK2QEAB1s+s74u4HXMC4HZN2ZXAULLw4iksmu+Aega2MLpifTNcLJrsiDCx0PXRamCtxt966Y6Z5hB6tpbrlZWzReaBESfFPa2nYfnD8WQBHRoguodrAkcgHQvu2fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771570408; c=relaxed/simple;
	bh=pWZ0b2iGDMKjg9Zq4mmm4/wBXh+gkYtORvwLlt/atFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qx+3CUzqCrLiuAGALtj+2tgjaNK7dOM3s6bq+sxbjpRhfxhfAv06IEEuGTqYmRkhV2An3Ba9spmiT69RZWgkXOeP9wnJO3ELMstoyaMUXJnmnK1DSnz6pi25rEwwsvqMzmr2hGmbVTggiEM2cbPTyKmvgj/Ob4SQ1QxKR73vx30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PoVboviT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PoVboviT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA8BC116C6;
	Fri, 20 Feb 2026 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771570408;
	bh=pWZ0b2iGDMKjg9Zq4mmm4/wBXh+gkYtORvwLlt/atFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoVboviTvppzZnqEMvnR3lgAk6AkLJNvDLhx2AAlKXnYgxDgUU8Vq23xJuJRBqxAh
	 4H2LE73p005KtXMFxhgG5FWPE6rCaB+iLyKHwFUkOU7cPFfyZMYJq/pvXm9UNUaPIH
	 hoDvwRrgFenWOX+e9WZygFxMqFYWbdgsNQl+sy78=
Date: Fri, 20 Feb 2026 07:53:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <2026022028-viable-audacious-411c@gregkh>
References: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
 <20260220063405.3623-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220063405.3623-1-nathan.c.rebello@gmail.com>

On Fri, Feb 20, 2026 at 01:34:04AM -0500, Nathan Rebello wrote:
> After.

I'm sorry, but I have no context here.  Remember, some of us get 1000+
emails a day, context matters :)

/me goes and digs...

> ucsi_connector_change() is only called via ucsi_notify_common(),
> which processes CCI interrupts from a bound device. The connector number
> comes from the CCI register (UCSI_CCI_CONNECTOR), a 7-bit field that
> can return 1-127, while the connector array is allocated based on
> num_connectors (typically 2-4). The same register is already validated
> for other fields in ucsi_init() (line 1840: "This is out of spec but
> happens in buggy FW").

Why not fix the buggy fw?  :)

Remember, Linux trusts hardware.  If people wish to change that model,
great, I'm all for that, and wack-a-mole fixes like this for after a
driver is bound to a device are nice to attempt, and clean up, but are
not really the solution.

That's why we have USBGuard, which prevents the driver from binding to
the device.  Make that policy decision in userspace, and then if you
trust the device, great, we trust the device to send us correct data.

And again, fix the hardware to not send invalid data.

thanks,

greg k-h
