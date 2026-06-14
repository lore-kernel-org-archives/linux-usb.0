Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C830E0D4;
	Sun, 14 Jun 2026 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781458418; cv=none; b=WhblvrlL02gZjVw25K08OfCJxqdMB8S+qLM1zA4tfo4mYZQuIV1qbJjzS/+6gphrnzftBIRZuBrWi82utLvqAbVecFHttwVclfkFwWv6yzcETcxoiVtwzHCiUyKsFM3LHaVUOM3KxcURXsBaV57i6AKdqYRgob1XC9i9t2hJ4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781458418; c=relaxed/simple;
	bh=Usklhn653q4m/Se20lSOzIPZ20ZE6C+GkfAbPYz7lo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGQu3ViQZP12MwOE4/tIovxmM4nwHcBEIEs8dct1p43+oswRNFS4qvon7QBsKM4hOK3ia5DxXut+ykHvb5iTCwbNCeMWrh1kk+Ivzm9w9aIVyc+JCnUEunSDNHtFSYdc/CgPvajcdRjUX88Be8WiayM7WUjjfim+JsAjNrtbNvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WBJiaMl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WBJiaMl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A391F000E9;
	Sun, 14 Jun 2026 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781458416;
	bh=PJpbpsB19NKJJxXOhVQ3b4i/gA1Iu3bh+NTFTFsa/XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBJiaMl5mCY+mI6wnfLQ0Qq4M6JEpRgk5cqS4q+7bL7IkRkWIgpeHYaDE2CN/ZJ7K
	 OzxG0+1m4DMYPaGkSDpXs0wBlIIvc3uXtS//kuYObJnUbjGFed3JeXh9xRrPz8nPG5
	 dI0frPj9QG6t81RDNcTExhN9Bk91OWIROrfg9TUY=
Date: Sun, 14 Jun 2026 19:32:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shuangpeng <shuangpeng.kernel@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-out-of-bounds in select_usb_power_delivery_show
Message-ID: <2026061454-pep-avenging-9656@gregkh>
References: <178144969600.60470.6584137935143789620@gmail.com>
 <2026061444-flattered-rewrap-3d96@gregkh>
 <D027A719-E252-4A9B-80DE-E6758D810DA5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D027A719-E252-4A9B-80DE-E6758D810DA5@gmail.com>

On Sun, Jun 14, 2026 at 01:28:36PM -0400, Shuangpeng wrote:
> 
> 
> > On Jun 14, 2026, at 12:37, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Sun, Jun 14, 2026 at 11:22:45AM -0400, Shuangpeng Bai wrote:
> >> Hi Kernel Maintainers,
> >> 
> >> I hit the following report while testing current upstream kernel:
> >> 
> >> KASAN: slab-out-of-bounds in select_usb_power_delivery_show
> >> 
> >> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
> > 
> > What about the latest tree?
> 
> I retested it on the latest Linus tree:
> 
> 424280953322cf66314f3ba5e2d1ef345f21c770
> 
> The same bug still reproduces there.
> 
> >> 
> >> The reproducer and .config files are here.
> >> https://gist.github.com/shuangpengbai/79c08ada299b3ae37b7a0af292ca413f
> >> 
> >> I'm happy to test debug patches or provide additional information.
> >> 
> >> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> >> 
> >> [  102.318332] BUG: KASAN: slab-out-of-bounds in select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
> >> [  102.319225] Read of size 8 at addr ffff888117d2f2c0 by task cat/8378
> >> [  102.319943] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > 
> > Does this happen on real hardware, or just on emulated hardware?
> 
> I have only reproduced it in QEMU so far, not on real hardware.
> The repro uses QEMU to emulate the hardware environment needed to load the
> FUSB302/TCPM driver path. I have not tested whether the same issue happens on
> physical hardware.
> 
> Please let me know if any additional information would be helpful.

If you could test on real hardware, that would be best.  How do we know
that qemu is actually correct?  :)

thanks,

greg k-h
