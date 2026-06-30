Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED39E423A68
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829092; cv=none; b=SDdC9xmE18c/vngaEUsNyoSmxfTOLwUJAvJs+d4jKGTztuo7hnGzz65h2ZyklQKlH4Nj/NlU2eKzzCpKLPqbUEE5ccv9ulIhWocOhUCqt9zEwa8/VfLuO/227GbVxcKlsiaYeS1v1vrpiP8aR2U4Gf2qc0fAXbKdslo6bk8tAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829092; c=relaxed/simple;
	bh=9Lx354mZJ6H27dHBQ3b7zF7Pm/G5fIOXgaUtwfwjh90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itBOIKP2yNITfxfFB3oYPG7/shGcK3NmStvDL0eT/qcGf6XYAnu7tu+oHlBtYQAtZO8MbEwYzxIjvTS/09BM0kGXkl3yi2B4x90e/2eut3s3YuZJvmPIXKSJ9/Khoi7Yp5t6zc9qoaPAtkDZuTpmPbwZLyeRZ6IpSTck57y2nCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cNfBq7iI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cNfBq7iI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF181F000E9;
	Tue, 30 Jun 2026 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782829090;
	bh=fH7gWJ2v5fPdaO5nI74A877McPd6Vt/NgdoXUGvRVGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cNfBq7iIH8A7iwiq9OZQQ/CacKh6ctGXxdRmyXHyISOZEWnmbrFauVvsKRk4DH2WG
	 p5pn/zijumfsJlfZEGyRjXQxPobAjTOfQDWTEIekHbIqedA54kU/6AODtLwIPbV0CU
	 mj/ygDEB8uuW/wn/ZTfV3mSVep9daeV3g9KnWb3E=
Date: Tue, 30 Jun 2026 16:16:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DongliLiu <dongli.liu@outlook.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC] usb: typec: ucsi: Guard semantic inconsistency and cleanup
Message-ID: <2026063026-specked-unlatch-1244@gregkh>
References: <KUZPR04MB896868553B291C340D89F66D85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KUZPR04MB896868553B291C340D89F66D85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>

On Tue, Jun 30, 2026 at 07:37:08PM +0800, DongliLiu wrote:
> From: DongliLiu <dongli.liu@outlook.com>
> 
> While auditing the UCSI subsystem, I noticed two code quality issues that
> may benefit from community discussion:
> 
> 1. Cross-function guard semantic gap
> 
> notify_common() uses inclusive check (<= num_connectors):
>   if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
> 
> connector_change() uses exclusive check (num > num_connectors):
>   if (!num || num > num_connectors)
> 
> This means the same connector number can pass one check but fail another.
> Should these be unified to strict '<' semantics?

Which one should be correct?

> 2. Mixed comparison operators
> 
> The subsystem uses both '<' and '<=' inconsistently across functions.
> Would a cleanup series to standardize all bounds checks be welcome?

Maybe, depends on the checks.  Send patches for us to review after
testing them please.

thanks,

greg k-h
