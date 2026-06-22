Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7435B645;
	Mon, 22 Jun 2026 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118280; cv=none; b=NuxyVcA1nFta45Lrksj4IvEAeh7E3ykfe2AJ+dQPG/ctqtpaeigFPJF0k99Qgs1vuOh4E/IJTIdByxeWe+mXF7BIc9h6ucI3wiFxVbHSwwxHnGed9JVp0dAGmq+iJPH+SUmh+T/LHBGoc8SgEKUZmn26h9P/kWgIGvrzo58U7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118280; c=relaxed/simple;
	bh=3WrnqAfpmKmqmuNO71EP/nyNWXZirfBdeHLEbKZ1Bi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSbIMovpwXYw7dNU0gDaNN5hfG94WcD2ynZrfruG/wkNuUFyZHD0LbBiqueFqpEvOYHgPA90OG1TqPT9eu6Ib7/F7vtfXx6XEnQoM8UMAuIxKmc41+XD1dazsCgxSMtf4LFBu1DKm0rQw0ZX4WuRfYphBAAylocxkHMN+l7Zz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I9ngzNA/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I9ngzNA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D85C1F000E9;
	Mon, 22 Jun 2026 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782118278;
	bh=BHI91WDNMOTEgqoEYT7FJmg0BdWX8kfroVVe4bMwFXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I9ngzNA/IvtfNKLedasmQmeHZWN0wbjUv3cZnukA7xwKiujPfjFqzHR5dux8cSL/d
	 +DiZfeL5WTQZL1Ixhv/CQMPMCkh6qyeq1fFsl5OqzXs5CCowqHVUO7wWb1l1hFXRNE
	 VosnnpwNwOYQfTRI7kkvD2/E+49qZqSqC5YWHC3o=
Date: Mon, 22 Jun 2026 10:51:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: Re: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Message-ID: <2026062241-rearrange-husked-5117@gregkh>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>

On Mon, Jun 22, 2026 at 03:38:34PM +0800, Chinna Mopurigari Naveen Kumar Reddy wrote:
> +module_param(urb_defer_timer_ns, ulong, 0644);
> +MODULE_PARM_DESC(urb_defer_timer_ns,
> +		 "Inter-batch defer between read-URB resubmissions, in nanoseconds. 0 (default) disables the defer. Max 100000000 = 100 ms.");

This is not the 1990's, module parameters should not be used anymore as
they are not scalable or configurable or very well handled at all.

Please use a better abi if you really need this, BUT, I feel this is
totally the wrong place to do this.  You are assuming a single driver is
the source of the problem, when the real problem is the host controller
driver for this USB host.  Are you going to go and make this type of
change to every individual USB driver instead to paper over the
broken-ness of that USB host controller?

Why not just fix this at the root of the problem, that way you don't
have to modify all individual drivers at all?

thanks,

greg k-h
