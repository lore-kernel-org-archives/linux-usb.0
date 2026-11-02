Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633966;
	b=aUsTvmBnz2GhXVSX+gGB9zzZGscUvfoS8RXKcSCVba13m7x8gGij9y6ZQZSOcU6PmY70
	 4Yh/r6jBRayAa5M5TfzBvKQ+i4ZNaBzU/KIs4q51Czb9waOrPZYpBY772lc5U5KHPu1Ce
	 PwEH1wv548HoDW523qPK3OGZ2BzNZCMWMIFepR1fsj1vVpb1mMyMilf2xDmi06xUAXUxg
	 LAbJBowKGpiorx1Ai6E8ptahWNk9ncUZB6H22fHplE1qbf4OeEuetuHPDNlmnJtNBY9au
	 s0yr2YMyjGjp8KwpucWPplZGcTQzmFHypU+5uOynbHIFUmUhXd1lwUmYDRXxUVV17Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=3z10U433DwI2NalH8ue402kAARNkdDeazFddhhDDLcY=;
	b=0idhnXTaYPgCq6S5je4/NBxWijvpSVwka/igQh69eTHUWsToyENl8AFJfiKO+z/IykeK
	 gm2xfGSqBi0KQWRYlBuB2w/+kDfZxcpWTE5X7ZtpFVm+wL4KS/2sQRwWDFWW2xreLtXRE
	 Am4IKBhM/dluLLh4aTaffKLFRu/CZzZDcvmHeMnYNTKwrI3JmWR5qP7BdSH8E2UWiHr1X
	 JOKhqlI0OAxLHi87k0/NOw7nnul+UlEefdXuXsmX87ND2NCsgsnko3qRs2lJlRxwDTSGw
	 jamyHWXS5JqKzFQqYGY3mbWcJozq+LQlHqcaNMbFcAfdJsLh7h7VvxerXzBU3WTBjKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF5Ua7cd;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40DB608C249;
	Mon,  2 Nov 2026 15:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40DB608C249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF5Ua7cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793633960; x=1825169960;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=3z10U433DwI2NalH8ue402kAARNkdDeazFddhhDDLcY=;
  b=iF5Ua7cdQ4sKfClCSfXAlo+xgL6xGpwqkxMXGPy9Yf+Y3srLoHW0qKqU
   tKtbBuM2SojXwMbyTDKYfgPq8zjPw1t0u4LxLfvB+R8WyKQiS+/dDRZEt
   d+Zj9g1VTzqUacQr3U8N3LVSZJ6vpFW/pe0s8m7YRzZsPi9dFR+1dNejU
   nmezOuxiTi2OdLCt0jhWWmkyE7L5OSJOj1XRNs9ODNjT+PRZPz+yrcocM
   EIy/LPr2KXNCf4hBa+XMX04wydLpIF4+wDYtwJjzzFh1iUhw3YMSPyjQQ
   CA9yGMLXN5vDzipxk7SYYCRgBayebbZMQyl1WArwMdJj9RS0Cr4WyIU4p
   g==;
X-CSE-ConnectionGUID: MzlM750dR1qVPiQUeowDHQ==
X-CSE-MsgGUID: eC69cufXSrekb0q7uULq9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2358064"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2358064"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:39:20 -0800
X-CSE-ConnectionGUID: +bmjxZgpR7SyKjSvrnwfeQ==
X-CSE-MsgGUID: sAZlDl/NR3+AD5q/97o2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="7987351"
Received: from aborzesz-mobl3.igk.intel.com ([10.237.140.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:39:18 -0800
Message-ID: <bc1ec916278d94116bd9b60e40b549612e3ff3a4.camel@linux.intel.com>
Subject: Re: [PATCH 0/3] net/9p: Add 9P transport over USB4STREAM
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: ericvh@kernel.org, lucho@ionkov.net, mika.westerberg@linux.intel.com, 
	andreas.noever@gmail.com, YehezkelShB@gmail.com, corbet@lwn.net, 
	linux-usb@vger.kernel.org, v9fs@lists.linux.dev, linux-doc@vger.kernel.org,
 	linux_oss@crudebyte.com
Date: Mon, 02 Nov 2026 16:39:15 +0100
In-Reply-To: <auKzZIyFW2CTci1b@codewreck.org>
References: <20260924162333.147033-1-alan.borzeszkowski@linux.intel.com>
			 <auKzZIyFW2CTci1b@codewreck.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

On Thu, 2026-10-29 at 11:45 +0900, Dominique Martinet wrote:
> Alan Borzeszkowski wrote on Thu, Sep 24, 2026 at 06:23:30PM +0200:
> > This series adds trans=3Dthunderbolt, a 9P transport over the
> > Thunderbolt/USB4 DMA tunnels exposed by the tbstream character
> > devices
> > (USB4STREAM). It's designed for simple host-to-host file sharing
> > over
> > single Thunderbolt/USB4 cable.
> >=20
> > Today the only practical way to use 9P over a USB4 link is trans=3Dfd
> > which, due to its design, cannot fully utilize USB4STREAM
> > capabilities.
> > Thunderbolt transport offers a simpler mount (no fd redirection
> > required),
> > busy-poll support and substantial throughput increase compared to
> > FD
> > transport.
> >=20
> > User may mount 9P export with following command:
> >=20
> > mount -t 9p -o trans=3Dthunderbolt,aname=3D<exported_remote>
> > /dev/tbstreamX /mnt
> >=20
> > Thunderbolt transport achieves a median 1.21x more throughput
> > compared
> > to FD transport under same conditions, and the advantage grows with
> > concurrency: 1.03-1.09x at 1-2 threads, 1.14-1.27x at 4, and 1.34-
> > 2.28x
> > at 8-16.
> >=20
> > As an example, 4K random reads, 4 worker threads. FD transport
> > achieves
> > ~53k IOPS, Thunderbolt transport ~66k (+24.7%). 4K random writes
> > follow:
> > FD ~28k IOPS, Thunderbolt ~33k (+19.4%).
>=20
> Thanks for the patches
>=20
> We've kept adding new transports for 9p lately but maintenance is
> becoming a burden so let me push back a bit: is the increased
> performance really worth it over trans=3Dfd ?

From the data I've collected, yes. trans=3Dthunderbolt is at worst on par
with trans=3Dfd and with increasing amount of threads, trans=3Dfd lags
behind.

Thunderbolt transport also offers busy-poll support, which boosts
performance significantly at low thread counts. It cannot be used by
trans=3Dfd due to its design around polling.

And regarding maintenance, this transport is simple and much smaller
than existing ones.

>=20
> If this could be used to bringup a system with a root filesystem like
> it
> was done for trans=3Dusbg I'd see the point, but otherwise the simpler
> usage could be addressed with a simple mount.9p helper, and at this
> point I'd consider usb4stream to be used for perhaps one-shot copy
> and
> not care too much about 4k random IOs (so less affected by latency
> if msize is large enough, and for a one-shot backup it doesn't matter
> too much if it takes 6 instead of 5 minutes)

In case of one-shot backup, I think my drag&drop scenario from cover-
letter fits it well. Assuming single thread copy, both transports
achieve similar results, but with busy-poll enabled, trans=3Dthunderbolt
cuts about 1/3rd of copy time:
Copy from 9P client to a server, using trans=3Dfd, takes 22m29s while
trans=3Dthunderbolt + busy-poll takes 14m50s (~1.5x faster).
Reverse direction, same improvement: reducing copy time from 41m07s to
26m56s. All done on default msize.

>=20
> If you can convince me this is worth it and can take care of the
> transport for the forseable future I'm not dead set to refuse this,
> but
> I can't say I'm convinced right now, especially as I can't even test
> this (I don't own two computers with working usb-c...)

I would be happy to maintain Thunderbolt transport.

>=20
> Thanks,
