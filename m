Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122B12FF69;
	Tue, 18 Aug 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035354; cv=none; b=OtDRsSDNOY4mmmzMDZiZ+irUVzWauqnQY/8Skp3W2pVK8E14J7xyeeXioa8kbjrzKy5I1ADaWG7h4UvYRYGds+Ql1hLn74Nn+4Z+wW9JMU/UR9TN6easLipIk3znfaVWmWNAcoPzvkr1FNX7n2y0V2+583Ej3keaLGhelpjocf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035354; c=relaxed/simple;
	bh=ks1BvnjC7Dn7hXt9zna+VhZTLcwxT0d0czq5P+lEuBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeirF7A/dl6jV5JaWkTj5N2Bw+xKJPff4k+Vv5SlEE8BIw5IVC0xvzigFMCndlVa4d2t8DgKvcEWyKwTBz0TRgSX9GcpXux8Nu0D7pLmdSQcDpQPz4cmBQ5VpjBGAockPMArxPF3bR/Z+/6qVpILToNjBF9wz9M4DiOPrxW19o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D7YUnRqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D7YUnRqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F420E1F000E9;
	Tue, 18 Aug 2026 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787035352;
	bh=du9H5EHjSeBbEL7SIMgnFHiOrRtSNpDQGRDBGPaMmsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D7YUnRqgR7QC3CCOdMED634/0fyAeyvCcKmGSqI6UakNkfXO0M23B7Sll2APGdJJP
	 UxlgvSgn6iuJIr0k1haU5wom6aJQAg1NPKj3iy9auFFKZ9KqPINurZinM3PtnS/ARg
	 HSEM+x06j+5orSI5gt3wlAOSJ12fNHakpnQn2tOc=
Date: Tue, 18 Aug 2026 08:40:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v6 0/3] driver core: add enumeration failure uevent helper
Message-ID: <2026081843-overlook-spokesman-0c68@gregkh>
References: <20260802233108.70950-1-Akshay.Gujar@harman.com>
 <20260818061046.14961-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818061046.14961-1-Akshay.Gujar@harman.com>

On Tue, Aug 18, 2026 at 06:10:46AM +0000, Akshay Gujar wrote:
> Hi Greg,
> 
> Second ping on this patch series. Please let me know if there are any concerns or further changes needed.

Sorry, no context here, remember some of us get 1000+ emails a day :(

Anyway, it's in my queue, sorry, will get to it after -rc1 is out, have
been swamped with bug fixes first and travel, will be catching up
soon...

thanks,

greg k-h
