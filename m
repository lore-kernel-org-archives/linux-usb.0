Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7582866;
	Sun, 15 Mar 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773568073; cv=none; b=T3gllsOaGYvO/P1EZGho9F+9mo5B7dGOcZGfeDdzcmYLwkEzsRMVOoNEPTMz2RL6+Ld5eXH5LgVxAoYDH7qB7dfWkFaNg9toFnVrDlQi48dIaNBqpMvwoMphFnqT1V+FjoSAnUbgFnTFNrA7zKcsdO8c2O2K1eqVsQ4scjX6gBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773568073; c=relaxed/simple;
	bh=04lsT4fyd9yoQX+rXmLl3juJluIw2jRrYDcJ0QC258o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk7Z0ACdI6QJiUODh5h2BwUTM2c2SzCf+9dbl5SsCRF9Q/l/wr37aOkgXOBpUI4Zq9qVTP3uEeRHnTGgUFpkqzyiyjmfFazlErqMVjUpVWAZZ86ND3+bHVjNQzv0m/MyAnkO/aBA0bYide7WmM+Wqh5YMPsZS3TGiUSxhh3Vz60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D4T5bhM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D4T5bhM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E938CC4CEF7;
	Sun, 15 Mar 2026 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773568073;
	bh=04lsT4fyd9yoQX+rXmLl3juJluIw2jRrYDcJ0QC258o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4T5bhM3I2qgIT6WexwbEnYbXOypd0gYw4La6+83ajI77v5kPBidVmLSEWL7xkHsl
	 C4fEGL8+tkSrghYofptweAH8/DY5TL9T7pJZw16eycNDY7vfRGeFgeXu7X59uuvf4Q
	 Sns6syvpuQ24xpSGnVWTE8Mgrv88TufHcoutxz/g=
Date: Sun, 15 Mar 2026 10:47:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
Message-ID: <2026031500-speak-lying-2626@gregkh>
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
 <2026031209-shawl-unshackle-f4eb@gregkh>
 <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>

On Sun, Mar 15, 2026 at 10:40:48AM +0100, Bence Csókás wrote:
> > Also, how was this tested?
> 
> I just compiled and booted it on my Arch box (with the original vendor
> config), an AthlonII X2 PC. I'm now typing this mail on a USB keyboard and
> mouse under Plasma, running this kernel :) I also plugged in a pendrive,
> mounted it, `ls`'d the mount, unmounted, unplugged, and did this 2 more
> times.
> 
> I realize I should probably put this info under the dashes. I'll prepare a
> v2.

Try looking at the USB strings in the device, as that's the path here
that is exercised.  Just using the device doesn't actually grab them
from the descriptor table.

And sorry for the extra review, I'm a bit picky about this function, it
was my first contribution to Linux way back in 1999 or so, and happen to
know too much about USB descriptor strings :)

thanks,

greg k-h
