Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6031F996;
	Tue, 18 Aug 2026 14:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787064503; cv=none; b=tiwlmfvk1LxFKV8pGnMULSNeG4uTk6NrBwNquy8HQW/AGrz8FB11rl7QquFta03YKAd3QUswr01XthKn9Hp81PncMdS/9j9TtEvkwXU/8kr7x8zboYH/0CnA2cooaK9lxc36+X4KvFtXmDxRNpKvBIt7KUnNFht/VRXDwXwiVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787064503; c=relaxed/simple;
	bh=UgAKnQ37nmwoCZUEO7wTROkAqPTuEOnUJSnrNmaDBdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+z0CCoLIogwFP62Ku5SFQ2hJ5tqj2Ao41xHcMZO2iRPe+7NTPMh5OZSqgBToIttBhDcvXm1mX2d2HFOYFL9F1R0FjjFfI2mizZH9AL35smWufQbx+KMFCn4ESw4+egjPfWaQnF8zOLVWkVCTaRnE+ExqafadXe40QvnBgDo+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzhNdYJO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzhNdYJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55901F000E9;
	Tue, 18 Aug 2026 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787064501;
	bh=UgAKnQ37nmwoCZUEO7wTROkAqPTuEOnUJSnrNmaDBdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HzhNdYJOv2Arg6iqpjd95K/sz5El/93G8VBtXkEDruxFd7tbT1i8EdAV2jEXph9Ct
	 WexiRfxE96g9kvP5swyFTlQVogqdFdtMjqvT0IjN3j4Kra/mw/SFqTgCWT3THIy6Vf
	 r/x6myt8GADpLSx1nkdeuVdabijdhzBItYIlX9zAUho17dIJSjOZhHob90Wkf5vMgr
	 sRsGDfspvGz/TIuVzCFVAyCg++TCWUwN8KnuVfEC3tLAyRFSZP4SGac4uWa8fOV0vr
	 rWRIuPp2dxibVLnq1aCh3eVZmOv2F5t7kE5BPwcNM7fM+wxPJUtWUgbxrtUEgJyWDL
	 CLkDN8vHstg0g==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwL6x-00000000tMi-3IMf;
	Tue, 18 Aug 2026 16:48:19 +0200
Date: Tue, 18 Aug 2026 16:48:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Juergen Stuber <starblue@users.sourceforge.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: legousbtower: clear interface data on probe failure
 and disconnect
Message-ID: <aoRws4FhriSazEXG@hovoldconsulting.com>
References: <tencent_30752557FD78912E64BC2E901338A0D0EF06@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_30752557FD78912E64BC2E901338A0D0EF06@qq.com>

On Tue, Aug 18, 2026 at 04:41:28PM +0400, Jiawen Liu wrote:
> From: jiawen <1298662399@qq.com>

Your full name is needed here and below.

> In tower_probe(), usb_set_intfdata() is called before
> usb_register_dev(). If registration fails, the error path calls
> tower_delete() which frees the device, but the interface data still
> points to the freed memory. A subsequent disconnect would dereference
> stale data.

This makes no sense as disconnect() is not called if probe() fails.

> Clear the interface data before freeing the device on the registration
> failure path. Similarly, tower_disconnect() retrieves the interface data
> but never clears it before possibly calling tower_delete(). Clear the
> interface data before the possible tower_delete() call to avoid leaving
> stale interface data after disconnect.

That's not needed either as disconnect() will not free the driver data
until after deregistering the class device (which takes care of any
racing call to open() which accesses the driver data).

> Signed-off-by: jiawen <1298662399@qq.com>

Johan
