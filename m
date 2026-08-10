Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B1E366DD3;
	Mon, 10 Aug 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362307; cv=none; b=Z+jverJDZl16+h20nklVTB6haO8AO7l9J81vg6ciGFGl9WdPMI+K+eVcrLDSSqoIW2452qivlvLfPPfX+GM31x+GwETkz4Rvk6IxjuICuxWIQoGr7DXzCbWZXIVAKUMXC/AB6cBI1TaoFTu2+wtLP14HmlDO0olE9E/3inY5Y3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362307; c=relaxed/simple;
	bh=aCxVOAs8OztsOhrfHVX8vKZvqlbECd7LnbMDY8Bhg0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+qEwSjnMajkOXo2hkh8SU44SBjTy6Toy3bw9lnV3P3soc+KZz7aLAXMz5HUMfiiUVszBEvnBS1DNITBA0w2p3oIpHXurEiE4Eea56ksLzxCRtgHPxoAbAYFUuSFPzmYjfzEJ+HxRPLuR78omviUUmUNMl5gDn02N0KAP6suocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fSGxLyn0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fSGxLyn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835341F000E9;
	Mon, 10 Aug 2026 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786362305;
	bh=AF0PGB3FWIcOFFuVknp7OizKXV5A9/FlRyocVu903tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSGxLyn08K0nr4R/0tpgAwa5K0TAjzoam8WLzQ9aUKt3/PRy1gHu6DqTYfd6a0PX1
	 7HR/Xb+gq/Bf28Ms5eck43jQN8cuGiA7W5QV/BGMDTM0tlRARZD5X7lsC7TfgixG2o
	 yxMNCGoDAZFcEb3rSwTmzCDE8PaZNOi3mCT7NCH0=
Date: Mon, 10 Aug 2026 13:43:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, leStoppe <lestoppe@gmail.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking
 VDS1022
Message-ID: <2026081002-helium-geologic-bb5a@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810091322.2201740-1-huangwei@kylinos.cn>

On Mon, Aug 10, 2026 at 05:13:22PM +0800, Huang Wei wrote:
> Commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
> oscilloscope support") added a USB_DEVICE() match on VID:PID
> 0x5345:0x1234. OWON uses this same VID:PID across multiple device
> families (HDS, VDS, SDS, PDS), so the overly broad match causes the
> owon driver to also bind to devices like the VDS1022, which previously
> worked fine with the generic usbserial driver.

Where is the "owon driver" located at?  Is it just a userspace program
or a real kernel driver?

thanks,

greg k-h
