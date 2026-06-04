Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65533CF672;
	Thu,  4 Jun 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555619; cv=none; b=IZbFs5fsW/wCkr+PWTYO2/ohc4S0i+hUOInvsb1gjHXtXJVq7TUVd5b4rOesvwyhSAhLF6E1k1kE+1d8mzLS7IaSzpbe0g0qFPqsV4xzTFh6edFVH0p875bSeGPfQRSQkHP1N8DYZxF5FDu662gkuQBYy+VJZA0dRjfyj4tmiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555619; c=relaxed/simple;
	bh=Wy6xJX3ldMfWKBn4+CC1kygwv0cMZ1H22cRmN9DD+S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgk3THhxZ1c9l4QulvHtrTYLnnnMVS4HO6FJe/TBpKtTAt0b2C8hy6dlHeMFgNM2jzEMOSamV7qfEbQtzwDfeTb6qXVSc0rHGzQc+UBUqa+FimsNo4hPHRw/fyefzMT1E5uX7e1kQtUBHe/Lno6KB7k0cLT3y9TtSKC0MUZYqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=SF8ZhUDf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WKAqUAa2; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="SF8ZhUDf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WKAqUAa2"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 86983140004E;
	Thu,  4 Jun 2026 02:46:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 04 Jun 2026 02:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1780555614; x=1780642014; bh=Hg5mhNt4rr
	ptcFklbzm1/wVJIH4DA4WOo8269xPArfY=; b=SF8ZhUDfKozty12Y6B0TWzGRlZ
	I4wy2yoyxawqXm8xwL7wlJHDVJlMq7QAsFhg41r6hwHzQ4XaoMapGv2Hfiq+sfAd
	VYXG9KbwfdYBu79wxIlVZXer5lJNnv1IlGQ8oArx5YAGAL9iV4Jxmkra/rh0Tfnb
	Nof5CjKXsWqX8G7+g5N5/Y9wXr3mXfDiSaHMzoWo7YVpxg/rJ8VolbcytJRPXK4F
	kVMap2OlmgeGs+M8YskPRAWf+181lezBFOvCOwMrwQqznTk2/dwAM3RZzYGSF59c
	xiomDIWi1V2L5iui28eRsDIX9YQcnPNXOwjTGu9YbZnmzsbrtOtLpYI0D9ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780555614; x=1780642014; bh=Hg5mhNt4rrptcFklbzm1/wVJIH4DA4WOo82
	69xPArfY=; b=WKAqUAa2ZFtbZZGTExO+316T9GCU+u3jo2+cO5wIuAFXQ+YB66A
	pVTxNZjRY2IX0M5sfmSdX60URtqBGbKq9szOR85JynEbfjOLAN40NOFvel8wEu/7
	K7njPHrSkin7v4Q3dNcfNeQHQGXjyqwwmYvPwSNyWg3jcdsoZr7KSgdTIFsBxPUw
	nH73CBTrfI7g3NkV+OS2bEAmSxFBFzMq3YXJWYjDJHQuSYP4+O6xOLMrwJRWFi2L
	kUU2dwes5LHaqT74VpzQDRdioftI0z2VnVmxsVwD+l7lH9b3w/IHw+ERsylywIvu
	BmBJEoZ9x/45kJrLXE7PeUgFGIZmyIuh3BQ==
X-ME-Sender: <xms:Xh8hagEGtsv_oJuI0OkwaAN6nA-g0FkjEkT0ID3ve0S3sjIpEFs98g>
    <xme:Xh8hapwqc75OTITj_dpbSZiCISk2O9XlSqAzwtiY1QoeiTCj1DuNtvG_a38CR_2ZX
    tKjzo-jn6i4gvXdQNOr7uHaAw8Nt2xhrabvI1OFwxSelD4>
X-ME-Received: <xmr:Xh8haq1IKOgJGOt2xk6XV3_RAe1E-NvM0LL6Fp6-cwx_AIusgsYIfy5cj9k>
X-ME-Proxy-Cause: dmFkZTElrHy+p+61NcGc4tTOnGb+186I45ZxcsgsfN1oK63NQOly5+eJ27ptpn1pSIBYCb
    XmAWvwNfbSZbHcxHWSMSDyK3Hizlo5e02+VPrVV6F3LLrOPTEKCaOLBaqkOMUm2aEj+37H
    R2j9zp/7SWPy3r/X9FaonlKAcHt2XVJrhzTfibLtOj4xWqPV5mOBAahkvro+L2uezShlbe
    1Bv0YNovDYiXExqFpkzwoyFP8NuDVruE4LK9cDotgFuU33qL23y1kutRynV0C+fZFjQRDY
    oeKnSo8QM5pj2s5p1q3Iovbtf1uEB6oz6nhci8EDcSMqYXrzW6AMDi5K3mdFrcfcfwWvbq
    Voa7rUlhiI5FwyKb+aQr9SDSlSmi7P8SozGdy0INH0KqyOkrMQKXC0EuBp0Kbw4utc3RNZ
    Tgb7h24p5yvhtK3AvYHfSwk802slVZ3lBM6tl0dP9l3IawSUSbjP1pX/4O/qAxBCq1/yMC
    CQJ0iO6HbCfwv3JPOs9QX1qWb6XEnQeafj2kvQNuHFFf6GG88RGH3Fn972VefvOMgikbDk
    00hnVN9iJPk0O1gTLGWunbMBqLunAwc8qCEqF95+VfkAkbpah5uerTHuzIb0uge3Yx8fJI
    qBWk32Q3sdc3GK4DMkS1xH2cpMaz5KOlNBsSjL6gbQC94X9rgCD5lOrfRceA
X-ME-Proxy: <xmx:Xh8happGuof_kSQCztYkZoSLpQHjB9CkC06v2fOypOxrPtLVeqEEpQ>
    <xmx:Xh8hanWkXDvpGUgFa4wuJqZbusLUWRlHha3uhRFc-3kjS7u9mpLT0g>
    <xmx:Xh8haiolhMQrSEY1DT4sQa-wLyAlQb_2nkiBP1Gr5z3WBASDi9s5Tw>
    <xmx:Xh8hauBmfXA83M_bad_dB3Ju7o30Xq1bunCjrRPorNOXlSB0yasCDw>
    <xmx:Xh8haqWv9DZOu7YnxcXXLN3owyoZNBsRVltP3N46tBWy_f-3moYp5sfs>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 02:46:53 -0400 (EDT)
Date: Thu, 4 Jun 2026 08:45:57 +0200
From: Greg KH <greg@kroah.com>
To: SARDARUDDIN SYED <ssardaruddin2002@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: ABI: remove outdated USB power/level
 removal notice
Message-ID: <2026060423-ipod-tarantula-4f5d@gregkh>
References: <20260530233410.1718-1-ssardaruddin2002@gmail.com>
 <2026053140-approve-enroll-5681@gregkh>
 <CAEUfWQg7msH_qsER7nL5_855puJYsj4ztT+DrRThfbih8TObnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUfWQg7msH_qsER7nL5_855puJYsj4ztT+DrRThfbih8TObnw@mail.gmail.com>


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Jun 04, 2026 at 05:36:29AM +0530, SARDARUDDIN SYED wrote:
> Hi Greg,
> 
> I looked into the history and current implementation of power/level.
> 
> The attribute is still implemented in drivers/usb/core/sysfs.c and is still
> documented as a deprecated interface. The obsolete ABI entry was added when
> power/level was deprecated in favor of power/control, but the interface
> itself remains present.
> 
> I wasn't sure whether you meant removing the obsolete documentation entry
> or removing the deprecated interface itself, so I wanted to clarify before
> sending a v2.

Why not remove both?

thanks,

greg k-h
