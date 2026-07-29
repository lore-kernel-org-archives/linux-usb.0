Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC44C9564
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785336490; cv=none; b=cY20UthzRPuFk7AOdyr4roZp7ME78rKJJxYnRhL/py/liiCjN+5VJ2cGdsPz5Um5iha5odak5LeaCoqAJrpEEC7qrLByDBX80RQVfSuR1mF0V2vqiInqN50HxonYvoLrCdcJL/s1a/fIr3NR5z5Tbf2/jW9RUI6wQBbwfD/+EPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785336490; c=relaxed/simple;
	bh=2llLaDOXMPRQmM/XqalDtJqo9YL1UTfJV6p96HHE014=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMNAIiZL27rVEmJOMEhBnzU91aPZfDXsZ2W7xjeUsvkxX1irM/1IhZperrDAQRXy078hL0kXNoG4fxhpA6Dy30KPGrStsNHwiYJGkIvQgNW4/3nnnPl/C//w63jKFIgTmTFvohihYTAfVFesT/GGj/ry1hvS3glolx8tlc/53Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 2089A36B;
	Wed, 29 Jul 2026 16:47:58 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1D435602E834; Wed, 29 Jul 2026 16:47:58 +0200 (CEST)
Date: Wed, 29 Jul 2026 16:47:58 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 5/5] thunderbolt: stream: Add support for busy polling
Message-ID: <amoSnhr833oztrqK@wunner.de>
References: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
 <20260728115141.2585464-6-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728115141.2585464-6-mika.westerberg@linux.intel.com>

On Tue, Jul 28, 2026 at 01:51:41PM +0200, Mika Westerberg wrote:
> Using interrupts and scheduling workers increase latency so latency
> critical applications may want to avoid that. Make this possible in
> USB4STREAM by adding a new ConfigFS attribute: busy_poll that, when
> activated switches the rings to polling mode. The cost for lower latency
> is that this burns more CPU cycles and things like poll(2) cannot be
> used.

Hm, would it be possible to auto-detect whether polling is more performant
for the current workload and automatically enable and disable it?
E.g. by counting the number of interrupts in a given interval and
enabling/disabling polling based on a high water mark / low water mark?
Those marks could then be finetuned from user space, but moving in and
out of polling automatically would be more desirable I think.  Forcing
polling could be achieved by setting the water marks to a special value,
e.g. 0 or UINT_MAX.

Thanks,

Lukas
